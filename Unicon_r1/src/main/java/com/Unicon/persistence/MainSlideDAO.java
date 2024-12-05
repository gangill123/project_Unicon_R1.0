package com.Unicon.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.MainSlideVO;

@Repository("mainSlideDAO")
public class MainSlideDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.Unicon.mapper.MainSlideMapper";
	
	// 메인슬라이드 등록
	public void createSlide(MainSlideVO vo) {
		sqlSession.insert(NAMESPACE+".createSlide", vo);
	}
	
	// 슬라이드 정보 가져오기
	public List<MainSlideVO> getSildeAll(){
		return sqlSession.selectList(NAMESPACE+".getSildeAll");
	}
	
	// 슬라이드 특정 정보 가져오기
	public MainSlideVO getSilde(int ms_id){
		return sqlSession.selectOne(NAMESPACE+".getSilde", ms_id);
	}
	
	// 슬라이드 정보 수정
	public void updateSilde(MainSlideVO vo) {
		sqlSession.update(NAMESPACE+".updateSilde", vo);
	}
	
	// 슬라이드 삭제
	public void deleteSilde(int ms_id) {
		sqlSession.delete(NAMESPACE+".deleteSilde", ms_id);
	}
	
	// 메인화면용 슬라이드 가져오기(개시시작일 ~ 개시종료일)
	public List<MainSlideVO> getSlideForMain(){
		return sqlSession.selectList(NAMESPACE+".getSlideForMain");
	}
	
	// 메인슬라이드src 가져오기(삭제관련)
	public String getMsSrc(int ms_id) {
		return sqlSession.selectOne(NAMESPACE+".getMsSrc", ms_id);
	}
	
	
	
}
