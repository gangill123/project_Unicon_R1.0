package com.Unicon.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mainDAO")
public class MainDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.Unicon.mapper.MainMapper";
	
	// 장바구니 수량 가져와서 세션저장
	public int getCartCount(String member_id) {
		return sqlSession.selectOne(NAMESPACE+".getCartCount", member_id);
	}
	
	// 공고수, 입양완료 수, 유니콘 가입자수, 보호센터 수 가져오기
	public List<Integer> getUnicornInfo(){
		
		List<Integer> uniInfos = new ArrayList<Integer>();
		
		// 입양 공고 수 가져오기
		Integer adptCnt = sqlSession.selectOne(NAMESPACE+".getAdptCnt");
		uniInfos.add(adptCnt);
		
		// 입양완료 수 가져오기
		Integer animalCnt = sqlSession.selectOne(NAMESPACE+".getAnimalCnt");
		uniInfos.add(animalCnt);
		
		// 유니콘 커뮤니티 수 가져오기
		Integer postCnt = sqlSession.selectOne(NAMESPACE+".getPostCnt");
		uniInfos.add(postCnt);
		
		// 보호센터 수 가져오기
		Integer centerCnt = sqlSession.selectOne(NAMESPACE+".getCenterCnt");
		uniInfos.add(centerCnt);
		
		return uniInfos;
	}
	
	
	
	
	
	
	
	
}
