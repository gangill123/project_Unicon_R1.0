package com.Unicon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.Unicon.domain.AdptVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.MemberVO;
import com.Unicon.persistence.AdptDAO;
import com.Unicon.service.AdptService;


@RestController
@RequestMapping("/adptmgmt/**")
public class AdptMgmtRestController {
	
	@Inject
	private AdptService aService;
	@Inject
	private AdptDAO aDao;
	private static final Logger logger = LoggerFactory.getLogger(AdptMgmtRestController.class);
	
	
	/* ===== 보호소페이지 동물 등록 ===== */
	@PostMapping(value = "/animals/creation")
	public ResponseEntity<Void> registerAnimal(@ModelAttribute AnimalVO avo, HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ registerAnimal(AnimalVO avo, HttpServletRequest req) 실행");
		
		try {
			
			if (avo == null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			avo.setAnimal_id(aService.genAnimalId());
			
			List<ImageVO> images = aService.saveImage(avo, req);
			if (images == null || images.isEmpty()) {
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			avo.setAnimal_images(images);
			aService.animalInsert(avo);
			
			return new ResponseEntity<Void>(HttpStatus.OK);
			
		} catch (Exception e) {
			logger.error("( •̀ ω •́ )✧ 오류 발생: " + e.getMessage());
			
			aService.deleteImage(avo.getAnimal_images(), req);
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	/* ===== 보호소페이지 동물 이름 자동짓기 ===== */
	@GetMapping(value = "/animals/autoname")
	public ResponseEntity<Map<String, String>> animalAutoName(
			@RequestParam("animal_act") int act, @RequestParam("animal_social") int social) {
		logger.debug("( •̀ ω •́ )✧ animalAutoName() 실행");
		
		String autoName = aService.genAutoName(act, social); 
		Map<String, String> resp = new HashMap<String, String>();
		resp.put("autoName", autoName);
		return new ResponseEntity<Map<String, String>>(resp,HttpStatus.OK);
	}
	
	
	/* ===== 보호소페이지 동물 목록 ===== */
	@GetMapping(value = "/animals")
	public ResponseEntity<List<AnimalVO>> animalListAllMember(HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ animalListAllMember() 실행");
		String member_id = (String) req.getSession().getAttribute("member_id");
		logger.debug("( •̀ ω •́ )✧ member_id : {}",member_id);
		List<AnimalVO> animList = aService.getAnimalListAll(member_id);
		if(animList != null) {
			return new ResponseEntity<List<AnimalVO>>(animList,HttpStatus.OK);
		} else {
			return new ResponseEntity<List<AnimalVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	/* ===== 보호소페이지 동물 목록(관리자) ===== */
	@GetMapping(value = "/animals/manager")
	public ResponseEntity<List<AnimalVO>> animalListAllManager(HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ animalListAllManager() 실행");
		String member_id = (String)req.getSession().getAttribute("member_id");
		
		List<AnimalVO> animList = aService.getAnimalListAll();
		if(animList != null) {
			return new ResponseEntity<List<AnimalVO>>(animList,HttpStatus.OK);
		} else {
			return new ResponseEntity<List<AnimalVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	/* ===== 보호소페이지 동물 정보 수정시 동물 조회(관리자 포함) ===== */
	@GetMapping(value = "/animals/{animal_id}")
	public ResponseEntity<AnimalVO> animalListOne(@PathVariable("animal_id")String animal_id,
			HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ animalListOne() 실행");
		String member_id = (String) req.getSession().getAttribute("member_id");
		
		int checkId = aService.checkAnimalId(animal_id, member_id);
		if(checkId == 1) {
			logger.debug("( •̀ ω •́ )✧ 존재하는 동물id & 해당 동물의 회원 확인완료");
			AnimalVO animalVO = aService.getAnimalListOne(animal_id);
			return new ResponseEntity<AnimalVO>(animalVO, HttpStatus.OK);
		} else {
			logger.debug("( •̀ ω •́ )✧ 존재하지않는 동물id || 해당 동물의 회원이 아닙니다");
			return new ResponseEntity<AnimalVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	/* ===== 보호소페이지 입양글 수정시 동물 정보 조회(관리자 포함) ===== */
	@GetMapping(value = "/animals/{animal_id}/writing")
	public ResponseEntity<AnimalVO> AnimalWritingOne(@PathVariable("animal_id")String animal_id,
			HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ AnimalWritingOne() 실행");
		String member_id = (String) req.getSession().getAttribute("member_id");
		
		int checkId = aService.checkAnimalId(animal_id, member_id);
		if(checkId == 1) {
			logger.debug("( •̀ ω •́ )✧ 존재하는 동물id & 해당 동물의 회원 확인완료");
			AnimalVO animalVO = aService.getAnimalWritingOne(animal_id);
			return new ResponseEntity<AnimalVO>(animalVO, HttpStatus.OK);
		} else {
			logger.debug("( •̀ ω •́ )✧ 존재하지않는 동물id || 해당 동물의 회원이 아닙니다");
			return new ResponseEntity<AnimalVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	/* ===== 보호소페이지 동물 입양글 작성시 동물ID정보 & 회원정보 확인 ===== */
	@GetMapping(value = "/animals/{animal_id}/check")
	public ResponseEntity<AnimalVO> animalWritingOne(@PathVariable("animal_id")String animal_id,
			HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ animalWritingOne() 실행");
		String member_id = (String)req.getSession().getAttribute("member_id");
		
		int checkId = aService.checkAnimalId(animal_id, member_id);
		
		if(checkId == 1) {
			logger.debug("( •̀ ω •́ )✧ 존재하는 동물id & 해당 동물의 회원 확인완료");
			AnimalVO animalVO = aService.getAnimalListOne(animal_id);
			int checkStatus = animalVO.getAnimal_status();
			
			if(checkStatus == 1) {
				logger.debug("( •̀ ω •́ )✧ 대기중 상태인 동물입니다 정상처리");
				return new ResponseEntity<AnimalVO>(animalVO, HttpStatus.OK);
			} else {
				logger.debug("( •̀ ω •́ )✧ 이미 입양글이 작성되거나 종료된 동물입니다");
				return new ResponseEntity<AnimalVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
				
		} else {
			logger.debug("( •̀ ω •́ )✧ 존재하지않는 동물id 입니다");
			return new ResponseEntity<AnimalVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	/* ===== 보호소페이지 동물 정보 수정(관리자 포함) ===== */
	@PostMapping(value = "/animals/{animal_id}/modification")
	public ResponseEntity<Void> modifyAnimal(@ModelAttribute AnimalVO avo, HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ modifyAnimal(AnimalVO avo, HttpServletRequest req) 실행");
		
		try {
			
			if (avo == null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			
			List<ImageVO> animal_images = aService.modifyImage(avo, req);
			
			if (animal_images == null || animal_images.isEmpty()) { 
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR); 
			}
			
			avo.setAnimal_images(animal_images);
			aService.modifyAnimal(avo);
			return new ResponseEntity<Void>(HttpStatus.OK);
			
		} catch (Exception e) {
			logger.error("( •̀ ω •́ )✧ 오류 발생: {}",e.getMessage());
			
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	
	/* ===== 보호소페이지 동물 정보 삭제(관리자 포함) ===== */
	@DeleteMapping(value = "/animals/{animal_id}/deletion")
	public ResponseEntity<Void> deleteAnimal(@PathVariable("animal_id") String animal_id) {
		logger.debug("( •̀ ω •́ )✧ deleteAnimal() 실행");
		
		try {
			aService.deleteAnimal(animal_id);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch(Exception e) {
			logger.debug("( •̀ ω •́ )✧ 오류 발생: {}",e.getMessage());
			
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	/* ===== 보호소페이지 동물 상태 정보 수정(관리자 포함) ===== */
	@PatchMapping(value = "/animals/{animal_id}/status")
	public ResponseEntity<Void> modifyAnimalStatus(@RequestBody Map<String, Object> statusData) {
		logger.debug("( •̀ ω •́ )✧ modifyAnimalStatus() 실행");
		
		try {
			aService.modifyAnimalStatus(statusData);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch(Exception e) {
			logger.debug("( •̀ ω •́ )✧ 오류 발생: {}",e.getMessage());
			
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	/* ===== 보호소페이지 입양글 등록 ===== */
	@PostMapping(value = "/writings/{animal_id}/creation")
	public ResponseEntity<Void> registerAdptWriting(AdptVO advo, @RequestParam("animalStatus")int animalStatus) {
		logger.debug("( •̀ ω •́ )✧ registerAdptWriting() 실행");
		
		try {
			advo.setAdpt_id(aService.genAdptId(advo));
			aService.adptWritingInsert(advo, animalStatus);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			logger.debug("( •̀ ω •́ )✧ 오류 발생: {}",e.getMessage());
			
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	/* ===== 보호소페이지 입양글 목록 ===== */
	@GetMapping(value = "/writings")
	public ResponseEntity<List<AnimalVO>> writingListAllMember(HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ writingListAllMember() 실행");
		String member_id = (String)req.getSession().getAttribute("member_id");
		logger.debug("( •̀ ω •́ )✧ member_id : {}",member_id);
		try {
			
			List<AnimalVO> writingList = aService.getWritingListAll(member_id);
			
			return new ResponseEntity<List<AnimalVO>>(writingList ,HttpStatus.OK);
		} catch (Exception e) {
			logger.debug("( •̀ ω •́ )✧ 오류 발생: {}",e.getMessage());
			
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	/* ===== 보호소페이지 입양글 목록 (관리자) ===== */
	@GetMapping(value = "/writings/manager")
	public ResponseEntity<List<AnimalVO>> writingListAllManager(HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ writingListAllMember() 실행");
		String member_id = (String)req.getSession().getAttribute("member_id");
		
		try {
			
			List<AnimalVO> writingList = aService.getWritingListAll();
			
			return new ResponseEntity<List<AnimalVO>>(writingList ,HttpStatus.OK);
		} catch (Exception e) {
			logger.debug("( •̀ ω •́ )✧ 오류 발생: {}",e.getMessage());
			
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	/* ===== 보호소페이지 입양글 수정 ===== */
	@PostMapping(value = "/writings/{animal_id}/modification")
	public ResponseEntity<Void> modifyWriting(AdptVO advo) {
		logger.debug("( •̀ ω •́ )✧ modifyWriting(AdptVO advo) 실행");
		
		try {
			aService.modifyWriting(advo);
			
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			logger.debug("( •̀ ω •́ )✧ 오류 발생: {}",e.getMessage());
			
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	/* ===== 보호소페이지 입양글 삭제 ===== */
	@DeleteMapping(value = "/writings/{animal_id}/deletion")
	public ResponseEntity<Void> deleteWriting(AdptVO advo) {
		logger.debug("( •̀ ω •́ )✧ deleteWriting(AdptVO advo) 실행");
		advo.setAdpt_status(4);
		
		try {
			aService.deleteWriting(advo);
			
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			logger.debug("( •̀ ω •́ )✧ 오류 발생: {}",e.getMessage());
			
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	/* ===== 보호소페이지 입양글 상태 변경 =====*/
	@PatchMapping(value = "/manager/writings/{animal_id}/status")
	public ResponseEntity<Void> writingsStatusManager(@RequestBody Map<String, Object> writingStatus) {
		logger.debug("( •̀ ω •́ )✧ writingsStatusManager() 실행");
		
		try {
			aService.writingsStatusManager(writingStatus);
			
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch(Exception e) {
			logger.debug("( •̀ ω •́ )✧ 오류 발생: {}",e.getMessage());
			
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	/* ===== 사용자 페이지 입양글 목록 ===== */
	@GetMapping(value = "/adpt/list")
	public ResponseEntity<List<AnimalVO>> adptListAll(HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ animalListAll() 실행");
		
		List<AnimalVO> adptList = aService.getAdptList();
		
		if(adptList != null) {
			return new ResponseEntity<List<AnimalVO>>(adptList,HttpStatus.OK);
		} else {
			return new ResponseEntity<List<AnimalVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	/* ===== 보호소 페이지 입양 신청 목록 ===== */
	@GetMapping(value = "/counsel/list")
	public ResponseEntity<List<AnimalVO>> counselListAll(HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ counselListAll() 실행");
		String member_id = (String)req.getSession().getAttribute("member_id");
		Map<String, String> counselMemberParams = new HashMap<String, String>();
		counselMemberParams.put("member_id", member_id);
		
		try {
			List<AnimalVO> counselList = aService.getCounselList(counselMemberParams);
			return new ResponseEntity<List<AnimalVO>>(counselList,HttpStatus.OK);
		} catch (Exception e) {
			logger.debug("( •̀ ω •́ )✧ 오류 발생: {}",e.getMessage());
			return new ResponseEntity<List<AnimalVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	/* ===== 보호소 페이지 입양 신청 목록 사용자 정보 ===== */
	@GetMapping(value = "/counsel/list/member")
	public ResponseEntity<MemberVO> counselMemberInfo(@RequestParam String member_id) {
		logger.debug("( •̀ ω •́ )✧ counselMemberInfo() 실행");
		
		try {
			MemberVO mvo = aService.getMemberInfo(member_id);
			return new ResponseEntity<MemberVO>(mvo, HttpStatus.OK);
		} catch (Exception e) {
			logger.debug("( •̀ ω •́ )✧ 오류 발생: {}",e.getMessage());
			return new ResponseEntity<MemberVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	/* ===== 보호소 페이지 입양 신청 목록 사용자 정보 ===== */
	@GetMapping(value = "/flutter/memberId")
	public ResponseEntity<MemberVO> flutterMemberId(HttpServletRequest req) {
		logger.debug("( •̀ ω •́ )✧ flutterMemberId() 실행");
		
		String member_id = (String)req.getSession().getAttribute("member_id");
		
		try {
			MemberVO mvo = aService.getMemberInfo(member_id);
			return new ResponseEntity<MemberVO>(mvo, HttpStatus.OK);
		} catch (Exception e) {
			logger.debug("( •̀ ω •́ )✧ 오류 발생: {}",e.getMessage());
			return new ResponseEntity<MemberVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	
	
}//class
