package com.Unicon.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.NewsVO;
import com.Unicon.service.NewsService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private NewsService nService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	//관리자페이지 이동(슬라이드 설정 보여주기)
	@GetMapping("")
	public String adminSlide() {
		return "admin/slide";
	}
	
	//관리자페이지 - 소식관리페이지 이동
	@GetMapping("/news_manage")
	public String adminNews(Model model) {
		
		// 모든정보 조회 서비스
		List<NewsVO> newsAllInfo = nService.getNewsAll();
		
		model.addAttribute("newsAllInfo", newsAllInfo);
		
		return "/admin/news_manage";
	}
	
	//소식등록페이지 이동
	@GetMapping("/news_create")
	public String adminNewsCreateGET() {
		return "admin/news_create";
	}
	
	//소식등록처리
	@PostMapping("/news_create")
	public String adminNewsCreatePOST(NewsVO vo) {
		
		logger.debug(vo.toString());
		
		MultipartFile file = vo.getNews_file();
		String uploadDir = servletContext.getRealPath("/uploads/");
		logger.debug(uploadDir);
		
		try {
            // 경로가 없으면 디렉터리 생성
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String uniqueFileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
            File uploadFile = new File(uploadDir + uniqueFileName);

            String news_src = "/uploads/" + uniqueFileName;
            vo.setNews_src(news_src);
            // 파일 저장
            file.transferTo(uploadFile);

        } catch (IOException e) {
            e.printStackTrace();
        }
		
			// 서비스 호출
			nService.newsCreate(vo);
		
		return "redirect:/admin/news_create";
	}
	
	// 소식 조회
	@GetMapping(value = "/news_view/{num}")
	public String getNewsInfo(@PathVariable("num") int num, Model model) {
		
		// 특정 소식정보 가져오기
		NewsVO newsInfo  =	nService.getNews(num);
		model.addAttribute("newsInfo", newsInfo);
		
		return "admin/news_view";
	}
	
	// 소식정보 수정
	@PostMapping(value = "/news_update/{num}")
	public String updateNewsInfo(NewsVO vo, @RequestParam("resion") String resion,
			@RequestParam("currentPage") int currentPage) {
		
		logger.debug("updateNewsInfo(newsVO vo) 실행");
		logger.debug(vo.toString());
		
		if(vo.getNews_src().equals("")) {
			
			// 새로운 src 만들어서 저장
			MultipartFile file = vo.getNews_file();
			String uploadDir = servletContext.getRealPath("/uploads/");
			try {
	            File dir = new File(uploadDir);
	            if (!dir.exists()) {
	                dir.mkdirs();
	            }
	            String uniqueFileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
	            File uploadFile = new File(uploadDir + uniqueFileName);
	            String news_src = "/uploads/" + uniqueFileName;
	            vo.setNews_src(news_src);
	            // 파일 저장
	            file.transferTo(uploadFile);
	            // 업데이트 서비스 실행
	            nService.updateNews(vo);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		} else {
			// 그대로 저장
			nService.updateNews(vo);
		}
		try {
			return "redirect:/admin/news_view/"+vo.getNews_id()+"?resion="+URLEncoder.encode(resion, StandardCharsets.UTF_8.toString())+"&currentPage="+currentPage;
		} catch (UnsupportedEncodingException e) {
			return null;
		}
	}
	
	//소식 삭제
	@DeleteMapping("/news_delete/{num}")
	@ResponseBody
	public void deleteNews(@PathVariable("num") int news_id) {
		logger.debug("news_id : "+news_id);
		nService.deleteNews(news_id);
	}
	
	// 소식 모두(전국) 가져오기(페이징_ajax)
	@GetMapping("/news_filter/all")
	@ResponseBody
	public List<NewsVO> getNewsAllFilter() {
		
		logger.debug("다녀옴");
		
		// 모든정보 조회 서비스
		List<NewsVO> newsAllInfo = nService.getNewsAll();
		
		return newsAllInfo;
	}
	
	// 소식 지역 가져오기(페이징_ajax)
	@GetMapping("/news_filter/{resion}")
	@ResponseBody
	public List<NewsVO> getNewsFilter(@PathVariable("resion") String news_resion) {
		logger.debug("getNewsFilter() 실행");
		logger.debug("news_resion : {}", news_resion);
		List<NewsVO> newsResionInfo = nService.getNewsResion(news_resion);
		
		return newsResionInfo;
	}
	
	
	// 슬라이드 등록 페이지 이동
	@GetMapping("/slide_create")
	public String slideCreate() {
		logger.debug("slideCreate() 실행");
		
		return "/admin/slide_create";
	}
	
	
	
	
	
	
	
		
}
