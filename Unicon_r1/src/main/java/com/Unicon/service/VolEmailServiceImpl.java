package com.Unicon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Service
public class VolEmailServiceImpl implements VolEmailService{
	@Autowired
    private JavaMailSender mailSender;
    
	@Async
    @Override
    public void sendVolunteerStatusEmail(String to, String status, String voTitle, String rejectReason) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            
            helper.setTo(to);
            // 발신자 이름만 표시되도록 설정
            helper.setFrom(new InternetAddress("kimxx54@gmail.com", "유니콘", "UTF-8"));
            helper.setSubject("[유니콘] 봉사활동 신청 상태 안내");
            
            String content = generateEmailContent(status, voTitle, rejectReason);
            helper.setText(content, true);
            
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	private String generateEmailContent(String status, String voTitle, String rejectReason) {
		   StringBuilder content = new StringBuilder();
		   content.append("<!DOCTYPE html>");
		   content.append("<html lang='ko'>");
		   content.append("<head><meta charset='UTF-8'></head>");
		   content.append("<body>");
		   content.append("<div style='font-family: \"Malgun Gothic\", sans-serif; padding: 20px; text-align: center; max-width: 600px; margin: 0 auto;'>");
		   content.append("<h2 style='color: #86BC42;'>봉사활동 신청 상태 안내</h2>");
		   content.append("<p>안녕하세요, 유니콘입니다.</p>"); 
		   content.append("<p>신청하신 봉사활동 [").append(voTitle).append("]의 상태가 변경되었습니다.</p>");
		   
		   switch (status) {
		       case "APPROVED":
		           content.append("<div style='text-align: center; margin: 20px 0;'>");
		           content.append("<span style='color: #348E38; background-color: #e8f5e9; padding: 10px 20px; border-radius: 4px; display: inline-block;'>");
		           content.append("신청하신 봉사활동이 <strong>승인</strong>되었습니다.</span></div>");
		           content.append("<p>봉사활동 일정과 장소를 다시 한 번 확인해 주시기 바랍니다.</p>");
		           break;
		           
		       case "REJECTED":
		           content.append("<div style='text-align: center; margin: 20px 0;'>");
		           content.append("<span style='color: #d32f2f; background-color: #ffebee; padding: 10px 20px; border-radius: 4px; display: inline-block;'>");
		           content.append("신청하신 봉사활동이 <strong>거절</strong>되었습니다.</span></div>");
		           if (rejectReason != null && !rejectReason.isEmpty()) {
		               content.append("<p><strong>거절 사유:</strong> ").append(rejectReason).append("</p>");
		           }
		           break;
		   }
		   
		   content.append("<p>추가 문의사항이 있으시다면 관리자에게 연락 부탁드립니다.</p>");
		   
		   // 신청현황 보기 버튼
		   content.append("<div style='margin: 30px 0;'>");
		   content.append("<a href='http://localhost:8088/volunteer/mylist' style='background-color: #86BC42; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px; display: inline-block; font-weight: bold; box-shadow: 0 2px 4px rgba(134, 188, 66, 0.2);'>");
		   content.append("나의 봉사활동 신청현황 보기</a>");
		   content.append("</div>");
		   
		   // 구분선
		   content.append("<hr style='border: none; border-top: 1px solid #eee; margin: 30px 0;'>");
		   
		   // 푸터
		   content.append("<div style='color: #666; font-size: 12px;'>");
		   content.append("<p>본 메일은 발신전용 메일입니다.</p>");
		   content.append("<p style='margin-top: 10px;'>© UNICORN. All Rights Reserved.</p>");
		   content.append("</div>");
		   
		   content.append("</div>");
		   content.append("</body></html>");
		   
		   return content.toString();
		}
}
