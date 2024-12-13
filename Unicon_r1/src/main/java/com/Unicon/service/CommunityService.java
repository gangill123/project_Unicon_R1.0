package com.Unicon.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.CheckImageVO;
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
	
	// 입양후기 게시물 보기
	public List<PostVO> getPostList(String post_type){
		logger.info(" Service - getPostList() 실행 ");
		return communityDAO.getPostList(post_type);
	}
	
	// 입양후기 게시물 보기
	public List<PostVO> getPostList01(){
		logger.info(" Service - getPostList01() 실행 ");
		return communityDAO.getPostList01();
	}
	
	// 반려이야기 게시물 보기
	public List<PostVO> getPostList02(){
		logger.info(" Service - getPostList02() 실행 ");
		return communityDAO.getPostList02();
	}
	
	// 실종 게시물 보기
	public List<PostVO> getPostList03(){
		logger.info(" Service - getPostList03() 실행 ");
		return communityDAO.getPostList03();
	}
	
	// 임시 보호 게시물 보기
	public List<PostVO> getPostList04(){
		logger.info(" Service - getPostList04() 실행 ");
		return communityDAO.getPostList04();
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
	
	// 게시물 수정 - 1
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void updatePost(PostVO postVO) {
		logger.info(" Service - updatePost() 실행 ");
		
		communityDAO.updatePost(postVO);
	}
	
	// 게시물 수정 - 2 (이미지)
	public List<ImageVO> updateImage(PostVO postVO, HttpServletRequest req) {
		logger.info(" Service - updateImage() 실행");
		// 경로 설정 //
		ServletContext context = req.getServletContext();
		String saveDir = context.getRealPath("/uploads/");
		// 뷰페이지에서 전달된 데이터 처리(MultipartFile, 이미지 파일 변경 상태확인(CheckImage)) //
		List<MultipartFile> uploadImageList = new ArrayList<MultipartFile>(postVO.getUpload_images());
		List<CheckImageVO> checkImageList = new ArrayList<CheckImageVO>(postVO.getCheck_images());
		// 이미지 파일의 조건에 따라 담을 객체 생성 //
		List<ImageVO> imageList = new ArrayList<ImageVO>(); // return할 객체
		ImageVO[] imageArray = new ImageVO[4]; // imageList의 빈칸 채우기 위한 배열
		List<String> imageNameList = new ArrayList<String>(); // 기존 이미지 파일이 존재하는지 확인하기 위한 리스트
		List<String> deleteImageList = new ArrayList<String>(); // imageNameList에 포함되지않은 기존 이미지 파일 리스트
		
		for(int i = 0; i < uploadImageList.size(); i++) {
			if(uploadImageList.get(i).isEmpty()) { // multipartfile 이미지 파일이 없을 경우
				if(checkImageList.get(i).getChangeCheck().isEmpty()) { // 이미지 파일 변경 없음 (기존 이미지 파일 유지)
					logger.info(" 이미지 파일 변경 없음 i : {}",i);
					logger.info(" 이미지 파일 변경 없음  "
							+ "checkImageList.get(i).getOrgSrc() : {} : {}",checkImageList.get(i).getOrgSrc(),i);
					imageNameList.add(checkImageList.get(i).getOrgSrc());
					ImageVO ivo = new ImageVO();
					ivo.setImage_id(postVO.getPost_id());
					ivo.setImage_type(postVO.getPost_type());
					ivo.setImage_sequence(i);
					ivo.setImage_src(checkImageList.get(i).getOrgSrc());
					imageList.add(ivo);
				}
				if(!checkImageList.get(i).getChangeCheck().isEmpty()
						&& !checkImageList.get(i).getMoveSrc().isEmpty()) {
					// 이미지 파일 변경 있음 + 위치 이동된 기존파일 있음
					// 이미지 파일 실제 저장없이 DB 데이터 업데이트(sequence, src 수정)
					logger.info(" 이미지 파일 변경 있음 + 위치 이동된 기존파일 있음 i : {}",i);
					logger.info(" 이미지 파일 변경 있음 + 위치 이동된 기존파일 있음  "
							+ "checkImageList.get(i).getMoveSrc() : {} : {}",checkImageList.get(i).getMoveSrc(),i);
					imageNameList.add(checkImageList.get(i).getMoveSrc());
					ImageVO ivo = new ImageVO();
					ivo.setImage_id(postVO.getPost_id());
					ivo.setImage_type(postVO.getPost_type());
					ivo.setImage_sequence(i);
					ivo.setImage_src(checkImageList.get(i).getMoveSrc());
					imageList.add(ivo);
				}
				if(!checkImageList.get(i).getChangeCheck().isEmpty() 
						&& checkImageList.get(i).getMoveSrc().isEmpty()) {
					// 이미지 파일 변경 있음 + 위치 이동된 기존파일 없음
					// 삭제했을 경우를 나타냄
					logger.info(" 이미지 파일 변경 있음 + 위치 이동된 기존파일 없음 i :{}",i);
					deleteImageList.add(checkImageList.get(i).getOrgSrc());
					logger.info(" 이미지 파일 변경 있음 + 위치 이동된 기존파일 없음  "
							+ "checkImageList.get(i).getOrgSrc() : {} : {}",checkImageList.get(i).getOrgSrc(),i);
				}
				
			} else { // multipartfile 이미지 파일이 있을 경우
				StringBuilder asb = new StringBuilder();
				MultipartFile aImage = uploadImageList.get(i);
				
				// 이미지 파일 저장
				File destinationImage 
				= new File(asb.append(saveDir)
						.append(UUID.randomUUID().toString())
						.append("_")
						.append(aImage.getOriginalFilename())
						.toString());
				
				try {
					aImage.transferTo(destinationImage);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				asb.setLength(0);
				
				// 이미지 파일 저장 후 이미지 파일 정보를 ImageVO객체에 저장
				int index = destinationImage.getPath().indexOf("\\uploads\\");
				String indexStr = "\\uploads\\";
				String indexSubStr = destinationImage.getPath().substring(index + indexStr.length());
				String modifiedPath = asb.append("/uploads/").append(indexSubStr).toString();
				
				ImageVO ivo = new ImageVO();
				ivo.setImage_id(postVO.getPost_id());
				ivo.setImage_sequence(i);
				ivo.setImage_src(modifiedPath);
				ivo.setImage_type(postVO.getPost_type());
				imageList.add(ivo);
				
			}
		}
		logger.debug(" imageList : {}",imageList);
		logger.debug(" imageNameList : {}",imageNameList);
		// deleteImageList
		// imageNameList에 포함되지않은 기존 이미지 파일 리스트 생성
		for (int i = 0; i < checkImageList.size(); i++) {
			String item = checkImageList.get(i).getOrgSrc();
			logger.info(" item{} : {}", i, item);
			boolean found = false;
		
			for (int j = 0; j < imageNameList.size(); j++) {
				if (imageNameList.get(j).equals(item)) {
					found = true;
					break;
				}
			}
			
			if (!found && !deleteImageList.contains(item)) {
				deleteImageList.add(item);
			}
		}
		
		logger.info(" deleteImageList : {}",deleteImageList);
		// imageNameList에 포함되지않은 기존 이미지 파일 삭제
		for(int i = 0; i < deleteImageList.size(); i++) {
			StringBuilder asb = new StringBuilder();
			int index = deleteImageList.get(i).indexOf("/uploads/");
			if(index == -1) {
				logger.info(" 파일 이름에 /uploads/가 존재하지 않습니다");
				continue;
			}
			String indexStr = "/uploads/";
			// 기존 이미지 파일 경로에서 /uploads/ 문자열 제거
			String indexSubStr = deleteImageList.get(i).substring(index + indexStr.length());
			
			File deleteFile 
				= new File(asb.append(saveDir)
						.append(indexSubStr)
						.toString());
			
			if (deleteFile.exists()) {
				deleteFile.delete();
			} else {
				logger.info("파일이 존재하지 않습니다: " + deleteFile.getPath());
			}
		}
		
		// imageList의 사이즈가 4가 아닐 경우 빈 인덱스를 찾아서 공백으로 처리
		// 리스트를 고정크기의 배열로 변경 후 처리
		imageArray = imageList.toArray(imageArray);
		for(int i = 0; i < imageArray.length; i++) {
			if(imageArray[i] != null) {
				continue;
			} else {
				imageArray[i] = new ImageVO();
				imageArray[i].setImage_id(postVO.getPost_id());
				imageArray[i].setImage_type(postVO.getPost_type());
				imageArray[i].setImage_sequence(i);
				imageArray[i].setImage_src("");
			}
		}
		
		// 배열을 리스트로 변환 후 전달
		List<ImageVO> lastImageList = Arrays.asList(imageArray);
		logger.info(" lastImageList : {}",lastImageList);
		
		
		return lastImageList;
	} // 게시물 수정 - 2 (이미지) Service
	
}
