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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.Unicon.domain.CommentVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.PostVO;
import com.Unicon.service.CommunityService;

@Controller
@RequestMapping(value = "/community/*")
public class CommunityController {
	
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
	
	// 커뮤니티 - 입양 후기 게시물 보는 사이트
	// http://localhost:8088/community/main
	@GetMapping("main")
	public String template(Model model) {
		List<PostVO> postList = communityService.getPostList01();
		
		model.addAttribute("postList", postList);
		
		logger.info("--------postList---------{}",postList);
		
		return "community/new_list";
	}
	
	// 커뮤니티 - 프로필 게시물 보는 사이트
	// http://localhost:8088/community/main04
	@GetMapping("main04/{member_id}")
	public String templateProfile(Model model, @PathVariable("member_id")String member_id) {
		List<PostVO> postList = communityService.getProfilePostList01(member_id);
		
		model.addAttribute("postList", postList);
		
		logger.info("--------postList---------{}",postList);
		
		return "community/new_profile";
	}
	
	// 커뮤니티 - 반려 이야기 게시물 보는 사이트
	// http://localhost:8088/community/main2
	@GetMapping("main2")
	public String template2(Model model) {
		List<PostVO> postList = communityService.getPostList02();
		
		model.addAttribute("postList", postList);
		
		logger.info("--------postList---------{}",postList);
		
		return "community/new_list";
	}
	
	// 커뮤니티 - 실종 게시물 보는 사이트
	// http://localhost:8088/community/main3
	@GetMapping("main3")
	public String template3(Model model) {
		List<PostVO> postList = communityService.getPostList03();
		
		model.addAttribute("postList", postList);
		
		logger.info("--------postList---------{}",postList);
		
		return "community/new_list";
	}
	
	// 커뮤니티 - 임시 보호 게시물 보는 사이트
	// http://localhost:8088/community/main4
	@GetMapping("main4")
	public String template4(Model model) {
		List<PostVO> postList = communityService.getPostList04();
		
		model.addAttribute("postList", postList);
		
		logger.info("--------postList---------{}",postList);
		
		return "community/new_list";
	}
	
	// 커뮤니티 - 게시물 등록 사이트
	// http://localhost:8088/community/main02
	@GetMapping("main02")
	public String templateInsert() {
		return "community/new_insert";
	}
	
	// 커뮤니티 - 게시물 수정 사이트
	// http://localhost:8088/community/main03
	@GetMapping("main03/{post_id}")
	public String templateUpdate(@PathVariable("post_id")String post_id, Model model) {
		logger.info("post_id는 : {}",post_id);
		PostVO postList = communityService.getPostListOne(post_id);
		model.addAttribute("postList", postList);
		logger.info(" postList는 : {}",postList);
		
		return "community/new_update";
	}
	
	// 게시물 종류별 전체, 상태별 불러오기
	@GetMapping("readPostType/{post_type}")
	@ResponseBody
	public List<PostVO> readPostType (@PathVariable("post_type")String post_type){
		return communityService.getPostList(post_type);
	}
	
	// 프로플 게시물 종류별 전체, 상태별 불러오기
	@GetMapping("readProfilePostType/{postType}")
	@ResponseBody
	public List<PostVO> readProfilePostType(@PathVariable("postType")String post_type, @RequestParam("profileId")String member_id){
		logger.info("post_type는 : {}",post_type);
		logger.info("member_id는 : {}",member_id);
		return communityService.getProfilePostList(post_type, member_id);
	}
	
	// 게시물 종류별 전체, 상태별 불러오기
	@GetMapping("readPostType02/{post_type}")
	@ResponseBody
	public List<PostVO> readPostType02 (@PathVariable("post_type")String post_type,
			@RequestParam("resionFilter") String post_resion, @RequestParam("animalFilter") int category_parent){
		logger.info("post_resion는 : {}",post_resion);
		logger.info("category_parent는 : {}",category_parent);
		
		List<PostVO> searchPostList = null;
		
		if(post_resion.equals("모든 지역") && category_parent == 0) {
			searchPostList = communityService.getPostList(post_type);
		}
		if(!post_resion.equals("모든 지역") && category_parent == 0) {
			searchPostList = communityService.getSearchList01(post_type, post_resion);
		}
		if(post_resion.equals("모든 지역") && category_parent != 0) {
			searchPostList = communityService.getSearchList02(post_type, category_parent);
		}
		if(!post_resion.equals("모든 지역") && category_parent != 0) {
			searchPostList = communityService.getSearchList03(post_type, post_resion, category_parent);
		}
		
		return searchPostList;
	}
	

	
} //controller
