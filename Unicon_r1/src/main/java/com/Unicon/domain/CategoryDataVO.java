package com.Unicon.domain;

import lombok.Data;

@Data
public class CategoryDataVO {
	
	private int category_code;		// 카테고리 분류코드
	private String category_type;	// 카테고리 종류
	private String category_value;	// 카테고리 값
	
}
