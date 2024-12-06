package com.Unicon.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Unicon.domain.MainSlideVO;
import com.Unicon.domain.NewsVO;
import com.Unicon.service.MainSlideService;
import com.Unicon.service.NewsService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	// http://localhost:8088/main/new_template
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MainSlideService msService;
	@Autowired
	private NewsService nService;
	
	@GetMapping("")
	public String main(Model model, HttpSession session) {
		
		logger.debug("main() 호출");
		
		// 임시 아이디 세션저장
		session.setAttribute("member_id", "junghun87");
		
		// 슬라이드 정보 가져오기
		List<MainSlideVO> slideInfo = msService.getSlideForMain();
		model.addAttribute("slideInfo", slideInfo);
		
		// 소식 정보 가져오기
		NewsVO newsInfo = nService.getNewsForMain();
		model.addAttribute("newsInfo", newsInfo);
		
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
