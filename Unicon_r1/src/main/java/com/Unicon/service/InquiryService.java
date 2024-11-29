package com.Unicon.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.InquiryAnswerVO;
import com.Unicon.domain.InquiryFileVO;
import com.Unicon.domain.InquiryVO;

public interface InquiryService {

	public List<InquiryVO> getAllInquiries();

	public Map<String, Object> getPagedBoards(int page, int size);

	public int insertInquiry(InquiryVO inquiry);

	public void saveFile(InquiryFileVO fileVO);

	public InquiryVO getBoardDetail(int bno);

	public void addAnswer(InquiryAnswerVO answer);

	public List<InquiryAnswerVO> getAnswersByBno(int bno);	
    // 답변 수정
    public void updateAnswer(int dno, String dcontent);
    // 답변 삭제
    public void deleteAnswer(int dno);
    // 답변 조회 (수정 폼용)
    public InquiryAnswerVO getAnswerByDno(int dno);

	public boolean validatePassword(int bno, String password);
	
	public void increaseViewCount(int bno);
}
