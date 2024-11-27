package com.Unicon.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class AnimalVO {
	private String animal_id;
	private int category_code;
	private String category_etc_value;
	private String animal_name;
	private String animal_color;
	private int animal_gender; // 1: 남아, 2: 여아
	private int animal_neuter; // 1: 유, 2: 무
	private String animal_age;
	private int animal_weight; // 1: 소형(~5), 2: 중형(5~25), 3: 대형(25~)
	private String member_id;
	private Timestamp animal_regdate;
	private Timestamp animal_upddate;
	private String animal_regnum;
	private int animal_act;
	private int animal_social;
	private String animal_etc;
	private String animal_status;
	private List<ImageVO> animal_images;
	private List<AnimalHealthVO> animal_healths;
	private List<AnimalVaccineVO> animal_vaccines;
	
	private AdptCounselVO adptCounsel;
	private AdptMemberVO adptMember;
	private AnimalInterestVO animalInterest;
	private AdptVO adpt;
}
