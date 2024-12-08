package com.Unicon.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Unicon.domain.AddressVO;
import com.Unicon.service.OrdersService;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private OrdersService oService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);

	
	// 주문/결제 페이지
	@GetMapping("/checkout")
	public String checkout() {
		return "/orders/checkout";
	}
	
	// 배송지 추가하기
	@PostMapping("/addressCreate")
	@ResponseBody
	public void addressCreate(@ModelAttribute AddressVO vo) {
		logger.info("addressCreate() 호출");
		logger.info("vo : {}",vo);
		
		// 배송지 등록 + 기본배송지 변경(있을 시)
		oService.addressCreate(vo);
		
	}
	
	
	// 배송지 정보 가져오기
	@GetMapping("/getAddrInfo")
	@ResponseBody
	public List<AddressVO> getAddrInfo(HttpSession session){
		String member_id = (String)session.getAttribute("member_id");
		return oService.getAddrInfo(member_id);
	}
	
	// 배송지 정보 수정하기
	@PostMapping("/getAddrToId/{address_id}")
	@ResponseBody
	public AddressVO getAddrToId(@PathVariable("address_id") int address_id) {
		logger.info("getAddrToId() 호출");
		logger.info("address_id : {}",address_id);
		
		return oService.getAddrToId(address_id);
	}
	
	
}
