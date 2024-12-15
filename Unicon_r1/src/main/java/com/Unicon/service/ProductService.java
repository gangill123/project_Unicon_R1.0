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
	
	
	public List<ProductVO> getProductList(Map<String, Object> data) {
		List<ProductVO> productList = pDao.getProductList(data);
		
		return productList;
	}
	

}
