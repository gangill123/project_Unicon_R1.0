package com.Unicon.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class VolunteerVO {
    private Long voId;                  // 봉사활동 번호
    private String voTitle;             // 봉사활동명
    private String voLocation;          // 봉사장소
    private String voTarget;            // 모집대상
    private String voContent;           // 활동내용
    private int voCapacity;             // 모집인원
    private String voManager;           // 담당자
    private String voContact;           // 연락처
    private Date voStartDate;           // 봉사시작일
    private Date voEndDate;             // 봉사종료일
    private Date voRecruitStart;        // 모집시작일
    private Date voRecruitEnd;          // 모집종료일
    private Date voRegDate;             // 등록일시
    private Date voUpdateDate;          // 수정일시
    private String status;              // 상태(active/DELETED/draft)
    private int guideId;
    
    private int applicationCount;       // 신청자 수
    private List<VolunteerApplyVO> applications; // 신청 목록
}
