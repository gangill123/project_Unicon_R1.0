package com.Unicon.controller;

import org.slf4j.Logger;


import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.Unicon.domain.InquiryVO;
import com.Unicon.service.InquiryService;


@Controller
@RequestMapping(value = "/inquiry/*")
public class InquiryController {

	private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);
	
	@Autowired
	private InquiryService inquiryService;
	
	
    @GetMapping("/inquiry")
    public String main() {
    	logger.debug("inquiry 메인 페이지 실행");
        return "inquiry/inquiry";  
    }
  
    @GetMapping("/adoption")
    public String adoption() {
    	logger.debug("adoption 메인 페이지 실행");
        return "inquiry/adoption";  
    }
  
    @GetMapping("/shop")
    public String shop() {
    	logger.debug("shop 메인 페이지 실행");
        return "inquiry/shop";  
    }
    
    @GetMapping("/community")
    public String community() {
    	logger.debug("community 메인 페이지 실행");
        return "inquiry/community";  
    }
    
    @GetMapping("/board")
    public String board() {
    	logger.debug("board 메인 페이지 실행");
        return "inquiry/board";  
    }
    
    @GetMapping("/history")
    public String history() {
    	logger.debug("history 메인 페이지 실행");
        return "inquiry/history";  
    }
    
    @GetMapping("/question")
    public String question() {
    	logger.debug("question 메인 페이지 실행");
        return "inquiry/question";  
    }
    
    @GetMapping("/write")
    public String write() {
    	logger.debug("write 메인 페이지 실행");
        return "inquiry/write";  
    }
    @GetMapping("/etc")
    public String etc() {
    	logger.debug("etc 메인 페이지 실행");
        return "inquiry/etc";  
    }
    
    // 게시글 상세 페이지
    @GetMapping("/board/{bno}")
    public String getBoardDetail(@PathVariable int bno, Model model) {
        // bno에 해당하는 게시글 상세 정보를 가져옴
        InquiryVO boardDetail = inquiryService.getBoardDetail(bno);
        
        
        // 파일 경로를 웹 서버 경로로 변경
        if (boardDetail != null && boardDetail.getInquiryFile() != null) {
            String filePath = boardDetail.getInquiryFile().getThumbnailPath();
            if (filePath != null) {
                // "C:/uploads/thumbnails/"에서 시작되는 경로에서 중복을 제거하고 "/uploads/thumbnails/"로 설정
                String webFilePath = filePath.replace("C:/uploads/thumbnails/", "/uploads/thumbnails/");
                boardDetail.getInquiryFile().setThumbnailPath(webFilePath);
            }
        }
        
        // 모델에 데이터 전달
        model.addAttribute("boardDetail", boardDetail);
        
        // 상세 페이지로 이동
        return "inquiry/boardDetail"; // boardDetail.jsp로 이동
    }
    
    
    
    
} // InquiryController