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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.service.AdptService;


@RestController
@RequestMapping("/adptmgmt/**")
public class AdptRestController {
	
	@Inject
	private AdptService aService;
	private static final Logger logger = LoggerFactory.getLogger(AdptRestController.class);
	
	@PostMapping(value = "/animals")
	public ResponseEntity<String> registerAnimal(AnimalVO avo, HttpServletRequest req) {
		logger.info("( •̀ ω •́ )✧ registerAnimal(AnimalVO avo, HttpServletRequest req) 실행");
		
		try {
			
			if (avo == null) {
				return new ResponseEntity<String>("( •̀ ω •́ )✧ 동물데이터가 필요합니다.", HttpStatus.BAD_REQUEST);
			}
			avo.setAnimal_id(aService.genAnimalId());
			
			List<ImageVO> images = aService.saveImage(avo, req);
			if (images == null || images.isEmpty()) {
				return new ResponseEntity<String>("( •̀ ω •́ )✧ 동물 이미지를 저장하는 데 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
			}
			avo.setAnimal_images(images);
			
			aService.animalInsert(avo);
			return new ResponseEntity<String>("( •̀ ω •́ )✧ 동물이 등록되었습니다", HttpStatus.OK);
			
		} catch (Exception e) {
			logger.error("( •̀ ω •́ )✧ 오류 발생: " + e.getMessage());
			
			return new ResponseEntity<String>("( •̀ ω •́ )✧ 오류가 발생했습니다: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@GetMapping(value = "/animals/autoname")
	public ResponseEntity<Map<String, String>> animalAutoName(
			@RequestParam("animal_act") int act, @RequestParam("animal_social") int social) {
		logger.info("( •̀ ω •́ )✧ animalAutoName() 실행");
		logger.info("( •̀ ω •́ )✧ act : {}, social : {}",act,social);
		
		String autoName = aService.genAutoName(act, social); 
		Map<String, String> resp = new HashMap<String, String>();
		resp.put("autoName", autoName);
		return new ResponseEntity<Map<String, String>>(resp,HttpStatus.OK);
	}

	

	
	
}//class
