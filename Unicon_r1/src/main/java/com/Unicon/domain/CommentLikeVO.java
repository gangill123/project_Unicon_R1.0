package com.Unicon.domain;

import lombok.Data;

@Data
public class CommentLikeVO {
	
	private String comment_id;		// 댓글아이디
	private String member_id;		// 유저아이디
	
	private int comment_like_count;		// 댓글 좋아요수(실제X)
	
}
