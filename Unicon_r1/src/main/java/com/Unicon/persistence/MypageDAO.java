package com.Unicon.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.CategoryDataVO;
import com.Unicon.domain.NewsVO;
import com.Unicon.domain.PetVO;

@Repository("mypageDAO")
public class MypageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.Unicon.mapper.MypageMapper";
	
	// 펫카테고리 가져오기
	public List<CategoryDataVO> getPetType(int petOpt){
		return sqlSession.selectList(NAMESPACE+".getPetType", petOpt);
	}
	
	// 펫 등록하기
	public void createPet(PetVO vo) {
		sqlSession.insert(NAMESPACE+".createPet", vo);
	}
	
	// 반려동물 조회
	public List<PetVO> getPetAll(String member_id){
		return sqlSession.selectList(NAMESPACE+".getPetAll", member_id);
	}
	
	// 반려동물 조회(pet_id)
	public PetVO getPet(int pet_id) {
		return sqlSession.selectOne(NAMESPACE+".getPet", pet_id);
	}
	
	// 펫 정보 수정
	public void petUpdate(PetVO vo) {
		sqlSession.update(NAMESPACE+".petUpdate", vo);
	}
	
	// 펫src 가져오기 (삭제용)
	public String getPetSrc(int pet_id) {
		return sqlSession.selectOne(NAMESPACE+".getPetSrc", pet_id);
	}
	
	// 펫 정보 삭제
	public void petDelete(int pet_id) {
		sqlSession.delete(NAMESPACE+".petDelete", pet_id);
	}
	
	
}
