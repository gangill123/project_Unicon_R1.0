package com.Unicon.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AdminNoticeVO {
	
	private int anoId;         // ano_id
    private int anoBno;        // ano_bno
    private String anoTitle;   // ano_title
    private String anoContent; // ano_content
    private String anoWriter;  // ano_writer
    private Timestamp anoRegdate; // ano_regdate
    private Timestamp anoModdate; // ano_moddate
    private byte important;    	// important
    private boolean importantCh; // important 체크 vo용
    private String status;      // status
    private int viewCount;     // view_count
    
    private String title;           // 제목
    private String dateInput;       // 게시 기간
    private String start_date;       // 시작일
    private String end_date;         // 종료일
    private String popupWidth;      // 팝업 너비
    private String popupHeight;     // 팝업 높이
    
    private String image_src;		// 이미지 경로
	private List<ImageVO> popup_images;
    private List<MultipartFile> upload_images; // 업로드 이미지
    
}
