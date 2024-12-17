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
        String messageContent = "<h2>UNICON 고객센터 - 문의사항 접수 안내</h2>"
                + "<p>안녕하세요, UNICON 고객센터입니다.</p>"
                + "<p>" + member_name + " 고객님의 문의가 접수되었습니다. 빠른 시일 내에 답변 드리겠습니다.</p>"
                + "<h3>문의 내용:</h3>"
                + "<table border='1' cellpadding='10' cellspacing='0' style='border-collapse: collapse; width: 100%; font-family: Arial, sans-serif;'>"
                + "<thead style='background-color: #f2f2f2;'>"
                + "<tr><th>작성자</th><td>" + member_name + "</td></tr>"
                + "<tr><th>카테고리</th><td>" + istatus + "</td></tr>"
                + "<tr><th>이메일</th><td>" + email + "</td></tr>"
                + "<tr><th>제목</th><td>" + title + "</td></tr>"
                + "<tr><th>전화번호</th><td>" + phone + "</td></tr>"
                + "<tr><th>내용</th><td>" + content + "</td></tr>"
                + "</table>"
                + "<footer><p>UNICON 고객센터</p></footer>";

        // 문의 확인 이메일 발송 (고객에게)
        emailService.sendEmail(email, "문의 접수 확인", messageContent, null);

        // 관리자가 받을 이메일 본문 생성
        String adminMessageContent = "<h2>UNICON 고객센터 - 새로운 문의사항 접수</h2>"
                + "<p>안녕하세요, UNICON 고객센터입니다.</p>"
                + "<p>" + member_name + " 고객님의 문의가 접수되었습니다. 아래의 정보를 확인하여 빠른 처리를 부탁드립니다.</p>"
                + "<h3>문의 내용:</h3>"
                + "<table border='1' cellpadding='10' cellspacing='0' style='border-collapse: collapse; width: 100%; font-family: Arial, sans-serif;'>"
                + "<thead style='background-color: #f2f2f2;'>"
                + "<tr><th>작성자</th><td>" + member_name + "</td></tr>"
                + "<tr><th>카테고리</th><td>" + istatus + "</td></tr>"
                + "<tr><th>이메일</th><td>" + email + "</td></tr>"
                + "<tr><th>제목</th><td>" + title + "</td></tr>"
                + "<tr><th>전화번호</th><td>" + phone + "</td></tr>"
                + "<tr><th>내용</th><td>" + content + "</td></tr>"
                + "</table>"
                + "<h2>해당 문의에 답변을 여기에 작성 부탁드립니다.</h2>"
                + "<footer><p>UNICON 고객센터</p></footer>";

        // 파일이 있을 경우 첨부 (파일 처리 로직 추가 가능)
        if (file != null && !file.isEmpty()) {
            adminMessageContent += "<p>첨부파일: " + file.getOriginalFilename() + "</p>";
            // 파일 첨부하여 이메일 발송
            emailService.sendEmail("xogox22@gmail.com", "새로운 문의: " + title, adminMessageContent, file);
        } else {
            // 파일이 없으면 파일 없이 이메일만 발송
            emailService.sendEmail("xogox22@gmail.com", "새로운 문의: " + title, adminMessageContent, null);
        }

        // 응답 객체 반환
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        return ResponseEntity.ok(response);
    }


}