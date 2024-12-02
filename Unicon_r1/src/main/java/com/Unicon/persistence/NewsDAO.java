package com.Unicon.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.NewsVO;

@Repository("newsDAO")
public class NewsDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.Unicon.mapper.NewsMapper";
	
	// 소식 생성
	public void newsCreate(NewsVO vo) {
		sqlSession.insert(NAMESPACE+".newsCreate", vo);
	}
	
	// 모든 소식 조회
	public List<NewsVO> getNewsAll() {
		return sqlSession.selectList(NAMESPACE+".getNewsAll");
	}
	
	// 특정 소식 조회
	public NewsVO getNews(int news_id) {
		return sqlSession.selectOne(NAMESPACE+".getNews", news_id);
	}
	
	// 소식정보 수정
	public void updateNews(NewsVO vo) {
		sqlSession.update(NAMESPACE+".updateNews", vo);
	}
	
	// 소식정보 삭제
	public void deleteNews(int news_id) {
		sqlSession.delete(NAMESPACE+".deleteNews", news_id);
	}
	
	// 특정 지역 소식 조회
	public List<NewsVO> getNewsResion(String news_resion) {
		return sqlSession.selectList(NAMESPACE+".getNewsResion", news_resion);
	}
	
	// 소식 조회(메인용)
	public NewsVO getNewsForMain() {
		return sqlSession.selectOne(NAMESPACE+".getNewsForMain");
	}
	
	
}
