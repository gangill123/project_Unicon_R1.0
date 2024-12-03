package com.Unicon.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class AdptMemberVO {
	
	private String member_id;
	private String member_name;
	private String member_tel;
	private String road_address;
	private String member_email;
	private Date member_birth;
	private String member_gender;
	private int member_age;
	
}
