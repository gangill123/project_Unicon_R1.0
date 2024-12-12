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
import com.Unicon.domain.CategoryDataVO;
import com.Unicon.domain.InterestVO;
import com.Unicon.domain.OptionVO;
import com.Unicon.domain.OrdersVO;
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
	
	// 장바구니에서 수량 조절 시 db 실시간 저장
	@PostMapping("/quantityChange/{num}")
	@ResponseBody
	public void quantityChange(@PathVariable("num") int num, @RequestParam("cart_detail_id") int cart_detail_id) {
		logger.info("quantityPlus() 호출");
		logger.info("num : {}", num);
		logger.info("cart_detail_id : {}",cart_detail_id);
		
		sService.quantityChange(cart_detail_id, num);
	}
	
	
	// 옵션 삭제 시 ajax구현(디비 실시간 반영)
	@PostMapping("/removeOption/{cart_detail_id}")
	@ResponseBody
	public void removeOption(@PathVariable("cart_detail_id") int cart_detail_id) {
		logger.info("removeOption() 호출");
		logger.info("cart_detail_id : {}",cart_detail_id);
		
		sService.removeOption(cart_detail_id);
	}
	
	// 상품 삭제시 ajax구현(디비 실시간 반영)
	@PostMapping("/removeProduct/{cart_id}")
	@ResponseBody
	public void removeProduct(@PathVariable("cart_id") int cart_id) {
		logger.info("removeProduct() 호출");
		logger.info("cart_id:{}",cart_id);
		
		sService.removeProduct(cart_id);
		
	}
	
	// 장바구니 비우기 클릭 시 ajax구현(디비 실시간 반영)
	@PostMapping("/emptyCart")
	@ResponseBody
	public void emptyCart(HttpSession session) {
		logger.info("emptyCart() 호출");
		String member_id = (String)session.getAttribute("member_id");
		
		sService.emptyCart(member_id);
	}
	
	
	// 장바구니에서 구매하기 시 주문테이블에 저장
	@PostMapping("/cartToCheckout")
	@ResponseBody
	public void cartToCheckout(OrdersVO vo) {
		logger.info("cartToCheckout() 호출");
		logger.debug("vo:{}",vo);
		
		sService.cartToCheckout(vo);
		
	}
	
	// 카테고리 대분류 선택 시 소분류 데이터 가져오기
	@GetMapping("/makeCategoryValue/{category_code}")
	@ResponseBody
	public CategoryDataVO makeCategoryValue(@PathVariable("category_code") int category_code) {
		logger.info("makeCategoryValue() 호출");
		logger.info("category_code : {}",category_code);
		
		return sService.makeCategoryValue(category_code);
		
	}
	
	
	
	// 쇼핑몰 페이징 처리
	@GetMapping("/shop_paging")
	@ResponseBody
	public List<ShopVO> shopPaging(int categoryType, String categoryValue) {
		logger.info("shopPaging() 호출");
		logger.info("categoryType : {}",categoryType);
		logger.info("categoryValue : {}",categoryValue);
		
		
		// categoryType이 0값일 때 -> 첫 로드 페이징
		if(categoryType == 0) {
			return sService.getProductAll();
		} else {
			return sService.shopPaging(categoryValue);
		}
	}
	
	
	// 하트 눌렀을때 관심상품으로 등록하기
	@PostMapping("/addInterest/{product_id}")
	@ResponseBody
	public Integer addInterest(@PathVariable("product_id") String product_id, 
			HttpSession session) {
		logger.info("product_id : {}",product_id);
		
		String member_id = (String)session.getAttribute("member_id");
		
		// 이미 등록된 관심상품인지 확인
		InterestVO checkInterest = sService.checkInterest(product_id, member_id);
		
		if(checkInterest == null) {
			sService.addInterest(product_id, member_id);
			return 0;
		} else {
			return 1;
		}
		
	}
	
	
	
	
	
	

}
