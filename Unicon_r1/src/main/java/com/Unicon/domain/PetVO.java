package com.Unicon.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PetVO {

	private int pet_id;
	private String member_id;
	private String pet_src;
	private String pet_name;
	private int pet_gender;
	private int pet_type;
	private int pet_detail;
	private String pet_detail_etc;
	private MultipartFile pet_file;
	
}
