package com.Unicon.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Unicon.domain.AddressVO;
import com.Unicon.domain.OrdersVO;
import com.Unicon.service.OrdersService;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private OrdersService oService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);

	
	// 주문/결제 페이지
	@GetMapping("/checkout")
	public String checkout(HttpSession session, Model model) {
		
		String member_id = (String)session.getAttribute("member_id");
		// 기본배송정보 가져오기
		AddressVO addrDefalut = oService.getDefalutAddrInfo(member_id);
		model.addAttribute("addrDefalut", addrDefalut);
		
		// 주문정보 가져오기
		OrdersVO ordersInfo = oService.getOrdersInfo(member_id);
		model.addAttribute("ordersInfo", ordersInfo);
		
		
		
		return "/orders/checkout";
	}
	
	// 배송지 추가하기
	@PostMapping("/addressCreate")
	@ResponseBody
	public void addressCreate(@ModelAttribute AddressVO vo, HttpSession session) {
		logger.info("addressCreate() 호출");
		logger.info("vo : {}",vo);
		
		String member_id = (String)session.getAttribute("member_id");
		vo.setMember_id(member_id);
		
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
	
	// 배송지 정보 가져오기(수정 시)
	@PostMapping("/getAddrToId/{address_id}")
	@ResponseBody
	public AddressVO getAddrToId(@PathVariable("address_id") int address_id) {
		logger.info("getAddrToId() 호출");
		logger.info("address_id : {}",address_id);
		
		return oService.getAddrToId(address_id);
	}
	
	// 배송지 정보 수정하기
	@PostMapping("/addressUpdate/{address_id}")
	@ResponseBody
	public void addressUpdate(@PathVariable("address_id") int address_id, AddressVO vo,
			HttpSession session) {
		logger.debug("vo:{}", vo);
		
		String member_id = (String)session.getAttribute("member_id");
		vo.setMember_id(member_id);
		
		oService.addressUpdate(vo);
		
	}
	
	// 배송지 정보 삭제
	@PostMapping("/addressDelete/{address_id}")
	@ResponseBody
	public void addressDelete(@PathVariable("address_id") int address_id) {
		logger.debug("address_id:{}",address_id);
		
		oService.addressDelete(address_id);
	}
	
	
	// 주문결제 페이지에서 결제하기 버튼 클릭 시 로직
	@PostMapping("/saveAddr/{order_id}")
	@ResponseBody
	public void saveAddr(@PathVariable("order_id") String order_id, OrdersVO vo) {
		logger.info("saveAddr() 호출");
		logger.info("vo :{}",vo);
	}
	
	
	
}
