package com.Unicon.persistence;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Unicon.domain.CartDetailVO;
import com.Unicon.domain.CartVO;
import com.Unicon.domain.CategoryDataVO;
import com.Unicon.domain.InterestVO;
import com.Unicon.domain.OptionVO;
import com.Unicon.domain.OrdersDetailOptionVO;
import com.Unicon.domain.OrdersDetailVO;
import com.Unicon.domain.OrdersVO;
import com.Unicon.domain.ReviewVO;
import com.Unicon.domain.ShopVO;

@Repository("shopDAO")
public class ShopDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ShopDAO.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.Unicon.mapper.ShopMapper";
	
		
	// shop페이지 접속 시 모든 상품정보 가져오기
	public List<ShopVO> getProductAll(){
		return sqlSession.selectList(NAMESPACE+".getProductAll");
	}
		
	// 상세페이지 이동 시 해당 상품정보 가져오기
	public ShopVO getProduct(String product_id) {
		return sqlSession.selectOne(NAMESPACE+".getProduct", product_id);
	}
	
	// 옵션1 정보 가져오기
	public List<OptionVO> getOption1(String product_id) {
		return sqlSession.selectList(NAMESPACE+".getOption1", product_id);
	}
	
	// 옵션1 정보 가져오기(단독형 - 가격포함)
	public List<OptionVO> getOption1ForSole(String product_id) {
		return sqlSession.selectList(NAMESPACE+".getOption1ForSole", product_id);
	}
	
	
	// 단독형 - 옵션 선택 시 해당 옵션가격 가져오기
	public int getSoleOptionPrice(Map<String, String> optionPriceMap) {
		return sqlSession.selectOne(NAMESPACE+".getSoleOptionPrice", optionPriceMap);
	}
	
	
	// 조합형 - 옵션1 선택시 옵션2 세부옵션 가져오기
	public List<OptionVO> getOption(Map<String, String> optionMap) {
		return sqlSession.selectList(NAMESPACE+".getOption", optionMap);
	}
	
	// 조합형 - 옵션1 옵션2 선택 시 해당 옵션 가격 가져오기
	public int getOptionPrice(Map<String, String> optionPriceMap) {
		return sqlSession.selectOne(NAMESPACE+".getOptionPrice", optionPriceMap);
	}
	
	// 최신 카트번호 가져오기
	public int getCartid() {
		Integer cart_id = sqlSession.selectOne(NAMESPACE+".getCartid");
		return(cart_id == null) ? 0 : cart_id;
	}
	
	// cart_id가져오기 (중복여부 확인)
	public int getCartidToCheck(CartVO vo) {
		Integer cart_id = sqlSession.selectOne(NAMESPACE+".getCartidToCheck", vo);
		return (cart_id == null) ? 0 : cart_id;
	}
	
	// 선택한 상품정보가 이미 장바구니에 있을 시 기존의 수량 가져와서 더한 다음 update
	// 해당 옵션이 없을 경우에는 insert 실행
	public void updateCart(CartVO vo) {
		
		for(CartDetailVO cdvo : vo.getCart_list()) {
			// 옵션이 일치하는 값이 존재하는지 수량을 가져와서 확인
			Integer quantity = sqlSession.selectOne(NAMESPACE+".optionQuantityCheck", cdvo);
			
			if(quantity == null) {
				//해당 옵션값이 없음 => insert
				sqlSession.insert(NAMESPACE+".saveCartDetailAfterCheck", cdvo);
			} else {
				// 해당 옵션이 이미 있음 가져온 수량에 현재 수량을 더한 값을 저장한다음 => update
				int existQuantity = cdvo.getQuantity();
				cdvo.setQuantity(existQuantity + quantity);
				
				sqlSession.update(NAMESPACE+".updateCartDetailAfterCheck", cdvo);
				
			}
		}
	}
	
	
	// 상세페이지에서 선택한 상품정보 cart, cart_detail 저장하기
	public void saveCart(CartVO vo) {
		//cart 테이블에 저장
		sqlSession.insert(NAMESPACE+".saveCart", vo);
		
		//cart detail 테이블에 저장
		sqlSession.insert(NAMESPACE+".saveCartDetail", vo.getCart_list());
	}
	
	
	// 장바구니 페이지 이동 시 장바구니 정보 가져오기
	public List<CartVO> getCartAll(String member_id){
		return sqlSession.selectList(NAMESPACE+".getCartAll", member_id);
	}
	
	
	// 장바구니에서 수량 조절 시 db 실시간 저장
	public void quantityChange(Map<String, Integer> quantityChangeMap) {
		sqlSession.update(NAMESPACE+".quantityChange", quantityChangeMap);
	}
	
	// 옵션 삭제 시 ajax구현(디비 실시간 반영)
	public void removeOption(int cart_detail_id) {
		sqlSession.delete(NAMESPACE+".removeOption", cart_detail_id);
	}
	
	// 상품 삭제시 ajax구현(디비 실시간 반영)
	public void removeProduct(int cart_id) {
		sqlSession.delete(NAMESPACE+".removeProduct", cart_id);
		sqlSession.delete(NAMESPACE+".removeProductOption", cart_id);
	}
	
	// member_id에 해당하는 모든 cart_id 가져오기
	public List<CartVO> getCartIdForEmpty(String member_id) {
		return sqlSession.selectList(NAMESPACE+".getCartIdForEmpty", member_id);
	}
	
	// cart와 cart_detail에서 정보 삭제하기
	public void removeCartAndDetail(String member_id, List<CartVO> cartIds) {
		// cart 테이블 삭제
		sqlSession.delete(NAMESPACE+".removeCart", member_id);
		
		// cart_detail 테이블 삭제
		sqlSession.delete(NAMESPACE+".removeCartDetail", cartIds);
	}
	
	// 장바구니에서 구매하기 시 주문테이블로 저장
	public void cartToCheckout(OrdersVO vo) {
		
		// 0. order_id 있는지 없는지 확인하고 없으면 만들기
        LocalDate today = LocalDate.now();
        int year = today.getYear();
        String order_id = "order-" +year+"000001";
        
        // 올해 첫 주문Id가 있는지 확인하기
        String checkOrderId = sqlSession.selectOne(NAMESPACE+".checkOrderId");
        
        if(checkOrderId != null) {
        	//있으면 order_id를 가장 최근 id에서 +1
        	order_id = "order-"+(Integer.parseInt(checkOrderId.substring(6))+1);
        }
        
        // orders - order_id set
        vo.setOrder_id(order_id);
		
        // orders_detail - order_id set
        for(OrdersDetailVO odvo :vo.getOrdersDetails()) {
        	odvo.setOrder_id(order_id);
        }
        
        
        // 현재 member_id와 임시저장 상태인 order_id 가져오기
        String cancelorder_id = sqlSession.selectOne(NAMESPACE+".getOrderIdToMemberId", vo);
        //0-1. 기존에 임시저장된 orders/ordersDetail/ordersDetailOption 상태 '취소종료'로 변경
        sqlSession.update(NAMESPACE+".updateOrdersToCancel", cancelorder_id);
        sqlSession.update(NAMESPACE+".updateOrdersDetailToCancel", cancelorder_id);
        sqlSession.update(NAMESPACE+".updateOrdersDetailOptionToCancel", cancelorder_id);
        
        // 1. orders테이블에 임시저장 상태로 생성
 		sqlSession.insert(NAMESPACE+".insertOrders", vo);
		
        // 2. orders_detail 테이블 저장
        sqlSession.insert(NAMESPACE+".insertOrdersDetail", vo.getOrdersDetails());
		
        // 3. orders_detail_id 가져오기
        List<OrdersDetailVO> odvo =	sqlSession.selectList(NAMESPACE+".getOrderDid");
        
        // 4. orders_detail_option - product_id set
        for(int i =0; i<vo.getOrdersDetails().size();i++) {
        	for(OrdersDetailOptionVO odovo : vo.getOrdersDetails().get(i).getOrdersDetailOptions()) {
        		odovo.setOrder_detail_id(odvo.get(i).getOrder_detail_id());
        		odovo.setOrder_id(order_id);
        	}
        }
		
		// 5. orders_detail_option 테이블 저장(임시저장 상태)
		for(int i =0; i<vo.getOrdersDetails().size();i++) {
			sqlSession.insert(NAMESPACE+".insertOrdersDetailOptions", vo.getOrdersDetails().get(i).getOrdersDetailOptions());
		}
	}
	
	// 카테고리 대분류 선택 시 소분류 데이터 가져오기
	public CategoryDataVO makeCategoryValue(int category_code) {
		return sqlSession.selectOne(NAMESPACE+".makeCategoryValue", category_code);
	}
	
	// 상품 페이징 처리(첫 로딩시)
	public List<ShopVO> shopPaging(String product_category_value){
		return sqlSession.selectList(NAMESPACE+".shopPaging", product_category_value);
	}
	
	
	// 이미 등록된 관심상품인지 확인
	public InterestVO checkInterest(Map<String, String> addInterestMap) {
		return sqlSession.selectOne(NAMESPACE+".checkInterest", addInterestMap);
	}
	
	
	// 하트 눌렀을때 관심상품으로 등록하기
	public void addInterest(Map<String, String> addInterestMap) {
		sqlSession.insert(NAMESPACE+".addInterest", addInterestMap);
	}
	
	// 리뷰정보 가져오기
	public List<ReviewVO> getReview(String product_id){
		return sqlSession.selectList(NAMESPACE+".getReview", product_id);
	}
	
	// 세일품목 정보 가져오기(4개)
	public List<ShopVO> getShopItemForMain(){
		return sqlSession.selectList(NAMESPACE+".getShopItemForMain");
	}
	
	
	
	
	
}
