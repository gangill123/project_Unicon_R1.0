package com.Unicon.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class OrdersVO {

	private String order_id;
	private String member_id;
	private String order_name;
	private String pay_method;
	private int total_product_price;
	private int total_delivery_price;
	private int total_price;
	private String address;
	private String detail_address;
	private String postal_code;
	private String recipient;
	private String recipient_phone;
	private String status;
	private String invoice_number;
	private String delivery_method;
	private String delivery_comment;
	private Timestamp create_date;
	private Timestamp update_date;
	private Timestamp payment_date;
	private String formatted_paydate;
	private String imp_uid;
	
	private List<OrdersDetailVO> ordersDetails;
	private MemberVO memberVO;
	
	
}
