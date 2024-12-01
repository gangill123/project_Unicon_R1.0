package com.Unicon.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.CategoryDataVO;

import lombok.extern.log4j.Log4j2;

@Repository(value = "CategoryDataDAO")
@Log4j2
public class CategoryDataDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.Unicon.mapper.categoryDataMapper.";
	
	public List<CategoryDataVO> petTypeAll() {
		log.info("( •̀ ω •́ )✧ petTypeAll() 실행");
		return sqlSession.selectList(NAMESPACE+"petTypeAll");
	}
	
	public List<CategoryDataVO> petTypeDetail(CategoryDataVO cDataVO) {
		log.info("( •̀ ω •́ )✧ petTypeDetail() 실행");
		return sqlSession.selectList(NAMESPACE+"petTypeDetail", cDataVO);
	}
	
	
	public List<CategoryDataVO> petProductsCategory() {
		log.info("( •̀ ω •́ )✧petProductsCategory() 실행");
		return sqlSession.selectList(NAMESPACE+"petProductsCategory");
	}
	
	public List<CategoryDataVO> petProductsCategoryDetail(String value) {
		log.info("( •̀ ω •́ )✧petProductsCategoryDetail(value) 실행"+ value);
		return sqlSession.selectList(NAMESPACE+"petProductsCategoryDetail",value);
	}
	
	
}
