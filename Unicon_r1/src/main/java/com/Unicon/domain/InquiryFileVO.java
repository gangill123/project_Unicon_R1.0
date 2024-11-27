package com.Unicon.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class InquiryFileVO {
	
	private int fileId; //고유 파일 ID
	private int bno; // inquiry 게시글 번호 참조                    
	private String originalName; // 업로드된 파일의 원래 이름
	private String storedName; // 서버에 저장된 파일 이름
	private String filePath; // 파일 저장 경로
	private String fileType; // 파일 MIME 타입
	private Timestamp uploadDate; // 업로드 날짜 (기본값: 현재 시간)
	private String thumbnailPath; // 
	
	
	

}
