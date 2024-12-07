package com.Unicon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Unicon.domain.OptionVO;
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
	
	
	
	
	
	
}
