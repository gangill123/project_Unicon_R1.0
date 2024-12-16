package com.Unicon.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.CheckImageVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.OptionVO;
import com.Unicon.domain.ProductVO;
import com.Unicon.persistence.AdptDAO;
import com.Unicon.persistence.ProductDAO;



@Service("ProductService")
public class ProductService {
	
	@Inject
	private ProductDAO pDao;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductService.class);

	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void productInsert(ProductVO vo) {
		logger.debug("( •̀ ω •́ )✧  productInsert() 실행");
		pDao.productInsert(vo);
	}
	
	// 상품 조회 / 수정 , 조건에 맞는 list 가져오기
	public List<ProductVO> getProductList(Map<String, Object> data) {
		List<ProductVO> productList = pDao.getProductList(data);
		return productList;
	}
	
	
	// 상품 조회 / 수정, 상품 옵션 가져오기
	public List<OptionVO> getOptionDetails(String product_id) {
		List<OptionVO> optionList = pDao.getOptionDetails(product_id);
		return optionList;
	}
	// 상품 조회 / 수정 , 판매 상태 수정
	public int updateStatus(Map<String, Object> data) {
		int result = pDao.updateStatus(data);
		return result;
	}
	
	// 상품 조회 / 수정 , 날짜 수정
	public int updateDate(Map<String, Object> data) {
		int result = pDao.updateDate(data);
		return result;
	}
	
	// 상품 조회 / 수량 수정
	public int updateStock(Map<String, Object> data) {
		int result = pDao.updateStock(data);
		return result;
	}
	// 상품 조회 / 판매가 수정
	public int updatePrice(Map<String, Object> data) {
		int result = pDao.updatePrice(data);
		return result;
	}
	

}
