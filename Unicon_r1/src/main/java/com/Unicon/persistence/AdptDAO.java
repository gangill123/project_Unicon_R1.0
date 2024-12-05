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
	
	
	
	
}
