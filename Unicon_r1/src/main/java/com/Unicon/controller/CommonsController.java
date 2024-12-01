package com.Unicon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/")
public class CommonsController {

    private static final Logger logger = LoggerFactory.getLogger(CommonsController.class);

    // 카카오 로그인 처리 (POST)
    @PostMapping("/kakao/login")
    public RedirectView kakaoLogin(@RequestBody Map<String, String> request) {
        String accessToken = request.get("token");

        // 카카오 사용자 정보 요청
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken); // 카카오 API를 호출하기 위한 Authorization 헤더 설정

        HttpEntity<String> entity = new HttpEntity<>(headers);

        // 카카오 사용자 정보 API 엔드포인트
        String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
        ResponseEntity<Map> response = restTemplate.exchange(userInfoUrl, HttpMethod.GET, entity, Map.class);

        if (response.getStatusCode().is2xxSuccessful()) {
            Map<String, Object> userInfo = response.getBody(); // 카카오 사용자 정보 반환
            System.out.println("카카오 사용자 정보: " + userInfo);

            // 로그인 성공 시 리디렉션 처리 (예: 대시보드 페이지로)
            return new RedirectView("/main/template"); // 대시보드 페이지로 리디렉션
        } else {
            return new RedirectView("/login/mLogin"); // 로그인 실패 시 로그인 페이지로 리디렉션
        }
    }
    
	    //네이버
	    private static final String CLIENT_ID = "fgGRzC0jJbhNFcOJszh2"; // 발급받은 Client ID
	    private static final String CLIENT_SECRET = "발급받은 Client Secret"; // 발급받은 Client Secret
	    private static final String REDIRECT_URI = "http://localhost:8088/main/template"; // 네이버 로그인 후 돌아올 URL
	
	    // state 값을 세션에 저장
	    @PostMapping("/save-state")
	    public ResponseEntity<String> saveState(@RequestBody Map<String, String> request, HttpSession session) {
	        String state = request.get("state");
	        session.setAttribute("naverLoginState", state); // 세션에 state 값 저장
	        return ResponseEntity.ok("State saved successfully");
    }
    
	    // 네이버 로그인 처리
	    @PostMapping("/naver/login")
	    public RedirectView naverLogin(@RequestBody Map<String, String> request, HttpSession session) {
	        String code = request.get("code"); // 네이버에서 전달받은 인증 코드
	        String state = request.get("state"); // 네이버에서 전달받은 state
	        String savedState = (String) session.getAttribute("naverLoginState"); // 세션에 저장된 state 값
	
	        // CSRF 검증
	        if (savedState == null || !savedState.equals(state)) {
	            logger.error("State mismatch error");
	            return new RedirectView("/login/mLogin"); // 검증 실패 시 로그인 페이지로 리디렉션
	        }
	
	        // 네이버 액세스 토큰 요청
	        RestTemplate restTemplate = new RestTemplate();
	        String tokenUrl = "https://nid.naver.com/oauth2.0/token";
	
	        // 네이버에 요청할 파라미터 설정
	        String params = String.format(
	            "grant_type=authorization_code&client_id=%s&client_secret=%s&code=%s&state=%s",
	            CLIENT_ID, CLIENT_SECRET, code, state
	        );
	
	        ResponseEntity<Map> tokenResponse = restTemplate.exchange(
	            tokenUrl + "?" + params,
	            HttpMethod.POST,
	            null,
	            Map.class
	        );
	
	        if (!tokenResponse.getStatusCode().is2xxSuccessful()) {
	            logger.error("Failed to retrieve access token from Naver");
	            return new RedirectView("/login/mLogin"); // 실패 시 로그인 페이지로 리디렉션
	        }
	
	        Map<String, Object> tokenBody = tokenResponse.getBody();
	        String accessToken = (String) tokenBody.get("access_token"); // 액세스 토큰 추출
	
	        // 네이버 사용자 정보 요청
	        HttpHeaders headers = new HttpHeaders();
	        headers.set("Authorization", "Bearer " + accessToken);
	        HttpEntity<String> entity = new HttpEntity<>(headers);
	
	        String userInfoUrl = "https://openapi.naver.com/v1/nid/me";
	        ResponseEntity<Map> userResponse = restTemplate.exchange(userInfoUrl, HttpMethod.GET, entity, Map.class);
	
	        if (!userResponse.getStatusCode().is2xxSuccessful()) {
	            logger.error("Failed to retrieve user info from Naver");
	            return new RedirectView("/login/mLogin"); // 실패 시 로그인 페이지로 리디렉션
	        }
	
	        Map<String, Object> userInfo = userResponse.getBody();
	        logger.info("Naver user info: " + userInfo);
	
	        // 여기서 사용자 정보로 추가 처리를 할 수 있습니다 (예: 회원가입/로그인 처리)
	
	        // 성공 시 대시보드 페이지로 리디렉션
	        return new RedirectView("/main/template");
	    }

    
    
}
