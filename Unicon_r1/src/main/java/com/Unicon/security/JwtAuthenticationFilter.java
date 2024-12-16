package com.Unicon.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;

import com.Unicon.service.CustomUserDetailsService;

import io.jsonwebtoken.Claims;

public class JwtAuthenticationFilter implements Filter {

    private JwtTokenUtil jwtTokenUtil; // JwtTokenUtil 필드
    private CustomUserDetailsService customUserDetailsService; // CustomUserDetailsService 필드

    // JwtTokenUtil Setter
    public void setJwtTokenUtil(JwtTokenUtil jwtTokenUtil) {
        this.jwtTokenUtil = jwtTokenUtil;
    }

    // CustomUserDetailsService Setter
    public void setCustomUserDetailsService(CustomUserDetailsService customUserDetailsService) {
        this.customUserDetailsService = customUserDetailsService;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 초기화 작업 필요없으면 그냥 빈 메서드로 두면 된다는데...초기화 작업 언제 필요한데...?
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String header = httpRequest.getHeader("Authorization");

        if (header != null && header.startsWith("Bearer ")) {
            String token = header.substring(7); // "Bearer " 제외한 토큰 부분 추출함.

            try {
                Claims claims = jwtTokenUtil.getClaimsFromToken(token); // JWT에서 Claims 추출함.
                String userId = claims.getSubject(); // JWT에서 사용자 ID 추출

                // 사용자 정보가 유효하고 SecurityContext에 인증된 사용자 설정 -- 이게 
                if (userId != null) {
                    // userDetailsService를 사용하여 사용자 정보 로드
                    customUserDetailsService.loadUserByUsername(userId);

                    // 인증된 사용자로 SecurityContext 설정
                    SecurityContextHolder.getContext().setAuthentication(
                            new UsernamePasswordAuthenticationToken(
                                    userId, null, AuthorityUtils.createAuthorityList("ROLE_MEMBER"))
                    );
                }
            } catch (Exception e) {
                // 토큰이 유효하지 않거나 에러 발생 시 처리
                e.printStackTrace();
            }
            //예외처리 필요하면 초기화 안해도 된다는건가?? 초기화 할때 토큰이 유효하지 않으면 어떻게 되는거지?
        }

        // 다음 필터로 요청 전달
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // 초기화 작업 필요 없으면 빈 메서드로 두기
    }
}
