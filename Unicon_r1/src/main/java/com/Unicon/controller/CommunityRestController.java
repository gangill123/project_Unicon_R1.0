package com.Unicon.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.CommentVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.PostVO;
import com.Unicon.service.CommunityService;

@RestController
@RequestMapping("/community")
public class CommunityRestController {
	
	@Inject
	CommunityService communityService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityRestController.class);
	
	
//	// 커뮤니티 글 등록
//	@RequestMapping(value = "",method = RequestMethod.POST)
//	public ResponseEntity<String> insertPost(@RequestBody PostVO postVO, ImageVO imageVO, @Autowired ServletContext servletContext){
//		
//		logger.info(" 커뮤니티REST컨트롤러 - insertPost() 실행 ");
//		logger.info("postVO : {}",postVO);
//		
//		MultipartFile file = postVO.getPost_file();
//		String uploadDir = servletContext.getRealPath("/uploads/");
//		
//		try {
//			// 경로 없을때 directory 생성
//			File dir = new File(uploadDir);
//			if (!dir.exists()) {
//	            dir.mkdirs();
//	        }
//			
//			String uniqueFileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
//			File uploadFile = new File(uploadDir + uniqueFileName);
//			
//			String image_src = "/uploads/" + uniqueFileName;
//			imageVO.setImage_src(image_src);
//			// 파일 저장
//			file.transferTo(uploadFile);
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		ResponseEntity<String> respEntity = null;
//		try {
//			logger.info(" 커뮤니티Service postInsert() 호출 ");
//			communityService.postInsert(postVO);
//			respEntity = new ResponseEntity<String>("ADD_Success",HttpStatus.OK);
//		} catch (Exception e) {
//			respEntity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
//		}
//		
//		return respEntity;
//		
//	} // insertPost()
	
	// 해당하는 게시물과 전체 댓글 들고 오기
	@RequestMapping(value = "/getAll/{post_id}",method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getPostListOneAndCommentListAll(@PathVariable("post_id")String post_id){
		logger.info(" getPostListOneAndCommentListAll() 실행 ");
		
		ResponseEntity<Map<String, Object>> result = null;
		
		try {
			PostVO postList = communityService.getPostListOne(post_id);
			List<CommentVO> commentList = communityService.getCommentListAll(post_id);
			
			Map<String, Object> responseMap = new HashMap<>();
			responseMap.put("postList", postList);
			responseMap.put("commentList", commentList);
			
			result = new ResponseEntity<>(responseMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return result;
	}
	
	// 댓글 등록
	@RequestMapping(value = "/insertComment",method = RequestMethod.POST)
	public ResponseEntity<CommentVO> insertComment(@RequestBody CommentVO commentVO){
		logger.info(" insertComment() 실행 ");
		logger.info(" commentVO : {}",commentVO);
		
		ResponseEntity<CommentVO> respEntity = null;
		try {
			communityService.insertComment(commentVO);
			respEntity = new ResponseEntity<CommentVO>(commentVO,HttpStatus.OK);
		} catch (Exception e) {
			respEntity = new ResponseEntity<CommentVO>(HttpStatus.BAD_REQUEST);
		}
		return respEntity;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/deleteComment/{comment_id}",method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteComment(@PathVariable("comment_id")int comment_id){
		logger.info(" deleteComment() 실행 ");
		logger.info(" comment_id : {}",comment_id);
		
		ResponseEntity<String> respEntity = null;
		try {
			communityService.deleteComment(comment_id);
			respEntity = new ResponseEntity<String>("deleteOK",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			respEntity = new ResponseEntity<String>("deleteErr",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return respEntity;
	}
	
	// 게시물 삭제
	@RequestMapping(value = "/deletePost/{post_id}",method = RequestMethod.DELETE)
	public ResponseEntity<String> deletePost(@PathVariable("post_id")String post_id){
		logger.info(" deletePost() 실행 ");
		logger.info(" post_id : {}",post_id);
		
		ResponseEntity<String> respEntity = null;
		try {
			communityService.deletePost(post_id);
			respEntity = new ResponseEntity<String>("deleteOK",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			respEntity = new ResponseEntity<String>("deleteErr",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return respEntity;
	}
	
	// 게시물 등록
	@PostMapping(value = "/insert")
	public ResponseEntity<String> registerPost(PostVO postVO, HttpServletRequest req){
		logger.info(" registerPost(PostVO postVO, HttpServletRequest req) 실행 ");
		
		try {
			
			if(postVO == null) {
				return new ResponseEntity<String>("Post데이터가 필요합니다.", HttpStatus.BAD_REQUEST);
			}
			
			postVO.setPost_id(getPostId());
			
			List<ImageVO> images = saveImage(postVO, req);
			if(images == null || images.isEmpty()) {
				return new ResponseEntity<String>("이미지를 저장하는 데 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
			}
			postVO.setPost_images(images);
			
			communityService.postInsert(postVO);
			return new ResponseEntity<String>("게시물이 등록되었습니다", HttpStatus.OK);
			
		}catch (Exception e) {
			logger.info(" 오류 발생 : {}",e.getMessage());
			return new ResponseEntity<String>(" 오류 발생 : "+e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// /////////////////////////////메서드/////////////////////////////
	
	// 게시물id 생성
	public String getPostId() {
		logger.info(" getPostId 실행 ");
		String pNamePre = "POST";
		char[] pNameCharacters =
				"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray();
		int pNamelength = 6;
		StringBuilder asb = new StringBuilder();
		Random pNameRandom = new Random();
		
		asb.append(pNamePre).append("-");
		for (int i = 0; i < pNamelength; i++) {
			int index = pNameRandom.nextInt(pNameCharacters.length);
			asb.append(pNameCharacters[index]);
		}
		
		return asb.toString();
	}
	// 게시물id 생성
	
	// 이미지 저장 및 리스트 생성
	public List<ImageVO> saveImage(PostVO postVO, HttpServletRequest req) {
		logger.info("saveImage(PostVO postVO, HttpServletRequest req) 실행  ");
		ServletContext context = req.getServletContext();
		String saveDir = context.getRealPath("/uploads/");
		List<MultipartFile> uploadImages = postVO.getUpload_images();
		List<ImageVO> postImages = new ArrayList<ImageVO>();
		
		for (int i = 0; i < uploadImages.size(); i++) {
			StringBuilder asb = new StringBuilder();
			MultipartFile pImage = uploadImages.get(i);
			
			if(pImage == null || pImage.isEmpty()) {
				logger.info(" 업로드할 이미지가 없습니다 인덱스 : "+i);
				continue;
			}
			
			// 파일 저장 경로 생성
			File destinationImage 
				= new File(asb.append(saveDir)
						.append(UUID.randomUUID().toString())
						.append("_")
						.append(pImage.getOriginalFilename())
						.toString());
			
			/*
			int index = destinationImage.getPath().indexOf("\\uploads\\");

			if (index != -1) {
				String modifiedPath = destinationImage.getPath().substring(index);
				ImageVO ivo = new ImageVO();
				ivo.setImage_id(postVO.getPost_id());
				ivo.setImage_sequence(i);
				ivo.setImage_src(modifiedPath);
				ivo.setImage_type(postVO.getPost_type());
				postImages.add(i, ivo);
			} else {
				logger.info("경로에 '\\uploads\\'가 없습니다.");
			}
			*/
			
			String modifiedPath = destinationImage.getPath().replace("\\uploads\\", "/uploads/");
	        int index = modifiedPath.indexOf("/uploads/");

	        if (index != -1) {
	            String finalPath = modifiedPath.substring(index);
	            ImageVO ivo = new ImageVO();
	            ivo.setImage_id(postVO.getPost_id());
	            ivo.setImage_sequence(i);
	            ivo.setImage_src(finalPath);
	            ivo.setImage_type(postVO.getPost_type());
	            postImages.add(i, ivo);
	        } else {
	            logger.info("경로에 '/uploads/'가 없습니다.");
	        }
			
			try {
				pImage.transferTo(destinationImage);
			} catch (IOException e) {
				e.printStackTrace(); 
			} 
		}
		
		return postImages;
	}
	// 이미지 저장 및 리스트 생성
	
	// /////////////////////////////메서드/////////////////////////////
	
	
	
} // CommunityRestController
