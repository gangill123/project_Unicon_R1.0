package com.Unicon.persistence;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.ProductVO;



@Repository("productDAO")
public class ProductDAO {
	
	@Inject
	private SqlSession sqlSession; 
	private static final Logger logger = LoggerFactory.getLogger(ProductDAO.class);

	private static final String NAMESPACE = "com.Unicon.mapper.productMapper.";
	
	public void productInsert(ProductVO vo) {
		logger.debug("( •̀ ω •́ )✧ productInsert() 실행");
		logger.debug("vo : "+ vo);
		
		sqlSession.insert(NAMESPACE+"insertProduct", vo);
		
		// 마지막으로 삽입된 product_id 가져오기
	    String lastInsertedId = (String) sqlSession.selectOne(NAMESPACE + "selectLastInsertedProductId");
	    vo.setProduct_id(lastInsertedId);
	    
		/* sqlSession.insert(NAMESPACE+"isertOption",vo); */
	    
		
		
		
		
		/*
		 * List<ImageVO> images = new ArrayList<ImageVO>(avo.getAnimal_images());
		 * sqlSession.insert(NAMESPACE+"insertAnimalImages", images);
		 * 
		 * Map<String, Object> healthParams = new HashMap<>();
		 * healthParams.put("animal_id", avo.getAnimal_id());
		 * healthParams.put("healths", avo.getAnimal_healths());
		 * sqlSession.insert(NAMESPACE+"insertAnimalHealths", healthParams);
		 * 
		 * Map<String, Object> vaccineParams = new HashMap<>();
		 * vaccineParams.put("animal_id", avo.getAnimal_id());
		 * vaccineParams.put("vaccines", avo.getAnimal_vaccines());
		 * sqlSession.insert(NAMESPACE+"insertAnimalVaccines", vaccineParams);
		 */
	}
	
	
	
	
	
	
	
}
