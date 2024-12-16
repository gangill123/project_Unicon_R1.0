package com.Unicon.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Unicon.service.AdptService;
import com.Unicon.service.CategoryDataService;


@Controller
@RequestMapping(value = "/AM/*")
public class AdptMgmtController {
	
	@Inject
	private CategoryDataService cService;
	@Inject
	private AdptService aService;
	private static final Logger logger = LoggerFactory.getLogger(AdptMgmtController.class);
	
	
	@GetMapping(value = "/main")
	public void adptmgmtMain() {
		logger.debug("( •̀ ω •́ )✧ adptmgmtMain() 실행");
	}
	
	@GetMapping(value = "/animals/creation")
	public String animalAdd() {
		logger.debug("( •̀ ω •́ )✧ animalAdd() 실행");
		return "/adptmgmt/animals/animal_add";
	}
	
	@GetMapping(value = "/animals/list")
	public String animalViewAll() {
		logger.debug("( •̀ ω •́ )✧ animalViewAll() 실행");
		
		return "/adptmgmt/animals/animal_read";
	}
	
	@GetMapping(value = "/animals/list/{animal_id}")
	public String animalViewOne() {
		logger.debug("( •̀ ω •́ )✧ animalViewOne() 실행");
		return "/adptmgmt/animals/animal_update";
	}
	
	@GetMapping(value = "/counsel/people")
	public String adptCounselViewAll() {
		logger.debug("( •̀ ω •́ )✧ adptCounselViewAll() 실행");
		return "/adptmgmt/animals/counsel_read";
	}
	
	@GetMapping(value = "/writings/add/{animal_id}")
	public String writingAdd() {
		logger.debug("( •̀ ω •́ )✧ writingAdd() 실행");
		return "/adptmgmt/writings/writing_add";
	}
	
	@GetMapping(value = "/writings/all")
	public String writingViewAll() {
		logger.debug("( •̀ ω •́ )✧ writingViewAll() 실행");
		return "/adptmgmt/writings/writing_read";
	}
	
	@GetMapping(value = "/writings/all/{animal_id}")
	public String writingViewOne() {
		logger.debug("( •̀ ω •́ )✧ writingViewOne() 실행");
		return "/adptmgmt/writings/writing_update";
	}
	
	@GetMapping(value = "/manager/animals/everything")
	public String managerAnimalViewAll() {
		logger.debug("( •̀ ω •́ )✧ managerAnimalViewAll() 실행");
		
		return "/adptmgmt/manager/manager_animal_read";
	}
	
	@GetMapping(value = "/manager/animals/everything/{animal_id}")
	public String managerAnimalViewOne() {
		logger.debug("( •̀ ω •́ )✧ managerAnimalViewOne() 실행");
		return "/adptmgmt/manager/manager_animal_update";
	}
	
	@GetMapping(value = "/manager/writings/total")
	public String managerWritingViewAll() {
		logger.debug("( •̀ ω •́ )✧ managerWritingViewAll() 실행");
		return "/adptmgmt/manager/manager_writing_read";
	}
	
	@GetMapping(value = "/manager/writings/total/{animal_id}")
	public String managerWritingViewOne() {
		logger.debug("( •̀ ω •́ )✧ managerWritingViewOne() 실행");
		return "/adptmgmt/manager/manager_writing_update";
	}
	
	
}
