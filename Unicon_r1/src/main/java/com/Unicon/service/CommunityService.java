package com.Unicon.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.Unicon.domain.CommentVO;
import com.Unicon.domain.ImageVO;
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
	
}
