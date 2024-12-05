package com.Unicon.domain;

import lombok.Data;

@Data
public class PostLikeVO {
	
	private String post_id;			// 게시글아이디
	private String member_id;		// 유저아이디
	
	private int post_like_count;	// 게시물 좋아요수(실제X)
	
}
