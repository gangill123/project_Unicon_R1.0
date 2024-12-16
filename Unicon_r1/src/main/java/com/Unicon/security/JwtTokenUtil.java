package com.Unicon.security;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import java.util.Date;

import javax.crypto.SecretKey;

public class JwtTokenUtil {

	// JWT를 생성할 때 사용하는 비밀 키 (HS256에 맞게 길이 32바이트 이상으로 설정)
    private static final String SECRET_KEY = "mySecretKey1234567890123456789012";  // 32바이트

    // SecretKey 객체로 변환
    private static final SecretKey secretKey = Keys.hmacShaKeyFor(SECRET_KEY.getBytes());

    // 토큰 만료 시간 (예시로 1시간 설정)
    private static final long EXPIRATION_TIME = 1000 * 60 * 60;

    // JWT 생성
    public static String generateToken(String memberId) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + EXPIRATION_TIME);

        return Jwts.builder()
                .setSubject(memberId)  // 토큰에 저장할 사용자 정보 (예: username)
                .setIssuedAt(now)      // 토큰 발급 시간
                .setExpiration(expiryDate)  // 토큰 만료 시간
                .signWith(secretKey, SignatureAlgorithm.HS256)   // HS256 알고리즘 사용
                .compact();
    }

    // JWT에서 사용자 정보(username) 추출
    public static String getUsernameFromToken(String token) {
        Claims claims = getClaimsFromToken(token);
        return claims.getSubject();
    }

    // JWT에서 만료 시간 추출
    public static Date getExpirationDateFromToken(String token) {
        Claims claims = getClaimsFromToken(token);
        return claims.getExpiration();
    }

    // JWT가 만료되었는지 확인
    public static boolean isTokenExpired(String token) {
        Date expiration = getExpirationDateFromToken(token);
        return expiration.before(new Date());
    }

    // JWT의 claims을 추출
    public static Claims getClaimsFromToken(String token) {
        return Jwts.parserBuilder()  // parser() 대신 parserBuilder() 사용
                .setSigningKey(secretKey)  // secretKey 객체 사용
                .build()
                .parseClaimsJws(token)
                .getBody();
    }
    // 토큰 검증 (유효한지 확인)
    public static boolean validateToken(String token, String username) {
        String tokenUsername = getUsernameFromToken(token);
        return (tokenUsername.equals(username) && !isTokenExpired(token));
    }
}
