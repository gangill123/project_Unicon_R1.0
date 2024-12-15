package com.Unicon.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.CommentLikeVO;
import com.Unicon.domain.CommentVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.PostLikeVO;
import com.Unicon.domain.PostVO;

@Repository("CommunityDAO")
public class CommunityDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.Unicon.mapper.CommunityMapper.";
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityDAO.class);
	
	
	// 메인페이지용 입양후기 게시물 보기
	public List<PostVO> forMainCommunityData(){
		logger.info(" DAO - forMainCommunityData() 실행 ");
		return sqlSession.selectList(NAMESPACE+"forMainCommunityData");
	}
	
	
	
	// member_id로 기존의 post_id 값 유무 체크(불러오기)
	public String checkPostId(String member_id) {
		logger.info(" DAO - checkPostId() 실행 ");
		return sqlSession.selectOne(NAMESPACE+"checkPostId", member_id);
	}
	
	// 게시물 정보 등록
	public void postInsert(PostVO postVO) {
		logger.info(" DAO - postInsert() 실행 ");
		
		sqlSession.insert(NAMESPACE+"postInsert", postVO);
		
		Map<String, Object> imageParams = new HashMap<>();
		imageParams.put("post_id", postVO.getPost_id());
		imageParams.put("images", postVO.getPost_images());
		sqlSession.insert(NAMESPACE+"insertPostImages", imageParams);
		
	} // postInsert()
	
	// 게시물 보기
	public List<PostVO> getPostList(String post_type){
		logger.info(" DAO - getPostList() 실행 ");
		return sqlSession.selectList(NAMESPACE+"getPostList", post_type);
	}
	
	// 입양후기 게시물 보기
	public List<PostVO> getPostList01(){
		logger.info(" DAO - getPostList01() 실행 ");
		return sqlSession.selectList(NAMESPACE+"getPostList01");
	}
	
	// 반려이야기 게시물 보기
	public List<PostVO> getPostList02(){
		logger.info(" DAO - getPostList02() 실행 ");
		return sqlSession.selectList(NAMESPACE+"getPostList02");
	}
	
	// 실종 게시물 보기
	public List<PostVO> getPostList03(){
		logger.info(" DAO - getPostList03() 실행 ");
		return sqlSession.selectList(NAMESPACE+"getPostList03");
	}
	
	// 임시 보호 게시물 보기
	public List<PostVO> getPostList04(){
		logger.info(" DAO - getPostList04() 실행 ");
		return sqlSession.selectList(NAMESPACE+"getPostList04");
	}
	
	// 해당 게시물 보기
	public PostVO getPostListOne(String post_id){
		logger.info(" DAO - getPostListOne() 실행 ");
		return sqlSession.selectOne(NAMESPACE+"getPostListOne", post_id);
	}
	
	// 전체 댓글 보기
	public List<CommentVO> getCommentListAll(String post_id){
		logger.info(" DAO - getCommentListAll() 실행 ");
		return sqlSession.selectList(NAMESPACE+"getCommentListAll", post_id);
	}
	
	// 댓글 등록
	public void insertComment(CommentVO commentVO) {
		logger.info(" DAO - insertComment() 실행 ");
		sqlSession.insert(NAMESPACE+"insertComment", commentVO);
	}
	
	// 댓글 삭제
	public int deleteComment(int comment_id) {
		logger.info(" DAO - deleteComment() 실행 ");
		logger.info(" comment_id : {}",comment_id);
		int result = sqlSession.delete(NAMESPACE+"deleteCommentLike",comment_id);
		int result2 = sqlSession.delete(NAMESPACE+"deleteComment",comment_id);
		return result + result2;
	}
	
	// 게시물 삭제
	public int deletePost(String post_id) {
		logger.info(" DAO - deletePost() 실행 ");
		logger.info(" post_id {}",post_id);
		int result = sqlSession.delete(NAMESPACE+"deletePostLike",post_id);
		int result2 = sqlSession.delete(NAMESPACE+"deletePostComment", post_id);
		int result3 = sqlSession.delete(NAMESPACE+"deletePost", post_id);
		return result + result2 + result3;
	}
	
	// 게시물 좋아요 확인
	public boolean isPostLike(String post_id, String member_id) {
		Map<String, Object> params = new HashMap<>();
		params.put("post_id", post_id);
		params.put("member_id", member_id);
		
		Integer count = sqlSession.selectOne(NAMESPACE+"isPostLike", params);
		return count != null && count > 0;
	}
	
	// 게시물 좋아요
	public void postLikeInsert(Map<String, Object> postLikeInfo) {
		logger.info(" DAO - postLikeInsert() 실행 ");
		sqlSession.insert(NAMESPACE+"postLikeInsert", postLikeInfo);
	}
	
	// 게시물 좋아요 취소
	public int postLikeDelete(Map<String, Object> postLikeInfo) {
		logger.info(" DAO - postLikeDelete() 실행 ");
		logger.info(" DAO - postLikeInfo : {}",postLikeInfo);
		int result = sqlSession.delete(NAMESPACE+"postLikeDelete", postLikeInfo);
		return result;
	}
	
	// 댓글 좋아요 확인
	public boolean isCommentLike(int comment_id, String member_id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("comment_id", comment_id);
		params.put("member_id", member_id);
		
		Integer count = sqlSession.selectOne(NAMESPACE+"isCommentLike", params);
		return count != null && count > 0;
	}
	
	// 댓글 좋아요
	public void commentLikeInsert(Map<String, Object> commentLikeInfo) {
		logger.info(" DAO - commentLikeInsert() 실행 ");
		sqlSession.insert(NAMESPACE+"commentLikeInsert", commentLikeInfo);
	}
	
	// 댓글 좋아요 취소
	public int commentLikeDelete(Map<String, Object> commentLikeInfo) {
		logger.info(" DAO - commentLikeDelete() 실행 ");
		int result = sqlSession.delete(NAMESPACE+"commentLikeDelete", commentLikeInfo);
		return result;
	}
	
	// 게시물 수정
	public void updatePost(PostVO postVO) {
		logger.info(" updatePost() 실행 ");
		
		sqlSession.update(NAMESPACE+"updatePost", postVO);
		
		List<ImageVO> images = new ArrayList<ImageVO>(postVO.getPost_images());
		sqlSession.insert(NAMESPACE+"updatePostImages", images);
	}
	
	
	
	
//	// 이미지 정보 등록(반복은 매퍼에서 처리)
//	public void imageInsert(ImageVO imageVO) {
//		logger.info(" DAO - imageInsert() 실행 ");
//		
//		sqlSession.insert(NAMESPACE+"postImageInsert", imageVO);
//		
////		for(ImageVO imageVO : postVO.getPost_images()) {
////		sqlSession.insert(NAMESPACE+"postImageInsert", imageVO);
////	}
//		
//	}
	
}
