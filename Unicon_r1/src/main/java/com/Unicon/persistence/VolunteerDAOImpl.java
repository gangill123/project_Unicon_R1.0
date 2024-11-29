package com.Unicon.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.VolunteerApplyVO;
import com.Unicon.domain.VolunteerVO;

@Repository
public class VolunteerDAOImpl implements VolunteerDAO {
    
    private static final Logger logger = LoggerFactory.getLogger(VolunteerDAOImpl.class);
    
    @Inject
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.Unicon.mapper.VolunteerMapper";
    
    @Override
    public void insertVolunteer(VolunteerVO volunteer) throws Exception {
        sqlSession.insert(NAMESPACE + ".insertVolunteer", volunteer);
    }
    
    @Override
    public void updateVolunteer(VolunteerVO volunteer) throws Exception {
        sqlSession.update(NAMESPACE + ".updateVolunteer", volunteer);
    }
    
    @Override
    public void updateVolunteerStatus(Map<String, Object> params) throws Exception {
        sqlSession.update(NAMESPACE + ".updateVolunteerStatus", params);
    }
    
    @Override
    public void updateRecruitStatus(Map<String, Object> params) throws Exception {
        sqlSession.update(NAMESPACE + ".updateRecruitStatus", params);
    }
    
    @Override
    public VolunteerVO selectVolunteer(Long voId) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".selectVolunteer", voId);
    }
    
    @Override
    public List<VolunteerVO> getOngoingVolunteers(Map<String, Object> params) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".getOngoingVolunteers", params);
    }

    @Override
    public List<VolunteerVO> getClosedVolunteers(Map<String, Object> params) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".getClosedVolunteers", params);
    }
    
    @Override
    public int selectVolunteerCount(Map<String, Object> params) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".selectVolunteerCount", params);
    }
    
    @Override
    public void updateGuide(VolunteerVO guide) throws Exception {
        try {
            int result = sqlSession.update(NAMESPACE + ".updateGuide", guide);
            logger.info("Update result: {}", result);  
            if (result == 0) {
                throw new Exception("업데이트된 행이 없습니다.");
            }
        } catch (Exception e) {
            logger.error("안내문 수정 DAO 실패: ", e);
            throw e;
        }
    }
    
    @Override
    public VolunteerVO selectVolunteerInfo(VolunteerVO guideId) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".selectVolunteerInfo", guideId);
    }
    
    @Override
    public void insertVolunteerApply(VolunteerApplyVO apply) throws Exception {
        sqlSession.insert(NAMESPACE + ".insertVolunteerApply", apply);
    }
    
    @Override
    public void updateVolunteerApplyStatus(Map<String, Object> params) throws Exception {
        sqlSession.update(NAMESPACE + ".updateVolunteerApplyStatus", params);
    }
    
    @Override
    public VolunteerApplyVO selectVolunteerApply(Long voId) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".selectVolunteerApply", voId);
    }
    
    @Override
    public List<VolunteerApplyVO> selectVolunteerApplyList(Map<String, Object> params) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".selectVolunteerApplyList", params);
    }
    
    @Override
    public int selectVolunteerApplyCount(Long volunteerId) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".selectVolunteerApplyCount", volunteerId);
    }
}
