package com.Unicon.controller;

import java.io.File;
import java.io.IOException;
import java.net.SecureCacheResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.AnimalHealthVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.AdptVO;
import com.Unicon.domain.AnimalVaccineVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.service.AdptService;

import lombok.extern.log4j.Log4j;


@RestController
@Log4j
@RequestMapping("/adptmgmt/**")
public class AdptRestController {
	
	@Inject
	private AdptService aService;

	
	@PostMapping(value = "/animals")
	public ResponseEntity<String> registerAnimal(AnimalVO avo, HttpServletRequest req) {
		log.info("( •̀ ω •́ )✧ registerAnimal(AnimalVO avo, HttpServletRequest req) 실행");
		
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
			log.error("( •̀ ω •́ )✧ 오류 발생: " + e.getMessage());
			return new ResponseEntity<String>("( •̀ ω •́ )✧ 오류가 발생했습니다: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	
	/*=============== 메서드 ===============*/
	
		/*=============== 동물id 생성 ===============*/
		public String genAnimalId() {
			log.info("( •̀ ω •́ )✧ genAnimalId() 실행");
			String aNamePre = "ANIM";
			char[] aNameCharacters =
					"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray();
			int aNamelength = 6;
			StringBuilder asb = new StringBuilder();
			Random aNameRandom = new Random();
			
			asb.append(aNamePre).append("-");
			for (int i = 0; i < aNamelength; i++) {
				int index = aNameRandom.nextInt(aNameCharacters.length);
				asb.append(aNameCharacters[index]);
			}
			
			return asb.toString();
		}
		/*=============== 동물id 생성 ===============*/
		
		
		/*=============== 이미지 저장 및 리스트 생성 ===============*/
		public List<ImageVO> saveImage(AnimalVO avo, HttpServletRequest req) {
			log.info("( •̀ ω •́ )✧ saveImage(AnimalVO avo, HttpServletRequest req) 실행");
			String saveDir = req.getRealPath("/uploads/");
			List<MultipartFile> uploadImages = avo.getUpload_images();
			List<ImageVO> animalImages = new ArrayList<ImageVO>();
			
			for (int i = 0; i < uploadImages.size(); i++) {
				StringBuilder asb = new StringBuilder();
				MultipartFile aImage = uploadImages.get(i);
				
				if(aImage == null || aImage.isEmpty()) {
					log.info("( •̀ ω •́ )✧ 업로드할 이미지가 없습니다 인덱스 : "+i);
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
					log.info("( •̀ ω •́ )✧ 경로에 '\\uploads\\'가 없습니다.");
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
		
	/*=============== 메서드 ===============*/
	
	
}//class
