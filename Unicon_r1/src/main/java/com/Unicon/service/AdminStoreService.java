package com.Unicon.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.CheckImageVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.ProductVO;
import com.Unicon.persistence.AdminStoreDAO;
import com.Unicon.persistence.AdptDAO;
import com.Unicon.persistence.ProductDAO;



@Service("AdminStoreService")
public class AdminStoreService {
	
//	@Inject
//	private ProductDAO pDao;
	
	@Inject
	private AdminStoreDAO aDao;
	
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(AdminStoreService.class);

	public List<ImageVO> getAdminStoreImg() {
		logger.debug("( •̀ ω •́ )✧  getAdminStoreImg() 실행");
		 List<ImageVO> list = aDao.getAdminStoreImg();
		
		return  list;
	}
	
	
	public void updateMainImg(List<ImageVO> list) {
		logger.debug("( •̀ ω •́ )✧  updateMainImg(list) 실행");
		aDao.updateMainImg(list);
	}
	
	
	public List<ProductVO> getNewProducts() {
		List<ProductVO> list = aDao.getNewProducts();
		
		return list;
	}
	
//	public List<AnimalVO> getAnimalListAll() {
//		logger.debug("( •̀ ω •́ )✧ getAnimalListAll() 실행");
//		
//		return aDao.getAnimalListAll();
//	}
//	
//	
//	public AnimalVO getAnimalListOne(String animal_id) {
//		logger.debug("( •̀ ω •́ )✧ getAnimalListiOne() 실행");
//		
//		return aDao.getAnimalListOne(animal_id);
//	}
//	
//	
//	
//	/*=============== 메서드 ===============*/
//		
//		/*=============== 동물id 생성 ===============*/
//		public String genAnimalId() {
//			logger.debug("( •̀ ω •́ )✧ genAnimalId() 메서드 실행");
//			
//			String aNamePre = "ANIM";
//			String animalId = "";
//			char[] aNameCharacters =
//					"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray();
//			int aNamelength = 6;
//			
//			do{
//				StringBuilder asb = new StringBuilder();
//				Random aNameRandom = new Random();
//				
//				asb.append(aNamePre).append("-");
//				for (int i = 0; i < aNamelength; i++) {
//					int index = aNameRandom.nextInt(aNameCharacters.length);
//					asb.append(aNameCharacters[index]);
//				}
//				animalId = asb.toString();
//			} while (aDao.checkAnimalId(animalId) != 0);
//			
//			return animalId;
//		}
//		/*=============== 동물id 생성 ===============*/
//		
//		
//		/*=============== 이미지 수정 및 삭제, 리스트 생성 ===============*/
//		public List<ImageVO> modifyImage(AnimalVO avo, HttpServletRequest req) {
//			logger.debug("( •̀ ω •́ )✧ modifyImage(AnimalVO avo, HttpServletRequest req) 실행");
//			ServletContext context = req.getServletContext();
//			String saveDir = context.getRealPath("/uploads/");
//			List<ImageVO> imageList = new ArrayList<ImageVO>();
//			List<MultipartFile> uploadImageList = new ArrayList<MultipartFile>(avo.getUpload_images());
//			List<CheckImageVO> checkImageList = new ArrayList<CheckImageVO>(avo.getCheck_images());
//			List<String> imageNameList = new ArrayList<String>();
//			List<String> deleteImageList = new ArrayList<String>();
//			
//			for(int i = 0; i < uploadImageList.size(); i++) {
//				if(uploadImageList.get(i).isEmpty()) {
//					if(checkImageList.get(i).getChangeCheck().isEmpty()) {
//						imageNameList.add(checkImageList.get(i).getOrgSrc());
//						ImageVO ivo = new ImageVO();
//						ivo.setImage_id(avo.getAnimal_id());
//						ivo.setImage_type("adpt");
//						ivo.setImage_sequence(i);
//						ivo.setImage_src(checkImageList.get(i).getOrgSrc());
//						imageList.add(ivo);
//					}
//					if(!checkImageList.get(i).getChangeCheck().isEmpty()
//							&& !checkImageList.get(i).getMoveSrc().isEmpty()) {
//						imageNameList.add(checkImageList.get(i).getMoveSrc());
//						ImageVO ivo = new ImageVO();
//						ivo.setImage_id(avo.getAnimal_id());
//						ivo.setImage_type("adpt");
//						ivo.setImage_sequence(i);
//						ivo.setImage_src(checkImageList.get(i).getOrgSrc());
//						imageList.add(ivo);
//					}
//					
//				} else {
//					StringBuilder asb = new StringBuilder();
//					MultipartFile aImage = uploadImageList.get(i);
//					
//					File destinationImage 
//					= new File(asb.append(saveDir)
//							.append(UUID.randomUUID().toString())
//							.append("_")
//							.append(aImage.getOriginalFilename())
//							.toString());
//				
//					try {
//						aImage.transferTo(destinationImage);
//					} catch (IOException e) {
//						e.printStackTrace();
//					}
//					
//					asb.setLength(0);
//					
//					int index = destinationImage.getPath().indexOf("\\uploads\\");
//					String indexStr = "\\uploads\\";
//					String indexSubStr = destinationImage.getPath().substring(index + indexStr.length());
//					String modifiedPath = asb.append("/uploads/").append(indexSubStr).toString();
//					
//					ImageVO ivo = new ImageVO();
//					ivo.setImage_id(avo.getAnimal_id());
//					ivo.setImage_sequence(i);
//					ivo.setImage_src(modifiedPath);
//					ivo.setImage_type("apdt");
//					imageList.add(ivo);
//					
//				}
//			}
//			
//			for (int i = 0; i < checkImageList.size(); i++) {
//				String item = checkImageList.get(i).getOrgSrc();
//				logger.debug("( •̀ ω •́ )✧ item{} : {}", i, item);
//				boolean found = false;
//			
//				for (int j = 0; j < imageNameList.size(); j++) {
//					if (imageNameList.get(j).equals(item)) {
//						found = true;
//						break;
//					}
//				}
//				
//				if (!found) {
//					deleteImageList.add(item);
//				}
//			}
//			
//			for(int i = 0; i < deleteImageList.size(); i++) {
//				StringBuilder asb = new StringBuilder();
//				int index = deleteImageList.get(i).indexOf("/uploads/");
//				String indexStr = "/uploads/";
//				String indexSubStr = deleteImageList.get(i).substring(index + indexStr.length());
//				
//				File deleteFile 
//					= new File(asb.append(saveDir)
//							.append(indexSubStr)
//							.toString());
//				
//				if (deleteFile.exists()) {
//					deleteFile.delete();
//				} else {
//					logger.debug("파일이 존재하지 않습니다: " + deleteFile.getPath());
//				}
//			}
//			
//			return imageList;
//		}
//		/*=============== 이미지 수정 및 삭제, 리스트 생성 ===============*/
//
//		
//		/*=============== 이미지 삭제 ===============*/
//		public void deleteImage(List<ImageVO> imageList, HttpServletRequest req) {
//			logger.debug("( •̀ ω •́ )✧ deleteImage(List<ImageVO> imageList, HttpServletRequest req) 실행");
//			ServletContext context = req.getServletContext();
//			String saveDir = context.getRealPath("/uploads/");
//			
//			for(int i = 0; i < imageList.size(); i++) {
//				StringBuilder asb = new StringBuilder();
//				int index = imageList.get(i).getImage_src().indexOf("/uploads/");
//				String indexStr = "/uploads/";
//				String indexSubStr = imageList.get(i).getImage_src().substring(index + indexStr.length());
//				
//				File deleteFile 
//					= new File(asb.append(saveDir)
//							.append(indexSubStr)
//							.toString());
//				
//				if (deleteFile.exists()) {
//					deleteFile.delete();
//				} else {
//					logger.debug("파일이 존재하지 않습니다: " + deleteFile.getPath());
//				}
//			}
//		}
//		/*=============== 이미지 삭제 ===============*/
//		
//		
//		
//		
//		
//		
//		/*=============== 자동이름짓기 ===============*/
//		public String genAutoName(int act, int social) {
//			logger.debug("( •̀ ω •́ )✧ genAutoName(int act, int social) 메서드 실행");
//			Random r = new Random();
//			String autoName = "";
//			
//			/*
//			String[][] actAdjective = {
//				{"느긋하고", "졸리고", "한가롭고", "편안하고", "평화롭고"},
//				{"잔잔하고", "차분하고", "묵묵하고", "평온하고", "조용하고"},
//				{"경쾌하고", "명랑하고", "가뿐하고", "상쾌하고", "가볍고"},
//				{"신나고", "행복하고", "열정있고", "반갑고", "흥미롭고"},
//				{"활기차고", "탐험하고", "용감하고", "발랄하고", "유쾌하고"}
//			};
//			
//			String[][] socialAdjective = {
//				{"자립적인", "내향적인", "독립적인", "사색적인", "씩씩한"},
//				{"자유로운", "신비로운", "소박한", "신중한", "신묘한"},
//				{"배우는", "즐거운", "긍정적인", "협조적인", "사교적인"},
//				{"관심있는", "따르는", "협력적인", "협동적인", "동행하는"},
//				{"사랑스런", "적극적인", "다정한", "친근한", "상냥한"}
//			};
//			*/
//			
//			String[][] mixedAdjective = {
//				{"느긋한", "씩씩한", "잔잔한", "자유로운", "경쾌한"},
//				{"졸린", "신비로운", "명랑한", "사랑스런", "신나는"},
//				{"한가로운", "소박한", "가뿐한", "적극적인", "행복한"},
//				{"편안한", "신중한", "상쾌한", "사교적인", "열정적인"},
//				{"평화로운", "다정한", "유쾌한", "긍정적인", "탐험하는"}
//			};
//			
//			String[] aNames = {
//				"바둑", "콩이", "초코", "루비", "산이",
//				"별이", "모카", "구름", "토리", "하늘",
//				"미미", "냥이", "치즈", "수리", "별이",
//				"하리", "복이", "아리", "소이", "구리",
//				"토미", "도리", "뽀송", "비비", "로이",
//				"알리", "하니", "초롱", "나비", "루시"
//			};
//			
//			if (act >= 1 && act <= 5 && social >= 1 && social <= 5) {
//					StringBuilder ansb = new StringBuilder();
//					ansb.append(mixedAdjective[r.nextInt(mixedAdjective[act - 1].length)][r.nextInt(mixedAdjective[social - 1].length)])
//					.append(aNames[r.nextInt(aNames.length-1)]);
//					autoName = ansb.toString();
//			}
//			return autoName;
//		}
//		/*=============== 자동이름짓기 ===============*/
//		
//		
//	/*=============== 메서드 ===============*/

}
