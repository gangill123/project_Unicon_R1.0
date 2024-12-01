package com.Unicon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Unicon.domain.CategoryDataVO;
import com.Unicon.persistence.CategoryDataDAO;

import lombok.extern.log4j.Log4j2;


@Service(value = "CategoryDataService")
@Log4j2
public class CategoryDataService {
	
	@Inject
	CategoryDataDAO cDAO;
	
	public List<CategoryDataVO> petTypeAll() {
		log.info("( •̀ ω •́ )✧ petTypeAll() 실행");
		return cDAO.petTypeAll();
	}
	
	public List<CategoryDataVO> petTypeDetail(CategoryDataVO cDataVO) {
		log.info("( •̀ ω •́ )✧ petTypeDetail(int num) 실행");
		return cDAO.petTypeDetail(cDataVO);
	}
	
	
	public List<CategoryDataVO> petProductsCategory() {
		log.info("( •̀ ω •́ )✧petProductsCategory() 실행");
		return cDAO.petProductsCategory();
	}
	
	public List<CategoryDataVO> petProductsCategoryDetail(String value) {
		log.info("( •̀ ω •́ )✧petProductsCategoryDetail() 실행");
		return cDAO.petProductsCategoryDetail(value);
	}
	
}
