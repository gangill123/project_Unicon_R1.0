package com.Unicon.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AnimalVO {
	private String animal_id;
	private int category_code;
	private String category_etc_value;
	private String animal_name;
	private String animal_color;
	private int animal_gender; // 1: 남아, 2: 여아
	private String gender_value;
	private int animal_neuter; // 1: 유, 2: 무
	private String neuter_value;
	private String animal_age;
	private int animal_weight; // 1: 소형(~5kg), 2: 중형(5~25kg), 3: 대형(25kg~)
	private String weight_value;
	private String member_id;
	private Timestamp animal_regdate;
	private Timestamp animal_upddate;
	private int animal_status; // 1: 대기중, 2: 모집중, 3: 상담중, 4: 입양완료, 5: 종료, 6: 삭제
	private String animal_status_value;
	private String animal_regnum;
	private int animal_act; // 0~5, 0: 미입력
	private String act_value;
	private int animal_social; // 0~5, 0: 미입력
	private String social_value;
	private String animal_etc;
	private String adpt_member;
	private List<ImageVO> animal_images;
	private List<MultipartFile> upload_images;
	private List<AnimalHealthVO> animal_healths;
	private List<AnimalVaccineVO> animal_vaccines;
	private List<CheckImageVO> check_images;
	
	private AdptCounselVO adptCounselVO;
	private AdptMemberVO adptMemberVO;
	private AnimalInterestVO animalInterestVO;
	private AdptVO adptVO;
	private CategoryDataVO categoryDataVO;
	
	final String AIMAGETYPE = "adpt";
}
