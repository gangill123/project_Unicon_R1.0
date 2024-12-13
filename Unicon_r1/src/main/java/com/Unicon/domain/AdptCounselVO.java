package com.Unicon.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdptCounselVO {
	
	private int counsel_id;
	private String animal_id;
	private String member_id;
	private Timestamp counsel_subdate;
	private Timestamp counsel_procdate;
	private int counsel_status;
	private String counsel_status_value;
	private String counsel_reason;

}
