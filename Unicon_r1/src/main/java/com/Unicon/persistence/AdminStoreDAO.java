package com.Unicon.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

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
		int result = sqlSession.insert(NAMESPACE+"insertStoreImages", list);
		logger.debug("( •̀ ω •́ )✧ updateMainImg() 실행" + result);
		
		
	}

}
