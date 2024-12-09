package com.Unicon.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.ImageVO;
import com.Unicon.domain.ProductVO;
import com.Unicon.service.AdminStoreService;
import com.Unicon.service.CategoryDataService;

@Controller
@RequestMapping(value = "/admin/store/*")
public class AdminStoreController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminStoreController.class);
	
	
//	@Inject 
//	private CategoryDataService cService;
	
	@Inject
	private AdminStoreService aService;
	
	@RequestMapping( value = "/main" , method=RequestMethod.GET)
	public String main(Model model) {
		logger.info("main 실행");
		logger.info("admin/store/main.jsp 뷰페이지 실행");
		
		List<ImageVO> list = aService.getAdminStoreImg();
		logger.info("list : "+ list);
		
		
		
		model.addAttribute("adminStoreImg", list);
		return "/store/admin/main";
	}
	
	@PostMapping("/updateImg")
    @ResponseBody // 메서드 레벨에서 JSON 응답을 반환하도록 지정
    public ResponseEntity<String> mainStoreImgUpdate(ProductVO avo,HttpServletRequest req) {
        logger.info("mainStoreImgUpdate 실행 : {}", (Object) avo);
        List<ImageVO> images = saveImage(avo, req); 
		logger.info("images :  "+ images);
		
		aService.updateMainImg(images);

        return ResponseEntity.ok("이미지 업로드 성공");
    }

	
	
	public List<ImageVO> saveImage(ProductVO avo, HttpServletRequest req) {
		logger.info("( •̀ ω •́ )✧ saveImage(ProductVO avo, HttpServletRequest req) 실행");
		ServletContext context = req.getServletContext();
		String saveDir = context.getRealPath("/uploads/");
		List<MultipartFile> uploadImages = avo.getUpload_images();
		List<ImageVO> store_main_images = new ArrayList<ImageVO>();

		for (int i = 0; i < uploadImages.size(); i++) {
			StringBuilder asb = new StringBuilder();
			MultipartFile aImage = uploadImages.get(i);

			if (aImage == null || aImage.isEmpty()) {
				logger.info("( •̀ ω •́ )✧ 업로드할 이미지가 없습니다 인덱스 : " + i);
				continue;
			}
			logger.info("( •̀ ω •́ )✧  파일이름 화긴 : " + uploadImages.get(i).getOriginalFilename());

			File destinationImage = new File(asb.append(saveDir)
					.append(UUID.randomUUID().toString())
					.append("_")
					.append(aImage.getOriginalFilename())
					.toString());

			try {
				aImage.transferTo(destinationImage);
			} catch (IOException e) {
				e.printStackTrace();
			}
			asb.setLength(0);
			
			int index = destinationImage.getPath().indexOf("\\uploads\\");
			String indexStr = "\\uploads\\";
			String indexSubStr = destinationImage.getPath().substring(index + indexStr.length());
			String modifiedPath = asb.append("/uploads/").append(indexSubStr).toString();
			
			logger.info("( •̀ ω •́ )✧ modifiedPath : " + modifiedPath);
			ImageVO ivo = new ImageVO();
			ivo.setImage_id("store-main-img");
			ivo.setImage_sequence(i);
			ivo.setImage_src(modifiedPath); 
			ivo.setImage_type("storeMain");
			logger.info("( •̀ ω •́ )✧ ivo : " + ivo);
			store_main_images.add(ivo);

		}

		return store_main_images;
	}

	
}
