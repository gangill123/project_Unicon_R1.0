package com.Unicon.persistence;

import java.util.List;
import java.util.Map;

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
	
	// 옵션1 정보 가져오기
	public List<OptionVO> getOption1(String product_id) {
		return sqlSession.selectList(NAMESPACE+".getOption1", product_id);
	}
	
	// 옵션1 정보 가져오기(단독형 - 가격포함)
	public List<OptionVO> getOption1ForSole(String product_id) {
		return sqlSession.selectList(NAMESPACE+".getOption1ForSole", product_id);
	}
	
	
	// 단독형 - 옵션 선택 시 해당 옵션가격 가져오기
	public int getSoleOptionPrice(Map<String, String> optionPriceMap) {
		return sqlSession.selectOne(NAMESPACE+".getSoleOptionPrice", optionPriceMap);
	}
	
	
	// 조합형 - 옵션1 선택시 옵션2 세부옵션 가져오기
	public List<OptionVO> getOption(Map<String, String> optionMap) {
		return sqlSession.selectList(NAMESPACE+".getOption", optionMap);
	}
	
	// 조합형 - 옵션1 옵션2 선택 시 해당 옵션 가격 가져오기
	public int getOptionPrice(Map<String, String> optionPriceMap) {
		return sqlSession.selectOne(NAMESPACE+".getOptionPrice", optionPriceMap);
	}
	
	
	
	
	
	
	
}
