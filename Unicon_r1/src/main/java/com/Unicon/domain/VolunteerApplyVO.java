package com.Unicon.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class VolunteerApplyVO {
    private Long voId;                  // 신청서번호
    private Long volunteerId;           // 봉사활동번호
    private String voApplicant;         // 신청자명
    private Date voBirth;               // 생년월일
    private String voTel;               // 연락처
    private String voEmail;             // 이메일
    private String voExperience;        // 반려동물경험
    private String voReason;            // 신청사유
    private String voAgree;             // 정보수신동의
    private String status;              // 상태(PENDING/APPROVED/REJECTED/CANCELED)
    private String rejectReason;        // 거절사유
    private String rejectReasonDetail;
    private String cancelReason;        // 취소사유
    private Date voRegDate;             // 신청일시
    private Date voUpdateDate;          // 수정일시

    private VolunteerVO volunteerInfo;  // 봉사활동 정보
    
    private String voTitle;
    private Date voStartDate;          
    private Date voEndDate;
    private String voManager;           
    private String voContact; 
    private String voLocation;
    private String voContent;
}
