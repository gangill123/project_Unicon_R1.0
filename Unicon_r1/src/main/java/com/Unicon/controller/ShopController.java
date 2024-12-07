package com.Unicon.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Unicon.domain.CartVO;
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
	
	// shop- 상세페이지
	@GetMapping("/shop_detail/{product_id}")
	public String showDetailPage(@PathVariable("product_id") String product_id,
			Model model) {
		logger.debug("product_id : {}",product_id);
		
		// 상품정보 + 이미지정보
		ShopVO productInfo = sService.getProduct(product_id);
		model.addAttribute("productInfo", productInfo);
		
		// 옵션정보 가져오기(조합형 - 가격제외)
		List<OptionVO> optionInfo = sService.getOption1(product_id);
		model.addAttribute("optionInfo", optionInfo);
		
		// 옵션정보 가져오기(단독형 - 가격포함)
		List<OptionVO> optionInfoForSole = sService.getOption1ForSole(product_id);
		model.addAttribute("optionInfoForSole", optionInfoForSole);
		
		
		return "/shop/shop_detail";
	}
	
	// 단독형 - 옵션 선택 시 해당 옵션가격 가져오기
	@GetMapping("/getSoleOptionPrice/{product_id}")
	@ResponseBody
	public int getSoleOptionPrice(@PathVariable("product_id") String product_id, @RequestParam String option_value) {
		return sService.getSoleOptionPrice(product_id, option_value);
	}
	
	
	
	// 조합형 - 옵션1 선택 시 옵션2 세부내용 가져오기
	@GetMapping("/getOption/{product_id}")
	@ResponseBody
	public List<OptionVO> getOption(@PathVariable("product_id") String product_id, @RequestParam String option_value) {
		logger.info("product_id : {}", product_id);
		logger.info("option_value: {}", option_value);
		
		return sService.getOption(product_id, option_value);
	}
	
	
	// 조합형 - 옵션1, 옵션2 선택 시 해당 옵션가격 가져오기
	@GetMapping("/getOptionPrice/{product_id}")
	@ResponseBody
	public int getOptionPrice(@PathVariable("product_id") String product_id, @RequestParam String option_value,
			@RequestParam String option_value2) {
		
		logger.info("option_value : {}", option_value);
		logger.info("option_value2 : {}", option_value2);
		
		return sService.getOptionPrice(product_id, option_value, option_value2);
	}
	
	
	// 상품선택정보를 카트테이블에 저장
	@PostMapping("/shopToCart")
	@ResponseBody
	public String shopToCart(@ModelAttribute CartVO vo) {
		logger.info("shopToCart() 호출");
		logger.info("vo:{}",vo);
		
		sService.saveCart(vo);
		
		return null;
	}
	
	
	// 장바구니 페이지 이동
	@GetMapping("/cart")
	public String shopCart(HttpSession session, Model model) {
		
		//member_id에 해당하는 장바구니 정보 모두 가져오기
		String member_id = (String)session.getAttribute("member_id");
		
		List<CartVO> cartAllInfo = sService.getCartAll(member_id);
		model.addAttribute("cartAllInfo", cartAllInfo);
		
		return "/shop/shop_cart";
	}
	
	
	

}
