package com.Unicon.controller;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.MemberVO;
import com.Unicon.service.MemberService;

@Controller
@RequestMapping("/register/")
public class RegisterController {

    @Inject
    MemberService mService;

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    // http://localhost:8088/register/mType
    @GetMapping("/mType")
    public void mType() {
        logger.info("mType() 실행!");
    }

    // 일반회원 회원가입 페이지 이동
    // http://localhost:8088/register/mRegister4
    @GetMapping("/mRegister4")
    public void mRegister4() {
        logger.info("mRegister4() 실행!");
    }

    // 일반 회원 가입 처리
    @PostMapping("/mRegister4")
    public String registerMember(@ModelAttribute MemberVO memberVO) {
        logger.info("회원 가입 처리 시작");

        // 회원 가입 서비스 호출
        boolean isRegistered = mService.registerGenMember(memberVO);

        if (isRegistered) {
            return "redirect:/register/mRegister5"; // 회원가입 성공 후 완료 페이지로 리다이렉트시킴쓰
        } else {
            return "redirect:/register/mRegister4"; // 실패 시 다시 회원가입 페이지로 리다이렉트시킴쓰
        }
    }
    
    // 아이디 중복 체크 API
    @GetMapping("/checkIdOverlap")
    public ResponseEntity<String> checkIdOverlap(@RequestParam("member_id") String memberId) {
        // 서비스에서 아이디 중복 여부 확인
        boolean isOverlap = mService.isIdOverlap(memberId);

        // 중복된 아이디 있으면 "fail", 없으면 "success" 반환
        if (isOverlap) {
            return ResponseEntity.ok("fail");
        } else {
            return ResponseEntity.ok("success");
        }
    }
    
    // 일반회원 회원가입 완료 페이지 이동
    // http://localhost:8088/register/mRegister5
    @GetMapping("/mRegister5")
    public void mRegister5() {
        logger.info("mRegister5() 실행!");
    }  
    
    
    // 보호 센터 회원가입 페이지 이동
    // http://localhost:8088/register/iRegister
    @GetMapping("/iRegister")
    public void iRegister() {
        logger.info("iRegister() 실행!");
    } 
    
    // 보호센터 회원 가입 처리
    @PostMapping("/iRegister")
    public String registerInstMember(@ModelAttribute MemberVO memberVO) {
        logger.info("회원 가입 처리 시작");

        // 회원 가입 서비스 호출
        boolean isRegistered = mService.registerInstMember(memberVO);

        if (isRegistered) {
            return "redirect:/register/mRegister6"; // 회원가입 성공 후 완료 페이지로 리다이렉트시킴쓰
        } else {
            return "redirect:/register/iRegister"; // 실패 시 다시 회원가입 페이지로 리다이렉트시킴쓰
        }
    }  
    
    // 쇼핑몰 관리자 회원가입 페이지 이동
    // http://localhost:8088/register/sRegister
    @GetMapping("/sRegister")
    public void sRegister() {
        logger.info("sRegister() 실행!");
    }   
    
    // 쇼핑몰 관리자 회원 가입 처리
    @PostMapping("/sRegister")
    public String registerShopMember(@ModelAttribute MemberVO memberVO) {
        logger.info("회원 가입 처리 시작");

        // 회원 가입 서비스 호출
        boolean isRegistered = mService.registerShopMember(memberVO);

        if (isRegistered) {
            return "redirect:/register/mRegister6";  // 회원가입 성공 후 완료 페이지로 리다이렉트!
        } else {
            return "redirect:/register/sRegister";  // 실패 시 다시 회원가입 페이지로 리다이렉트!
        }
    }


    // 센터,쇼핑몰 회원 회원가입 완료 페이지 이동
    // http://localhost:8088/register/mRegister5
    @GetMapping("/mRegister6")
    public void mRegisterz6() {
        logger.info("mRegister6() 실행!");
    }  
        
    
}
