package com.Unicon.persistence;

import java.util.List;
import java.util.Map;

import com.Unicon.domain.MemberVO;
import com.Unicon.domain.NoticeVO;

public interface NoticeDAO {
	void insertNotice(NoticeVO noVo) throws Exception;
    
	void updateNotice(NoticeVO noVo) throws Exception;
    
	void deleteNotice(Long noId) throws Exception;
    
	List<NoticeVO> selectNoticeList(Map<String, Object> params) throws Exception;
    
	int selectNoticeCount(Map<String, Object> params) throws Exception;
    
	NoticeVO selectNotice(Long noId) throws Exception;
    
	void updateViewCount(Long noId) throws Exception;
    
	void updateStatus(Long noId, String status) throws Exception;
    
	NoticeVO selectPrevNotice(Long noId) throws Exception;
    
	NoticeVO selectNextNotice(Long noId) throws Exception;
	
	List<NoticeVO> selectDraftList(Map<String, Object> params) throws Exception;
    
	NoticeVO selectDraft(Long noId) throws Exception;
	
	// 메일 구독자 조회
    public List<MemberVO> getMailSubscribers() throws Exception;
}
