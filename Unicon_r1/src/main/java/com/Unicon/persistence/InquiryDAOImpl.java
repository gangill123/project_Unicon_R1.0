package com.Unicon.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.InquiryFileVO;
import com.Unicon.domain.InquiryVO;

@Repository
public class InquiryDAOImpl implements InquiryDAO {

	private static final Logger logger = LoggerFactory.getLogger(InquiryDAOImpl.class);

	@Autowired
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.unicon.mapper.InquiryMapper";

	@Override
	public List<InquiryVO> getAllInquiries() {
		logger.debug("문의 게시판 DAO 조회 실행");
		return sqlSession.selectList(NAMESPACE + ".getAllInquiries");
	}

	@Override
	public List<InquiryVO> getBoards(int offset, int limit) {
		Map<String, Object> params = new HashMap<>();
		params.put("offset", offset);
		params.put("limit", limit);
		return sqlSession.selectList(NAMESPACE + ".getBoards", params);
	}

	@Override
	public int getTotalCount() {
		return sqlSession.selectOne(NAMESPACE + ".getTotalCount");
	}

	@Override
	public void insertInquiry(InquiryVO inquiry) {
	    sqlSession.insert(NAMESPACE + ".insertInquiry", inquiry);  // inquiry 객체를 전달
	}
	

    @Override
    public void insertFile(InquiryFileVO inquiryFileVO) {
        sqlSession.insert(NAMESPACE + ".insertFile", inquiryFileVO);  // 파일 정보 저장
    }
    @Override
    public InquiryVO getBoardDetail(int bno) {
    	return sqlSession.selectOne(NAMESPACE + ".getBoardDetail", bno);  // 파일 정보 저장
    	
    }

}
