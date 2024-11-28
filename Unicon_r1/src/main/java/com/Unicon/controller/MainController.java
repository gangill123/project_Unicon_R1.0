package com.Unicon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Unicon.domain.MainSlideVO;
import com.Unicon.service.MainSlideService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MainSlideService msService;
	
	
	@GetMapping("")
	public String main(Model model) {
		
		logger.debug("main() 호출");
		
		// 슬라이드 정보 가져오기
		List<MainSlideVO> slideInfo = msService.getSlideForMain();
		model.addAttribute("slideInfo", slideInfo);
		
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
