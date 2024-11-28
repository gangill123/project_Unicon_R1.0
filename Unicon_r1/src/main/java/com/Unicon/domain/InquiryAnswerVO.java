package com.Unicon.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class InquiryAnswerVO {
	  private int dno;       // 답변 번호
	  private int bno;       // 게시글 번호
	  private String dname;  // 답변 작성자
	  private String dcontent; // 답변 내용
	  private Date createdAt; // 작성일

}
