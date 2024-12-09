package com.Unicon.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.InquiryAnswerVO;
import com.Unicon.domain.InquiryFileVO;
import com.Unicon.domain.InquiryVO;
import com.Unicon.persistence.InquiryDAO;

@Service
public class InquiryServiceImpl implements InquiryService {

	private static final Logger logger = LoggerFactory.getLogger(InquiryServiceImpl.class);

	@Autowired
	private InquiryDAO inquiryDAO;

	private final String uploadDir = "C:/uploads/";

	// 게시글 목록 조회
	public List<InquiryVO> getAllInquiries() {
		return inquiryDAO.getAllInquiries(); // DAO 호출
	}

	public Map<String, Object> getPagedBoards(int page, int size) {
		int offset = (page - 1) * size;
		List<InquiryVO> boards = inquiryDAO.getBoards(offset, size);
		int totalCount = inquiryDAO.getTotalCount();

		Map<String, Object> response = new HashMap<>();
		response.put("boards", boards);
		response.put("totalCount", totalCount);
		response.put("totalPages", (int) Math.ceil((double) totalCount / size));
		response.put("currentPage", page);

		return response;
	}

	// 문의 데이터를 삽입하고 bno 반환
	public int insertInquiry(InquiryVO inquiry) {
		inquiryDAO.insertInquiry(inquiry);
		return inquiry.getBno(); // insert 후 생성된 bno 값을 반환
	}

	public void saveFile(InquiryFileVO fileVO) {
		inquiryDAO.insertFile(fileVO);
	}

	// 게시글 상세 정보 조회
	@Override
	public InquiryVO getBoardDetail(int bno) {
		return inquiryDAO.getBoardDetail(bno); // DAO에서 게시글 정보 가져오기
	}

	// 답변 등록
	@Override
	public void addAnswer(InquiryAnswerVO answer) {

		// 답변 등록
		inquiryDAO.insertAnswer(answer);
		// 문의 상태를 2로 변경 (답변이 추가되었으므로)
		int bno = answer.getBno(); // InquiryAnswerVO에서 bno를 추출
		inquiryDAO.updateInquiryStatus(bno);
	}

	@Override
	// 게시글 번호에 해당하는 답변 조회
	public List<InquiryAnswerVO> getAnswersByBno(int bno) {
		return inquiryDAO.getAnswersByBno(bno);
	}

	// 답변 수정
	@Override
	public void updateAnswer(int dno, String dcontent) {
		inquiryDAO.updateAnswer(dno, dcontent);
	}

	// 답변 삭제
	@Override
	public void deleteAnswer(int dno) {
		inquiryDAO.deleteAnswer(dno);
	}

	// 답변 조회 (수정 폼용)
	@Override
	public InquiryAnswerVO getAnswerByDno(int dno) {
		return inquiryDAO.getAnswerByDno(dno);
	}

	// 비밀번호 확인 (비교용)
	@Override
	public boolean validatePassword(int bno, String password) {
		InquiryVO inquiry = inquiryDAO.getInquiryByBno(bno);
		return inquiry != null && inquiry.getPost_password().equals(password);
	}

	// 조회수 증가
	@Override
	public void increaseViewCount(int bno) {
		inquiryDAO.updateViewCount(bno);
	}

	// 삭제 전체 삭제
	@Override
	public void deleteBoards(List<Integer> ids) {
		inquiryDAO.deleteBoards(ids);
	}

	@Override
	public List<InquiryVO> searchBoards(String startDate, String endDate, String istatus) {
		return inquiryDAO.searchBoards(startDate, endDate, istatus);
	}

	@Override
	public Map<String, Object> getInquiriesByMember(String memberId, int page, int size) {
		int offset = (page - 1) * size;
		List<InquiryVO> inquiries = inquiryDAO.findInquiriesByMember(memberId, offset, size);
		int totalRecords = inquiryDAO.countInquiriesByMember(memberId);

		Map<String, Object> result = new HashMap<>();
		result.put("boards", inquiries);
		result.put("totalPages", (int) Math.ceil((double) totalRecords / size));

		return result;
	}

	public Map<String, Map<String, Long>> getMonthlyIstatusCounts() {
		// DAO 호출로 월별 상태별 카운트 데이터를 가져옴
		List<Map<String, Object>> results = inquiryDAO.getMonthlyIstatusCounts();

		// 결과를 월별로 묶어서 반환할 Map
		Map<String, Map<String, Long>> chartData = new HashMap<>();

		// 상태 목록 (이 상태 목록은 고정된 값으로 추가)
		List<String> istatusNames = Arrays.asList("입양 문의", "쇼핑몰 문의", "커뮤니티 문의", "기타 문의");

		for (Map<String, Object> result : results) {
			String month = result.get("month").toString(); // 월
			String istatus = result.get("istatus").toString(); // 상태
			Long count = ((Number) result.get("count")).longValue(); // 상태별 개수

			// 월별 상태 카운트를 저장
			chartData.computeIfAbsent(month, k -> {
				// 월별 상태 초기화 (0으로 설정)
				Map<String, Long> statusCount = new HashMap<>();
				for (String status : istatusNames) {
					statusCount.put(status, 0L); // 기본 상태 카운트 0
				}
				return statusCount;
			}).put(istatus, count); // 상태별 카운트 설정
		}

		return chartData; //
	}

	@Override
	public double getCompletionRate() {
		return inquiryDAO.getCompletionRate();
	}

}
