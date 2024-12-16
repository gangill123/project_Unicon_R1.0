package com.Unicon.domain;

import lombok.Data;

@Data
public class MemberVO {
	
    private String member_id;       // 아이디
    private String member_pw;       // 비밀번호
    private String member_name;     // 이름
    private String member_nickname; // 닉네임
    private String member_tel;      // 전화번호
    private String member_gender;   // 성별
    private String member_birth;    // 생년월일
    private String member_email;    // 이메일
    private String signup_date;     // 가입일
    private String approval_date;   // 승인일
    private String member_image;  // 이미지
    private String inst_image;  // 이미지
    private Integer permission_id;  // 권한 ID
    private String mail_subscription; // 메일 수신 여부
    private String road_address;    // 도로명 주소
    private String postal_code;     // 우편번호
    private String detail_address;  // 상세 주소
    private String extra_address;   // 참고 항목
    private String inst_number;     // 사업자 등록번호
    private String inst_type; // 기관유형
    private String approval_status; // 승인 상태
    private String local_name; // 기관유형
    private String is_cosign; // 위탁여부
    private String inst_name; //  기관명 
    private String member_type; //  기관명 
    private String member_rate; //  기관명 
    

}
