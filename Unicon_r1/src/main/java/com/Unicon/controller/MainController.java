package com.Unicon.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Unicon.domain.AdptVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.MainSlideVO;
import com.Unicon.domain.NewsVO;
import com.Unicon.domain.PostVO;
import com.Unicon.domain.ShopVO;
import com.Unicon.service.AdptService;
import com.Unicon.service.CommunityService;
import com.Unicon.service.MainService;
import com.Unicon.service.MainSlideService;
import com.Unicon.service.NewsService;
import com.Unicon.service.ShopService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	// http://localhost:8088/main/new_template
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MainSlideService msService;
	@Autowired
	private NewsService nService;
	@Autowired
	private MainService mainService;
	@Autowired
	private ShopService shopService;
	@Autowired
	private AdptService adptService;
	@Autowired
	private CommunityService commService;
	
	@GetMapping("")
	public String main(Model model, HttpSession session) {
		
		logger.debug("main() 호출");
		
		String member_id = (String)session.getAttribute("member_id");
		
		// 슬라이드 정보 가져오기
		List<MainSlideVO> slideInfo = msService.getSlideForMain();
		model.addAttribute("slideInfo", slideInfo);
		
		// 소식 정보 가져오기
		NewsVO newsInfo = nService.getNewsForMain();
		model.addAttribute("newsInfo", newsInfo);
		
		// 세일품목 정보 가져오기(4개)
		List<ShopVO> shopInfo = shopService.getShopItemForMain();
		model.addAttribute("shopInfo", shopInfo);
		
		// 공고수, 입양완료 수, 유니콘 가입자수, 보호센터 수 가져오기
		List<Integer> unicornInfo = mainService.getUnicornInfo();
		model.addAttribute("unicornInfo", unicornInfo);
		
		// 최신 입양공고 가져오기
		List<AnimalVO> adptInfo =	adptService.forMainAdptData();
		model.addAttribute("adptInfo", adptInfo);
		
		// 최신 입양후기 가져오기
		List<PostVO> adptreviewInfo = commService.forMainCommunityData();
		model.addAttribute("adptreviewInfo", adptreviewInfo);
		
		// 장바구니 수량 가져와서 세션저장
		int cartCount = mainService.getCartCount(member_id);
		session.setAttribute("cartCount", cartCount);
		
		// 멤버 사진 가져와서 세션 저장
		String memberImage = mainService.getMemberImage(member_id);
		session.setAttribute("memberImage", memberImage);
		
		
		return "/main/new_main";
	}
	
	//템플릿 테스트
	@GetMapping("/shop")
	public String mainTest2() {
		
		return "main/template";
	}
	
	//템플릿 테스트
	@GetMapping("/test")
	public String mainTest3() {
		
		return "main/test";
	}
	
	
} //controller
