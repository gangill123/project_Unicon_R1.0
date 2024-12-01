package com.Unicon.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AnimalInterestVO {
	
	private String animal_id;
	private String member_id;
	private Timestamp interest_regdate;
	private int adpt_interest_sum;
	
} 

