package com.Unicon.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PetVO {

	private int pet_id;
	private String member_id;
	private String pet_src;
	private String pet_name;
	private int pet_gender;
	private String pet_color;
	private int pet_type;
	private int pet_code;
	private String pet_etc_breed;
	private MultipartFile pet_file;
	private Date pet_birthdate;
	private Date pet_adopdate;
	
	private CategoryDataVO categoryDataVO;	// 카테고리 테이블
	
}
