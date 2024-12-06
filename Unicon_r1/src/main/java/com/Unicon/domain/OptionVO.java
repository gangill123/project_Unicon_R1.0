package com.Unicon.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class OptionVO {
	
	
	private int option_id;
	private String product_id;
	private String option_name;
	private String option_value;
	private int option_price;
	private int option_stock;
	private String option_name2;
	private String option_value2;
	private String option_type;
	// 날짜도 추가 해야될거 같은데 다음에 함.
}
