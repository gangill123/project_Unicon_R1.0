package com.Unicon.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.Unicon.domain.MemberVO;
import com.Unicon.persistence.MemberDAO;

@Service
public class MemberService {
    
    @Inject
    private MemberDAO mDAO;
    
    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder; // BCryptPasswordEncoder 주입받기
    
    private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
    
    // 아이디 중복 여부 확인
    public boolean isIdOverlap(String memberId) {
        // 아이디 중복 체크
        int count = mDAO.checkIdOverlap(memberId); // DAO에서 아이디 중복 체크
        return count > 0; // count > 0이면 중복, 그렇지 않으면 사용 가능
    }
    // 이메일 중복 여부 확인
    public boolean checkEmailOverlap(String email) {
        logger.info("이메일 중복 체크 실행: " + email);
        // DAO 메서드를 호출하여 이메일 중복 여부를 확인
        int count = mDAO.checkEmailOverlap(email);
        return count > 0;
    }

    
    // 일반 회원 가입 처리 메서드
    public boolean registerGenMember(MemberVO memberVO) {
        logger.info("(S)회원 가입 처리 시작: registerGenMember()");

        // 비밀번호 암호화
        String encodedPassword = bcryptPasswordEncoder.encode(memberVO.getMember_pw());
        memberVO.setMember_pw(encodedPassword);  // 암호화된 비밀번호로 설정

        // DAO 호출하여 회원 가입 처리
        int result = mDAO.insertMember(memberVO);

        // 회원 가입 성공 시
        if (result == 1) {
            logger.info("회원 가입 성공: " + memberVO.getMember_id());
            return true;
        } else {
            logger.error("회원 가입 실패: " + memberVO.getMember_id());
            return false;
        }
    }
    
    // 보호 센터 회원 가입 처리 메서드
    public boolean registerInstMember(MemberVO memberVO) {
        logger.info("(S)회원 가입 처리 시작: registerInstMember()");

        // 비밀번호 암호화
        String encodedPassword = bcryptPasswordEncoder.encode(memberVO.getMember_pw());
        memberVO.setMember_pw(encodedPassword);;  // 암호화된 비밀번호로 설정

        // DAO 호출하여 회원 가입 처리
        int result = mDAO.insertInstMember(memberVO);

        // 회원 가입 성공 시
        if (result == 1) {
            logger.info("회원 가입 성공: " + memberVO.getMember_id());
            return true;
        } else {
            logger.error("회원 가입 실패: " + memberVO.getMember_id());
            return false;
        }
    }

    // 쇼핑몰 관리자 회원 가입 처리 메서드
    public boolean registerShopMember(MemberVO memberVO) {
        logger.info("(S) 회원 가입 처리 시작: registerShopMember()");

        // 비밀번호 암호화
        String encodedPassword = bcryptPasswordEncoder.encode(memberVO.getMember_pw());
        memberVO.setMember_pw(encodedPassword);; // 암호화된 비밀번호로 설정

        // DAO 호출하여 회원 가입 처리
        int result = mDAO.insertShopMember(memberVO);

        if (result == 1) {
            logger.info("회원 가입 성공: " + memberVO.getMember_id());
            return true;
        } else {
            logger.error("회원 가입 실패: " + memberVO.getMember_id());
            return false;
        }
    }
    
    public String getUserType(String memberId) {
        return mDAO.getUserTypeByMemberId(memberId);  // DAO 메서드를 호출하여 member_type 값을 조회
    }

}
