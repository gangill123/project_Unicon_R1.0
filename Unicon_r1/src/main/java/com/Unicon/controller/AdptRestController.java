package com.Unicon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.persistence.AdptDAO;
import com.Unicon.service.AdptService;


@RestController
@RequestMapping("/adptmgmt/**")
public class AdptRestController {
	
	@Inject
	private AdptService aService;
	@Inject
	private AdptDAO aDao;
	private static final Logger logger = LoggerFactory.getLogger(AdptRestController.class);
	
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
	
	
	@GetMapping(value = "/animals/autoname")
	public ResponseEntity<Map<String, String>> animalAutoName(
			@RequestParam("animal_act") int act, @RequestParam("animal_social") int social) {
		logger.debug("( •̀ ω •́ )✧ animalAutoName() 실행");
		
		String autoName = aService.genAutoName(act, social); 
		Map<String, String> resp = new HashMap<String, String>();
		resp.put("autoName", autoName);
		return new ResponseEntity<Map<String, String>>(resp,HttpStatus.OK);
	}
	
	
	@GetMapping(value = "/animals")
	public ResponseEntity<List<AnimalVO>> animalListAll() {
		logger.debug("( •̀ ω •́ )✧ animalListAll() 실행");
		
		List<AnimalVO> animList = aService.getAnimalListAll();
		if(animList != null) {
			return new ResponseEntity<List<AnimalVO>>(animList,HttpStatus.OK);
		} else {
			return new ResponseEntity<List<AnimalVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@GetMapping(value = "/animals/{animal_id}")
	public ResponseEntity<AnimalVO> animalListOne(@PathVariable("animal_id")String animal_id) {
		logger.debug("( •̀ ω •́ )✧ animalListOne() 실행");
		int checkId = aDao.checkAnimalId(animal_id);
		if(checkId == 1) {
			logger.debug("( •̀ ω •́ )✧ 존재하는 동물id 확인완료");
			AnimalVO animalVO = aService.getAnimalListOne(animal_id);
			logger.debug("( •̀ ω •́ )✧ animalVO : {}",animalVO);
			return new ResponseEntity<AnimalVO>(animalVO,HttpStatus.OK);
		} else {
			logger.debug("( •̀ ω •́ )✧ 존재하지않는 동물id 입니다");
			return new ResponseEntity<AnimalVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
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
			
			
			return new ResponseEntity<Void>(HttpStatus.OK);
			
		} catch (Exception e) {
			logger.error("( •̀ ω •́ )✧ 오류 발생: " + e.getMessage());
			
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	

	
	
}//class
