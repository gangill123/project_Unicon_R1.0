package com.Unicon.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import javax.inject.Inject;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import com.Unicon.persistence.VolunteerDAO;

@Service
public class VolStatisticsServiceImpl implements VolStatisticsService{

private static final Logger logger = LoggerFactory.getLogger(VolStatisticsServiceImpl.class);
    
    @Inject
    private VolunteerDAO volDAO;
    
    @Override
    public Map<String, Object> getAllStatistics() {
        Map<String, Object> statistics = new HashMap<>();
        
        try {
            // 연령대별 통계
            statistics.put("ageGroupStats", volDAO.selectAgeGroupStatistics());
            
            // 요일별 신청 통계
            statistics.put("weekdayStats", volDAO.selectWeekdayStatistics());
            
            // 프로그램별 신청자 수 통계
            statistics.put("programStats", volDAO.selectProgramStatistics());
            
            // 월별 신청 추이
            statistics.put("monthlyStats", volDAO.selectMonthlyStatistics());
            
            // 봉사 경험 통계
            statistics.put("experienceStats", volDAO.selectExperienceStatistics());
            
        } catch (Exception e) {
            logger.error("통계 데이터 조회 중 오류 발생", e);
            throw new RuntimeException("통계 데이터를 불러오는데 실패했습니다.", e);
        }
        
        return statistics;
    }
}