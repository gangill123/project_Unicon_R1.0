package com.Unicon.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public void updateAnswer(int dno, String dcontent);  
	    
	public void deleteAnswer(int dno);
	   
	public InquiryAnswerVO getAnswerByDno(int dno);
	
	void updateInquiryStatus(int bno);
	
	public InquiryVO getInquiryByBno(int bno);
	
	public void updateViewCount(int bno);

	void deleteBoards(List<Integer> ids);

	List<InquiryVO> searchBoards(String startDate, String endDate, String istatus);
	

}
