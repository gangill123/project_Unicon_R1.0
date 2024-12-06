package com.Unicon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Unicon.domain.OptionVO;
import com.Unicon.domain.ShopVO;
import com.Unicon.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private ShopService sService;
	
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	
	// shop 페이지
	@GetMapping("")
	public String shopPage(Model model) {
		List<ShopVO> productAllInfo = sService.getProductAll();
		model.addAttribute("productAllInfo", productAllInfo);
		
		return "/shop/shopMain";
	}
	
	// shop-detail 페이지
	@GetMapping("/shop_detail/{product_id}")
	public String showDetailPage(@PathVariable("product_id") String product_id,
			Model model) {
		logger.debug("product_id : {}",product_id);
		
		// 상품정보 + 이미지정보
		ShopVO productInfo = sService.getProduct(product_id);
		model.addAttribute("productInfo", productInfo);
		
		// 옵션정보 가져오기
		List<OptionVO> optionInfo = sService.getOption1(product_id);
		model.addAttribute("optionInfo", optionInfo);
		
		return "/shop/shop_detail";
	}
	
	// 옵션1 선택 시 옵션2 세부내용 가져오기
	@GetMapping("/getOption/{product_id}")
	@ResponseBody
	public List<OptionVO> getOption(@PathVariable("product_id") String product_id) {
		logger.debug("product_id : {}", product_id);
		return sService.getOption(product_id);
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
