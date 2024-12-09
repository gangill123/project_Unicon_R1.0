package com.Unicon.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.CategoryDataVO;
import com.Unicon.domain.PetVO;
import com.Unicon.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MypageService myService;
	@Autowired
	private ServletContext servletContext;
	
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
		
		if(vo.getPet_src() == null) {
			 
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
	
	
	// 마이페이지 주문관리
	@GetMapping("orders")
	public String orderPage() {
		
		return "/mypage/orders";
	}
	
	// 마이페이지 주문관리 상세보기
	@GetMapping("orders_detail")
	public String orderDetailPage() {
		return "/mypage/orders_detail";
	}
	
	
	
	
} //controller
