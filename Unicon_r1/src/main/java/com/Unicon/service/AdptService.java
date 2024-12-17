package com.Unicon.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Month;
import java.time.Year;
import java.util.ArrayList;
import java.util.Arrays;
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

import com.Unicon.domain.AdptVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.CheckImageVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.MemberVO;
import com.Unicon.persistence.AdptDAO;



@Service("AdptService")
public class AdptService {
	
	@Inject
	private AdptDAO aDao;
	private static final Logger logger = LoggerFactory.getLogger(AdptService.class);

	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void animalInsert(AnimalVO avo) {
		logger.debug("( •̀ ω •́ )✧ adptInsert() 실행");
		
		aDao.animalInsert(avo);
	}
	
	/* forMain */
	public List<AnimalVO> forMainAdptData() {
		logger.debug("( •̀ ω •́ )✧ forMainAdptData() 실행");
		
		return aDao.forMainAdptData();
	}
	
	
	public List<AnimalVO> getAnimalListAll(String member_id) {
		logger.debug("( •̀ ω •́ )✧ getAnimalListAll() 실행");
		
		return aDao.getAnimalListAll(member_id);
	}
	
	
	public List<AnimalVO> getAnimalListAll() {
		logger.debug("( •̀ ω •́ )✧ getAnimalListAll() 실행");
		
		return aDao.getAnimalListAll();
	}
	
	
	public AnimalVO getAnimalListOne(String animal_id) {
		logger.debug("( •̀ ω •́ )✧ getAnimalListiOne() 실행");
		
		return aDao.getAnimalListOne(animal_id);
	}
	
	
	public AnimalVO getAnimalWritingOne(String animal_id) {
		logger.debug("( •̀ ω •́ )✧ getAnimalWritingOne() 실행");
		
		return aDao.getAnimalWritingOne(animal_id);
	}
	
	
	public Integer checkAnimalId(String animal_id) {
		logger.debug("( •̀ ω •́ )✧ checkAnimalId(String animId) 실행");
		
		return aDao.checkAnimalId(animal_id);
	}
	public Integer checkAnimalId(String animal_id, String member_id) {
		logger.debug("( •̀ ω •́ )✧ checkAnimalId(String animId, String member_id) 실행");
		
		return aDao.checkAnimalId(animal_id, member_id);
	}
	
	
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void modifyAnimal(AnimalVO avo) {
		logger.debug("( •̀ ω •́ )✧ modifyAnimal() 실행");
		
		aDao.modifyAnimal(avo);
	}
	
	
	public void deleteAnimal(String animal_id) {
		logger.debug("( •̀ ω •́ )✧ deleteAnimal(String animal_id, String member_id) 실행");
		
		aDao.deleteAnimal(animal_id);
	}
	
	
	public void modifyAnimalStatus(Map<String, Object> statusData) {
		logger.debug("( •̀ ω •́ )✧ modifyAnimalStatus(Map<String, Object> statusData) 실행");
	
		aDao.modifyAnimalStatus(statusData);
	}
	
	public MemberVO getMemberInfo(String member_id) {
		logger.debug("( •̀ ω •́ )✧ getMemberInfo(String member_id) 실행");
		
		return aDao.getMemberInfo(member_id);
	}
	
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void adptWritingInsert(AdptVO advo, int animalStatus) {
		logger.debug("( •̀ ω •́ )✧ adptWritingInsert(AdptVO advo) 실행");
		
		aDao.adptWritingInsert(advo, animalStatus);
	}
	
	
	public List<AnimalVO> getWritingListAll(String member_id) {
		logger.debug("( •̀ ω •́ )✧ getWritingListAll() 실행");
		
		return aDao.getWritingListAll(member_id);
	}
	public List<AnimalVO> getWritingListAll() {
		logger.debug("( •̀ ω •́ )✧ getWritingListAll() 실행");
		
		return aDao.getWritingListAll();
	}
	
	
	public void modifyWriting(AdptVO advo) {
		logger.debug("( •̀ ω •́ )✧ modifyWriting(AdptVO advo) 실행");
		
		aDao.modifyWriting(advo);
	}
	
	
	@Transactional(rollbackFor = {SQLException.class, Exception.class}, propagation = Propagation.REQUIRES_NEW)
	public void deleteWriting(AdptVO advo) {
		logger.debug("( •̀ ω •́ )✧ deleteWriting(AdptVO advo) 실행");
		
		aDao.deleteWriting(advo);
	}
	
	
	public List<AnimalVO> getAdptList() {
		logger.debug("( •̀ ω •́ )✧ getAdptList() 실행");
		
		return aDao.getAdptList();
	}
	
	
	public void writingsStatusManager(Map<String, Object> writingStatus) {
		logger.debug("( •̀ ω •́ )✧ writingsStatusManager() 실행");
		
		aDao.writingsStatusManager(writingStatus);
	}
	
	
	/*=========== 사용자 페이지 입양하기 ===========*/
	public List<AnimalVO> getAdptFilterView(Map<String, Object> adptFilters) {
		logger.debug("( •̀ ω •́ )✧ getAdptFilterView() 실행");
		
		return aDao.getAdptFilterView(adptFilters);
	}
	
	
	/*=========== 사용자 페이지 상담신청 ===========*/
	public void counselSubmit(Map<String, String> counselParams) {
		logger.debug("( •̀ ω •́ )✧ counselSubmit() 실행");
		
		aDao.counselSubmit(counselParams);
	}
	
	
	/*=========== 사용자 페이지 상담신청 확인 ===========*/
	public boolean counselCheckMember(Map<String, String> counselCheckParams) {
		logger.debug("( •̀ ω •́ )✧ counselCheckMember() 실행");
		
		return aDao.counselCheckMember(counselCheckParams);
	}
	
	
	/*=========== 보호소 페이지 상담 신청 목록 ===========*/
	public List<AnimalVO> getCounselList(Map<String, String> counselMemberParams) {
		logger.debug("( •̀ ω •́ )✧ getCounselList() 실행");
		
		return aDao.getCounselList(counselMemberParams);
	}
	
	
/*========================= 메서드 =========================*/
		
		/*=============== 동물id 생성 ===============*/
		public String genAnimalId() {
			logger.debug("( •̀ ω •́ )✧ genAnimalId() 메서드 실행");
			
			String aNamePre = "ANIM";
			String animalId = "";
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
				animalId = asb.toString();
			} while (aDao.checkAnimalId(animalId) != 0);
			
			return animalId;
		}
		/*=============== 동물id 생성 ===============*/
		
		
		
		/*=============== 입양글id 생성 ===============*/
		public String genAdptId(AdptVO advo) {
			logger.debug("( •̀ ω •́ )✧ genAdptId() 메서드 실행");
			
			String adNamePre = "ADPT";
			String adptId = "";
			StringBuilder asb = new StringBuilder();
			MemberVO mvo = aDao.getMemberInfo(advo.getMember_id());
			String[] RoadAddress = mvo.getRoad_address().split(" ");
			String sido = RoadAddress[0];
			String sigun = RoadAddress[1];
			LocalDate currentDate = LocalDate.now();
			int year = currentDate.getYear();
			int month = currentDate.getMonthValue();
			
			asb.append(adNamePre).append("-").append(sido).append("-").append(sigun).append("-").append(year).append(month).append("-");
			
			adptId = asb.toString();
			
			return adptId;
		}
		/*=============== 입양글id 생성 ===============*/
		
		
		
		/*=============== 이미지 저장, 리스트 생성 ===============*/
		public List<ImageVO> saveImage(AnimalVO avo, HttpServletRequest req) {
			logger.debug("( •̀ ω •́ )✧ saveImage(AnimalVO avo, HttpServletRequest req) 메서드 실행");
			ServletContext context = req.getServletContext();
			String saveDir = context.getRealPath("/uploads/");
			List<MultipartFile> uploadImages = avo.getUpload_images();
			List<ImageVO> animalImages = new ArrayList<ImageVO>();
			
			for (int i = 0; i < uploadImages.size(); i++) {
				StringBuilder asb = new StringBuilder();
				MultipartFile aImage = uploadImages.get(i);
				
				if(aImage == null) {
					logger.debug("( •̀ ω •́ )✧ 업로드할 이미지가 없습니다 null 인덱스 : {}",i);
					continue;
				} else if(aImage.isEmpty()) {
					logger.debug("( •̀ ω •́ )✧ 업로드할 이미지가 없습니다 isEmpty 인덱스 : {}",i);
					continue;
				}
				
				File destinationImage 
					= new File(asb.append(saveDir)
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
				
				ImageVO ivo = new ImageVO();
				ivo.setImage_id(avo.getAnimal_id());
				ivo.setImage_sequence(i);
				ivo.setImage_src(modifiedPath);
				ivo.setImage_type(avo.getAIMAGETYPE());
				animalImages.add(ivo);
				
			}
			
			return animalImages;
		}
		/*=============== 이미지 저장, 리스트 생성 ===============*/

		
		/*=============== 이미지 수정(삭제포함), 리스트 생성 ===============*/
		public List<ImageVO> modifyImage(AnimalVO avo, HttpServletRequest req) {
			logger.debug("( •̀ ω •́ )✧ modifyImage(AnimalVO avo, HttpServletRequest req) 실행");
			// 경로 설정 //
			ServletContext context = req.getServletContext();
			String saveDir = context.getRealPath("/uploads/");
			// 뷰페이지에서 전달된 데이터 처리(MultipartFile, 이미지 파일 변경 상태확인(CheckImage)) //
			List<MultipartFile> uploadImageList = new ArrayList<MultipartFile>(avo.getUpload_images());
			List<CheckImageVO> checkImageList = new ArrayList<CheckImageVO>(avo.getCheck_images());
			// 이미지 파일의 조건에 따라 담을 객체 생성 //
			List<ImageVO> imageList = new ArrayList<ImageVO>(); // return할 객체
			ImageVO[] imageArray = new ImageVO[4]; // imageList의 빈칸 채우기 위한 배열
			List<String> imageNameList = new ArrayList<String>(); // 기존 이미지 파일이 존재하는지 확인하기 위한 리스트
			List<String> deleteImageList = new ArrayList<String>(); // imageNameList에 포함되지않은 기존 이미지 파일 리스트
			
			for(int i = 0; i < uploadImageList.size(); i++) {
				if(uploadImageList.get(i).isEmpty()) { // multipartfile 이미지 파일이 없을 경우
					if(checkImageList.get(i).getChangeCheck().isEmpty()) { // 이미지 파일 변경 없음 (기존 이미지 파일 유지)
						logger.debug("( •̀ ω •́ )✧ 이미지 파일 변경 없음 i : {}",i);
						logger.debug("( •̀ ω •́ )✧ 이미지 파일 변경 없음  "
								+ "checkImageList.get(i).getOrgSrc() : {} : {}",checkImageList.get(i).getOrgSrc(),i);
						imageNameList.add(checkImageList.get(i).getOrgSrc());
						ImageVO ivo = new ImageVO();
						ivo.setImage_id(avo.getAnimal_id());
						ivo.setImage_type(avo.getAIMAGETYPE());
						ivo.setImage_sequence(i);
						ivo.setImage_src(checkImageList.get(i).getOrgSrc());
						imageList.add(ivo);
					}
					if(!checkImageList.get(i).getChangeCheck().isEmpty()
							&& !checkImageList.get(i).getMoveSrc().isEmpty()) {
						// 이미지 파일 변경 있음 + 위치 이동된 기존파일 있음
						// 이미지 파일 실제 저장없이 DB 데이터 업데이트(sequence, src 수정)
						logger.debug("( •̀ ω •́ )✧ 이미지 파일 변경 있음 + 위치 이동된 기존파일 있음 i : {}",i);
						logger.debug("( •̀ ω •́ )✧ 이미지 파일 변경 있음 + 위치 이동된 기존파일 있음  "
								+ "checkImageList.get(i).getMoveSrc() : {} : {}",checkImageList.get(i).getMoveSrc(),i);
						imageNameList.add(checkImageList.get(i).getMoveSrc());
						ImageVO ivo = new ImageVO();
						ivo.setImage_id(avo.getAnimal_id());
						ivo.setImage_type(avo.getAIMAGETYPE());
						ivo.setImage_sequence(i);
						ivo.setImage_src(checkImageList.get(i).getMoveSrc());
						imageList.add(ivo);
					}
					if(!checkImageList.get(i).getChangeCheck().isEmpty() 
							&& checkImageList.get(i).getMoveSrc().isEmpty()) {
						// 이미지 파일 변경 있음 + 위치 이동된 기존파일 없음
						// 삭제했을 경우를 나타냄
						logger.debug("( •̀ ω •́ )✧ 이미지 파일 변경 있음 + 위치 이동된 기존파일 없음 i :{}",i);
						deleteImageList.add(checkImageList.get(i).getOrgSrc());
						logger.debug("( •̀ ω •́ )✧ 이미지 파일 변경 있음 + 위치 이동된 기존파일 없음  "
								+ "checkImageList.get(i).getOrgSrc() : {} : {}",checkImageList.get(i).getOrgSrc(),i);
					}
					
				} else { // multipartfile 이미지 파일이 있을 경우
					StringBuilder asb = new StringBuilder();
					MultipartFile aImage = uploadImageList.get(i);
					
					// 이미지 파일 저장
					File destinationImage 
					= new File(asb.append(saveDir)
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
					
					// 이미지 파일 저장 후 이미지 파일 정보를 ImageVO객체에 저장
					int index = destinationImage.getPath().indexOf("\\uploads\\");
					String indexStr = "\\uploads\\";
					String indexSubStr = destinationImage.getPath().substring(index + indexStr.length());
					String modifiedPath = asb.append("/uploads/").append(indexSubStr).toString();
					
					ImageVO ivo = new ImageVO();
					ivo.setImage_id(avo.getAnimal_id());
					ivo.setImage_sequence(i);
					ivo.setImage_src(modifiedPath);
					ivo.setImage_type(avo.getAIMAGETYPE());
					imageList.add(ivo);
					
				}
			}
			logger.debug("( •̀ ω •́ )✧ imageList : {}",imageList);
			logger.debug("( •̀ ω •́ )✧ imageNameList : {}",imageNameList);
			// deleteImageList
			// imageNameList에 포함되지않은 기존 이미지 파일 리스트 생성
			for (int i = 0; i < checkImageList.size(); i++) {
				String item = checkImageList.get(i).getOrgSrc();
				logger.debug("( •̀ ω •́ )✧ item{} : {}", i, item);
				boolean found = false;
			
				for (int j = 0; j < imageNameList.size(); j++) {
					if (imageNameList.get(j).equals(item)) {
						found = true;
						break;
					}
				}
				
				if (!found && !deleteImageList.contains(item)) {
					deleteImageList.add(item);
				}
			}
			
			logger.debug("( •̀ ω •́ )✧ deleteImageList : {}",deleteImageList);
			// imageNameList에 포함되지않은 기존 이미지 파일 삭제
			for(int i = 0; i < deleteImageList.size(); i++) {
				StringBuilder asb = new StringBuilder();
				int index = deleteImageList.get(i).indexOf("/uploads/");
				if(index == -1) {
					logger.debug("( •̀ ω •́ )✧ 파일 이름에 /uploads/가 존재하지 않습니다");
					continue;
				}
				String indexStr = "/uploads/";
				// 기존 이미지 파일 경로에서 /uploads/ 문자열 제거
				String indexSubStr = deleteImageList.get(i).substring(index + indexStr.length());
				
				File deleteFile 
					= new File(asb.append(saveDir)
							.append(indexSubStr)
							.toString());
				
				if (deleteFile.exists()) {
					deleteFile.delete();
				} else {
					logger.debug("파일이 존재하지 않습니다: " + deleteFile.getPath());
				}
			}
			
			// imageList의 사이즈가 4가 아닐 경우 빈 인덱스를 찾아서 공백으로 처리
			// 리스트를 고정크기의 배열로 변경 후 처리
			imageArray = imageList.toArray(imageArray);
			for(int i = 0; i < imageArray.length; i++) {
				if(imageArray[i] != null) {
					continue;
				} else {
					imageArray[i] = new ImageVO();
					imageArray[i].setImage_id(avo.getAnimal_id());
					imageArray[i].setImage_type(avo.getAIMAGETYPE());
					imageArray[i].setImage_sequence(i);
					imageArray[i].setImage_src("");
				}
			}
			
			// 배열을 리스트로 변환 후 전달
			List<ImageVO> lastImageList = Arrays.asList(imageArray);
			logger.debug("( •̀ ω •́ )✧ lastImageList : {}",lastImageList);
			
			
			return lastImageList;
		}
		/*=============== 이미지 수정(삭제포함), 리스트 생성 ===============*/

		
		/*=============== 이미지 삭제 ===============*/
		public void deleteImage(List<ImageVO> imageList, HttpServletRequest req) {
			logger.debug("( •̀ ω •́ )✧ deleteImage(List<ImageVO> imageList, HttpServletRequest req) 실행");
			ServletContext context = req.getServletContext();
			String saveDir = context.getRealPath("/uploads/");
			
			for(int i = 0; i < imageList.size(); i++) {
				StringBuilder asb = new StringBuilder();
				int index = imageList.get(i).getImage_src().indexOf("/uploads/");
				String indexStr = "/uploads/";
				String indexSubStr = imageList.get(i).getImage_src().substring(index + indexStr.length());
				
				File deleteFile 
					= new File(asb.append(saveDir)
							.append(indexSubStr)
							.toString());
				
				if (deleteFile.exists()) {
					deleteFile.delete();
				} else {
					logger.debug("파일이 존재하지 않습니다: " + deleteFile.getPath());
				}
			}
		}
		/*=============== 이미지 삭제 ===============*/
		
		
		/*=============== 자동이름짓기 ===============*/
		public String genAutoName(int act, int social) {
			logger.debug("( •̀ ω •́ )✧ genAutoName(int act, int social) 메서드 실행");
			Random r = new Random();
			String autoName = "";
			
			/*
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
			*/
			
			String[][] mixedAdjective = {
				{"느긋한", "씩씩한", "잔잔한", "자유로운", "경쾌한"},
				{"졸린", "신비로운", "명랑한", "사랑스런", "신나는"},
				{"한가로운", "소박한", "가뿐한", "적극적인", "행복한"},
				{"편안한", "신중한", "상쾌한", "사교적인", "열정적인"},
				{"평화로운", "다정한", "유쾌한", "긍정적인", "탐험하는"}
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
					ansb.append(mixedAdjective[r.nextInt(mixedAdjective[act - 1].length)][r.nextInt(mixedAdjective[social - 1].length)])
					.append(aNames[r.nextInt(aNames.length-1)]);
					autoName = ansb.toString();
			}
			return autoName;
		}
		/*=============== 자동이름짓기 ===============*/
		
/*========================= 메서드 =========================*/

}
