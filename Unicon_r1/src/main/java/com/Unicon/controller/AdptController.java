package com.Unicon.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.MemberVO;
import com.Unicon.service.AdptService;

@Controller
@RequestMapping(value = "/adpt*")
public class AdptController {
	
	@Inject
	private AdptService aService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdptController.class);
	
	
	@GetMapping(value= "")
	public String adptViewAll() {
		logger.debug("( •̀ ω •́ )✧ adptViewAll() 실행");
		
		return "/adpt/adpt_list";
	}
	
	
	@PostMapping("/getAdpt")
	@ResponseBody
	public List<AnimalVO> getAdptType(@RequestBody Map<String, Object> adptFilters, HttpServletRequest req){
		logger.debug("( •̀ ω •́ )✧ getAdptType 실행");
		
		
		
		if(adptFilters.get("adptFilter").equals("local")) {
			String member_id = (String)req.getSession().getAttribute("member_id");
			member_id = "youreal00";
			MemberVO mvo = aService.getMemberInfo(member_id);
			String roadAddress = mvo.getRoad_address();
			String[] splitAddress = roadAddress.split(" ");
			adptFilters.put("location", splitAddress[0]);
			List<AnimalVO> animalList = aService.getAdptFilterView(adptFilters);
			return animalList;
		} else {
			List<AnimalVO> animalList = aService.getAdptFilterView(adptFilters);
			return animalList;
		}
	}
	
	
	@PostMapping("/counsel")
	@ResponseBody
	public ResponseEntity<?> counselCheck(HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ counselCheck() 실행");
		
		String member_id = (String)req.getSession().getAttribute("member_id");
		
		if(member_id == null) {
			logger.debug("( •̀ ω •́ )✧ 회원 ID가 없습니다 - 로그인 필요");
			
			return new ResponseEntity<Void>(HttpStatus.UNAUTHORIZED);
		}
		
		try {
			MemberVO mvo = aService.getMemberInfo(member_id);
			return new ResponseEntity<MemberVO>(mvo, HttpStatus.OK);
		} catch (Exception e) {
			logger.debug("( •̀ ω •́ )✧ 저장된 회원 정보가 없음");
			
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	@PostMapping("/counsel/submit")
	@ResponseBody
	public ResponseEntity<Void> counselSubmit(@RequestBody Map<String, String> counselParams, HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ counselSubmit() 실행");
		
		try {
			aService.counselSubmit(counselParams);
			
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			logger.debug("( •̀ ω •́ )✧ 오류발생 : {}",e.getMessage());
			
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	@GetMapping("/counsel/check")
	@ResponseBody
	public boolean counselCheck(@RequestParam Map<String,String> counselCheckParams, HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ counselCheck() 실행");
		
		String member_id = (String)req.getSession().getAttribute("member_id");
		counselCheckParams.put("member_id", member_id);
		
		return aService.counselCheckMember(counselCheckParams);
	}
	
	
	
	
	
}
