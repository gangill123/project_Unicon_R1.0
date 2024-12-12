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
import com.Unicon.domain.ProductVO;

@Repository("AdminStoreDAO")
public class AdminStoreDAO {

	@Inject
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AdminStoreDAO.class);

	private static final String NAMESPACE = "com.Unicon.mapper.adminStoreMapper.";

	// 복지몰 메인 슬라이드 이미지 받아오기, 어드민 슬라이드 이미지 받아오기
	public List<ImageVO> getAdminStoreImg() {
		logger.debug("( •̀ ω •́ )✧ getAdminStoreImg() 실행");
		
		// 복지몰 슬라이드 이미지 받아오기.
		List<ImageVO> list	= sqlSession.selectList(NAMESPACE + "selectStoreMainImg");
		return list;
	}
	
	
	// 복지몰 메인 슬라이드 이미지 수정
	public void updateMainImg(List<ImageVO> list) {
		logger.debug("( •̀ ω •́ )✧ updateMainImg() 실행" + list);
		int result = sqlSession.update(NAMESPACE+"updateStoreImages", list);
		logger.debug("( •̀ ω •́ )✧ updateMainImg() 실행" + result);
		
	}
	
	// 어드민 새로 등록된 상품 List (아직 mapper 작성 못함.)
	public List<ProductVO> getNewProducts() {
		logger.debug("( •̀ ω •́ )✧ getNewProducts() 실행");
		List<ProductVO> list = sqlSession.selectList(NAMESPACE + "getNewProducts");
		return list;
	}
	
	
	// 스토어 관리자 공지사항 list 전부
	public List<AdminNoticeVO> getNoticeList() {
		logger.debug("( •̀ ω •́ )✧ getNoticeList() 실행");
		List<AdminNoticeVO> list	= sqlSession.selectList(NAMESPACE + "getNoticeList");
		return list;
	}
	
	// 스토어 관리자 공지사항 생성
	public int insertNotices(AdminNoticeVO vo) {
		logger.debug("( •̀ ω •́ )✧ insertNotices() 실행"+ vo);
		int result = sqlSession.insert(NAMESPACE + "insertNotices", vo);
		return result;
	}
	
	// 스토어 관리자 특정 공지사항 조회
	public AdminNoticeVO getNoticeById(int ano) {
		logger.debug("( •̀ ω •́ )✧ getNoticeById() 실행"+ ano);
		AdminNoticeVO result = sqlSession.selectOne(NAMESPACE + "getNoticeById", ano);
		return result;
	}
	
	// 스토어 관리자 공지사항 생성
	public int updateNotices(AdminNoticeVO vo) {
		logger.debug("( •̀ ω •́ )✧ updateNotices() 실행"+ vo);
		int result = sqlSession.update(NAMESPACE + "updateNotices", vo);
		return result;
	}
	
	// 스토어 관리자 팝업 생성
	public int insertPopup(AdminNoticeVO vo) {
		logger.debug("( •̀ ω •́ )✧ insertPopup() 실행"+ vo);
		// 스토어 관리자 팝업 생성
		int result = sqlSession.insert(NAMESPACE + "insertPopup", vo);
		if(result > 0) {
			// 생성된 ID를 가져옴
	        int generatedPopupId = vo.getAnoId();
	        		
			// 팝업 images insert
			List<ImageVO> images = new ArrayList<ImageVO>(vo.getPopup_images());
			for(ImageVO image : images) {
				image.setImage_id(String.valueOf(generatedPopupId));
			}
			sqlSession.insert(NAMESPACE + "insertPopupImg",images);
			
		}
		return result;
	}
	
	// 공지사항 5개 가져오기
	public List<AdminNoticeVO> getNoticePreviewList() {
		logger.debug("( •̀ ω •́ )✧ getNoticePreviewList() 실행");
		// 최신 공지사항 미리보기 리스트 5개
		List<AdminNoticeVO> list = sqlSession.selectList(NAMESPACE + "getNoticePreviewList");
		
		return list;
		
	}
	public List<AdminNoticeVO> getActivePopupList() {
		logger.debug("( •̀ ω •́ )✧ getActivePopupList() 실행");
		
		// 활성화된 팝업 리스트 가져오기,조인된 팝업 이미지 가져오기
		List<AdminNoticeVO> list = sqlSession.selectList(NAMESPACE + "getActivePopupList");

		return list;
		
	}
	

}
