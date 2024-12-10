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

import com.Unicon.domain.AdminNoticeVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.CheckImageVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.ProductVO;
import com.Unicon.persistence.AdminStoreDAO;
import com.Unicon.persistence.AdptDAO;
import com.Unicon.persistence.ProductDAO;



@Service("AdminStoreService")
public class AdminStoreService {
	
//	@Inject
//	private ProductDAO pDao;
	
	@Inject
	private AdminStoreDAO aDao;
	
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(AdminStoreService.class);
	
	// 복지목 메인 슬라이드 이미지 가져오기.
	public List<ImageVO> getAdminStoreImg() {
		logger.debug("( •̀ ω •́ )✧  getAdminStoreImg() 실행");
		 List<ImageVO> list = aDao.getAdminStoreImg();
		
		return  list;
	}
	
	// 복지몰 메인 슬라이드 이미지 수정.
	public void updateMainImg(List<ImageVO> list) {
		logger.debug("( •̀ ω •́ )✧  updateMainImg(list) 실행");
		aDao.updateMainImg(list);
	}
	
	// 새로운 상품 등록 글 가져오기.
	public List<ProductVO> getNewProducts() {
		List<ProductVO> list = aDao.getNewProducts();
		return list;
	}
	
	public List<AdminNoticeVO> getNoticeList() {
		List<AdminNoticeVO> list = aDao.getNoticeList();
		return list;
	}
	public int insertNotices(AdminNoticeVO vo) {
		int result = aDao.insertNotices(vo);
		return result;
	}
	
	public AdminNoticeVO getNoticeById(int ano) {
		return aDao.getNoticeById(ano);
	}
	
	 


}
