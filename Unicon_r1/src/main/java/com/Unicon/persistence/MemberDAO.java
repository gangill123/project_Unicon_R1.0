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
    	return sqlSession.selectOne(NAMESPACE + "checkIdOverlap", memberId); // 쿼리 실행
    }    
    
    // 회원 가입 정보 입력
    public Integer insertMember(MemberVO member) {
        logger.info("insertMember 실행");
        return sqlSession.insert(NAMESPACE + "insertMember", member);
    }   
    
    
    
}
