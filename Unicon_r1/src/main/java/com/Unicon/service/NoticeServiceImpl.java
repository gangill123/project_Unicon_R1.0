package com.Unicon.service;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.controller.NoticeController;
import com.Unicon.domain.MemberVO;
import com.Unicon.domain.NoticeFileVO;
import com.Unicon.domain.NoticeVO;
import com.Unicon.persistence.NoticeDAO;
import com.Unicon.persistence.NoticeFileDAO;
import com.Unicon.exception.NoticeException;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	private static final Logger logger 
					= LoggerFactory.getLogger(NoticeServiceImpl.class);
    
	@Inject
    private NoticeDAO noDAO;
	
	@Autowired
    private JavaMailSender mailSender;
    
	@Override
	@Transactional
	public void registerNotice(NoticeVO noVO) throws Exception {
	    try {
	        // 1. 공지사항 등록 먼저 수행
	        noDAO.insertNotice(noVO);
	        
	        // 2. 트랜잭션 완료 후 비동기 메일 발송을 위해 새로운 NoticeVO 객체 생성
	        final NoticeVO savedNotice = noDAO.selectNotice(noVO.getNoId());
	        
	        // 3. 트랜잭션 외부에서 비동기로 메일 발송
	        if (noVO.isNoEmail()) {
	            new Thread(() -> {
	                try {
	                    sendNoticeMailToSubscribers(savedNotice);
	                } catch (Exception e) {
	                    logger.error("메일 발송 중 오류 발생", e);
	                }
	            }).start();
	        }
	        
	    } catch (Exception e) {
	        logger.error("공지사항 등록 중 오류 발생", e);
	        throw new NoticeException("공지사항 등록에 실패했습니다.", e);
	    }
	}
    
    @Async  // public 메서드로 변경하고 @Async 추가
    public void sendNoticeMailToSubscribers(NoticeVO notice) {
        try {
            List<MemberVO> subscribers = noDAO.getMailSubscribers();
            logger.info("메일 수신자 수: {}", subscribers.size());
            
            if (!subscribers.isEmpty()) {
                for (MemberVO member : subscribers) {
                    if (member != null && member.getMember_email() != null && !member.getMember_email().isEmpty()) {
                        try {
                            sendNoticeMail(notice, member);
                            logger.info("메일 발송 성공 - 수신자: {}", member.getMember_email());
                        } catch (Exception e) {
                            logger.error("메일 발송 실패 - 수신자: {} - 원인: {}", 
                                member.getMember_email(), e.getMessage());
                        }
                    }
                }
            }
        } catch (Exception e) {
            logger.error("메일 발송 처리 중 오류 발생", e);
        }
    }
    
	@Async
	private void sendNoticeMail(NoticeVO notice, MemberVO member) throws Exception {
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
	    
	    // 수신자 설정
	    helper.setTo(member.getMember_email());
	    // 발신자 설정
	    helper.setFrom(new InternetAddress("kimxx54@gmail.com", "유니콘", "UTF-8"));
	    // 제목 설정
	    helper.setSubject("[UNICORN] " + notice.getNoTitle());
	    // 본문 설정 (HTML)
	    helper.setText(createMailContent(notice), true);
	    
	    mailSender.send(message);
	}
    
	private String createMailContent(NoticeVO notice) {
		StringBuilder html = new StringBuilder();
	    
		String content = notice.getNoContent();
		content = content.replaceAll("src=\"/", "src=\"http://localhost:8088/");
		
		html.append("<!DOCTYPE html>");
	    html.append("<html lang='ko'>");
	    html.append("<head><meta charset='UTF-8'></head>");
	    html.append("<body>");
	    html.append("<div style='font-family: \"Malgun Gothic\", sans-serif; padding: 20px; text-align: center; max-width: 600px; margin: 0 auto;'>");
	    
	    // 헤더
	    html.append("<h2 style='color: #86BC42;'>UNICORN 공지사항</h2>");
	    html.append("<p>안녕하세요, 유니콘입니다.</p>");
	    
	    // 본문
	    html.append("<div style='text-align: center; margin: 20px 0;'>");
	    html.append("<h3>").append(notice.getNoTitle()).append("</h3>");
	    html.append(content);
	    html.append("</div>");
	    
	    // 버튼
	    html.append("<div style='margin: 30px 0;'>");
	    html.append("<a href='http://localhost:8088/notice/").append(notice.getNoId())
	        .append("' style='background-color: #86BC42; color: white; padding: 12px 24px; text-decoration: none; ")
	        .append("border-radius: 4px; display: inline-block; font-weight: bold; box-shadow: 0 2px 4px rgba(0, 110, 96, 0.2);'>");
	    html.append("공지사항 확인하기</a>");
	    html.append("</div>");
	    
	    // 구분선
	    html.append("<hr style='border: none; border-top: 1px solid #eee; margin: 30px 0;'>");
	    
	    // 푸터
	    html.append("<div style='color: #666; font-size: 12px;'>");
	    html.append("<p>본 메일은 발신전용 메일입니다.</p>");
	    html.append("<p style='margin-top: 10px;'>© UNICORN. All Rights Reserved.</p>");
	    html.append("</div>");
	    
	    html.append("</div>");
	    html.append("</body></html>");
	    
	    return html.toString();
	}
    
    public List<NoticeVO> getDraftList() throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("status", "draft");
        return noDAO.selectDraftList(params);
    }

    public NoticeVO getDraft(Long noId) throws Exception {
        return noDAO.selectDraft(noId);
    }
    
    @Override
    public Map<String, Object> getNoticeList(int page, int size, String category, String keyword, String startDate, String endDate) throws Exception {
        // 페이지 번호를 0부터 시작하는 인덱스로 변환
        int startIndex = (page - 1) * size;
        
        Map<String, Object> params = new HashMap<>();
        params.put("start", startIndex);
        params.put("size", size);
        params.put("category", category);
        params.put("keyword", keyword);
        params.put("startDate", startDate);
        params.put("endDate", endDate);
        params.put("status", "active");
        
        List<NoticeVO> notices = noDAO.selectNoticeList(params);
        int totalCount = noDAO.selectNoticeCount(params);
        
        Map<String, Object> result = new HashMap<>();
        result.put("boards", notices);
        result.put("totalCount", totalCount);
        
        return result;
    }
    
    @Override
    public NoticeVO getPrevNotice(Long noId) throws Exception {
        return noDAO.selectPrevNotice(noId);
    }

    @Override
    public NoticeVO getNextNotice(Long noId) throws Exception {
        return noDAO.selectNextNotice(noId);
    }
    
    @Override
    @Transactional
    public void updateNotice(NoticeVO noVO) throws Exception {
        try {
            NoticeVO existingNotice = noDAO.selectNotice(noVO.getNoId());
            if (existingNotice == null) {
                throw new NoticeException("존재하지 않는 공지사항입니다.");
            }
            
            // status가 설정되지 않은 경우 'active'로 설정
            if (noVO.getStatus() == null || noVO.getStatus().isEmpty()) {
                noVO.setStatus("active");
            }
            
            noDAO.updateNotice(noVO);
        } catch (Exception e) {
            logger.error("공지사항 수정 중 오류 발생", e);
            throw new NoticeException("공지사항 수정에 실패했습니다.", e);
        }
    }

    @Override
    @Transactional
    public void deleteNotice(Long noId) throws Exception {
        try {
            noDAO.deleteNotice(noId);
        } catch (Exception e) {
            logger.error("공지사항 삭제 중 오류 발생", e);
            throw new NoticeException("공지사항 삭제에 실패했습니다.", e);
        }
    }

    @Override
    @Transactional
    public NoticeVO getNotice(Long noId) throws Exception {
        try {
            noDAO.updateViewCount(noId);
            NoticeVO notice = noDAO.selectNotice(noId);
            if (notice == null) {
                throw new NoticeException("존재하지 않는 공지사항입니다.");
            }
            return notice;
        } catch (Exception e) {
            logger.error("공지사항 조회 중 오류 발생", e);
            throw new NoticeException("공지사항 조회에 실패했습니다.", e);
        }
    }
   
}