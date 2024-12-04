package com.Unicon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login/")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	//통합 로그인 페이지
	// http://localhost:8088/login/customLogin
	public void mLogin() {
		logger.info("mLogin() 실행!");
	}
	
    // customLogin 동작 처리 (GET)
    @GetMapping("/customLogin")
    public void myLogin() throws Exception {
        logger.info("myLogin() 실행");
        logger.info("customLogin.jsp 뷰 페이지 이동 실행");
    }
    
	// http://localhost:8088/login/register
    @GetMapping("/register")
	public void register() {
		logger.info("register() 실행!");
	}
    
	// http://localhost:8088/login/register3
    @GetMapping("/register3")
	public void register3() {
		logger.info("register() 실행!");
	}    
	   

}
