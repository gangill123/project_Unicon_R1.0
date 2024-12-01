package com.Unicon.persistence;

import java.util.List;

import com.Unicon.domain.InquiryAnswerVO;
import com.Unicon.domain.InquiryFileVO;
import com.Unicon.domain.InquiryVO;

public interface InquiryDAO {

	List<InquiryVO> getAllInquiries();

	public List<InquiryVO> getBoards(int offset, int limit);

	public int getTotalCount();

	void insertInquiry(InquiryVO inquiry);

	void insertFile(InquiryFileVO inquiryFileVO);

	InquiryVO getBoardDetail(int bno);

	// 답변 추가
	public void insertAnswer(InquiryAnswerVO answer);

	// 게시글 번호에 해당하는 답변 조회
	public List<InquiryAnswerVO> getAnswersByBno(int bno);

}
