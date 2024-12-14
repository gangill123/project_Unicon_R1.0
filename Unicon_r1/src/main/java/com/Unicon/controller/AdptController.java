package com.Unicon.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Unicon.domain.AnimalVO;
import com.Unicon.service.AdptService;

@Controller
@RequestMapping(value = "/adpt*")
public class AdptController {
	
	@Inject
	private AdptService aService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdptController.class);
	
	
	@GetMapping(value= "")
	public String adptViewAll() {
		logger.debug("( •̀ ω •́ )✧ adptViewAll() 실행");
		
		return "/adpt/adpt_list";
	}
	
	
	@GetMapping("/getAdpt/{adptFilter}")
	@ResponseBody
	public List<AnimalVO> getAdptType(@PathVariable("adptFilter") String adptFilter, HttpServletRequest req){
		logger.debug("( •̀ ω •́ )✧ getAdptType 실행");
		
		List<AnimalVO> animalList = aService.getAdptFilterView(adptFilter);
		
		if(adptFilter.equals("local")) {
			String member_id = (String)req.getSession().getAttribute("member_id");
			return null;
		} else {
			return animalList;
		}
	}
	
}
