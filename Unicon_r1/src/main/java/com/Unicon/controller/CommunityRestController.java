package com.Unicon.controller;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.ImageVO;
import com.Unicon.domain.PostVO;
import com.Unicon.service.CommunityService;

@RestController
@RequestMapping("/community")
public class CommunityRestController {
	
	@Inject
	CommunityService communityService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityRestController.class);
	
	
	// 커뮤니티 글 등록
	@RequestMapping(value = "",method = RequestMethod.POST)
	public ResponseEntity<String> insertPost(@RequestBody PostVO postVO, ImageVO imageVO, @Autowired ServletContext servletContext){
		
		logger.info(" 커뮤니티REST컨트롤러 - insertPost() 실행 ");
		logger.info("postVO : {}",postVO);
		
		MultipartFile file = postVO.getPost_file();
		String uploadDir = servletContext.getRealPath("/uploads/");
		
		try {
			// 경로 없을때 directory 생성
			File dir = new File(uploadDir);
			if (!dir.exists()) {
	            dir.mkdirs();
	        }
			
			String uniqueFileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
			File uploadFile = new File(uploadDir + uniqueFileName);
			
			String image_src = "/uploads/" + uniqueFileName;
			imageVO.setImage_src(image_src);
			// 파일 저장
			file.transferTo(uploadFile);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		ResponseEntity<String> respEntity = null;
		try {
			logger.info(" 커뮤니티Service postInsert() 호출 ");
			communityService.postInsert(postVO);
			respEntity = new ResponseEntity<String>("ADD_Success",HttpStatus.OK);
		} catch (Exception e) {
			respEntity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return respEntity;
		
	} // insertPost()
	
	
	
} // CommunityRestController
