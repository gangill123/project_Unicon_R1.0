package com.Unicon.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.InquiryFileVO;
import com.Unicon.domain.InquiryVO;
import com.Unicon.service.InquiryService;
import com.Unicon.service.RecaptchaService;

import io.swagger.annotations.Api;
import io.swagger.models.Model;
import net.coobird.thumbnailator.Thumbnails;


@RestController
@RequestMapping(value = "/api")
@Api(tags = "문의게시판 API")
public class InquiryRestController {

	private static final Logger logger = LoggerFactory.getLogger(InquiryRestController.class);

	@Autowired
	private InquiryService inquiryService;
	
	@Autowired
	private RecaptchaService recaptchaService;
	

	// 게시글 목록 조회
	@GetMapping
	public List<InquiryVO> getAllInquiries() {
		return inquiryService.getAllInquiries(); // JSON 형식으로 반환
	}
	
	@GetMapping(value = "/boards")
    public ResponseEntity<Map<String, Object>> getBoards(
        @RequestParam(value = "page", defaultValue = "1") int page,
        @RequestParam(value = "size", defaultValue = "10") int size
    ) {
        Map<String, Object> response = inquiryService.getPagedBoards(page, size);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
	// JSON 데이터와 파일을 처리하는 POST 요청
    @PostMapping("/submit")
    public ResponseEntity<String> submitInquiry(
        @RequestParam("member_name") String memberName,
        @RequestParam("email") String email,
        @RequestParam("title") String title,
        @RequestParam("phone") String phone,
        @RequestParam("content") String content,
        @RequestParam("istatus") String istatus,
        @RequestParam("recaptcha") String recaptchaResponse,
        @RequestParam(value = "file", required = false) MultipartFile file // 파일 처리
    ) {
        try {
            // 요청 데이터 로그 추가
            logger.debug("전달된 문의 데이터: {}, 파일: {}", memberName, file != null ? file.getOriginalFilename() : "없음");

            // reCAPTCHA 검증
            boolean isRecaptchaValid = recaptchaService.verify(recaptchaResponse);
            if (!isRecaptchaValid) {
                return ResponseEntity.badRequest().body("reCAPTCHA 인증에 실패했습니다.");
            }

            // InquiryVO 객체 생성 후 데이터 처리
            InquiryVO inquiry = new InquiryVO();
            inquiry.setMember_name(memberName);
            inquiry.setEmail(email);
            inquiry.setTitle(title);
            inquiry.setPhone(phone);
            inquiry.setContent(content);
            inquiry.setIstatus(istatus);
            inquiry.setRecaptcha(recaptchaResponse);

            // 문의 데이터 처리 후, bno 값을 반환받음
            int bno = inquiryService.insertInquiry(inquiry);
            
            if (bno <= 0) {
                throw new IllegalStateException("bno 생성 실패");
            }

            // 파일 처리 (파일이 있는 경우)
            if (file != null && !file.isEmpty()) {
            	String originalName = file.getOriginalFilename();
            	String fileType = file.getContentType();

            	// 절대 경로 또는 프로젝트 기준 상대 경로 설정
            	String uploadDir = System.getProperty("user.dir") + "/uploads/";
            	String storedName = UUID.randomUUID().toString() + "_" + originalName;
            	String filePath = uploadDir + storedName;

            	// 파일 저장 디렉토리 확인 및 생성
            	File uploadFolder = new File(uploadDir);
            	if (!uploadFolder.exists()) {
            	    uploadFolder.mkdirs();
            	}

            	// 파일 저장
            	File destinationFile = new File(filePath);
            	file.transferTo(destinationFile);

            	// 썸네일 생성 (이미지 파일만 처리)
            	String thumbnailPath = null;
            	if (fileType.startsWith("image/")) {
            	    String thumbnailDir = uploadDir + "thumbnails/";
            	    File thumbnailFolder = new File(thumbnailDir);
            	    if (!thumbnailFolder.exists()) {
            	        thumbnailFolder.mkdirs();
            	    }

            	    String thumbnailName = "thumb_" + storedName;
            	    thumbnailPath = thumbnailDir + thumbnailName;

            	    Thumbnails.of(destinationFile)
            	              .size(150, 150)
            	              .toFile(new File(thumbnailPath));
            	}

            	

                // InquiryFileVO 객체 생성 후 파일 정보 저장
                InquiryFileVO fileVO = new InquiryFileVO();
                fileVO.setBno(bno); // 생성된 bno 값 설정
                fileVO.setOriginalName(originalName);
                fileVO.setStoredName(storedName);
                fileVO.setFilePath(filePath);
                fileVO.setFileType(fileType);
                fileVO.setUploadDate(new Timestamp(System.currentTimeMillis()));
                fileVO.setThumbnailPath(thumbnailPath);

                // 파일 정보를 서비스에 저장
                inquiryService.saveFile(fileVO);
            }

            return new ResponseEntity<>("문의가 성공적으로 등록되었습니다.", HttpStatus.CREATED);
        } catch (Exception e) {
            // 예외 로그 추가
            logger.error("문의 등록 중 오류 발생", e);
            return new ResponseEntity<>("문의 등록 중 오류가 발생했습니다: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
   
	
} // InquiryController