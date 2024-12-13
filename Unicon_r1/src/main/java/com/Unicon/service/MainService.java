package com.Unicon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Unicon.persistence.MainDAO;

@Service("mainService")
public class MainService {

	@Autowired
	private MainDAO maindao;
	
	
	// 장바구니 수량 가져와서 세션저장
	public int getCartCount(String member_id) {
		return maindao.getCartCount(member_id);
	}
	
	
}
