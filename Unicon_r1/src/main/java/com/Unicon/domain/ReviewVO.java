package com.Unicon.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewVO {
	private int review_id;
	private String member_id;
	private String product_id;
	private String order_detail_option_id;
	private int review_rate;
	private String review_content;
	private Timestamp review_create_date;
	private String formatted_review_create_date;
	
	private MemberVO memberVO;
}
