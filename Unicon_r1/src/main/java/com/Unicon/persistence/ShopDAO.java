package com.Unicon.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.OptionVO;
import com.Unicon.domain.ShopVO;

@Repository("shopDAO")
public class ShopDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper namespace 정보 저장
		private static final String NAMESPACE = "com.Unicon.mapper.ShopMapper";
	
		
	// shop페이지 접속 시 모든 상품정보 가져오기
	public List<ShopVO> getProductAll(){
		return sqlSession.selectList(NAMESPACE+".getProductAll");
	}
		
	// 상세페이지 이동 시 해당 상품정보 가져오기
	public ShopVO getProduct(String product_id) {
		return sqlSession.selectOne(NAMESPACE+".getProduct", product_id);
	}
	
	
	
	// 옵션1 선택시 옵션2 세부옵션 가져오기
	public List<OptionVO> getOption(String product_id) {
		return sqlSession.selectList(NAMESPACE+".getOption", product_id);
	}
	
	
	
	
	
	
	
	
	
}
