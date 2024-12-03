package com.Unicon.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Unicon.domain.NewsVO;
import com.Unicon.service.NewsService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/news")
public class NewsController {
	
	@Autowired
	private NewsService nService;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);
	
	// 소식페이지 이동
	@GetMapping("")
	public String newsPage(Model model, HttpSession session) {

		// 임시 아이디 세션저장
		session.setAttribute("member_id", "dummy01");
		
		// 소식정보 가져오기
		List<NewsVO> newsAllInfo = nService.getNewsAll();
		model.addAttribute("newsAllInfo", newsAllInfo);
		
		return "/news/news";
	}
	
	
	// 소식 탭 클릭에 따른 소식정보 가져오기
	@GetMapping("/getNews/{id}")
	@ResponseBody
	public List<NewsVO> getNewsType(@PathVariable("id") String id, HttpSession session){
		logger.debug("getNewsType() 호출");
		logger.debug("id : {}",id);
		
		if(id.equals("lastest")) {
			// 전체 소식 가져가기
			return nService.getNewsLastest();
		} else if(id.equals("upcoming")) {
			// 다가오는 소식 가져가기
			return nService.getNewsUpcoming();
		} else if(id.equals("local")) {
			// 우리 지역 소식 가져오기
			String member_id = (String)session.getAttribute("member_id");
			return nService.getNewsLocal(member_id);
		} else {
			// 종료된 소식 가져오기
			return nService.getNewsClosed();
		}
	}
	
	
	
	
}
