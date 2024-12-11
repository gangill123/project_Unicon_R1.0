package com.Unicon.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Unicon.domain.AdminNoticeVO;
import com.Unicon.domain.CategoryDataVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.service.AdminStoreService;
import com.Unicon.service.CategoryDataService;

@Controller
@RequestMapping(value = "/store/*")
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	
	@Inject
	private CategoryDataService cService;
	
	@Inject
	private AdminStoreService aService;
	
	@RequestMapping( value = "/main" , method=RequestMethod.GET)
	public String main(HttpSession session, Model model) {
		logger.info("main 실행");
		logger.info(" /store/main.jsp 뷰페이지 실행");
		
		String member_id = (String) session.getAttribute("id");
		
		if(member_id == "admin") {
			List<ImageVO> list = aService.getAdminStoreImg();
			logger.info("list : "+ list);
			model.addAttribute("adminStoreImg", list);
		}
		
		return "/store/main";
	}
	
	
	@RequestMapping( value="/products/list" , method =RequestMethod.GET )
	public void productsList() {
		logger.info("products/list 실행");
	}
	
	@RequestMapping( value="/products/create" , method =RequestMethod.GET )
	public void productsCreate(Model model) {
		logger.info("/products/create 실행");
		
		List<CategoryDataVO> CategoryDataList = cService.petProductsCategory();
		logger.info("/products/create 실행  "+ CategoryDataList );
		
		model.addAttribute("CategoryDataList", CategoryDataList);
	}
	
	@RequestMapping( value="/manage/order" , method =RequestMethod.GET )
	public void orderGET() {
		logger.info("/manage/order 실행");
		
		
	}
	@RequestMapping( value="/sale/delivery" , method =RequestMethod.GET )
	public void deliveryGET() {
		logger.info("/sale/delivery 실행");
		
	}
	@RequestMapping( value="/sale/deliverySituation" , method =RequestMethod.GET )
	public void deliverySituationGET() {
		logger.info("/sale/deliverySituation 실행");
	}
	@RequestMapping( value="/claim/cancel" , method =RequestMethod.GET )
	public void claimCancelGET() {
		logger.info("/claim/cancel 실행");
	}
	@RequestMapping( value="/claim/blackConsumer" , method =RequestMethod.GET )
	public void blackConsumerGET() {
		logger.info("/claim/blackConsumerGET 실행");
	}
	
	// 어드민 공지사항.
	@RequestMapping( value="/admin/notice" , method =RequestMethod.GET )
	public void notice(HttpSession session, Model model) {
		logger.info("/admin/notice 실행");
	}
	
	// 어드민 공지사항 생성
	@GetMapping("/admin/noticeForm")
     public void createNoticeForm() {
		logger.info("/admin/createNoticeForm 실행");
	 }
	

	@RequestMapping( value="/admin/notices/detail/{ano_id}" , method =RequestMethod.GET )
	public String GetNoticeContent(@PathVariable("ano_id") int ano_id ,Model model ) {
		// ano 변수를 사용하여 특정 공지사항에 대한 작업 수행
	    logger.info("공지사항 ID: " + ano_id);
		
	    AdminNoticeVO result = aService.getNoticeById(ano_id); // insertNotices 메서드 호출
	    logger.info("result : " + result);
	    model.addAttribute("list", result);
	    return "/store/admin/detail";
	}
	
	
}
