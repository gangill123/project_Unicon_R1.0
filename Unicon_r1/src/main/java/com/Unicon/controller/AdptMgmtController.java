package com.Unicon.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Unicon.service.AdptService;


@Controller
@RequestMapping(value = "/AM/*")
public class AdptMgmtController {
	
	@Inject
	private static final Logger logger = LoggerFactory.getLogger(AdptMgmtController.class);

	
	@GetMapping(value = "/main")
	public void adptmgmtMain() throws Exception {
		logger.info("( •̀ ω •́ )✧ adptmgmtMain() 실행");
	}
	
	@GetMapping(value = "/animals/creation")
	public String animalAdd() throws Exception {
		logger.info("( •̀ ω •́ )✧ animalAdd() 실행");
		return "/adptmgmt/animals/insert";
	}
	
	@GetMapping(value = "/animals/list")
	public String animalViewAll() throws Exception {
		logger.info("( •̀ ω •́ )✧ animalView() 실행");
		return "/adptmgmt/animals/read";
	}
	
	@GetMapping(value = "/animals/list/{animal_id}")
	public String animalViewOne() throws Exception {
		logger.info("( •̀ ω •́ )✧ animalView() 실행");
		return "/adptmgmt/animals/update";
	}
	
}
