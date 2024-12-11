package com.Unicon.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrdersDetailOptionVO {

	private int order_detail_option_id;
	private int order_detail_id;
	private String order_id;
	private String product_option;
	private int option_price;
	private int quantity;
	private String orders_detail_option_status;
	private Timestamp dispatch_date;
	private Timestamp cancellation_request_date;
	private Timestamp return_request_date;
	
}
