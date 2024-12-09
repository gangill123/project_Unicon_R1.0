package com.Unicon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.service.EmailService;
import com.Unicon.service.RecaptchaService;

import org.springframework.ui.Model;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;

@RestController
@RequestMapping("/contact")
public class ContactFormController {
	   @Autowired
	    private RecaptchaService recaptchaService; // Service for reCAPTCHA verification

	    @Autowired
	    private EmailService emailService; // Service for sending emails
	    @PostMapping("/submit")
	    public ResponseEntity<Map<String, Object>> submitForm(
	            @RequestParam String member_name,
	            @RequestParam String email,
	            @RequestParam String title,
	            @RequestParam String phone,
	            @RequestParam String content,
	            @RequestParam String istatus,
	            @RequestParam String recaptcha,
	            @RequestParam(required = false) MultipartFile file) throws MessagingException {

	        // reCAPTCHA 검증
	        boolean isRecaptchaValid = recaptchaService.verify(recaptcha);
	        if (!isRecaptchaValid) {
	            return ResponseEntity.badRequest().body(Collections.singletonMap("message", "reCAPTCHA 인증에 실패했습니다."));
	        }

	        // 유효성 검사
	        if (member_name.isEmpty() || email.isEmpty() || title.isEmpty() || phone.isEmpty() || content.isEmpty()) {
	            return ResponseEntity.badRequest().body(Collections.singletonMap("message", "입력된 정보가 부족합니다."));
	        }

	        // 이메일 본문 내용 생성
	        String messageContent = "<h3>작성자: " + member_name + "</h3>"
	                + "<p>이메일: " + email + "</p>"
	                + "<p>제목: " + title + "</p>"
	                + "<p>전화번호: " + phone + "</p>"
	                + "<p>내용: " + content + "</p>"
	                + "<p>카테고리: " + istatus + "</p>";

	        // 파일이 있을 경우 첨부 (파일 처리 로직 추가 가능)
	        if (file != null && !file.isEmpty()) {
	            messageContent += "<p>첨부파일: " + file.getOriginalFilename() + "</p>";
	            // 파일 첨부하여 이메일 발송
	            emailService.sendEmail("xogox22@gmail.com", "새로운 문의: " + title, messageContent, file);
	        } else {
	            // 파일이 없으면 파일 없이 이메일만 발송
	            emailService.sendEmail("xogox22@gmail.com", "새로운 문의: " + title, messageContent, null);
	        }

	        // 응답 객체 반환
	        Map<String, Object> response = new HashMap<>();
	        response.put("success", true);
	        return ResponseEntity.ok(response);
	    }
}