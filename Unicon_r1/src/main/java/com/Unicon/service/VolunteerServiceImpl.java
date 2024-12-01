package com.Unicon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Unicon.domain.VolunteerApplyVO;
import com.Unicon.domain.VolunteerVO;
import com.Unicon.persistence.VolunteerDAO;

@Service
public class VolunteerServiceImpl implements VolunteerService {
    
    private static final Logger logger = LoggerFactory.getLogger(VolunteerServiceImpl.class);
    
    @Inject
    private VolunteerDAO volDAO;
    
    @Override
    @Transactional
    public void registerVolunteer(VolunteerVO volunteer) throws Exception {
        try {
            volDAO.insertVolunteer(volunteer);
        } catch (Exception e) {
            logger.error("봉사활동 등록 실패", e);
            throw new RuntimeException("봉사활동 등록에 실패했습니다.", e);
        }
    }
    
    @Override
    @Transactional
    public void updateVolunteer(VolunteerVO volunteer) throws Exception {
        try {
            VolunteerVO existingVolunteer = volDAO.selectVolunteer(volunteer.getVoId());
            if (existingVolunteer == null) {
                throw new RuntimeException("존재하지 않는 봉사활동입니다.");
            }
            volDAO.updateVolunteer(volunteer);
        } catch (Exception e) {
            logger.error("봉사활동 수정 실패", e);
            throw new RuntimeException("봉사활동 수정에 실패했습니다.", e);
        }
    }
    
    @Override
    @Transactional
    public void deleteVolunteer(Long voId) throws Exception {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("voId", voId);
            params.put("status", "DELETED");
            volDAO.updateVolunteerStatus(params);
        } catch (Exception e) {
            logger.error("봉사활동 삭제 실패", e);
            throw new RuntimeException("봉사활동 삭제에 실패했습니다.", e);
        }
    }
    
    @Override
    public VolunteerVO getVolunteer(Long voId) throws Exception {
        VolunteerVO volunteer = volDAO.selectVolunteer(voId);
        if (volunteer == null) {
            throw new RuntimeException("존재하지 않는 봉사활동입니다.");
        }
        return volunteer;
    }
    
    @Override
    public Map<String, Object> getVolunteerList(int page, int size, String recruitStatus, 
            String keyword, String startDate, String endDate) throws Exception {
        
        int startIndex = (page - 1) * size;
        
        Map<String, Object> params = new HashMap<>();
        params.put("start", startIndex);
        params.put("size", size);
        params.put("keyword", keyword);
        params.put("startDate", startDate);
        params.put("endDate", endDate);
        params.put("recruitStatus", recruitStatus);

        List<VolunteerVO> volunteers = volDAO.getAllVolunteers(params);
        
        int totalCount = volDAO.selectVolunteerCount(params);
        
        int totalPages = (int) Math.ceil((double) totalCount / size);
        int startPage = ((page - 1) / 10) * 10 + 1;
        int endPage = Math.min(startPage + 9, totalPages);
        
        Map<String, Object> result = new HashMap<>();
        result.put("volunteers", volunteers);
        result.put("totalCount", totalCount);
        result.put("totalPages", totalPages);
        result.put("startPage", startPage);
        result.put("endPage", endPage);
        
        return result;
    }
    
    @Override
    public List<VolunteerVO> getOngoingVolunteers() throws Exception {
        return volDAO.getOngoingVolunteers(new HashMap<>());
    }

    @Override
    public List<VolunteerVO> getClosedVolunteers() throws Exception {
        return volDAO.getClosedVolunteers(new HashMap<>());
    }
    
    @Override
    @Transactional
    public void closeRecruitment(Long voId) throws Exception {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("voId", voId);
            params.put("recruitStatus", "CLOSE");  
            volDAO.updateRecruitStatus(params);  // 메서드명 변경
        } catch (Exception e) {
            logger.error("봉사활동 마감 처리 실패", e);
            throw new RuntimeException("봉사활동 마감에 실패했습니다.", e);
        }
    }
    
    @Transactional
    public void openRecruitment(Long voId) throws Exception {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("voId", voId);
            params.put("recruitStatus", "OPEN");  
            volDAO.updateRecruitStatus(params);
        } catch (Exception e) {
            logger.error("봉사활동 모집 처리 실패", e);
            throw new RuntimeException("봉사활동 모집 처리에 실패했습니다.", e);
        }
    }
    
    @Override
    @Transactional
    public void updateGuide(VolunteerVO guide) throws Exception {
        try {
            logger.info("Updating guide with data: {}", guide);  
            volDAO.updateGuide(guide);
        } catch (Exception e) {
            logger.error("안내문 수정 실패: ", e);
            throw e;
        }
    }
    
    @Override
    public VolunteerVO getVolunteerInfo() throws Exception {
        try {
            VolunteerVO guideId = new VolunteerVO();
            guideId.setGuideId(1);
            return volDAO.selectVolunteerInfo(guideId);
        } catch (Exception e) {
            logger.error("봉사활동 안내 정보 조회 실패", e);
            throw new RuntimeException("봉사활동 안내 정보 조회에 실패했습니다.", e);
        }
    }
    
    @Override
    @Transactional
    public void submitApplication(VolunteerApplyVO apply) throws Exception {
        try {
            // 신청 가능 여부 확인
            VolunteerVO volunteer = volDAO.selectVolunteer(apply.getVolunteerId());  
            if (!"active".equals(volunteer.getStatus())) {
                throw new RuntimeException("모집이 마감된 봉사활동입니다.");
            }
            
            // 모집 인원 확인
            int currentApplicants = volDAO.selectVolunteerApplyCount(apply.getVolunteerId());
            if (currentApplicants >= volunteer.getVoCapacity()) {
                throw new RuntimeException("모집 인원이 마감되었습니다.");
            }
            
            apply.setStatus("PENDING");  // VO에 status 필드 추가 필요
            volDAO.insertVolunteerApply(apply);
        } catch (Exception e) {
            logger.error("봉사활동 신청 실패", e);
            throw new RuntimeException("봉사활동 신청에 실패했습니다.", e);
        }
    }
    
    @Override
    @Transactional
    public void approveApplication(Long voId) throws Exception {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("voId", voId);
            params.put("status", "APPROVED");
            volDAO.updateVolunteerApplyStatus(params);
        } catch (Exception e) {
            logger.error("봉사활동 신청 승인 실패", e);
            throw new RuntimeException("신청 승인에 실패했습니다.", e);
        }
    }
    
    @Override
    @Transactional
    public void rejectApplication(Long voId, String reason) throws Exception {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("voId", voId);
            params.put("status", "REJECTED");
            params.put("rejectReason", reason);
            volDAO.updateVolunteerApplyStatus(params);
        } catch (Exception e) {
            logger.error("봉사활동 신청 거절 실패", e);
            throw new RuntimeException("신청 거절에 실패했습니다.", e);
        }
    }
    
    @Override
    @Transactional
    public void cancelApplication(Long voId, String reason, String reasonDetail) throws Exception {
        try {
            VolunteerApplyVO application = volDAO.selectVolunteerApply(voId);
            if (!"PENDING".equals(application.getStatus())) {
                throw new RuntimeException("승인된 신청은 취소할 수 없습니다.");
            }
            
            Map<String, Object> params = new HashMap<>();
            params.put("voId", voId);
            params.put("status", "CANCELED");
            params.put("cancelReason", reason);
            params.put("cancelReasonDetail", reasonDetail);
            volDAO.updateVolunteerApplyStatus(params);
        } catch (Exception e) {
            logger.error("봉사활동 신청 취소 실패", e);
            throw new RuntimeException("신청 취소에 실패했습니다.", e);
        }
    }
    
    @Override
    public List<VolunteerApplyVO> getMyApplications(String userId) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        return volDAO.selectVolunteerApplyList(params);
    }
    
    @Override
    public Map<String, Object> getApplicationList(Long volunteerId, String status) throws Exception {
        Map<String, Object> params = new HashMap<>();
        params.put("volunteerId", volunteerId);
        params.put("status", status);
        
        List<VolunteerApplyVO> applications = volDAO.selectVolunteerApplyList(params);
        int totalCount = volDAO.selectVolunteerApplyCount(volunteerId);
        
        Map<String, Object> result = new HashMap<>();
        result.put("applications", applications);
        result.put("totalCount", totalCount);
        
        return result;
    }
    
    @Override
    public List<VolunteerVO> getDraftList() throws Exception {
       Map<String, Object> params = new HashMap<>();
       params.put("status", "draft");
       return volDAO.getClosedVolunteers(params); 
    }

}
