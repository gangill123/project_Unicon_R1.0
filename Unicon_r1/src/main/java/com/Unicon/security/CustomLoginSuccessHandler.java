package com.Unicon.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.Unicon.controller.LoginController;

/**
 * 
 * 로그인 성공시 처리하는 동작
 * (로그인 된 계정 정보에 따른 페이지 이동)
 *
 */

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		logger.info("인증 성공! => 로그인 성공!");
		
		//로그인한 사용자의 권한체크
		List<String> roleNames = new ArrayList<String>();
		
		authentication.getAuthorities().forEach(new Consumer<GrantedAuthority>() {

			@Override
			public void accept(GrantedAuthority authority) {
				roleNames.add(authority.getAuthority());
			}
		});
		
		logger.info("roleNames : {}",roleNames);
		
		//권한에 따른 페이지 이동
		if(roleNames.contains("ROLE_MEMBER")) {
			
			logger.info("일반 회원 로그인 성공!");
			
			response.sendRedirect("/login/memberMain");
			return;
		}
		
	}
}
