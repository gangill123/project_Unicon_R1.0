package com.Unicon.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.AddressVO;

@Repository("ordersDAO")
public class OrdersDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.Unicon.mapper.OrdersMapper";
	
	
	// 기본배송지 있는 지 확인 -> address_id 가져와서 바로 default값 수정
	public void checkDefaultAddr(AddressVO vo) {
		Integer address_id = sqlSession.selectOne(NAMESPACE+".checkDefaultAddr", vo);
		if(address_id != null) {
			sqlSession.update(NAMESPACE+".updateDefalutAddr", address_id);
		}
	}
	
	// 배송지 등록
	public void addressCreate(AddressVO vo) {
		sqlSession.insert(NAMESPACE+".addressCreate", vo);
	}
	
	
	// 배송지 정보 가져오기
	public List<AddressVO> getAddrInfo(String member_id){
		return sqlSession.selectList(NAMESPACE+".getAddrInfo", member_id);
	}
	
	// 배송지 정보 가져오기(수정 버튼 시)
	public AddressVO getAddrToId(int address_id) {
		return sqlSession.selectOne(NAMESPACE+".getAddrToId", address_id);
	}
	
	

}
