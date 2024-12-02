package com.Unicon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/news")
@Log4j
public class NewsController {

	@GetMapping("")
	public String newsPage() {
		
		
		return "/news/news";
	}
	
	
}
