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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.controller.NoticeController;
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
    
    @Override
    @Transactional
    public void registerNotice(NoticeVO noVO) throws Exception {
        try {
            noDAO.insertNotice(noVO);
            
            // 중요 공지일 경우 이메일 발송
            if (noVO.isImportant()) {
                // emailService.sendNotification(noVO);
            }
        } catch (Exception e) {
            logger.error("공지사항 등록 중 오류 발생", e);
            throw new NoticeException("공지사항 등록에 실패했습니다.", e);
        }
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
        // 1부터 시작하는 페이지 번호를 0부터 시작하는 인덱스로 변환
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