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
import com.Unicon.domain.OptionVO;
import com.Unicon.domain.ProductVO;
import com.Unicon.domain.ShopVO;
import com.Unicon.service.AdminStoreService;
import com.Unicon.service.CategoryDataService;
import com.Unicon.service.ProductService;
import com.Unicon.service.ShopService;
import com.mysql.cj.xdevapi.Result;

@Controller
@RequestMapping(value = "/store/*")
public class StoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	
	@Inject
	private CategoryDataService cService;
	
	@Inject
	private AdminStoreService aService;
	
	@Inject 
	private ShopService sService;
	
	@Inject
	private ProductService pService;
	
	// 쇼핑몰 메인 페이지
	@RequestMapping( value = "/main" , method=RequestMethod.GET)
	public String StoreMain(HttpSession session, Model model) {
		logger.info("main 실행");
		
		// 공지사항과 팝업 가져오기
	    List<AdminNoticeVO> notices = aService.getNoticePreviewList(); // 공지사항 리스트
	    List<AdminNoticeVO> popups = aService.getActivePopupList(); // 팝업 리스트
	    
	    // 모델에 데이터 담기
	    model.addAttribute("notices", notices);
	    model.addAttribute("popups", popups);
	    logger.info("main 실행 : "+popups);
	    
		return "/store/main";
	}
	
	
	
	
	// 상품 조회 / 수정
	@RequestMapping( value="/product/list" , method =RequestMethod.GET )
	public void productsList(HttpSession session,Model model) {
		logger.info("products/list 실행");
	}
	// 2차 카테고리 가져오기
	@RequestMapping( value="/product/create" , method =RequestMethod.GET )
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
	
	@RequestMapping( value="/claim/blackConsumer" , method =RequestMethod.GET )
	public void blackConsumerGET() {
		logger.info("/claim/blackConsumerGET 실행");
	}
	
	
	
	/////////////////////////////어드민 /////////////////// ////////////////////////////////////////////// 
	/////////////////////////////어드민 /////////////////// ////////////////////////////////////////////// 
	/////////////////////////////어드민 /////////////////// ////////////////////////////////////////////// 
	/////////////////////////////어드민 /////////////////// ////////////////////////////////////////////// 

	
	// 쇼핑몰 판매 관리자 페이지
	@RequestMapping( value = "/admin/main" , method=RequestMethod.GET)
	public String AdminMain(HttpSession session, Model model) {
		logger.info("main 실행");
		logger.info(" /store/main.jsp 뷰페이지 실행");
		
		// 내일 member 로그인이랑 합쳐서 어드민 아니면 돌려보내기
//		String member_id = (String) session.getAttribute("id");
		
		
		// 복지몰 메인 슬라이드 이미지
		List<ImageVO> list = aService.getAdminStoreImg();
		logger.info("list : "+ list);
		model.addAttribute("adminStoreImg", list);
		
		
		// 신규 상품 등록 갯수
		int newProductCount = aService.getNewProductCount();
		model.addAttribute("newProductCount", newProductCount);
		
		// 전체 상품 목록 갯수
		int ProductCount = aService.getProductCount();
		model.addAttribute("ProductCount", ProductCount);
		
		
		
		return "/store/admin/main";
	}
	
	
	// 승인 해야되는 새로 등록된 상품 리스트
	@RequestMapping(value ="/admin/product/newList" , method = RequestMethod.GET )
	public void newProductList() {
		logger.info("newProductList 실행");
	}
	
	
	// 승인 해야되는 새로 등록된 상품 미리보기
	@RequestMapping(value ="/admin/product/preview/{product_id}" , method = RequestMethod.GET )
	public String previewProduct(@PathVariable("product_id") String product_id,Model model) {
		logger.info("previewProduct 실행");
		logger.debug("product_id : {}",product_id);
		
		// 상품정보 + 이미지정보
		ShopVO productInfo = sService.getProduct(product_id);
		model.addAttribute("productInfo", productInfo);
		
		// 옵션정보 가져오기(조합형 - 가격제외)
		List<OptionVO> optionInfo = sService.getOption1(product_id);
		model.addAttribute("optionInfo", optionInfo);
		
		// 옵션정보 가져오기(단독형 - 가격포함)
		List<OptionVO> optionInfoForSole = sService.getOption1ForSole(product_id);
		model.addAttribute("optionInfoForSole", optionInfoForSole);
		
		
		return "/store/admin/product/preview";
	}
	
	// 승인된 상품 리스트
	@RequestMapping(value ="/admin/product/list" , method = RequestMethod.GET )
	public String product() {
		logger.info("product 실행");
		
		return "/store/admin/product/list";
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
	
	// 어드민 공지사항 생성
	@GetMapping("/admin/noticeUpdateForm/{ano_id}")
	public String updateNoticeForm(@PathVariable("ano_id") int ano_id ,Model model ) {
        // ano 변수를 사용하여 특정 공지사항에 대한 작업 수행
		logger.info("공지사항 ID: " + ano_id);

		AdminNoticeVO result = aService.getNoticeById(ano_id); // insertNotices 메서드 호출
		logger.info("result : " + result);
		
		if (result == null) {
			// result가 null인 경우 리다이렉트
			return "redirect:/store/admin/notice"; // 적절한 리다이렉트 URL로 변경
		}
		model.addAttribute("list", result);
		
        return "/store/admin/noticeUpdateForm"; // 수정할 JSP 파일명
    }
	
	// 공지사항 상세보기
	@RequestMapping( value="/admin/notices/detail/{ano_id}" , method =RequestMethod.GET )
	public String GetNoticeContent(@PathVariable("ano_id") int ano_id ,Model model ) {
		// ano 변수를 사용하여 특정 공지사항에 대한 작업 수행
		logger.info("공지사항 ID: " + ano_id);
		
		AdminNoticeVO result = aService.getNoticeById(ano_id); // insertNotices 메서드 호출
		logger.info("result : " + result);
		
		if (result == null) {
			// result가 null인 경우 리다이렉트
			return "redirect:/store/admin/notice"; // 적절한 리다이렉트 URL로 변경
		}
		model.addAttribute("list", result);
		return "/store/admin/detail";
	}
	
	
	// 어드민 팝업 공지사항.
	@RequestMapping( value="/admin/popup" , method =RequestMethod.GET )
	public String GetPopup() {
		logger.info("/admin/popup 실행");
		return "/store/admin/popup";
	}
	
	// 어드민 팝업 공지사항 디테일.
	@RequestMapping( value="/admin/popup/{anoId}" , method =RequestMethod.GET )
	public String GetPopupDetail(@PathVariable("anoId") int ano_id,Model model   ) {
		logger.info("/admin/popup/{anoId} 실행"+ ano_id);
		AdminNoticeVO result = aService.getPopupById(ano_id);
		logger.info("result : " + result);
		if (result == null) {
			// result가 null인 경우 리다이렉트
			return "redirect:/store/admin/popup"; // 적절한 리다이렉트 URL로 변경
		}
		model.addAttribute("list", result);
		
		return "/store/admin/popupDetail";
	}
	
	// 어드민 팝업 공지사항.
	@RequestMapping( value="/admin/popupForm" , method =RequestMethod.GET )
	public String GetpopupForm() {
		logger.info("/admin/popup 실행");
		return "/store/admin/popupForm";
	}
	
	
}
