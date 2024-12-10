package com.Unicon.domain;

import java.util.List;

import lombok.Data;

@Data
public class OrdersDetailVO {

	private int order_detail_id;
	private String order_id;
	private String product_id;
	private int product_subprice;
	private int delivery_price;
	private String status;

	private List<OrdersDetailOptionVO> ordersDetailOptions;
	
	private ShopVO shopVO;
}
