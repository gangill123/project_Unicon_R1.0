package com.Unicon.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.CategoryDataVO;
import com.Unicon.persistence.AdptDAO;
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
		return "/adptmgmt/animals/animalinsert";
	}
	
	@GetMapping(value = "/animals/list")
	public String animalViewAll() {
		logger.debug("( •̀ ω •́ )✧ animalViewAll() 실행");
		return "/adptmgmt/animals/animalread";
	}
	
	@GetMapping(value = "/animals/list/{animal_id}")
	public String animalViewOne() {
		logger.debug("( •̀ ω •́ )✧ animalViewOne() 실행");
		return "/adptmgmt/animals/animalupdate";
	}
	
	@GetMapping(value = "/writings/add/{animal_id}")
	public String writingAdd() {
		logger.debug("( •̀ ω •́ )✧ writingAdd() 실행");
		return "/adptmgmt/writings/writinginsert";
	}
	
	@GetMapping(value = "/writings/all")
	public String writingViewAll() {
		logger.debug("( •̀ ω •́ )✧ writingViewAll() 실행");
		return "/adptmgmt/writings/writingread";
	}
	
	@GetMapping(value = "/writings/{animal_id}")
	public String writingViewOne() {
		logger.debug("( •̀ ω •́ )✧ writingViewOne() 실행");
		return "/adptmgmt/writings/writingupdate";
	}
	
	
}
