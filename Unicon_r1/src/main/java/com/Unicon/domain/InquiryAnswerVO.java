package com.Unicon.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class InquiryAnswerVO {
	  private int dno;       // 답변 번호
	  private int bno;       // 게시글 번호
	  private String dname;  // 답변 작성자
	  private String dcontent; // 답변 내용
	  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	  private Date created_at; // 작성일

}
