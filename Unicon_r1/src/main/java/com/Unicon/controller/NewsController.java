package com.Unicon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Unicon.domain.NewsVO;
import com.Unicon.service.NewsService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	@Autowired
	private NewsService nService;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);
	

	@GetMapping("")
	public String newsPage(Model model) {
		
		// 소식정보 가져오기
		List<NewsVO> newsAllInfo = nService.getNewsAll();
		model.addAttribute("newsAllInfo", newsAllInfo);
		
		return "/news/news";
	}
	
	
	@GetMapping("/getNews_lastest")
	@ResponseBody
	public List<NewsVO> getNewsLastest(){
		logger.debug("getNewsLastest() 호출");
		return nService.getNewsAll();
	}
	
	
	
	
	
}
