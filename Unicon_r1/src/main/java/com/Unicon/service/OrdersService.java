package com.Unicon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Unicon.domain.AddressVO;
import com.Unicon.domain.OrdersVO;
import com.Unicon.persistence.OrdersDAO;

@Service("ordersService")
public class OrdersService {
	
	private static final Logger logger = LoggerFactory.getLogger(OrdersService.class);
	
	@Autowired
	private OrdersDAO odao;

	// 배송지 등록
	public void addressCreate(AddressVO vo) {
		
		if(vo.getIs_default_address().equals("true")) {
			
			logger.info("truetruetruetruetrue");
			
			// 기본주소값 있는지 확인 후 있으면 false로 변경
			odao.checkDefaultAddr(vo);
			// 배송지 저장
			odao.addressCreate(vo);
		} else {
			
			logger.info("elseelseelseelseelseelse");
			
			// 배송지 저장
			odao.addressCreate(vo);
		}
	}
	
	// 배송지 정보 가져오기
	public List<AddressVO> getAddrInfo(String member_id){
		return odao.getAddrInfo(member_id);
	}
	
	// 배송지 정보 가져오기(수정 버튼 시)
	public AddressVO getAddrToId(int address_id) {
		return odao.getAddrToId(address_id);
	}
	
	// 배송지 수정하기
	public void addressUpdate(AddressVO vo) {
		
		if(vo.getIs_default_address().equals("true")) {
			// 기본주소값 있는지 확인 후 있으면 false로 변경
			odao.checkDefaultAddr(vo);
			// 배송지 수정
			odao.addressUpdate(vo);
		} else {
			// 배송지 수정
			odao.addressUpdate(vo);
		}
		
	}
	
	// 배송지 정보 삭제
	public void addressDelete(int address_id) {
		odao.addressDelete(address_id);
	}
	
	// 기본배송정보 가져가기
	public AddressVO getDefalutAddrInfo(String member_id) {
		return odao.getDefalutAddrInfo(member_id);
	}
	
	// 주문정보 가져오기(결제용)
	public OrdersVO getOrdersInfoForPay(String member_id) {
		return odao.getOrdersInfoForPay(member_id);
	}
	
	// 주문정보 가져오기
	public List<OrdersVO> getOrdersInfo(String member_id) {
		return odao.getOrdersInfo(member_id);
	}
	
	// 결제완료 시 주문정보 업데이트
	public void saveAddr(OrdersVO vo) {
		odao.saveAddr(vo);
	}
	
	// order_detail_id에 따른 주문정보 가져오기
	public OrdersVO getOrdersInfoToDetailId(int order_detail_id) {
		return odao.getOrdersInfoToDetailId(order_detail_id);
	}
	
	// 결제 후 주문결제 정보 가져오기
	public OrdersVO getOrdersInfoAfterCheckout(String order_id) {
		return odao.getOrdersInfoAfterCheckout(order_id);
	}
	
	// 주문상태 갯수 가져오기
	public List<Integer> getOrdersCount(String member_id){
		return odao.getOrdersCount(member_id);
	}
	
	// 마이페이지 주문관리 모든 주문정보 가져오기
	public List<OrdersVO> getOrdersInfoAll(String member_id){
		return odao.getOrdersInfoAll(member_id);
	}
	
	// 마이페이지 주문관리 주문상태에 따른 주문정보 가져오기
	public List<OrdersVO> getOrdersInfoToStatus(String orders_detail_status, String member_id){
		
		Map<String, String> orderStatusMap = new HashMap<String, String>();
		orderStatusMap.put("orders_detail_status",orders_detail_status);
		orderStatusMap.put("member_id",member_id);
		return odao.getOrdersInfoToStatus(orderStatusMap);
	}
	
	// 마이페이지 주문관리 주문상태에 따른 주문정보 가져오기 + 기간설정
	public List<OrdersVO> getOrdersInfoToStatusAndTime(String orders_detail_status, String member_id,
			Integer monthVal){
		
		Map<String, Object> orderStatusMap = new HashMap<String, Object>();
		orderStatusMap.put("orders_detail_status",orders_detail_status);
		orderStatusMap.put("member_id",member_id);
		orderStatusMap.put("monthVal", monthVal);
		
		return odao.getOrdersInfoToStatusAndTime(orderStatusMap);
	}
	
	
	
	
	
	
}
