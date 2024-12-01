package com.Unicon.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Unicon.domain.CategoryDataVO;
import com.Unicon.service.CategoryDataService;

@Controller
@RequestMapping(value = "/store/*")
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	
	@Inject
	private CategoryDataService cService;
	
	@RequestMapping( value = "/main" , method=RequestMethod.GET)
	public String main() {
		logger.info("main 실행");
		logger.info(" /store/main.jsp 뷰페이지 실행");
		
		return "/store/main";
	}
	
	
	@RequestMapping( value="/products/list" , method =RequestMethod.GET )
	public void productsList() {
		logger.info("products/list 실행");
	}
	
	@RequestMapping( value="/products/create" , method =RequestMethod.GET )
	public void productsCreate(Model model) {
		logger.info("/products/create 실행");
		
		List<CategoryDataVO> CategoryDataList = cService.petProductsCategory();
		logger.info("/products/create 실행  "+ CategoryDataList );
		
		model.addAttribute("CategoryDataList", CategoryDataList);
	}
	
	
}
