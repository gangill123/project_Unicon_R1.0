package com.Unicon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
public class EmailService {

	  @Autowired
	    private JavaMailSender javaMailSender;

	  public void sendEmail(String to, String subject, String content, MultipartFile file) throws MessagingException {
		    // 이메일 전송 준비
		    MimeMessage message = javaMailSender.createMimeMessage();
		    
		    // UTF-8 인코딩 설정
		    MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

		    helper.setTo(to);
		    helper.setSubject(subject);
		    helper.setText(content, true);  // HTML 형식으로 이메일 내용 설정

		    // 파일이 있을 경우 첨부
		    if (file != null && !file.isEmpty()) {
		        helper.addAttachment(file.getOriginalFilename(), file);  // 파일 첨부
		    }

		    // 이메일 전송
		    javaMailSender.send(message);
	  }
}