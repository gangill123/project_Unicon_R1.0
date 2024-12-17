package com.Unicon.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.InquiryAnswerVO;
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
	public ResponseEntity<Map<String, Object>> getBoards(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		Map<String, Object> response = inquiryService.getPagedBoards(page, size);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}

	// 게시글 작성 제출 및 캡챠 토큰 기능
	@PostMapping("/submit")
	public ResponseEntity<String> submitInquiry(@RequestParam("member_name") String memberName,
			@RequestParam("email") String email, @RequestParam("title") String title,
			@RequestParam("phone") String phone, @RequestParam("content") String content,
			@RequestParam("istatus") String istatus, @RequestParam("post_password") String postPassword,
			@RequestParam("recaptcha") String recaptchaResponse,
			@RequestParam(value = "file", required = false) MultipartFile file, // 파일 처리
			HttpSession session // 세션 객체 추가
	) {
		try {
			// 세션에서 member_id 가져오기
			String memberId = (String) session.getAttribute("member_id");
			if (memberId == null) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
			}

			logger.debug("세션에서 가져온 member_id: {}", memberId);

			// 요청 데이터 로그 추가
			logger.debug("전달된 문의 데이터: {}, 파일: {}", memberName, file != null ? file.getOriginalFilename() : "없음");

			// reCAPTCHA 검증
			boolean isRecaptchaValid = recaptchaService.verify(recaptchaResponse);
			if (!isRecaptchaValid) {
				return ResponseEntity.badRequest().body("reCAPTCHA 인증에 실패했습니다.");
			}

			// InquiryVO 객체 생성 후 데이터 처리
			InquiryVO inquiry = new InquiryVO();
			inquiry.setMember_id(memberId); // 세션에서 가져온 member_id 추가
			inquiry.setMember_name(memberName);
			inquiry.setEmail(email);
			inquiry.setTitle(title);
			inquiry.setPhone(phone);
			inquiry.setContent(content);
			inquiry.setIstatus(istatus);
			inquiry.setPost_password(postPassword);
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

				// 파일 업로드 디렉토리 설정 (웹 애플리케이션 내 상대 경로)
				String uploadDir = "/resources/uploads/"; // 프로젝트의 웹 애플리케이션 내 상대 경로
				String storedName = UUID.randomUUID().toString() + "_" + originalName;
				String filePath = uploadDir + storedName;

				// 파일 저장 디렉토리 확인 및 생성
				File uploadFolder = new File(uploadDir);
				if (!uploadFolder.exists()) {
					uploadFolder.mkdirs(); // 디렉토리가 없으면 생성
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
						thumbnailFolder.mkdirs(); // 썸네일 디렉토리가 없으면 생성
					}

					String thumbnailName = "thumb_" + storedName;
					thumbnailPath = thumbnailDir + thumbnailName;

					// 썸네일 생성
					Thumbnails.of(destinationFile).size(150, 150).toFile(new File(thumbnailPath));
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

	// 답변 추가 API
	@PostMapping("/addAnswer")
	public ResponseEntity<?> addAnswer(@RequestParam("bno") int bno, @RequestParam("dname") String dname,
			@RequestParam("dcontent") String dcontent) {
		InquiryAnswerVO answer = new InquiryAnswerVO();
		answer.setBno(bno);
		answer.setDname(dname);
		answer.setDcontent(dcontent);

		// 답변 추가 서비스 호출
		inquiryService.addAnswer(answer);

		// 추가된 답변 정보를 반환 (예: bno에 해당하는 답변 목록)
		List<InquiryAnswerVO> answers = inquiryService.getAnswersByBno(bno);

		// 성공적인 응답 (HTTP 200 OK)과 함께 답변 목록 반환
		return ResponseEntity.ok(answers);
	}

	// 댓글 수정
	@PutMapping("/manageEdit")
	public ResponseEntity<Map<String, String>> updateAnswer(@RequestBody Map<String, Object> requestBody) {
		int dno = (int) requestBody.get("dno"); // dno를 body에서 추출
		String dcontent = (String) requestBody.get("dcontent"); // dcontent를 body에서 추출
		inquiryService.updateAnswer(dno, dcontent);

		Map<String, String> response = new HashMap<>();
		response.put("message", "답변이 수정되었습니다.");
		return ResponseEntity.ok(response); // 응답 메시지 전송
	}

	// 댓글 삭제
	@DeleteMapping("/manageDelete")
	public ResponseEntity<Map<String, String>> deleteAnswer(@RequestBody Map<String, Integer> requestBody) {
		int dno = requestBody.get("dno");
		inquiryService.deleteAnswer(dno);
		Map<String, String> response = new HashMap<>();
		response.put("message", "답변이 삭제되었습니다.");
		return ResponseEntity.ok(response);
	}

	// 게시글 비밀번호 확인 메서드
	@PostMapping("/validate-password")
	public Map<String, Object> validatePassword(@RequestParam("bno") int bno,
			@RequestParam("password") String password) {
		boolean isValid = inquiryService.validatePassword(bno, password); // 서비스에서 비밀번호 검증
		Map<String, Object> response = new HashMap<>();
		response.put("valid", isValid); // 결과를 JSON 형태로 반환
		logger.debug("패스워드 검증 결과: bno={}, isValid={}", bno, isValid);
		return response;
	}

	// 관리자 선택/전체 삭제
	@PostMapping("/delete")
	public ResponseEntity<String> deleteBoards(@RequestBody Map<String, List<Integer>> request) {
		List<Integer> ids = request.get("ids");
		if (ids == null || ids.isEmpty()) {
			return ResponseEntity.badRequest().body("삭제할 항목이 없습니다.");
		}

		inquiryService.deleteBoards(ids);
		return ResponseEntity.ok("선택한 항목이 삭제되었습니다.");
	}

	// 카테고리,날짜별 검색 기능
	@GetMapping("/search")
	public ResponseEntity<?> searchBoards(@RequestParam(required = false) String startDate,
			@RequestParam(required = false) String endDate, @RequestParam(required = false) String istatus) {

		List<InquiryVO> boards = inquiryService.searchBoards(startDate, endDate, istatus);

		return ResponseEntity.ok(Map.of("boards", boards));
	}

	@GetMapping("/boardsA")
	public ResponseEntity<Map<String, Object>> getMyInquiries(@RequestParam int page, @RequestParam int size,
			HttpSession session) {
		String memberId = (String) session.getAttribute("member_id"); // 로그인 세션에서 member_id 가져오기
		if (memberId == null) {
			// 세션에 member_id가 없을 경우
			System.out.println("로그인된 사용자 없음. member_id가 세션에 없습니다.");
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build(); // 로그인 필요
		}

		// 세션에 member_id가 있으면 해당 사용자 데이터를 조회
		Map<String, Object> result = inquiryService.getInquiriesByMember(memberId, page, size);
		return ResponseEntity.ok(result);
	}

	// 그래프 월별 데이터 가져오기
	@GetMapping("/statusCounts")
	public ResponseEntity<Map<String, Map<String, Long>>> getStatusCounts() {
		try {
			// 서비스에서 월별 상태 개수 데이터를 받아옴
			Map<String, Map<String, Long>> chartData = inquiryService.getMonthlyIstatusCounts();
			return ResponseEntity.ok(chartData); // JSON 형식으로 반환
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(500).build(); // 에러 처리
		}
	}

	@GetMapping("/inquiryChart")
	public ResponseEntity<Double> getCompletionRate() {
		double completionRate = inquiryService.getCompletionRate();
		return ResponseEntity.ok(completionRate);
	}

} // InquiryController