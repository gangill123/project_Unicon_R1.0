package com.Unicon.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.CategoryDataVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.service.CategoryDataService;



@RestController
@RequestMapping("/store")
public class StoreRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(StoreRestController.class);
	
	
	@Inject 
	private CategoryDataService cService;
	
	
	@RequestMapping(value = "/category/{value}", method = RequestMethod.GET)
	public ResponseEntity<List<CategoryDataVO>> sscategoryDataGET(@PathVariable("value") String value) {
		logger.info("categoryDataGET(value) 호출 ");
		
		List<CategoryDataVO> CategoryDetailDataList = cService.petProductsCategoryDetail(value);
		
		if(CategoryDetailDataList == null) {
			return new ResponseEntity<List<CategoryDataVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			return new ResponseEntity<List<CategoryDataVO>>(CategoryDetailDataList, HttpStatus.OK);
		}
		
	}
	
	@RequestMapping(value = "/store/products/create", method = RequestMethod.GET)
	public ResponseEntity<String> registerAnimal(AnimalVO avo, HttpServletRequest req) {

		try {
			
			List<ImageVO> images = saveImage(avo, req);
			if (images == null || images.isEmpty()) {
				return new ResponseEntity<String>("( •̀ ω •́ )✧ 동물 이미지를 저장하는 데 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
			}
			// 이거 변환하는거는 건들지 않아도 됨. avo.setAnimal_images(images);
			
			
			//  aService.animalInsert(avo);
			return new ResponseEntity<String>("( •̀ ω •́ )✧ 동물이 등록되었습니다", HttpStatus.OK);
			
		} catch (Exception e) {
			return new ResponseEntity<String>("( •̀ ω •́ )✧ 오류가 발생했습니다: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	/*=============== 이미지 저장 및 리스트 생성 ===============*/
	public List<ImageVO> saveImage(AnimalVO avo, HttpServletRequest req) {
		logger.info("( •̀ ω •́ )✧ saveImage(AnimalVO avo, HttpServletRequest req) 실행");
		String saveDir = req.getRealPath("/uploads/");
		List<MultipartFile> uploadImages = avo.getUpload_images();
		List<ImageVO> animalImages = new ArrayList<ImageVO>();
		
		for (int i = 0; i < uploadImages.size(); i++) {
			StringBuilder asb = new StringBuilder();
			MultipartFile aImage = uploadImages.get(i);
			
			if(aImage == null || aImage.isEmpty()) {
				logger.info("( •̀ ω •́ )✧ 업로드할 이미지가 없습니다 인덱스 : "+i);
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
	
	/*=============== 썸머노트 img src ===============*/
	@PostMapping("/api/upload")
    public ResponseEntity<String> uploadImage(
            @RequestParam("file") MultipartFile file,
            HttpServletRequest request) {
        try {
            if (file.isEmpty()) {
                return ResponseEntity.badRequest().body("파일이 비어있습니다.");
            }
            logger.info("( •̀ ω •́ )✧ 경로에 '\\uploads\\'가 없습니다.");
            logger.info("( •̀ ω •́ )✧ 경로에 '\\uploads\\'가 없습니다.");
            // 파일 확장자 검사
            String originalFilename = file.getOriginalFilename();
            String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();
            if (!extension.matches("jpg|jpeg|png|gif")) {
                return ResponseEntity.badRequest().body("지원하지 않는 파일 형식입니다.");
            }

            // 저장할 파일명 생성
            String storedFileName = "image_" + UUID.randomUUID().toString() + "." + extension;
            
            // 이미지 저장 경로 설정
            String uploadDir = request.getServletContext().getRealPath("/uploads/images");
            
            logger.info("uploadDir" + uploadDir);
            
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            
            // 파일 저장
            File destFile = new File(dir, storedFileName);
            file.transferTo(destFile);
            
            // 이미지 URL 반환
            String imageUrl = "/uploads/images/" + storedFileName;
            logger.info("이미지 업로드 완료: {}", imageUrl);

            return ResponseEntity.ok(imageUrl);
            
        } catch (Exception e) {
            logger.error("이미지 업로드 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body("이미지 업로드 실패: " + e.getMessage());
        }
    }
	
}
