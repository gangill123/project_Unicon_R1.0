package com.Unicon.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class MailConfig {

	@Bean
	public JavaMailSender javaMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

		// 이메일 서버 설정
		mailSender.setHost("smtp.gmail.com"); // 메일 서버 주소 (구글 예시)
		mailSender.setPort(587); // 메일 서버 포트

		// 발신 이메일 계정 정보
		mailSender.setUsername("xogox22@gmail.com");
		mailSender.setPassword("vzol hkjj nlox wmaf"); // 생성된 앱 비밀번호를 사용

		// SMTP 프로토콜 설정
		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.smtp.auth", "true"); // 인증 필요
		props.put("mail.smtp.starttls.enable", "true"); // TLS 사용
		props.put("mail.smtp.starttls.required", "true");

		// 이메일 본문 문자 인코딩 설정 (UTF-8로 설정)
		props.put("mail.smtp.charset", "UTF-8");

		return mailSender;
	}
}