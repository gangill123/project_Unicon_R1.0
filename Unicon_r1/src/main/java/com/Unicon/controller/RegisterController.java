package com.Unicon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/register/")
public class RegisterController {


		private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	    
		// http://localhost:8088/register/mType
	    @GetMapping("/mType")
		public void mType() {
			logger.info("mType() 실행!");
		}    
	    
	    //일반회원 회원가입
		// http://localhost:8088/register/mRegister
	    @GetMapping("/mRegister")
		public void mRegister() {
			logger.info("mRegister() 실행!");
		} 

	    //일반회원 회원가입
		// http://localhost:8088/register/mRegister2
	    @GetMapping("/mRegister2")
		public void mRegister2() {
			logger.info("mRegister2() 실행!");
		}   
	    
	    //일반회원 회원가입
		// http://localhost:8088/register/mRegister3
	    @GetMapping("/mRegister3")
		public void mRegister3() {
			logger.info("mRegister3() 실행!");
		}   	    
	    

	    //쇼핑몰 관리자 회원가입
		// http://localhost:8088/register/sRegister
	    @GetMapping("/sRegister")
		public void sRegister() {
			logger.info("sRegister() 실행!");
		} 
	    
	    //보호 센터 회원가입
		// http://localhost:8088/register/iRegister
	    @GetMapping("/iRegister")
		public void iRegister() {
			logger.info("iRegister() 실행!");
		}	    
}
