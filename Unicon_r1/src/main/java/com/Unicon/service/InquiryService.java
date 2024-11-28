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

}
