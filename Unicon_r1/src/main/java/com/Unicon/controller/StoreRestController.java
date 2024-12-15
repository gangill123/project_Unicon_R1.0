package com.Unicon.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.AdminNoticeVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.CategoryDataVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.OptionVO;
import com.Unicon.domain.ProductVO;
import com.Unicon.service.AdminStoreService;
import com.Unicon.service.CategoryDataService;
import com.Unicon.service.ProductService;

import springfox.documentation.service.ResponseMessage;

@RestController
@RequestMapping("/store")
public class StoreRestController {

	private static final Logger logger = LoggerFactory.getLogger(StoreRestController.class);

	@Inject
	private CategoryDataService cService;

	@Inject
	private ProductService pService;
	
	@Inject
	private AdminStoreService aService;

	@RequestMapping(value = "/category/{value}", method = RequestMethod.GET)
	public ResponseEntity<List<CategoryDataVO>> sscategoryDataGET(@PathVariable("value") String value) {
		logger.info("categoryDataGET(value) 호출 ");

		List<CategoryDataVO> CategoryDetailDataList = cService.petProductsCategoryDetail(value);

		if (CategoryDetailDataList == null) {
			return new ResponseEntity<List<CategoryDataVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			return new ResponseEntity<List<CategoryDataVO>>(CategoryDetailDataList, HttpStatus.OK);
		}
	}

	
    @RequestMapping(value = "/products/create", method = RequestMethod.POST)
    public ResponseEntity<String> createProduct(@ModelAttribute ProductVO vo, HttpServletRequest req) { 
	    logger.info("vo :  "+ vo);
	    logger.info(" req : "+ req.toString());
	    for(int i = 0; i < vo.getOption().size(); i++) {
	  	    logger.info("vo :  "+ vo.getOption().get(i));
	    }
	  
	    try {
		  List<ImageVO> images = saveImage(vo, req,"create"); 
		  logger.info("images :  "+ images);
		  if (images == null || images.isEmpty()) { return new
			  ResponseEntity<String>("( •̀ ω •́ )✧  이미지가 없음.",
			  HttpStatus.INTERNAL_SERVER_ERROR); 
		  } // 이거 변환하는거는 건들지 않아도 됨.
		  
		  vo.setProduct_images(images);
		  
		  pService.productInsert(vo);
		  return new ResponseEntity<String>("( •̀ ω •́ )✧ 동물이 등록되었습니다", HttpStatus.OK);
	  
	  } catch (Exception e) {
		  logger.info("오류 발생 "); e.printStackTrace(); return
		  new ResponseEntity<String>("( •̀ ω •́ )✧ 오류가 발생했습니다: " + e.getMessage(),
		  HttpStatus.INTERNAL_SERVER_ERROR); 
	  } 
	  
    }
    
    // 상품 조회 / 수정
    @RequestMapping(value = "/products/list", method = RequestMethod.POST)
	public ResponseEntity<List<ProductVO>> productListGET(@RequestBody Map<String, Object> data) {
		logger.info("productListGET REST API 호출 ");


		// 멤버 ID를 가져와서 그 유저가 올린 상품 목록을 볼 수 있게 해야됨,
		// 지금 member랑 연동이 안되어 있으니깐 못함. 임의로 'junghun87' 사용
		// String member_id = (String) session.getAttribute("id");
		String member_id = "junghun87";
		// Java 변수 추가
		data.put("member_id", member_id);
		
		String statuses = (String) data.get("selectedStatuses"); // 문자열 가져오기
        List<String> statusList = Arrays.asList(statuses.split(",")); // , 기준으로 나눠 리스트로 변환

        // 변환된 리스트를 다시 data에 저장
        data.put("selectedStatuses", statusList);
		
		logger.info("productListGET data :  "+ data);
		
		
		List<ProductVO> productList =  pService.getProductList(data);
		logger.info("productList"+productList);
		
		if (productList == null) {
			return new ResponseEntity<List<ProductVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			return new ResponseEntity<List<ProductVO>>(productList, HttpStatus.OK);
		}
	}
    
    
    
    
    ////////////////////////////////////////////////////////////////////////////    
    ////////////////////////////////////////////////////////////////////////////    
    ////////////////////////////////////////////////////////////////////////////    
    ////////////////////////////////////////////////////////////////////////////    
    ////////////////////////////////////////////////////////////////////////////    
 
    // store/updateImg
    @PostMapping("/updateImg")
    public ResponseEntity<String> mainStoreImgUpdate(ProductVO avo,HttpServletRequest req) {
        logger.info("mainStoreImgUpdate 실행 : {}", (Object) avo);
        
        // 문제점 1. 부분 업데이트 할려고 하는데. 못함 전부 다 시 넣어야 됨.
        List<ImageVO> images = saveImage(avo, req, "mainImg"); 
		logger.info("images :  "+ images);
		
		aService.updateMainImg(images);

        return ResponseEntity.ok("이미지 업로드 성공");
  	}
    

	// 신규 상품 등록 목록 이거 데이터 테이블때문에 만듬 신규 상품 등록된것들 가져오는거임
	@RequestMapping( value = "/admin/products/new" , method=RequestMethod.GET)
	public ResponseEntity<List<ProductVO>> showNewProductList() {
		List<ProductVO> newProducts = aService.getNewProducts();
		
		
		logger.info("newProducts : " + newProducts);
		
		if(newProducts != null) {
			return new ResponseEntity<List<ProductVO>>(newProducts,HttpStatus.OK);
		} else {
			return new ResponseEntity<List<ProductVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	// 신규 상품 등록 반려 동작
	@RequestMapping( value = "/admin/product/reject/{prod_id}" , method=RequestMethod.POST)
	public ResponseEntity<String> rejectProduct(@PathVariable ("prod_id") String prod_id) {
		logger.info("rejectProduct  : " + prod_id);
		int result = aService.rejectProduct(prod_id);
		if(result == 1) {
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	// 신규 상품 등록 승인 동작
	@RequestMapping( value = "/admin/product/approval/{prod_id}" , method=RequestMethod.POST)
	public ResponseEntity<String> approvalProduct(@PathVariable ("prod_id") String prod_id) {
		logger.info("approvalProduct  : " + prod_id);
		int result = aService.approvalProduct(prod_id);
		if(result == 1) {
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// 신규 상품 등록 목록 이거 데이터 테이블때문에 만듬 신규 상품 등록된것들 가져오는거임
	@RequestMapping( value = "/admin/products/list" , method=RequestMethod.GET)
	public ResponseEntity<List<ProductVO>> showProductList() {
		
		List<ProductVO> ProductList = aService.getProductList();
		
		
		logger.info("newProducts : " + ProductList);
		
		if(ProductList != null) {
			return new ResponseEntity<List<ProductVO>>(ProductList,HttpStatus.OK);
		} else {
			return new ResponseEntity<List<ProductVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	
	// 어드민 공지사랑 list 가져오기.
	@RequestMapping( value="/admin/notices" , method =RequestMethod.GET )
	public ResponseEntity<List<AdminNoticeVO>> noticeList() {
		logger.info("/admin/notices 실행");
		// 이거 나중에 session에 어떻게 저장하는지 물어보고 변경해야됨. 시큐리티 쓰는데 세션을 사용해야 하는건가?
		// String member_id = (String) session.getAttribute("id");
		List<AdminNoticeVO> list = aService.getNoticeList();
		if(list != null) {
			return new ResponseEntity<List<AdminNoticeVO>>(list,HttpStatus.OK);
		} else {
			return new ResponseEntity<List<AdminNoticeVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// 공지사항 생성
	@RequestMapping( value="/admin/notices" , method =RequestMethod.POST )
	public ResponseEntity<String> noticePOST(AdminNoticeVO vo) {
		logger.info("/admin/notices 실행" + vo);
		
		// importantCh가 true일 경우 important를 1로 설정
	    if (vo.isImportantCh()) {
	    	vo.setImportant((byte) 1); // 중요 공지로 설정
	    } else {
	    	vo.setImportant((byte) 0); // 중요 공지가 아닐 경우 0으로 설정
	    }
		
		
	    int result = aService.insertNotices(vo); // insertNotices 메서드 호출

	    if (result == 0) {
	        // 삽입 실패 시
	        return new ResponseEntity<String>("공지사항 등록에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	    } else {
	        // 삽입 성공 시
	        return new ResponseEntity<String>("공지사항 등록 성공", HttpStatus.OK);
	    }
	}
	// 특정 공지사항 수정
	@RequestMapping( value="/admin/notices" , method =RequestMethod.PATCH )
	public ResponseEntity<String> noticePATCH(@RequestBody AdminNoticeVO vo) {
		logger.info("/admin/noticesPATCH 실행" + vo);
		
		// importantCh가 true일 경우 important를 1로 설정
		if (vo.isImportantCh()) {
			vo.setImportant((byte) 1); // 중요 공지로 설정
		} else {
			vo.setImportant((byte) 0); // 중요 공지가 아닐 경우 0으로 설정
		}
		int result = aService.updateNotices(vo); // insertNotices 메서드 호출
		
		if (result == 0) {
			// 삽입 실패 시
			return new ResponseEntity<String>("공지사항 수정에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			// 삽입 성공 시
			return new ResponseEntity<String>("공지사항 수정 성공", HttpStatus.OK);
		}
	}
	
	// 팝업 목록 조회
	@GetMapping("/admin/popups")
	public ResponseEntity<List<AdminNoticeVO>> getPopupList() {
		
		List<AdminNoticeVO> list = aService.getPopupList(); 
		logger.info("List  " + list);
		if(list != null) {
			return new ResponseEntity<List<AdminNoticeVO>>(list,HttpStatus.OK);
		} else {
			return new ResponseEntity<List<AdminNoticeVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// 특정 팝업 수정
	@RequestMapping( value="/admin/popup/update" , method =RequestMethod.POST )
	public ResponseEntity<String> updatePATCH(@ModelAttribute AdminNoticeVO popupVO,HttpServletRequest req) {
		logger.info("/admin/noticesPATCH 실행" + popupVO);
		
		if(popupVO.getUpload_images() != null) {
			ProductVO product = new ProductVO();
			
			// MultipartFile을 List<MultipartFile>로 변환
			List<MultipartFile> uploadImages = new ArrayList<>();
			if (popupVO.getUpload_images() != null && !popupVO.getUpload_images().isEmpty()) {
				uploadImages.addAll(popupVO.getUpload_images()); // 전체 리스트 추가
			}
			
			product.setUpload_images(uploadImages); // MultipartFile 리스트 설정
			
			// MultipartFile을 List<MultipartFile>로 변환
			List<ImageVO> images = saveImage(product, req, "popupImg");
			popupVO.setPopup_images(images);
		}
		int result = aService.updatePopup(popupVO);
		
		
		if (result == 0) {
			// 삽입 실패 시
			return new ResponseEntity<String>("공지사항 수정에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			// 삽입 성공 시
			return new ResponseEntity<String>("공지사항 수정 성공", HttpStatus.OK);
		}
	}
	// 팝업 생성
	 @PostMapping("/admin/popup/create")
	 public ResponseEntity<String> createPopup(@ModelAttribute AdminNoticeVO popupVO, HttpServletRequest req) {
		 // PopupVO에서 데이터 처리
	        System.out.println("제목: " + popupVO.getTitle());
	        System.out.println("게시 기간: " + popupVO.getDateInput());
	        System.out.println("시작일: " + popupVO.getStart_date());
	        System.out.println("종료일: " + popupVO.getEnd_date());
	        System.out.println("팝업 너비: " + popupVO.getPopupWidth());
	        System.out.println("팝업 높이: " + popupVO.getPopupHeight());
	        
	        ProductVO product = new ProductVO();

		     // MultipartFile을 List<MultipartFile>로 변환
		     List<MultipartFile> uploadImages = new ArrayList<>();
		     if (popupVO.getUpload_images() != null && !popupVO.getUpload_images().isEmpty()) {
		         uploadImages.addAll(popupVO.getUpload_images()); // 전체 리스트 추가
		     }
	
		     product.setUpload_images(uploadImages); // MultipartFile 리스트 설정
	        
	        // MultipartFile을 List<MultipartFile>로 변환
	        List<ImageVO> images = saveImage(product, req, "popupImg");
	        popupVO.setPopup_images(images);
	        
	        int result = aService.insertPopup(popupVO);
	        logger.info("( •̀ ω •́ )✧ result : " + result);
	        
	        // 성공적으로 처리되었다는 응답
	        return ResponseEntity.status(HttpStatus.CREATED).body("팝업이 생성되었습니다."); // 201 Created
	    }
	
	  
	  

	/* =============== 이미지 저장 및 리스트 생성 =============== */
	public List<ImageVO> saveImage(ProductVO avo, HttpServletRequest req,String action) {
		logger.info("( •̀ ω •́ )✧ saveImage(ProductVO avo, HttpServletRequest req) 실행");
		ServletContext context = req.getServletContext();
		String saveDir = context.getRealPath("/uploads/");
		List<MultipartFile> uploadImages = avo.getUpload_images();
		List<ImageVO> product_images = new ArrayList<ImageVO>();

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
			
			ivo.setImage_sequence(i);
			ivo.setImage_src(modifiedPath); 
			if(action.equals("mainImg")) {
				ivo.setImage_type("storeMain");
				ivo.setImage_id("store-main-img");
			}else if(action.equals("popupImg")) {
				ivo.setImage_type("popup");
			} else {
				ivo.setImage_type("prod");
			}
			logger.info("( •̀ ω •́ )✧ ivo : " + ivo);
			product_images.add(ivo);

		}

		return product_images;
	}
	/* =============== 이미지 저장 및 리스트 생성 =============== */

	/* =============== 썸머노트 img src =============== */
	@PostMapping("/api/upload")
	public ResponseEntity<String> uploadImage(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		try {
			if (file.isEmpty()) {
				return ResponseEntity.badRequest().body("파일이 비어있습니다.");
			}
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
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("이미지 업로드 실패: " + e.getMessage());
		}
	}

}
