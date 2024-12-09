package com.Unicon.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.Unicon.domain.CommentLikeVO;
import com.Unicon.domain.CommentVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.PostLikeVO;
import com.Unicon.domain.PostVO;
import com.Unicon.persistence.CommunityDAO;

@Service("CommunityService")
public class CommunityService {
	
	@Inject
	CommunityDAO communityDAO;
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityService.class);
	
	// member_id로 기존의 post_id 값 유무 체크(불러오기)
	public String checkPostId(String member_id) {
		logger.info(" Service - checkPostId() 실행 ");
		return communityDAO.checkPostId(member_id);
	}
	
	// 게시물 등록
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void postInsert(PostVO postVO) {
		logger.info(" Service - postInsert() 실행 ");
		communityDAO.postInsert(postVO);
	} // postInsert()
	
	// 전체 게시물 보기
	public List<PostVO> getPostListAll(){
		logger.info(" Service - getPostListAll() 실행 ");
		return communityDAO.getPostListAll();
	}
	
	// 해당 게시물 보기
	public PostVO getPostListOne(String post_id) {
		logger.info(" Service - getPostListOne() 실행 ");
		return communityDAO.getPostListOne(post_id);
	}
	
	// 전체 댓글 보기
	public List<CommentVO> getCommentListAll(String post_id){
		logger.info(" Service - getCommentListAll() 실행 ");
		return communityDAO.getCommentListAll(post_id);
	}
	
	// 댓글 등록
	public void insertComment(CommentVO commentVO) {
		logger.info(" Service - insertComment() 실행 ");
		communityDAO.insertComment(commentVO);
	}
	
	// 댓글 삭제
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public int deleteComment(int comment_id) {
		logger.info(" Service - deleteComment() 실행 ");
		logger.info(" comment_id : {}",comment_id);
		return communityDAO.deleteComment(comment_id);
	}
	
	// 게시물 삭제
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public int deletePost(String post_id) {
		logger.info(" Service - deletePost() 실행 ");
		logger.info(" post_id : {}",post_id);
		return communityDAO.deletePost(post_id);
	}
	
	// 게시물 좋아요 확인
	public boolean isPostLike(String post_id, String member_id) {
		return communityDAO.isPostLike(post_id, member_id);
	}
	
	// 게시물 좋아요
	public void postLikeInsert(String post_id, String member_id) {
		logger.info(" Service - postLikeInsert() 실행 ");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("post_id", post_id);
		params.put("member_id", member_id);
		
		communityDAO.postLikeInsert(params);
	}
	
	// 게시물 좋아요 취소
	public int postLikeDelete(String post_id, String member_id) {
		logger.info(" Service - postLikeDelete() 실행 ");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("post_id", post_id);
		params.put("member_id", member_id);
		
		return communityDAO.postLikeDelete(params);
	}
	
	// 댓글 좋아요 확인
	public boolean isCommentLike (int comment_id, String member_id) {
		return communityDAO.isCommentLike(comment_id, member_id);
	}
	
	// 댓글 좋아요
	public void commentLikeInsert(int comment_id, String member_id) {
		logger.info(" Service - commentLikeInsert() 실행 ");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("comment_id", comment_id);
		params.put("member_id", member_id);
		
		communityDAO.commentLikeInsert(params);
	}
	
	// 댓글 좋아요 취소
	public int commentLikeDelete(int comment_id, String member_id) {
		logger.info(" Service - commentLikeDelete() 실행 ");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("comment_id", comment_id);
		params.put("member_id", member_id);
		
		return communityDAO.commentLikeDelete(params);
	}
	
}
