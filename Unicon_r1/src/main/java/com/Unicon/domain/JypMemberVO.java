package com.Unicon.domain;

import lombok.Data;

@Data
public class JypMemberVO {
	
	private String member_id;			// 유저 아이디
	private String member_name;			// 유저 이름
	private String road_address;		// 유저 거주지(주소)
	private String member_nickname;		// 유저 닉네임
	private String member_image;		// 유저 프로필 이미지
	
}
