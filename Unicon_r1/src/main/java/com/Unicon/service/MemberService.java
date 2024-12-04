package com.Unicon.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.Unicon.domain.MemberVO;
import com.Unicon.persistence.MemberDAO;

@Service
public class MemberService {
	
	@Inject
	MemberDAO mDAO;
	
    private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
    

    // 아이디 중복 여부 확인
    public boolean isIdOverlap(String memberId) {
        // 아이디 중복 체크
        int count = mDAO.checkIdOverlap(memberId); // DAO에서 아이디 중복 체크
        return count > 0; // count > 0이면 중복, 그렇지 않으면 사용 가능
    }
    
    
    // 일반 회원 가입 처리 메서드
    public boolean registerGenMember(MemberVO memberVO) {
        logger.info("(S)회원 가입 처리 시작: registerGenMember()");

        // DAO 호출하여 회원 가입 처리
        int result = mDAO.insertMember(memberVO);

        // 회원 가입 성공 시
        if (result == 1) {
            logger.info("회원 가입 성공: " + memberVO.getMemberId());
            return true;
        } else {
            logger.error("회원 가입 실패: " + memberVO.getMemberId());
            return false;
        }
    }
}
