package com.Unicon.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.AddressVO;
import com.Unicon.domain.OrdersDetailVO;
import com.Unicon.domain.OrdersVO;

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
	
	// 배송지 수정하기
	public void addressUpdate(AddressVO vo) {
		sqlSession.update(NAMESPACE+".addressUpdate", vo);
	}
	
	
	// 배송지 정보 삭제
	public void addressDelete(int address_id) {
		sqlSession.delete(NAMESPACE+".addressDelete", address_id);
	}
	
	// 기본배송정보 가져가기
	public AddressVO getDefalutAddrInfo(String member_id) {
		return sqlSession.selectOne(NAMESPACE+".getDefalutAddrInfo", member_id);
	}
	
	// 주문정보 가져오기(결제용)
	public OrdersVO getOrdersInfoForPay(String member_id) {
		return sqlSession.selectOne(NAMESPACE+".getOrdersInfoForPay", member_id);
	}
	
	// 주문정보 가져오기
	public List<OrdersVO> getOrdersInfo(String member_id) {
		return sqlSession.selectList(NAMESPACE+".getOrdersInfo", member_id);
	}
	
	
	// 결제완료 시 주문정보 업데이트
	public void saveAddr(OrdersVO vo) {
		// oders 테이블 업데이트
		sqlSession.update(NAMESPACE+".updateOrdersToPayCompl", vo);
		// oders_detail 테이블 업데이트
		sqlSession.update(NAMESPACE+".updateOrdersDetailToPayCompl", vo);
		// oders_detail_option 테이블 업데이트
		sqlSession.update(NAMESPACE+".updateOrdersDetailOptionToPayCompl", vo);
	}
	
	
	// order_detail_id에 따른 주문정보 가져오기
	public OrdersVO getOrdersInfoToDetailId(int order_detail_id) {
		return sqlSession.selectOne(NAMESPACE+".getOrdersInfoToDetailId", order_detail_id);
	}
	
	// 결제 후 주문결제 정보 가져오기
	public OrdersVO getOrdersInfoAfterCheckout(String order_id) {
		return sqlSession.selectOne(NAMESPACE+".getOrdersInfoAfterCheckout", order_id);
	}
	
	// 주문상태 갯수 가져오기
	public List<Integer> getOrdersCount(String member_id){
		
		List<String> orderStatus = new ArrayList<>();
		orderStatus.add("결제완료");
		orderStatus.add("배송준비중");
		orderStatus.add("배송중");
		orderStatus.add("배송완료");
		orderStatus.add("구매확정");

		Map<String, String> orderStatusMap = new HashMap<String, String>();
		orderStatusMap.put("member_id", member_id);
		
		List<Integer> orderCnt = new ArrayList<Integer>();
		
		for(String status : orderStatus) {
			orderStatusMap.put("status", status);
			orderCnt.add(sqlSession.selectOne(NAMESPACE+".getOrdersCount", orderStatusMap));
		}
		
		return orderCnt;
	}
	
	
	// 마이페이지 주문관리 주문상태에 따른 주문정보 가져오기
	public List<OrdersVO> getOrdersInfoAll(String member_id){
		return sqlSession.selectList(NAMESPACE+".getOrdersInfoAll", member_id);
	}
	
	// 마이페이지 주문관리 주문상태에 따른 주문정보 가져오기
	public List<OrdersVO> getOrdersInfoToStatus(Map<String, String> orderStatusMap){
		return sqlSession.selectList(NAMESPACE+".getOrdersInfoToStatus", orderStatusMap);
	}
	
	// 마이페이지 주문관리 주문상태에 따른 주문정보 가져오기 + 기간설정
	public List<OrdersVO> getOrdersInfoToStatusAndTime(Map<String, Object> orderStatusMap){
		return sqlSession.selectList(NAMESPACE+".getOrdersInfoToStatusAndTime", orderStatusMap);
	}
	
	// 마이페이지 리뷰작성 시 모달 로직(상품정보 가져오기)
	public OrdersDetailVO ordersDetailForReview(int order_detail_option_id) {
		return sqlSession.selectOne(NAMESPACE+".ordersDetailForReview", order_detail_option_id);
	}

}
