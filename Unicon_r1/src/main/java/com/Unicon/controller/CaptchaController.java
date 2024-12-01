package com.Unicon.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpEntity;

@RestController
public class CaptchaController {

    @Value("${recaptcha.secret.key}")
    private String secretKey;

    @PostMapping("/submit")
    public ResponseEntity<String> submit(@RequestParam("type_the_word") String typeTheWord,
                                         @RequestParam("g-recaptcha-response") String recaptchaResponse) {
        // reCAPTCHA 검증 URL
        String url = "https://www.google.com/recaptcha/api/siteverify";
        
        // 파라미터 설정
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("secret", secretKey); // 비밀 키
        params.add("response", recaptchaResponse); // 사용자가 제출한 reCAPTCHA 응답

        // HTTP 요청 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, headers);

        // RestTemplate을 사용하여 Google reCAPTCHA 서버에 요청
        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.postForObject(url, entity, String.class);

        // Google에서 반환한 JSON 응답 처리
        if (result.contains("\"success\": true")) {
            // reCAPTCHA 검증 성공
            return ResponseEntity.ok("Captcha verification successful.");
        } else {
            // reCAPTCHA 검증 실패
            return ResponseEntity.badRequest().body("Captcha verification failed.");
        }
    }
}
