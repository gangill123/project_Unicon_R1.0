package com.Unicon.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.BlackConsumerVO;
import com.Unicon.domain.ImageVO;
import com.Unicon.domain.OptionVO;
import com.Unicon.domain.OrdersDetailVO;
import com.Unicon.domain.OrdersVO;
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
	
	// 상품 조회 / 수정 , 상품 리스트
	public List<ProductVO> getProductList(Map<String, Object> data) {
		List<ProductVO> productList = sqlSession.selectList(NAMESPACE + "getProductList", data);
		return productList; 
	}
	
	// 상품 조회 / 수정, 선택한 상품의 옵션 자세히 보기.
	public List<OptionVO> getOptionDetails(String product_id) {
		List<OptionVO> optionList = sqlSession.selectList(NAMESPACE + "getOptionDetails", product_id);
		return optionList; 
	}
	// 상품 조회/ 수정, 상품 상태 변경
	public int updateStatus(Map<String, Object> data) {
		int productList = sqlSession.update(NAMESPACE + "updateStatus", data);
		return productList; 
	}
	
	// 상품 조회/ 수정, 판매 시작 시간, 판매 종료 시간 업데이트
	public int updateDate(Map<String, Object> data) {
		int productList = sqlSession.update(NAMESPACE + "updateDate", data);
		return productList; 
	}
	
	// 상품 조회/ 수정, 판매 시작 시간, 판매 종료 시간 업데이트
	public int updateStock(Map<String, Object> data) {
		int productList = sqlSession.update(NAMESPACE + "updateStock", data);
		return productList; 
	}
	
	// 상품 조회/ 판매가 수정
	public int updatePrice(Map<String, Object> data) {
		int productList = sqlSession.update(NAMESPACE + "updatePrice", data);
		return productList; 
	}
	
	// 주문통합검색 /  통합 검색 데이터 테이블 요청
	public List<OrdersVO> getOrder(Map<String, Object> member_id) {
		List<OrdersVO> list = sqlSession.selectList(NAMESPACE + "getOrdersWithDetails", member_id);
		
		return list; 
	}
	
	// 주문통합검색 /  주문 상세 요청 데이터
	public List<Map<String, Object>> getOrderDetail(String id) {
		List<Map<String, Object>> list= sqlSession.selectList(NAMESPACE + "getOrderDetail", id);
		
		// 결과 출력
	    System.out.println("Order Detail Result:");
	    for (Map<String, Object> map : list) {
	        System.out.println(map);
	    }
		return list; 
	}
	
	// 발송관리/배송현황 / 송장번호 업데이트
	public int updateInvoiceNumber(OrdersVO data) {
		int result = sqlSession.update(NAMESPACE + "updateInvoiceNumber", data);
		return result; 
	}
	
	// 판매방해고객 등록
	public int insertBlackConsumer(BlackConsumerVO vo) {
		int result = sqlSession.insert(NAMESPACE + "insertBlackConsumer", vo);
		return result; 
	}
	
	// 판매방해고객 GET
	public List<BlackConsumerVO> getBlackConsumer(String id) {
		List<BlackConsumerVO> list= sqlSession.selectList(NAMESPACE + "getBlackConsumer", id);
		
		return list; 
	}
}
