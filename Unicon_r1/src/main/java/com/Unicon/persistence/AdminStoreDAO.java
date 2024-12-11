package com.Unicon.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.AdminNoticeVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.OptionVO;
import com.Unicon.domain.ProductVO;

@Repository("AdminStoreDAO")
public class AdminStoreDAO {

	@Inject
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AdminStoreDAO.class);

	private static final String NAMESPACE = "com.Unicon.mapper.adminStoreMapper.";

	public List<ImageVO> getAdminStoreImg() {
		logger.debug("( •̀ ω •́ )✧ getAdminStoreImg() 실행");
		
		// 복지몰 슬라이드 이미지 받아오기.
		List<ImageVO> list	= sqlSession.selectList(NAMESPACE + "selectStoreMainImg");
		return list;
	}
	
	
	public void updateMainImg(List<ImageVO> list) {
		
		logger.debug("( •̀ ω •́ )✧ updateMainImg() 실행" + list);
		int result = sqlSession.update(NAMESPACE+"updateStoreImages", list);
		logger.debug("( •̀ ω •́ )✧ updateMainImg() 실행" + result);
		
		
	}
	
	public List<ProductVO> getNewProducts() {
		logger.debug("( •̀ ω •́ )✧ getNewProducts() 실행");
		
		// 복지몰 슬라이드 이미지 받아오기.
		List<ProductVO> list	= sqlSession.selectList(NAMESPACE + "getNewProducts");
		return list;
	}
	
	
	// 스토어 관리자 공지사항
	public List<AdminNoticeVO> getNoticeList() {
		logger.debug("( •̀ ω •́ )✧ getNoticeList() 실행");
		List<AdminNoticeVO> list	= sqlSession.selectList(NAMESPACE + "getNoticeList");
		return list;
	}
	
	// 스토어 관리자 공지사랑 생성
	public int insertNotices(AdminNoticeVO vo) {
		logger.debug("( •̀ ω •́ )✧ insertNotices() 실행"+ vo);
		// 복지몰 슬라이드 이미지 받아오기.
		int result = sqlSession.insert(NAMESPACE + "insertNotices", vo);
		return result;
	}
	
	// 스토어 관리자 특정 공지사항 조회
	public AdminNoticeVO getNoticeById(int ano) {
		logger.debug("( •̀ ω •́ )✧ getNoticeById() 실행"+ ano);
		// 복지몰 슬라이드 이미지 받아오기.
		AdminNoticeVO result = sqlSession.selectOne(NAMESPACE + "getNoticeById", ano);
		return result;
	}
	
	

}
