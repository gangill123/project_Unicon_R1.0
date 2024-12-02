package com.Unicon.persistence;

import java.util.List;
import java.util.Map;

import com.Unicon.domain.VolunteerApplyVO;
import com.Unicon.domain.VolunteerVO;

public interface VolunteerDAO {
    // 봉사활동 관련
    void insertVolunteer(VolunteerVO volunteer) throws Exception;
    void updateVolunteer(VolunteerVO volunteer) throws Exception;
    void updateVolunteerStatus(Map<String, Object> params) throws Exception;
    public void updateRecruitStatus(Map<String, Object> params) throws Exception;
    VolunteerVO selectVolunteer(Long voId) throws Exception;
    List<VolunteerVO> getAllVolunteers(Map<String, Object> params) throws Exception;
    List<VolunteerVO> getOngoingVolunteers(Map<String, Object> params) throws Exception;
    List<VolunteerVO> getClosedVolunteers(Map<String, Object> params) throws Exception;
    int selectVolunteerCount(Map<String, Object> params) throws Exception;
    void updateGuide(VolunteerVO guide) throws Exception;
    VolunteerVO selectVolunteerInfo(VolunteerVO guideId) throws Exception;
    
    // 봉사활동 신청 관련
    void insertVolunteerApply(VolunteerApplyVO apply) throws Exception;
    void updateVolunteerApplyStatus(Map<String, Object> params) throws Exception;
    void updateVolunteerApplyReject(Map<String, Object> params) throws Exception;
    VolunteerApplyVO selectVolunteerApply(Long voId) throws Exception;
    List<VolunteerApplyVO> selectVolunteerApplyList(Map<String, Object> params) throws Exception;
    int selectVolunteerApplyCount(Long volunteerId) throws Exception;
}

