package com.Unicon.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
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
	
	  // 답변 추가
	@Override
    public void addAnswer(InquiryAnswerVO answer) {
        inquiryDAO.insertAnswer(answer);
    }
	@Override
    // 게시글 번호에 해당하는 답변 조회
    public List<InquiryAnswerVO> getAnswersByBno(int bno) {
        return inquiryDAO.getAnswersByBno(bno);
    }
	
}
