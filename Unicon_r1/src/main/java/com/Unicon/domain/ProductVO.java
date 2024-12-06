package com.Unicon.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	
	
	private String product_id;
	private String product_seller_id;
	private String product_category_type;
	private String product_category_value;
	private String product_keyword;
	private String product_name;
	private int product_price;  
	private Timestamp start_date; 
	private Timestamp end_date; 
	private int discount_rate; 
	private int product_stock;
	private String product_content;
	private String brand; 
	private String manufacturer;
	private String product_origin;
	private String product_expiry;
	private String product_status;
	private String delivery_method; 
	private String delivery_company; 
	private int delivery_price; 
	private String address;
	private Timestamp create_date;
	private Timestamp update_date;
	private Timestamp approval_date;
	private String approval_id;
	private String comments;
	private String option_type; 
	
	private OptionVO option1;
	private List<OptionVO> option;
	
	private List<ImageVO> product_images;
	
	private List<MultipartFile> upload_images;
	
	private CategoryDataVO categoryDataVO;
}
