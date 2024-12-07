package com.Unicon.domain;

import lombok.Data;

@Data
public class CartDetailVO {
	private int cart_detail_id;
	private int cart_id;
	private String option_name;
	private String option_value;
	private String option_name2;
	private String option_value2;
	private int quantity;
	private int option_price;
	
}
