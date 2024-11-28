package com.Unicon.persistence;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.AnimalHealthVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.AnimalVaccineVO;
import com.Unicon.domain.ImageVO;

import lombok.extern.log4j.Log4j2;


@Repository("AdptDAO")
@Log4j2
public class AdptDAO {
	
	@Inject
	private SqlSession sqlSession; 
	
	private static final String NAMESPACE = "com.Unicon.mapper.adptMapper.";
	
	
	public void animalInsert(AnimalVO avo) {
		log.info("( •̀ ω •́ )✧ animalInsert() 실행");
		
		sqlSession.insert(NAMESPACE+"insertAnimal", avo);
		
		Map<String, Object> imageParams = new HashMap<>();
		imageParams.put("animal_id", avo.getAnimal_id());
		imageParams.put("images", avo.getAnimal_images());
		sqlSession.insert(NAMESPACE+"insertAnimalImages", imageParams);
		
		Map<String, Object> healthParams = new HashMap<>();
		healthParams.put("animal_id", avo.getAnimal_id());
		healthParams.put("healths", avo.getAnimal_healths());
		sqlSession.insert(NAMESPACE+"insertAnimalHealths", healthParams);
		
		Map<String, Object> vaccineParams = new HashMap<>();
		vaccineParams.put("animal_id", avo.getAnimal_id());
		vaccineParams.put("vaccines", avo.getAnimal_vaccines());
		sqlSession.insert(NAMESPACE+"insertAnimalVaccines", vaccineParams);
	}
	
	
	
	
}
