package com.Unicon.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class InquiryVO {

	int bno; // 글번호
	String member_id;
	String member_name;
	String title; // 제목
	String content;// 내용
	String istatus; // 카테고리 분류
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date created_at; // 작성일
	int status; // 상태 (1: 진행 중, 2: 답변완료)
	String email;
	String phone;
	String post_password;
	int view_count;

	private String recaptcha; // reCAPTCHA 토큰

	// InquiryFileVO 타입의 필드 추가
	private InquiryFileVO inquiryFile; // 필드를 추가

	// getter와 setter 추가
	public InquiryFileVO getInquiryFile() {
		return inquiryFile;
	}

	public void setInquiryFile(InquiryFileVO inquiryFile) {
		this.inquiryFile = inquiryFile;
	}

	public String getRecaptcha() {
		return recaptcha;
	}

	public void setRecaptcha(String recaptcha) {
		this.recaptcha = recaptcha;
	}

}
