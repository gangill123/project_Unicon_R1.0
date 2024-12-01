package com.Unicon.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	private static final Logger logger 
					= LoggerFactory.getLogger(NoticeDAOImpl.class);
    
    @Inject
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.Unicon.mapper.NoticeMapper";
    
    @Override
    public void insertNotice(NoticeVO noVo) throws Exception {
        sqlSession.insert(NAMESPACE + ".insertNotice", noVo);
    }
    
    @Override
    public void updateNotice(NoticeVO noVo) throws Exception {
        sqlSession.update(NAMESPACE + ".updateNotice", noVo);
    }
    
    @Override
    public void deleteNotice(Long noId) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("noId", noId);
        params.put("status", "DELETED");
        sqlSession.update(NAMESPACE + ".deleteNotice", params);
    }
    
    @Override
    public List<NoticeVO> selectNoticeList(Map<String, Object> params) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".selectNoticeList", params);
    }
    
    @Override
    public int selectNoticeCount(Map<String, Object> params) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".selectNoticeCount", params);
    }
    
    @Override
    public NoticeVO selectNotice(Long noId) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".selectNotice", noId);
    }
    
    @Override
    public void updateViewCount(Long noId) throws Exception {
        sqlSession.update(NAMESPACE + ".updateViewCount", noId);
    }
    
    @Override
    public void updateStatus(Long noId, String status) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("noticeId", noId);
        params.put("status", status);
        sqlSession.update(NAMESPACE + ".updateStatus", params);
    }
    
    @Override
    public NoticeVO selectPrevNotice(Long noId) throws Exception {
        try {
            return sqlSession.selectOne(NAMESPACE + ".selectPrevNotice", noId);
        } catch (Exception e) {
            logger.error("이전글 조회 실패: {}", noId, e);
            throw new Exception("이전글 조회 중 오류가 발생했습니다.", e);
        }
    }

    @Override
    public NoticeVO selectNextNotice(Long noId) throws Exception {
        try {
            return sqlSession.selectOne(NAMESPACE + ".selectNextNotice", noId);
        } catch (Exception e) {
            logger.error("다음글 조회 실패: {}", noId, e);
            throw new Exception("다음글 조회 중 오류가 발생했습니다.", e);
        }
    }
    
    @Override
    public List<NoticeVO> selectDraftList(Map<String, Object> params) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".selectDraftList", params);
    }

    @Override
    public NoticeVO selectDraft(Long noId) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".selectDraft", noId);
    }
}
