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
	
	// 모든 소식 조회 + filter(개시중)
	public List<NewsVO> getNewsAllPost() {
		return sqlSession.selectList(NAMESPACE+".getNewsAllPost");
	}
	
	// 모든 소식 조회 + filter(개시완료)
	public List<NewsVO> getNewsAllPostEnd() {
		return sqlSession.selectList(NAMESPACE+".getNewsAllPostEnd");
	}
	
	// 특정 지역 소식 조회
	public List<NewsVO> getNewsResion(String news_resion) {
		return sqlSession.selectList(NAMESPACE+".getNewsResion", news_resion);
	}
	
	// 특정 지역 소식 조회 + filter(개시중)
	public List<NewsVO> getNewsResionPost(String news_resion) {
		return sqlSession.selectList(NAMESPACE+".getNewsResionPost", news_resion);
	}
	
	// 특정 지역 소식 조회 + filter(개시완료)
	public List<NewsVO> getNewsResionPostEnd(String news_resion) {
		return sqlSession.selectList(NAMESPACE+".getNewsResionPostEnd", news_resion);
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
	
	
	// 소식 조회(메인용)
	public NewsVO getNewsForMain() {
		return sqlSession.selectOne(NAMESPACE+".getNewsForMain");
	}
	
	// 소식 조회(모두보기)
	public List<NewsVO> getNewsLastest() {
		return sqlSession.selectList(NAMESPACE+".getNewsLastest");
	}
	
	// 소식 조회(진행중인 행사)
	public List<NewsVO> getNewsNow() {
		return sqlSession.selectList(NAMESPACE+".getNewsNow");
	}
	
	// 소식 조회(다가오는 행사)
	public List<NewsVO> getNewsUpcoming() {
		return sqlSession.selectList(NAMESPACE+".getNewsUpcoming");
	}
	
	// 소식 조회(우리 지역 행사)
	public List<NewsVO> getNewsLocal(String member_id) {
		return sqlSession.selectList(NAMESPACE+".getNewsLocal", member_id);
	}
	
	// 소식 조회(종료된 소식)
	public List<NewsVO> getNewsClosed() {
		return sqlSession.selectList(NAMESPACE+".getNewsClosed");
	}
	
	// 소식 src가져오기 (삭제관련)
	public String getNewsSrc(int news_id) {
		return sqlSession.selectOne(NAMESPACE+".getNewsSrc", news_id);
	}
	
	
	
	
	
}
