package com.Unicon.service;

import java.util.List;
import java.util.Map;

import com.Unicon.domain.VolunteerApplyVO;
import com.Unicon.domain.VolunteerVO;

public interface VolunteerService {
    // 봉사활동 공고 관련
    void registerVolunteer(VolunteerVO volunteer) throws Exception;
    void updateVolunteer(VolunteerVO volunteer) throws Exception;
    void deleteVolunteer(Long voId) throws Exception;
    VolunteerVO getVolunteer(Long voId) throws Exception;
    Map<String, Object> getVolunteerList(int page, int size, String status, String keyword, 
                                       String startDate, String endDate) throws Exception;
    List<VolunteerVO> getOngoingVolunteers() throws Exception;
    List<VolunteerVO> getClosedVolunteers() throws Exception;
    void closeRecruitment(Long voId) throws Exception;
    void openRecruitment(Long voId) throws Exception;
    void updateGuide(VolunteerVO guide) throws Exception;
    VolunteerVO getVolunteerInfo() throws Exception;
    
    // 봉사활동 신청 관련
    void submitApplication(VolunteerApplyVO application) throws Exception;
    void approveApplication(Long voId) throws Exception;
    void rejectApplication(Long voId, String reason, String reasonDetail) throws Exception;
    void cancelApplication(Long voId, String reason, String reasonDetail) throws Exception;
    List<VolunteerApplyVO> getMyApplications(String userId) throws Exception;
    Map<String, Object> getApplicationList(Long volunteerId, String status) throws Exception;
    List<VolunteerVO> getDraftList() throws Exception;
}
