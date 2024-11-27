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
	String image_id; // 이미지
	String attachment; // 첨부파일주소

	int dno; // 댓글 번호
	String dcontent; // 댓글내용
	Timestamp dcreated_at; // 댓글일

	int status; // 상태 (1: 진행 중, 2: 답변완료)
	String acontent; // 답변내용
	Timestamp answerdate; // 답변일

	String email;
	String phone;
	String MultipartFile;
	private String filePath; // 파일 저장 경로

	private String recaptcha; // reCAPTCHA 토큰
	
	
	
	
	
	
	public String getRecaptcha() {
		return recaptcha;
	}

	public void setRecaptcha(String recaptcha) {
		this.recaptcha = recaptcha;
	}
	
	
}
