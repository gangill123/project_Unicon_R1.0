package com.Unicon.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.InquiryAnswerVO;
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
    // 답변 메서드 ////////////////////////////////
    
    // 답변 추가
    @Override
    public void insertAnswer(InquiryAnswerVO answer) {
        sqlSession.insert(NAMESPACE +".insertAnswer", answer);
    }

    // 게시글 번호에 해당하는 답변 조회
    @Override
    public List<InquiryAnswerVO> getAnswersByBno(int bno) {
        return sqlSession.selectList(NAMESPACE+".getAnswersByBno", bno);
    }   
    @Override
    public void updateAnswer(int dno, String dcontent) {
        Map<String, Object> params = new HashMap<>();
        params.put("dno", dno);
        params.put("dcontent", dcontent);
        
        sqlSession.update(NAMESPACE + ".updateAnswer", params);
    }   
    @Override
    public void deleteAnswer(int dno) {
        sqlSession.delete(NAMESPACE + ".deleteAnswer", dno);
    }
    @Override
    public InquiryAnswerVO getAnswerByDno(int dno) {
        return sqlSession.selectOne(NAMESPACE + ".getAnswerByDno", dno);
    }
    // 문의 상태 변경
    @Override
	public void updateInquiryStatus(int bno){
    	sqlSession.update(NAMESPACE + ".updateInquiryStatus", bno);
    };
    @Override
    public InquiryVO getInquiryByBno(int bno) {
        return sqlSession.selectOne(NAMESPACE + ".getInquiryByBno", bno);
    }
    // 조회수
    @Override
    public void updateViewCount(int bno) {
        sqlSession.update(NAMESPACE + ".updateViewCount", bno);
        logger.debug("update view 조회수 +1 증가 메서드 실행 {}",bno);
    }
    @Override
    public void deleteBoards(List<Integer> ids) {
    	sqlSession.delete(NAMESPACE + ".deleteBoards", ids);	
    }
    @Override
    public List<InquiryVO> searchBoards(String startDate, String endDate, String istatus) {
        Map<String, String> params = Map.of(
                "startDate", startDate,
                "endDate", endDate,
                "istatus", istatus
        );
        return sqlSession.selectList(NAMESPACE+".searchBoards", params);
    }
    
    
    
}
    
    


