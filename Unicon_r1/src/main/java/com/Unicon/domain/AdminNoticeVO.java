package com.Unicon.domain;

import java.sql.Timestamp;

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

}
