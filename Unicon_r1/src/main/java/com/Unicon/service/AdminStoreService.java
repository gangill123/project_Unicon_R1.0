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
	
	// 새로 등록된 상품 갯수
	public int getNewProductCount() {
		int getNewProductCount = aDao.getNewProductCount();
		return getNewProductCount;
	}
	
	// 등록된 상품 갯수
	public int getProductCount() {
		int getProductCount = aDao.getProductCount();
		return getProductCount;
	}
	
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
	
	// 새로운 상품 등록 반려 동작
	public int rejectProduct(String prod_id) {
		logger.debug("( •̀ ω •́ )✧  rejectProduct(prod_id)s 실행");
		int result = aDao.rejectProduct(prod_id);
		return result;
	}
	// 새로운 상품 등록 승인 동작
	public int approvalProduct(String prod_id) {
		logger.debug("( •̀ ω •́ )✧  approvalProduct(prod_id)s 실행");
		int result = aDao.approvalProduct(prod_id);
		return result;
	}
	// 승인된 상품 등록 글 가져오기.
	public List<ProductVO> getProductList() {
		List<ProductVO> list = aDao.getProductList();
		return list;
	}
	
	// 어드민 공지사항 List 목록
	public List<AdminNoticeVO> getNoticeList() {
		List<AdminNoticeVO> list = aDao.getNoticeList();
		return list;
	}
	
	// 어드민 공지사항 생성
	public int insertNotices(AdminNoticeVO vo) {
		int result = aDao.insertNotices(vo);
		return result;
	}
	
	// 특정 공지사항 자세히 보기
	public AdminNoticeVO getNoticeById(int ano) {
		return aDao.getNoticeById(ano);
	}
	// 어드민 공지사항 수정
	public int updateNotices(AdminNoticeVO vo) {
		int result = aDao.updateNotices(vo);
		return result;
	}
	
	// 팝업 생성
	public int insertPopup(AdminNoticeVO vo) {
		int result = aDao.insertPopup(vo);
		return result;
	}
	// 공지사항 list 5개
	public List<AdminNoticeVO> getNoticePreviewList() {
		List<AdminNoticeVO> list = aDao.getNoticePreviewList();
		return list;
	}
	// 활성화된 팝업창 
	public List<AdminNoticeVO> getActivePopupList() {
		List<AdminNoticeVO> list = aDao.getActivePopupList();
		return list;
	}
	
	// 팝업창 목록
	public List<AdminNoticeVO> getPopupList() {
		List<AdminNoticeVO> list = aDao.getPopupList();
		return list;
	}
	// 특정 팝업창 보기
	public AdminNoticeVO getPopupById(int ano_id) {
		AdminNoticeVO list = aDao.getPopupById(ano_id);
		return list;
	}
	// 특정 팝업 수정
	public int updatePopup(AdminNoticeVO vo) {
		int list = 0;
		if(vo.getPopup_images() == null) {
			 list = aDao.updatePopup(vo);
		}else {
			 list = aDao.updatePopupAndImg(vo);
		}
		return list;
	}
	
	


}
