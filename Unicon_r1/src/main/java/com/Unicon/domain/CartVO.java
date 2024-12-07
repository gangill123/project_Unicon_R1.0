package com.Unicon.domain;

import java.util.List;

import lombok.Data;

@Data
public class CartVO {

	private int cart_id;
	private String member_id;
	private String product_id;
	
	private List<CartDetailVO> cart_list;
	
	private ShopVO shopVO;
	
}
