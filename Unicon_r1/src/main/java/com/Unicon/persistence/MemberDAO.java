package com.Unicon.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.MemberVO;

@Repository("MemberDAO")
public class MemberDAO {

    @Inject
    private SqlSession sqlSession;  

    private static final Logger logger = LoggerFactory.getLogger(MemberDAO.class);
    
    private static final String NAMESPACE = "com.Unicon.mapper.memberMapper.";  

    // 아이디 중복 체크
    public int checkIdOverlap(String memberId) {
    	logger.info("아이디 중복 체크 실행: " + memberId);
    	return sqlSession.selectOne(NAMESPACE + "checkIdOverlap", memberId); 
    }    
    
    // 일반 회원 가입 정보 입력
    public Integer insertMember(MemberVO member) {
        logger.info("insertMember 실행");
        return sqlSession.insert(NAMESPACE + "insertMember", member);
    }   
    
    //보호 센터 회원가입 정보 입력
    public Integer insertInstMember(MemberVO member) {
        logger.info("insertInstMember 실행");
        return sqlSession.insert(NAMESPACE + "insertInstMember", member);
    }   
    
    //쇼핑몰 관리자 회원가입 정보 입력
    public Integer insertShopMember(MemberVO member) {
        logger.info("insertShopMember 실행");
        return sqlSession.insert(NAMESPACE + "insertShopMember", member);
    }   

    // 사용자 정보 조회 (아이디 기반)
    public MemberVO getMemberByUsername(String memberId) {
        logger.info("********************************************getMemberByUsername 실행: " + memberId);
        return sqlSession.selectOne(NAMESPACE + "getMemberByUsername", memberId);
    }    
}
