package com.Unicon.domain;

import lombok.Data;

@Data
public class InterestVO {

	private int interest_id;
	private String product_id;
	private String member_id;
	
	private ShopVO shopVO;
	
}
