package com.Unicon.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Unicon.domain.NewsVO;
import com.Unicon.persistence.NewsDAO;

@Service("newsService")
public class NewsService {
	
	@Autowired
	private NewsDAO ndao;
	
	private static final Logger logger = LoggerFactory.getLogger(NewsService.class);
	
	// 소식 생성
	public void newsCreate(NewsVO vo) {
		ndao.newsCreate(vo);
	}
	
	// 모든 소식 조회 + filter
	public List<NewsVO> getNewsAll() {
		
		return ndao.getNewsAll();
	}
	
	// 모든 소식 조회 + filter
	public List<NewsVO> getNewsAll(int filter) {
		
		if(filter == 0) {
			return ndao.getNewsAll();
		} else if(filter == 1) {
			return ndao.getNewsAllPost();
		} else {
			return ndao.getNewsAllPostEnd();
		}
	}
	
	// 특정 지역 소식 조회 + filter
	public List<NewsVO> getNewsResion(String news_resion, int filter) {
		
		if(filter == 0) {
			return ndao.getNewsResion(news_resion);
		} else if(filter == 1) {
			return ndao.getNewsResionPost(news_resion);
		} else {
			return ndao.getNewsResionPostEnd(news_resion);
		}
	}
	
	// 특정 소식 조회
	public NewsVO getNews(int news_id) {
		return ndao.getNews(news_id);
	}
	
	// 소식정보 수정
	public void updateNews(NewsVO vo) {
		ndao.updateNews(vo);
	}
	
	// 소식정보 삭제
	public void deleteNews(int news_id) {
		ndao.deleteNews(news_id);
	}
	
	
	// 소식 조회(메인용)
	public NewsVO getNewsForMain() {
		return ndao.getNewsForMain();
	}
	
	// 소식 조회(모두보기)
	public List<NewsVO> getNewsLastest() {
		return ndao.getNewsLastest();
	}
	
	// 소식 조회(다가오는 행사)
	public List<NewsVO> getNewsUpcoming() {
		return ndao.getNewsUpcoming();
	}
	
	// 소식 조회(우리 지역 행사)
	public List<NewsVO> getNewsLocal(String member_id) {
		return ndao.getNewsLocal(member_id);
	}
	
	// 소식 조회(종료된 소식)
	public List<NewsVO> getNewsClosed() {
		return ndao.getNewsClosed();
	}
	
	
	
}
