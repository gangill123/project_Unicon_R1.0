package com.Unicon.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.Unicon.domain.CartDetailVO;
import com.Unicon.domain.CartVO;
import com.Unicon.domain.CategoryDataVO;
import com.Unicon.domain.InterestVO;
import com.Unicon.domain.OptionVO;
import com.Unicon.domain.OrdersVO;
import com.Unicon.domain.ReviewVO;
import com.Unicon.domain.ShopVO;
import com.Unicon.persistence.ShopDAO;

@Service("shopService")
public class ShopService {
	
	@Autowired
	private ShopDAO sdao;

	// shop페이지 접속 시 모든 상품정보 가져오기
	public List<ShopVO> getProductAll(){
		return sdao.getProductAll();
	}
	
	// 상세페이지 이동 시 해당 상품정보 가져오기
	public ShopVO getProduct(String product_id) {
		return sdao.getProduct(product_id);
	}
	
	// 옵션1 정보 가져오기(조합형 - 가격제외)
	public List<OptionVO> getOption1(String product_id) {
		return sdao.getOption1(product_id);
	}
	
	// 옵션1 정보 가져오기(단독형 - 가격포함)
	public List<OptionVO> getOption1ForSole(String product_id) {
		return sdao.getOption1ForSole(product_id);
	}
	
	// 단독형 - 옵션 선택 시 해당 옵션가격 가져오기
	public int getSoleOptionPrice(String product_id, String option_value) {
		Map<String, String> optionPriceMap = new HashMap<String, String>();
		optionPriceMap.put("product_id", product_id);
		optionPriceMap.put("option_value", option_value);
		
		return sdao.getSoleOptionPrice(optionPriceMap);
	}
	
	
	
	// 조합형 - 옵션1 선택시 옵션2 세부옵션 가져오기
	public List<OptionVO> getOption(String product_id, String option_value) {
		
		Map<String, String> optionMap = new HashMap<String, String>();
		optionMap.put("product_id", product_id);
		optionMap.put("option_value", option_value);
		
		return sdao.getOption(optionMap);
	}
	
	
	// 조합형 - 옵션1 옵션2 선택 시 해당 옵션 가격 가져오기
	public int getOptionPrice(String product_id, String option_value, String option_value2) {
		Map<String, String> optionPriceMap = new HashMap<String, String>();
		optionPriceMap.put("product_id", product_id);
		optionPriceMap.put("option_value", option_value);
		optionPriceMap.put("option_value2", option_value2);
		
		return sdao.getOptionPrice(optionPriceMap);
	}
	
	// 상세페이지에서 선택한 상품정보 cart, cart_detail 저장하기
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void saveCart(CartVO vo) {
		
		// 1. 장바구니에 이미 저장된 product_id가 있는지 확인 -> cart_id 가져옴
		if(sdao.getCartidToCheck(vo) != 0) {
			int cart_id = sdao.getCartidToCheck(vo);
			
			for(CartDetailVO cdvo : vo.getCart_list()) {
				cdvo.setCart_id(cart_id);
			}
			
			sdao.updateCart(vo);
			
			
		} else {
			//최신 카트번호 가져오기
			int cart_id;
			if(sdao.getCartid() == 0) {
				cart_id = 1;
			} else {
				cart_id = sdao.getCartid() + 1;
			}
			
			vo.setCart_id(cart_id);
			
			for(CartDetailVO cdvo : vo.getCart_list()) {
				cdvo.setCart_id(cart_id);
			}
			
			// cart 및 cart_detail 테이블에 저장
			sdao.saveCart(vo);
		}
		
	}
	
	// 장바구니 페이지 이동 시 장바구니 정보 가져오기
	public List<CartVO> getCartAll(String member_id){
		return sdao.getCartAll(member_id);
	}
	
	
	// 장바구니에서 수량 조절 시 db 실시간 저장
	public void quantityChange(int cart_detail_id, int num) {
		
		Map<String, Integer> quantityChangeMap = new HashMap<String, Integer>();
		quantityChangeMap.put("cart_detail_id", cart_detail_id);
		quantityChangeMap.put("num", num);
		
		sdao.quantityChange(quantityChangeMap);
	}
	
	// 옵션 삭제 시 ajax구현(디비 실시간 반영)
	public void removeOption(int cart_detail_id) {
		sdao.removeOption(cart_detail_id);
	}
	
	// 상품 삭제시 ajax구현(디비 실시간 반영)
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void removeProduct(int cart_id) {
		sdao.removeProduct(cart_id);
	}
	
	// 장바구니 비우기 클릭 시 ajax구현(디비 실시간 반영)
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void emptyCart(String member_id) {
		
		// member_id에 해당하는 모든 cart_id 가져오기
		List<CartVO> cartIds = sdao.getCartIdForEmpty(member_id);
		
		// cart와 cart_detail에서 정보 삭제하기
		sdao.removeCartAndDetail(member_id, cartIds);
	}
	
	// 장바구니에서 구매하기 시 주문테이블로 저장
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void cartToCheckout(OrdersVO vo) {
		sdao.cartToCheckout(vo);
	}
	
	// 카테고리 대분류 선택 시 소분류 데이터 가져오기
	public CategoryDataVO makeCategoryValue(int category_code) {
		return sdao.makeCategoryValue(category_code);
	}
	
	// 상품 페이징 처리(첫 로딩시)
	public List<ShopVO> shopPaging(String product_category_value){
		return sdao.shopPaging(product_category_value);
	}
	
	
	// 이미 등록된 관심상품인지 확인
	public InterestVO checkInterest(String product_id, String member_id) {
		Map<String, String> addInterestMap = new HashMap<String, String>();
		addInterestMap.put("product_id", product_id);
		addInterestMap.put("member_id", member_id);
		
		return sdao.checkInterest(addInterestMap);
	}
	
	// 하트 눌렀을때 관심상품으로 등록하기
	public void addInterest(String product_id, String member_id) {
		Map<String, String> addInterestMap = new HashMap<String, String>();
		addInterestMap.put("product_id", product_id);
		addInterestMap.put("member_id", member_id);
		
		sdao.addInterest(addInterestMap);
	}
	
	// 리뷰정보 가져오기
	public List<ReviewVO> getReview(String product_id){
		return sdao.getReview(product_id);
	}
	
	
	// 세일품목 정보 가져오기(4개)
	public List<ShopVO> getShopItemForMain(){
		return sdao.getShopItemForMain();
	}
	
	
	
}
