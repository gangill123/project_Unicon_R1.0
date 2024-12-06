package com.Unicon.service;

import java.util.List;

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
	
	// 옵션1 정보 가져오기
	public List<OptionVO> getOption1(String product_id) {
		return sdao.getOption1(product_id);
	}
	
	
	// 옵션1 선택시 옵션2 세부옵션 가져오기
	public List<OptionVO> getOption(String product_id) {
		return sdao.getOption(product_id);
	}
	
}
