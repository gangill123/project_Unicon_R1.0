package com.Unicon.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdptVO {
	
	private String adpt_id;
	private String animal_id;
	private String member_id;
	private Timestamp adpt_regdate;
	private Timestamp adpt_upddate;
	private String adpt_intro;
	private String adpt_etc;
	private int adpt_status;
	private String adpt_status_value;
	private String adpt_reason;
	
} 