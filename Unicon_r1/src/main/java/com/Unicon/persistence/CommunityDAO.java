package com.Unicon.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.CommentVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.PostVO;

@Repository("CommunityDAO")
public class CommunityDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.Unicon.mapper.CommunityMapper.";
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityDAO.class);
	
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
	
	// 전체 게시물 보기
	public List<PostVO> getPostListAll(){
		logger.info(" DAO - getPostListAll() 실행 ");
		return sqlSession.selectList(NAMESPACE+"getPostListAll");
	}
	
	// 전체 댓글 보기
	public List<CommentVO> getCommentListAll(String post_id){
		logger.info(" DAO - getCommentListAll() 실행 ");
		return sqlSession.selectList(NAMESPACE+"getCommentListAll", post_id);
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
