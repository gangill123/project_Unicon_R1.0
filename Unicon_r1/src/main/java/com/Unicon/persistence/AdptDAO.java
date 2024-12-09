package com.Unicon.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.AnimalHealthVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.AnimalVaccineVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.MemberVO;

import lombok.extern.log4j.Log4j2;


@Repository("AdptDAO")
public class AdptDAO {
	
	@Inject
	private SqlSession sqlSession; 
	private static final Logger logger = LoggerFactory.getLogger(AdptDAO.class);

	private static final String NAMESPACE = "com.Unicon.mapper.adptMapper.";
	
	public void animalInsert(AnimalVO avo) {
		logger.debug("( •̀ ω •́ )✧ animalInsert() 실행");
		
		sqlSession.insert(NAMESPACE+"insertAnimal", avo);
		
		// animal_id를 이미지 정보 저장 과정에서 입력되었기에 리스트 전달
		List<ImageVO> images = new ArrayList<ImageVO>(avo.getAnimal_images());
		sqlSession.insert(NAMESPACE+"insertAnimalImages", images);
		
		Map<String, Object> healthParams = new HashMap<>();
		healthParams.put("animal_id", avo.getAnimal_id());
		healthParams.put("healths", avo.getAnimal_healths());
		sqlSession.insert(NAMESPACE+"insertAnimalHealths", healthParams);
		
		Map<String, Object> vaccineParams = new HashMap<>();
		vaccineParams.put("animal_id", avo.getAnimal_id());
		vaccineParams.put("vaccines", avo.getAnimal_vaccines());
		sqlSession.insert(NAMESPACE+"insertAnimalVaccines", vaccineParams);
	}
	
	
	public Integer checkAnimalId(String animal_id) {
		logger.debug("( •̀ ω •́ )✧ checkAnimalId(String animId) 실행");
		
		return sqlSession.selectOne(NAMESPACE+"checkAnimalId", animal_id);
	}
	
	
	public List<AnimalVO> getAnimalListAll() {
		logger.debug("( •̀ ω •́ )✧ getAnimalListAll() 실행");
		
		return sqlSession.selectList(NAMESPACE+"getAnimalListAll");
	}
	
	
	public AnimalVO getAnimalListOne(String animal_id) {
		logger.debug("( •̀ ω •́ )✧ getAnimalListOne(String animal_id) 실행");
		
		return sqlSession.selectOne(NAMESPACE+"getAnimalListOne",animal_id);
	}
	
	
	public void modifyAnimal(AnimalVO avo) {
		logger.debug("( •̀ ω •́ )✧ modifyAnimal(AnimalVO avo) 실행");
		 
		sqlSession.update(NAMESPACE+"modifyAnimal", avo);
		  
		List<ImageVO> images = new ArrayList<ImageVO>(avo.getAnimal_images());
		sqlSession.insert(NAMESPACE+"modifyAnimalImages", images);
		
		Map<String, Object> healthParams = new HashMap<>();
		healthParams.put("animal_id", avo.getAnimal_id());
		healthParams.put("healths", avo.getAnimal_healths());
		sqlSession.insert(NAMESPACE+"modifyAnimalHealths", healthParams);
		 
		Map<String, Object> vaccineParams = new HashMap<>();
		vaccineParams.put("animal_id", avo.getAnimal_id());
		vaccineParams.put("vaccines", avo.getAnimal_vaccines());
		sqlSession.insert(NAMESPACE+"modifyAnimalVaccines", vaccineParams);
		 
	}
	
	public void deleteAnimal(String animal_id, String member_id) {
		logger.debug("( •̀ ω •́ )✧ deleteAnimal(String animal_id, String member_id) 실행");
		Map<String, String> animalParams = new HashMap<String, String>();
		animalParams.put("animal_id", animal_id);
		animalParams.put("member_id", member_id);
		sqlSession.update(NAMESPACE+"deleteAnimal", animalParams);
	}
	
	
	public void modifyAnimalStatus(Map<String, Object> statusData) {
		logger.debug("( •̀ ω •́ )✧ modifyAnimalStatus(Map<String, Object> statusData) 실행");
		
		sqlSession.update(NAMESPACE+"modifyAnimalStatus", statusData);
	}
	
	
	public MemberVO getMemberInfo(String member_id) {
		logger.debug("( •̀ ω •́ )✧ getMemberInfo(String member_id) 실행");
		
		return sqlSession.selectOne(NAMESPACE+"getMemberInfo", member_id);
	}
}
