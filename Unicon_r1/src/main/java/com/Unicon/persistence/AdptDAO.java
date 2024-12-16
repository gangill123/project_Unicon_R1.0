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

import com.Unicon.domain.AdptVO;
import com.Unicon.domain.AnimalVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.MemberVO;



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
	public Integer checkAnimalId(String animal_id, String member_id) {
		logger.debug("( •̀ ω •́ )✧ checkAnimalId(String animId) 실행");
		
		Map<String,String> checkParams = new HashMap<String, String>();
		checkParams.put("animal_id", animal_id);
		checkParams.put("member_id", member_id);
		
		return sqlSession.selectOne(NAMESPACE+"checkAnimalIdMemberId", checkParams);
	}
	
	
	public List<AnimalVO> getAnimalListAll(String member_id) {
		logger.debug("( •̀ ω •́ )✧ getAnimalListAll() 실행");
		
		return sqlSession.selectList(NAMESPACE+"getAnimalListAllMember", member_id);
	}
	public List<AnimalVO> getAnimalListAll() {
		logger.debug("( •̀ ω •́ )✧ getAnimalListAll() 실행");
		
		return sqlSession.selectList(NAMESPACE+"getAnimalListAll");
	}
	
	
	public AnimalVO getAnimalListOne(String animal_id) {
		logger.debug("( •̀ ω •́ )✧ getAnimalListOne(String animal_id) 실행");
		
		return sqlSession.selectOne(NAMESPACE+"getAnimalListOne", animal_id);
	}
	
	public AnimalVO getAnimalWritingOne(String animal_id) {
		logger.debug("( •̀ ω •́ )✧ getAnimalWritingOne(String animal_id) 실행");
		
		return sqlSession.selectOne(NAMESPACE+"getAnimalWritingOne", animal_id);
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
	
	public void deleteAnimal(String animal_id) {
		logger.debug("( •̀ ω •́ )✧ deleteAnimal(String animal_id, String member_id) 실행");
		Map<String, Object> animalParams = new HashMap<String, Object>();
		animalParams.put("animal_id", animal_id);
		animalParams.put("animal_status", 6);
		sqlSession.update(NAMESPACE+"modifyAnimalStatus", animalParams);
	}
	
	
	public void modifyAnimalStatus(Map<String, Object> statusData) {
		logger.debug("( •̀ ω •́ )✧ modifyAnimalStatus(Map<String, Object> statusData) 실행");
		
		sqlSession.update(NAMESPACE+"modifyAnimalStatus", statusData);
		if((int)statusData.get("animal_status") == 5) {
			statusData.put("adpt_status", 4);
			sqlSession.update(NAMESPACE+"animalStatusEnd", statusData);
		}
	}
	
	
	public MemberVO getMemberInfo(String member_id) {
		logger.debug("( •̀ ω •́ )✧ getMemberInfo(String member_id) 실행");
		
		return sqlSession.selectOne(NAMESPACE+"getMemberInfo", member_id);
	}
	
	
	public void adptWritingInsert(AdptVO advo,int animalStatus) {
		logger.debug("( •̀ ω •́ )✧ adptWritingInsert(AdptVO advo) 실행");
		
		Map<String,Object> adptParams = new HashMap<String, Object>();
		adptParams.put("animal_status", animalStatus);
		adptParams.put("animal_id", advo.getAnimal_id());
		
		sqlSession.insert(NAMESPACE+"adptWritingInsert", advo);
		sqlSession.update(NAMESPACE+"writingAnimalStatus", adptParams);
	}
	
	
	public List<AnimalVO> getWritingListAll(String member_id) {
		logger.debug("( •̀ ω •́ )✧ getWritingListAll() 실행");
		
		return sqlSession.selectList(NAMESPACE+"getWritingListAllMember", member_id);
	}
	public List<AnimalVO> getWritingListAll() {
		logger.debug("( •̀ ω •́ )✧ getWritingListAll() 실행");
		
		return sqlSession.selectList(NAMESPACE+"getWritingListAll");
	}
	
	
	public void modifyWriting(AdptVO advo) {
		logger.debug("( •̀ ω •́ )✧ modifyWriting(AdptVO advo) 실행");
		
		sqlSession.update(NAMESPACE+"modifyWriting", advo);
	}
	
	
	public void deleteWriting(AdptVO advo) {
		logger.debug("( •̀ ω •́ )✧ deleteWriting(AdptVO advo) 실행");
		
		Map<String, Object> writingParams = new HashMap<String, Object>();
		writingParams.put("animal_id", advo.getAnimal_id());
		writingParams.put("animal_status", 1);
		
		sqlSession.update(NAMESPACE+"deleteWriting", advo);
		sqlSession.update(NAMESPACE+"modifyAnimalStatus", writingParams);
	}
	
	
	public void writingsStatusManager(Map<String, Object> writingStatus) {
		logger.debug("( •̀ ω •́ )✧ writingsStatusManager() 실행");
		
		sqlSession.update(NAMESPACE+"writingsStatusManager", writingStatus);
	}
	
	
	public List<AnimalVO> getAdptList() {
		logger.debug("( •̀ ω •́ )✧ getAdptList() 실행");
		
		return sqlSession.selectList(NAMESPACE+"getAdptList");
	}
	
	
	public List<AnimalVO> forMainAdptData() {
		logger.debug("( •̀ ω •́ )✧ getAdptList() 실행");
		
		return sqlSession.selectList(NAMESPACE+"forMainAdptData");
	}
	
	
	/*=========== 사용자 페이지 입양하기 ===========*/
	public List<AnimalVO> getAdptFilterView(Map<String, Object> adptFilters) {
		logger.debug("( •̀ ω •́ )✧ getAdptFilterView() 실행");
		
		return sqlSession.selectList(NAMESPACE+"getAdptFilterView", adptFilters);
	}
	
	
	/*=========== 사용자 페이지 상담신청 ===========*/
	public void counselSubmit(Map<String, String> counselParams) {
		logger.debug("( •̀ ω •́ )✧ counselSubmit() 실행");
		
		sqlSession.insert(NAMESPACE+"counselSubmit", counselParams);
	}
	
	
	
}
