package com.Unicon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Unicon.domain.MainSlideVO;
import com.Unicon.persistence.MainSlideDAO;

@Service("mainSlideService")
public class MainSlideService {

	@Autowired
	private MainSlideDAO msdao;
	
	// 메인슬라이드 등록
	public void createSlide(MainSlideVO vo) {
		msdao.createSlide(vo);
	}
	
	// 슬라이드 모든 정보 가져오기
	public List<MainSlideVO> getSildeAll(){
		return msdao.getSildeAll();
	}
	
	// 슬라이드 특정 정보 가져오기
	public MainSlideVO getSilde(int ms_id){
		return msdao.getSilde(ms_id);
	}
	
	// 슬라이드 정보 수정
	public void updateSilde(MainSlideVO vo) {
		msdao.updateSilde(vo);
	}
	
	// 슬라이드 삭제
	public void deleteSilde(int ms_id) {
		msdao.deleteSilde(ms_id);
	}
	
	// 메인화면용 슬라이드 가져오기(개시시작일 ~ 개시종료일)
	public List<MainSlideVO> getSlideForMain(){
		return msdao.getSlideForMain();
	}
	
	// 메인슬라이드src 가져오기(삭제관련)
	public String getMsSrc(int ms_id) {
		return msdao.getMsSrc(ms_id);
	}
	
	
	
	
	
}
