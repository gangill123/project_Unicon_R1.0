package com.Unicon.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class CommentVO {
	
	private int comment_id;			// 댓글 고유 아이디
	private String post_id;				// 게시글 아이디
	private String member_id;			// 유저아이디
	private String comment_content;		// 내용
	private String comment_date;		// 생성일자
	
	private List<CommentLikeVO> comment_likes;		// 댓글 좋아요 테이블
	
	private JypMemberVO jypMemberVO;			// 임시 멤버 테이블
	
}
