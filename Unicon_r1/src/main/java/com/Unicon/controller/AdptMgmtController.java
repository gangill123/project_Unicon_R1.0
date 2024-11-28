package com.Unicon.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Unicon.service.AdptService;


@Controller
@RequestMapping(value = "/adptmgmt/*")
public class AdptMgmtController {
	
	@Inject
	private AdptService aService;
	private static final Logger logger = LoggerFactory.getLogger(AdptMgmtController.class);

	
	@GetMapping(value = "/main")
	public void adptmgmtMain() throws Exception {
		logger.info("( •̀ ω •́ )✧ adptmgmtMain() 실행");
	}
	
	@GetMapping(value = "/animals")
	public String animalAdd() throws Exception {
		logger.info("( •̀ ω •́ )✧ animalAdd() 실행");
		return "/adptmgmt/animals/insert";
	}
	
}
