package com.Unicon.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.CategoryDataVO;
import com.Unicon.domain.InterestVO;
import com.Unicon.domain.OrdersVO;
import com.Unicon.domain.PetVO;
import com.Unicon.domain.ShopVO;
import com.Unicon.service.MypageService;
import com.Unicon.service.OrdersService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MypageService myService;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private OrdersService oService;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	// 마이페이지
	@GetMapping("")
	public String Mypage(HttpSession session, Model model) {
		logger.info("Mypage() 호출");
		
		// 반려동물 조회
		String member_id = (String)session.getAttribute("member_id");
		List<PetVO> petAllInfo = myService.getPetAll(member_id);
		model.addAttribute("petAllInfo", petAllInfo);
			
		return "/mypage/main";
	}
	
	
	// 마이페이지 - 유니콘 등록
	@GetMapping("/pet_create")
	public String uniCreate() {
		return "/mypage/pet_create";
	}
	
	// 세부종류 가져오기(반려동물 등록)
	@GetMapping("/pet_type/{petOpt}")
	@ResponseBody
	public List<CategoryDataVO> getPetType(@PathVariable("petOpt") int petOpt){
		logger.info("getPetType() 호출");
		
		return myService.getPetType(petOpt);
	}
	
	// 반려동물 등록
	@PostMapping("/pet_create")
	public String petCreate(PetVO vo, HttpSession session) {
		logger.info("vo : {}",vo);
		
		// 세션아이디 저장
		vo.setMember_id((String)session.getAttribute("member_id"));
		
		MultipartFile file = vo.getPet_file();
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

            String pet_src = "/uploads/" + uniqueFileName;
            vo.setPet_src(pet_src);
            // 파일 저장
            file.transferTo(uploadFile);

        } catch (IOException e) {
            e.printStackTrace();
        }
		
		// 서비스 호출
		myService.createPet(vo);
		
		return "redirect:/mypage/pet_create";
	}
	
	
	// 펫정보 조회(ajax)
	@GetMapping("/pet_filter/all")
	@ResponseBody
	public List<PetVO> getPetInfoForAjax(HttpSession session){
		String member_id = (String)session.getAttribute("member_id");
		
		return myService.getPetAll(member_id);
	}
	
	
	// 펫뷰 이동
	@GetMapping("/pet_view/{pet_id}")
	public String petView(@PathVariable("pet_id") int pet_id, Model model) {
		
		// pet_id로 펫정보 가져오기
		PetVO petInfo = myService.getPet(pet_id);
		model.addAttribute("petInfo", petInfo);
		
		return "/mypage/pet_view";
	}
	
	// 펫 정보 수정
	@PostMapping("/pet_update/{pet_id}")
	public String petUpdate(PetVO vo) {
		logger.info("vo : {}",vo);
		
		if(vo.getPet_src().equals("")) {
			 
			/// 기존 파일 서버에서 삭제하기///
			
			// 프로젝트명 가져오기
			String projectName = servletContext.getContextPath();
			
			// 삭제할 파일의 dir 계산
			String deleteDir = servletContext.getRealPath("/"+projectName);
			
			// 기존 프로젝트 src 가져오기
			int pet_id = vo.getPet_id();
			String petSrc = myService.getPetSrc(pet_id);
			logger.debug("petSrc : {}",petSrc);
			
			// 삭제파일 경로객체 만들기
			String filePath = deleteDir+petSrc;
			Path path = Paths.get(filePath);
			
			try {
	            Files.delete(path); // 파일 삭제
	            logger.debug("정상적으로 삭제되었습니다.");
	        } catch (NoSuchFileException e) {
	            System.out.println("파일을 찾을 수 없습니다: " + filePath);
	        } catch (IOException e) {
	            System.out.println("파일 삭제 중 오류 발생: " + e.getMessage());
	        }
			
			/// 기존 파일 서버에서 삭제하기///
			
			// 새로운 src 만들어서 저장
			MultipartFile file = vo.getPet_file();
			String uploadDir = servletContext.getRealPath("/uploads/");
			try {
	            File dir = new File(uploadDir);
	            if (!dir.exists()) {
	                dir.mkdirs();
	            }
	            String uniqueFileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
	            File uploadFile = new File(uploadDir + uniqueFileName);
	            String pet_src = "/uploads/" + uniqueFileName;
	            vo.setPet_src(pet_src);
	            // 파일 저장
	            file.transferTo(uploadFile);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		} 
		
		// 서비스 호출
		myService.petUpdate(vo);
		return "redirect:/mypage/pet_view/"+vo.getPet_id();
		
	}
	
	// 펫 정보 삭제
	@PostMapping("/pet_delete/{pet_id}")
	@ResponseBody
	public void petDelete(@PathVariable("pet_id") int pet_id) {
		logger.info("pet_id : {}", pet_id);
		myService.petDelete(pet_id);
	}
	
	
	// 마이페이지 주문관리
	@GetMapping("orders")
	public String orderPage(HttpSession session, Model model) {
			
		String member_id = (String)session.getAttribute("member_id");
		// 주문정보 가져오기
		List<OrdersVO> ordersInfos = oService.getOrdersInfo(member_id);
		model.addAttribute("ordersInfos", ordersInfos);
		
		// 주문상태 갯수 가져오기
		List<Integer> ordersCntInfo = oService.getOrdersCount(member_id);
		model.addAttribute("ordersCntInfo", ordersCntInfo);
		
		return "/mypage/orders";
	}
	
	// 마이페이지 주문관리 상세보기
	@GetMapping("orders_detail/{order_detail_id}")
	public String orderDetailPage(@PathVariable("order_detail_id") int order_detail_id, Model model) {
		
		logger.info("orderDetailPage() 호출");
		logger.info("order_detail_id : {}", order_detail_id);
		
		// order_detail_id에 따른 주문정보 가져오기
		OrdersVO orderDetailInfo = oService.getOrdersInfoToDetailId(order_detail_id);
		model.addAttribute("orderDetailInfo", orderDetailInfo);
		
		return "/mypage/orders_detail";
	}
	
	// 마이페이지 주문관리 모든 주문정보 가져오기
	@GetMapping("/getOrdersInfoToStatus/all")
	@ResponseBody
	public List<OrdersVO> getOrdersInfoAll(@RequestParam Integer monthVal, HttpSession session){
		
		logger.info("getOrdersInfoAll() 호출");
		logger.info("monthVal :{}",monthVal);
		
		String member_id = (String)session.getAttribute("member_id");
		
		return oService.getOrdersInfoAll(member_id);
	}
	
	// 마이페이지 주문관리 주문상태에 따른 주문정보 가져오기
	@GetMapping("/getOrdersInfoToStatus/{orders_detail_status}")
	@ResponseBody
	public List<OrdersVO> getOrdersInfoToStatus(@PathVariable("orders_detail_status")
			String orders_detail_status, @RequestParam Integer monthVal, HttpSession session){
		
		logger.info("getOrdersInfoToStatus() 호출");
		logger.info("orders_detail_status: {}",orders_detail_status);
		logger.info("monthVal :{}",monthVal);
		
		String member_id = (String)session.getAttribute("member_id");
		
		if(monthVal == 0) {
			return oService.getOrdersInfoToStatus(orders_detail_status, member_id);
		} else {
			return oService.getOrdersInfoToStatusAndTime(orders_detail_status, member_id, monthVal);
		}
	}
	
	
	// 마이페이지 상단 탭(관심상품) 클릭 시 상품관련 정보 가져오기
	@GetMapping("/getInterest")
	@ResponseBody
	public List<InterestVO> getInterest(HttpSession session){
		
		logger.info("getInterest() 호출");
		String member_id = (String)session.getAttribute("member_id");
		return myService.getInterest(member_id);
	}
	
	
	// 마이페이지 관심상품 삭제 로직
	@PostMapping("/delInItem/{interest_id}")
	@ResponseBody
	public void delInItem(@PathVariable("interest_id") int interest_id) {
		logger.info("interest_id : {}",interest_id);
		myService.delInItem(interest_id);
	}
	
	
	
	
	
	
	
} //controller
