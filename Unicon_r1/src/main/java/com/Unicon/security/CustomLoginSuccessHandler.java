package com.Unicon.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.Unicon.controller.LoginController;

/**
 * 로그인 성공시 처리하는 동작
 * (로그인 된 계정 정보에 따른 페이지 이동)
 */

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    private JwtTokenUtil jwtTokenUtil;

    // 생성자에서 JwtTokenUtil을 주입받기
    public CustomLoginSuccessHandler(JwtTokenUtil jwtTokenUtil) {
        this.jwtTokenUtil = jwtTokenUtil;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        logger.info("인증 성공! => 로그인 성공!");

        // 인증된 사용자의 username을 사용하여 JWT 토큰 생성
        String memberId = authentication.getName();  // 인증된 사용자 이름
        String jwtToken = jwtTokenUtil.generateToken(memberId);  // JWT 토큰 생성

        // JWT 토큰을 응답 헤더에 추가 (예: "Authorization" 헤더에 포함)
        response.setHeader("Authorization", "Bearer " + jwtToken);

        // 사용자의 권한 정보를 가져옴
        List<String> roles = new ArrayList<>();
        for (GrantedAuthority authority : authentication.getAuthorities()) {
            roles.add(authority.getAuthority());
        }

        // 세션 생성 및 데이터 저장
        HttpSession session = request.getSession();
        session.setAttribute("member_id", memberId); // 사용자 ID 저장
        session.setAttribute("roles", roles); // 권한 정보 저장

        logger.info("세션에 사용자 정보 저장: memberId={}, roles={}", memberId, roles);

        // 로그인 성공 후 모든 사용자를 /main으로 이동
        response.sendRedirect("/main");
       
    }



    }

