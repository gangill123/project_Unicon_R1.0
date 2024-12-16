package com.Unicon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    // 통합 로그인 페이지
    // http://localhost:8088/login/customLogin
    @GetMapping("/customLogin")
    public String showLoginForm() {
        logger.info("customLogin() 실행");
        return "login/customLogin"; 
    }

    // 회원가입 페이지
    // http://localhost:8088/login/register
    @GetMapping("/register")
    public void register() {
        logger.info("register() 실행!");
    }

    // 다른 회원가입 관련 페이지
    // http://localhost:8088/login/register3
    @GetMapping("/register3")
    public void register3() {
        logger.info("register3() 실행!");
    }
}
