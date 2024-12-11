package com.Unicon.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Unicon.domain.CategoryDataVO;
import com.Unicon.domain.NewsVO;
import com.Unicon.domain.PetVO;
import com.Unicon.persistence.MypageDAO;
import com.Unicon.persistence.NewsDAO;

@Service("myService")
public class MypageService {
	
	@Autowired
	private MypageDAO mydao;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageService.class);
	
	// 펫카테고리 가져오기
	public List<CategoryDataVO> getPetType(int petOpt){
		return mydao.getPetType(petOpt);
	}
	
	// 펫 등록하기
	public void createPet(PetVO vo) {
		mydao.createPet(vo);
	}
	
	// 반려동물 조회
	public List<PetVO> getPetAll(String member_id){
		return mydao.getPetAll(member_id);
	}
	
	// 반려동물 조회(pet_id)
	public PetVO getPet(int pet_id) {
		return mydao.getPet(pet_id);
	}
	
	// 펫 정보 수정
	public void petUpdate(PetVO vo) {
		mydao.petUpdate(vo);
	}
	
	// 펫src 가져오기 (삭제용)
	public String getPetSrc(int pet_id) {
		return mydao.getPetSrc(pet_id);
	}
	
	// 펫 정보 삭제
	public void petDelete(int pet_id) {
		mydao.petDelete(pet_id);
	}
	
}
