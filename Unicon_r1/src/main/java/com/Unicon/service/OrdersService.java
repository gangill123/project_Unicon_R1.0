package com.Unicon.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Unicon.domain.AddressVO;
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
	
	
	
	
}
