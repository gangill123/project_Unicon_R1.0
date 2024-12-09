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
	                + "<p>고객님의  문의에 대해 아래와 같이 확인되었습니다. 빠른 처리를 위해 아래 해당 양식으로 필요한 사항을 기입하여 주시기 바랍니다.</p>"
	                
	                // 테이블 형식으로 작성자 정보
	                + "<table border='1' cellpadding='10' cellspacing='0' style='border-collapse: collapse; width: 100%; font-family: Arial, sans-serif;'>"
	                + "<thead style='background-color: #f2f2f2;'>"
	                + "<tr><th>작성자</th><td>" + member_name + "</td></tr>"
	                + "<tr><th>카테고리</th><td>" + istatus + "</td></tr>"
	                + "<tr><th>이메일</th><td>" + email + "</td></tr>"
	                + "<tr><th>제목</th><td>" + title + "</td></tr>"
	                + "<tr><th>전화번호</th><td>" + phone + "</td></tr>"
	                + "<tr><th>내용</th><td>" + content + "</td></tr>"
	                + "</table>"
	                + "<h2>해당 문의에 답변을 여기에 작성 부탁드립니다. : </h2>"
	                + "<h3>처리 예정 시간</h3>"
	                + "<p>저희 고객센터에서는 접수된 문의 사항을 최대한 신속하게 처리하고 있으며, 처리 완료 후 이메일로 답변을 드립니다. 처리 시간이 다소 지연될 수 있으니 양해 부탁드립니다.</p>"
	                + "<h3>문의 처리 및 확인 방법</h3>"
	                + "<p>문의하신 사항에 대한 처리 진행 상황은 고객센터를 통해 확인 가능합니다. 추가적인 문의나 확인이 필요하시면 언제든지 고객센터로 연락 주세요.</p>"
	                + "<h3>환불 및 취소 관련 안내</h3>"
	                + "<p>만약 환불 및 취소와 관련된 사항이라면, 구매일로부터 7일 이내에 접수해주셔야 하며, 상품 사용 여부에 따라 취소가 제한될 수 있습니다. 자세한 사항은 고객센터에 문의하시기 바랍니다.</p>"
	                + "<footer><p>UNICON 고객센터</p></footer>";

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