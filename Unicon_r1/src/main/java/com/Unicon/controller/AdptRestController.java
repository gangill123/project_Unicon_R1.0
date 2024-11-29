package com.Unicon.controller;

import java.io.File;
import java.io.IOException;
import java.net.SecureCacheResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.AnimalHealthVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.AdptVO;
import com.Unicon.domain.AnimalVaccineVO;
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
			
			avo.setAnimal_id(genAnimalId());
			
			List<ImageVO> images = saveImage(avo, req);
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
		String autoName = genAutoName(act, social); 
		Map<String, String> resp = new HashMap<String, String>();
		resp.put("autoName", autoName);
		return new ResponseEntity<Map<String, String>>(resp,HttpStatus.OK);
	}

	
	/*=============== 메서드 ===============*/
	
		/*=============== 동물id 생성 ===============*/
		public String genAnimalId() {
			logger.info("( •̀ ω •́ )✧ genAnimalId() 메서드 실행");
			String aNamePre = "ANIM";
			String animId = "";
			char[] aNameCharacters =
					"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray();
			int aNamelength = 6;
			
			do{
				StringBuilder asb = new StringBuilder();
				Random aNameRandom = new Random();
				
				asb.append(aNamePre).append("-");
				for (int i = 0; i < aNamelength; i++) {
					int index = aNameRandom.nextInt(aNameCharacters.length);
					asb.append(aNameCharacters[index]);
				}
				animId = asb.toString();
			} while (false/*aService.checkAnimalId(animId)*/);
			
			return animId;
		}
		/*=============== 동물id 생성 ===============*/
		
		
		/*=============== 이미지 저장 및 리스트 생성 ===============*/
		public List<ImageVO> saveImage(AnimalVO avo, HttpServletRequest req) {
			logger.info("( •̀ ω •́ )✧ saveImage(AnimalVO avo, HttpServletRequest req) 메서드 실행");
			String saveDir = req.getRealPath("/uploads/");
			List<MultipartFile> uploadImages = avo.getUpload_images();
			List<ImageVO> animalImages = new ArrayList<ImageVO>();
			
			for (int i = 0; i < uploadImages.size(); i++) {
				StringBuilder asb = new StringBuilder();
				MultipartFile aImage = uploadImages.get(i);
				
				if(aImage == null || aImage.isEmpty()) {
					logger.info("( •̀ ω •́ )✧ 업로드할 이미지가 없습니다 인덱스 : {}",i);
					continue;
				}
				
				File destinationImage 
					= new File(asb.append(saveDir)
							.append(UUID.randomUUID().toString())
							.append("_")
							.append(aImage.getOriginalFilename())
							.toString());
				
				
				int index = destinationImage.getPath().indexOf("\\uploads\\");

				if (index != -1) {
					String modifiedPath = destinationImage.getPath().substring(index);
					ImageVO ivo = new ImageVO();
					ivo.setImage_id(avo.getAnimal_id());
					ivo.setImage_sequence(i);
					ivo.setImage_src(modifiedPath);
					ivo.setImage_type("apdt");
					animalImages.add(i, ivo);
				} else {
					logger.info("( •̀ ω •́ )✧ 경로에 '\\uploads\\'가 없습니다.");
				}
				
				try {
					aImage.transferTo(destinationImage);
				} catch (IOException e) {
					e.printStackTrace(); 
				} 
			}
			
			return animalImages;
		}
		/*=============== 이미지 저장 및 리스트 생성 ===============*/
		
		
		/*=============== 자동이름짓기 ===============*/
		public String genAutoName(int act, int social) {
			logger.info("( •̀ ω •́ )✧ genAutoName(int act, int social) 메서드 실행");
			Random r = new Random();
			String autoName = "";

			String[][] actAdjective = {
				{"느긋하고", "졸리고", "한가롭고", "편안하고", "평화롭고"},
				{"잔잔하고", "차분하고", "묵묵하고", "평온하고", "조용하고"},
				{"경쾌하고", "명랑하고", "가뿐하고", "상쾌하고", "가볍고"},
				{"신나고", "행복하고", "열정있고", "반갑고", "흥미롭고"},
				{"활기차고", "탐험하고", "용감하고", "발랄하고", "유쾌하고"}
			};
			
			String[][] socialAdjective = {
				{"자립적인", "내향적인", "독립적인", "사색적인", "씩씩한"},
				{"자유로운", "신비로운", "소박한", "신중한", "신묘한"},
				{"배우는", "즐거운", "긍정적인", "협조적인", "사교적인"},
				{"관심있는", "따르는", "협력적인", "협동적인", "동행하는"},
				{"사랑스런", "적극적인", "다정한", "친근한", "상냥한"}
			};
			
			String[] aNames = {
				"바둑", "콩이", "초코", "루비", "산이",
				"별이", "모카", "구름", "토리", "하늘",
				"미미", "냥이", "치즈", "수리", "별이",
				"하리", "복이", "아리", "소이", "구리",
				"토미", "도리", "뽀송", "비비", "로이",
				"알리", "하니", "초롱", "나비", "루시"
			};
			
			if (act >= 1 && act <= 5 && social >= 1 && social <= 5) {
					StringBuilder ansb = new StringBuilder();
					ansb.append(actAdjective[act - 1][r.nextInt(actAdjective[act - 1].length)])
					.append(socialAdjective[social - 1][r.nextInt(socialAdjective[social - 1].length)])
					.append(aNames[r.nextInt(aNames.length-1)]);
					autoName = ansb.toString();
			}
			return autoName;
		}
		/*=============== 자동이름짓기 ===============*/
		
		
	/*=============== 메서드 ===============*/
	
	
}//class
