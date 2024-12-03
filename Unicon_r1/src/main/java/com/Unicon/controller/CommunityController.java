package com.Unicon.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.Unicon.domain.ImageVO;
import com.Unicon.domain.PostVO;
import com.Unicon.service.CommunityService;

@Controller
@RequestMapping(value = "/community/*")
public class CommunityController {
	
//	//템플릿 테스트
//	@GetMapping("/shop")
//	public String mainTest2() {
//		
//		return "main/template";
//	}
	
//	//템플릿 테스트
//	@GetMapping("/test")
//	public String mainTest3() {
//		
//		return "main/test";
//	}
	
	@Inject
	private CommunityService communityService;
	
	@Inject
	private ServletContext servletContext;
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	// http://localhost:8088/community/listAll
	@GetMapping("listAll")
	public String readCommunityAll() {
		
		logger.info(" community 메인페이지(전체 글) 실행 ");
		
		return "community/community";
	}
	
	// http://localhost:8088/community/insert
	@GetMapping("insert")
	public String insertCommunity() {
		
		logger.info(" community 등록페이지 실행 ");
		
		return "community/insert";
	}
	
	// http://localhost:8088/community/main
	@GetMapping("main")
	public String template() {
		return "community/new_list";
	}
	
	// http://localhost:8088/community/main02
	@GetMapping("main02")
	public String templateInsert() {
		return "community/new_insert";
	}
	
	// http://localhost:8088/community/main04
	@GetMapping("main04")
	public String templateProfile() {
		return "community/new_profile";
	}
	
	
	
	
//	// 게시물 등록 및 이미지 파일 등록
//	@PostMapping(value = "insert")
//	public String communityInsert(PostVO postVO) {
//		
//		logger.info("postVO : {}",postVO.toString());
//		
//		ImageVO imageVO = new ImageVO();
//		
//		MultipartFile file1 = postVO.getImage_file1();
//		MultipartFile file2 = postVO.getImage_file2();
//		MultipartFile file3 = postVO.getImage_file3();
//		MultipartFile file4 = postVO.getImage_file4();
//		
//		logger.info(" file1 : {}",file1);
//		logger.info(" file2 : {}",file2);
//		logger.info(" file3 : {}",file3);
//		logger.info(" file4 : {}",file4);
//		
//		String uploadDir = servletContext.getRealPath("/uploads/");
//		logger.info(" uploadDir : {}",uploadDir);
//		
//		try {
//			// 경로가 없으면 디렉터리 생성
//			File dir = new File(uploadDir);
//			if(!dir.exists()) {
//				dir.mkdirs();
//			}
//			
//			String uniqueFileName1 = UUID.randomUUID() + "_" + file1.getOriginalFilename();
//			File uploadFile1 = new File(uploadDir + uniqueFileName1);
//			String uniqueFileName2 = UUID.randomUUID() + "_" + file2.getOriginalFilename();
//			File uploadFile2 = new File(uploadDir + uniqueFileName2);
//			String uniqueFileName3 = UUID.randomUUID() + "_" + file3.getOriginalFilename();
//			File uploadFile3 = new File(uploadDir + uniqueFileName3);
//			String uniqueFileName4 = UUID.randomUUID() + "_" + file4.getOriginalFilename();
//			File uploadFile4 = new File(uploadDir + uniqueFileName4);
//			
//			// 파일 저장
//			file1.transferTo(uploadFile1);
//			file2.transferTo(uploadFile2);
//			file3.transferTo(uploadFile3);
//			file4.transferTo(uploadFile4);
//			
////			String image_src = "/uploads/" + uniqueFileName1 + ",/uploads/" + uniqueFileName2 + ",/uploads/" + uniqueFileName3 + ",/uploads/" + uniqueFileName4;
//			List<String> image_src = new ArrayList<String>();
//			image_src.add("/uploads/" + uniqueFileName1);
//			image_src.add("/uploads/" + uniqueFileName2);
//			image_src.add("/uploads/" + uniqueFileName3);
//			image_src.add("/uploads/" + uniqueFileName4);
//			logger.info(" 리스트 타입의 image_src : {}",image_src);
//			
////			imageVO.setImage_src(image_src);
//			imageVO.setImage_src(image_src);
//			
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		
////		imageVO.setImage_id(postVO.getPost_id());
////		imageVO.setImage_type(postVO.getPost_type());
////		if(file1 != null) {
////			imageVO.setImage_sequence(1);
////		}
////		if(file2 != null) {
////			imageVO.setImage_sequence(2);
////		}
////		if(file3 != null) {
////			imageVO.setImage_sequence(3);
////		}
////		if(file4 != null) {
////			imageVO.setImage_sequence(4);
////		}
//		
//		// post_id 설정
//		String post_id = postVO.getMember_id()+"0001";
//		
//		// 기존의 post_id 값 유무 체크(불러오기)
//		String checkPostId = communityService.checkPostId(postVO.getMember_id());
//		
//		// 기존에 post_id가 있다면
//		if(checkPostId != null) {
//			post_id = Integer.parseInt(checkPostId) + 1;
//		}
//		
//		logger.info(" imageVO : {}",imageVO);
//		
//		communityService.postInsert(postVO, imageVO);
//		
//		return "redirect:/community/new_insert";
//	}
	
} //controller
