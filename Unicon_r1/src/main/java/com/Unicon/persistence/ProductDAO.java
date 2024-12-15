package com.Unicon.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.ImageVO;
import com.Unicon.domain.OptionVO;
import com.Unicon.domain.ProductVO;

@Repository("productDAO")
public class ProductDAO {

	@Inject
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(ProductDAO.class);

	private static final String NAMESPACE = "com.Unicon.mapper.productMapper.";

	public void productInsert(ProductVO vo) {
		logger.debug("( •̀ ω •́ )✧ productInsert() 실행");
		logger.debug("vo : " + vo);
		
		
		// 상품등록 (옵션, 이미지 뺴고)등록
		sqlSession.insert(NAMESPACE + "insertProduct", vo);

		// 마지막으로 삽입된 product_id 가져오기
		String InsertedProductId = (String) sqlSession.selectOne(NAMESPACE + "selectInsertedProductId", vo);
		
		//option을 리스트에 받아온 상품id 담아서 insert
		List<OptionVO> optionVo = new ArrayList<OptionVO>(vo.getOption());
		for(OptionVO option : optionVo) {
			option.setProduct_id(InsertedProductId);
		}
		sqlSession.insert(NAMESPACE + "insertOptions", optionVo);
		
		// 상품 images insert
		List<ImageVO> images = new ArrayList<ImageVO>(vo.getProduct_images());
		for(ImageVO image : images) {
			image.setImage_id(InsertedProductId);
		}
		sqlSession.insert(NAMESPACE + "insertProductImages", images);
	}
	
	public List<ProductVO> getProductList(Map<String, Object> data) {
		List<ProductVO> productList = sqlSession.selectList(NAMESPACE + "getProductList", data);
		return productList; 
	}

}
