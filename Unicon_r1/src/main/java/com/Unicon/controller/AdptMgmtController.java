package com.Unicon.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Unicon.domain.CategoryDataVO;
import com.Unicon.service.AdptService;
import com.Unicon.service.CategoryDataService;


@Controller
@RequestMapping(value = "/AM/*")
public class AdptMgmtController {
	
	@Inject
	private CategoryDataService cService;
	private static final Logger logger = LoggerFactory.getLogger(AdptMgmtController.class);

	
	@GetMapping(value = "/main")
	public void adptmgmtMain() throws Exception {
		logger.debug("( •̀ ω •́ )✧ adptmgmtMain() 실행");
	}
	
	@GetMapping(value = "/animals/creation")
	public String animalAdd() throws Exception {
		logger.debug("( •̀ ω •́ )✧ animalAdd() 실행");
		return "/adptmgmt/animals/insert";
	}
	
	@GetMapping(value = "/animals/list")
	public String animalViewAll() throws Exception {
		logger.debug("( •̀ ω •́ )✧ animalView() 실행");
		return "/adptmgmt/animals/read";
	}
	
	@GetMapping(value = "/animals/list/{animal_id}")
	public String animalViewOne() throws Exception {
		logger.debug("( •̀ ω •́ )✧ animalViewOne() 실행");
		return "/adptmgmt/animals/update";
	}
	
}
