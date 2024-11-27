package com.Unicon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@GetMapping("")
	public String mainTest() {
		
		return "/main/new_main";
	}
	
	//템플릿 테스트
	@GetMapping("/shop")
	public String mainTest2() {
		
		return "main/template";
	}
	
	//템플릿 테스트
	@GetMapping("/test")
	public String mainTest3() {
		
		return "main/test";
	}
	
	
} //controller
