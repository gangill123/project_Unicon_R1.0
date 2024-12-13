package com.Unicon.persistence;

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
	
	
}
