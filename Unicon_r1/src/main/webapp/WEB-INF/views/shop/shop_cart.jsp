<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

<style>

.itemCntBox{
	width: 100px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 7px 15px;
	background: rgb(255, 255, 255);
	color: rgb(47, 52, 56);
	border: 1px solid rgb(230, 230, 230);
	border-radius: 4px;
	margin: auto;
}

.itemCntSpan{
	display: inline-block;
	font-size: 25px;
	line-height: 1;
	cursor: pointer;
}

.product-thumbnail img{
	aspect-ratio: 1 / 1; /* 원하는 가로:세로 비율 설정 */
	border-radius: 0.5rem;
}

.shop-cart-table .shop-cart td{
	padding: 11px 8px;
}


</style>

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<!-- 아래는 예시 -->
<!-- PAGE TITLE
        ================================================== -->
        ${cartAllInfo }
        
        <section class="page-title-section bg-img cover-background" data-overlay-dark="7" data-background="${pageContext.request.contextPath }/resources/new_assets/img/bg/bg5.jpg">
            <div class="container">

                <div class="row">
                    <div class="col-md-7">
                        <h1>Shop Cart</h1>
                    </div>
                    <div class="col-md-5">
                        <ul class="text-md-end mt-3 mt-md-0 ps-0">
                            <li><a href="home-1.html">Home</a></li>
                            <li><a href="#!">Shop Cart</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </section>

        <!-- SHOP CART
        ================================================== -->
        <section>
            <div class="container">

                <div class="row" style="justify-content: center;">
					<div class="col-lg-11">
                    <!-- Start Product Table -->
                    <div class="col-12 shop-cart-table">
                        <table class="table shop-cart text-center">
                            <colgroup>
                                <col class="w-100px">
                                <col>
                                <col class="w-10px" style="width: 5%;">
                                <col>
                                <col class="w-120px">
                                <col class="w-1px">
                            </colgroup>

                            <thead>
                                <tr>
                                    <th class="first"></th>
                                    <th class="text-start text-uppercase font-weight-500">상품명</th>
                                    <th class="text-start text-uppercase font-weight-500">가격</th>
                                    <th class="text-center text-uppercase font-weight-500">수량</th>
                                    <th class="text-start text-uppercase font-weight-500" style="width: 165px;">합계</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="list" items="${cartAllInfo }" varStatus="st">
                            	<tr class="${list.cart_id } product" data-prodid="${list.shopVO.product_id}">
                                    <td class="product-thumbnail text-start">
                                        <a href="/shop/shop_detail/${list.shopVO.product_id}" class="d-inline-block w-70px">
                                        <img src="${list.shopVO.product_images[0].image_src }" class="w-70px"></a>
                                    </td>
                                    <td class="text-start">
                                        <a href="/shop/shop_detail/${list.shopVO.product_id}">${list.shopVO.product_name }</a>
                                        <span class="dprice text-uppercase d-block" data-dprice="${list.shopVO.delivery_price }">
                                        판매자 : ${list.shopVO.memberVO.member_name } /
                                        ${list.shopVO.delivery_method }
                                        <fmt:formatNumber value="${list.shopVO.delivery_price }" type="number" />원
                                        
                                        </span>
                                    </td>
                                    <td class="text-start" style="width: 10%;">
                                    </td>
                                    <td class="">
                                    </td>
                                    <td class="text-start">
                                    </td>
                                    <td class="product-remove text-center" data-cartid="${list.cart_id }">
                                        <a href="#!"><i class="fas fa-times"></i></a>
                                    </td>
                                </tr>
                                
                                <c:forEach var="dlist" items="${list.cart_list }">
                                	<tr class="${list.cart_id } productOption${st.index}">
                                    <td class="product-thumbnail text-start"></td>
                                    <td class="text-start">
                                        <span class="text-uppercase d-block option"
                                        >${dlist.option_name} : ${dlist.option_value}<c:if test="${!empty dlist.option_name2}"
                                        > / ${dlist.option_name2} : ${dlist.option_value2}</c:if></span>
                                    </td>
                                    <td class="price text-start" style="width: 10%;">
                                        <fmt:formatNumber value="${(list.shopVO.product_price + dlist.option_price)
                                        *(100 - list.shopVO.discount_rate)/100}"
		                                 type="number" />원
                                    </td>
                                    <td class="product-quantity">
                                        <div class="itemCntBox">
			                            	<span class="minusBtn itemCntSpan">-</span>
			                            	<span class="itemCnt">${dlist.quantity}</span>
			                            	<span class="plusBtn itemCntSpan">+</span>
			                            </div>
                                    </td>
                                    <td class="subPrice product-subtotal text-start">
                                    <fmt:formatNumber value="${(((list.shopVO.product_price + dlist.option_price)
                                    *(100 - list.shopVO.discount_rate)/100)*dlist.quantity/100)*100}"
		                                 type="number" />원
                                    
                                    </td>
                                    <td class="option-remove text-center" data-dcartid="${dlist.cart_detail_id }">
                                        <a href="#!"><i class="fas fa-times"></i></a>
                                    </td>
                                </tr>
                                
                                </c:forEach>
                            	
                            	</c:forEach>
                                
                            </tbody>
                        </table>
                    </div>
                    <!-- End Product Table -->

                    <!-- Start Button Set -->
                    <div class="col-12 border-bottom py-4 py-lg-5 mb-4 mb-lg-0">
                        <button class="emptyCart butn small float-end ms-2"><span>장바구니 비우기</span></button>
                    </div>
                    <!-- End Button Set -->

                    <!-- Start Total Block Set -->
                    <div class="col-12 cart-total py-4 pt-lg-5">
                        <div class="row">

                            <div class="col-md-5 mb-4 mb-md-0">
                                <div id="accordion" class="accordion-style2">
                                    <div class="card">
                                        <div class="card-header" id="headingOne">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                  Coupon Code
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#accordion">
                                            <div class="card-body">

                                                    <div class="row">

                                                        <div class="col-12">

                                                            <div class="form-group">
                                                                <input type="text" class="form-control" name="coupon" placeholder="Enter Your Coupon code">
                                                            </div>

                                                        </div>

                                                    </div>

                                                    <button type="button" class="butn small"><span>Apply Code</span></button>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingTwo">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                  Calculate Shipping
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion">
                                            <div class="card-body">

                                                    <div class="row">

                                                        <div class="col-sm-12">

                                                            <div class="form-group">
                                                                <input type="text" class="form-control" name="country" placeholder="Country">
                                                            </div>

                                                        </div>

                                                        <div class="col-sm-12">

                                                            <div class="form-group">
                                                                <input type="text" class="form-control" name="state" placeholder="State / County">
                                                            </div>

                                                        </div>

                                                        <div class="col-sm-12">

                                                            <div class="form-group">
                                                                <input type="text" class="form-control" name="postcode" placeholder="Postcode">
                                                            </div>

                                                        </div>

                                                    </div>

                                                    <button type="button" class="butn small"><span>Update Totals</span></button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6 offset-lg-1 col-md-7 offset-md-0">
                                <table class="table cart-sub-total">
                                    <tbody>
                                        <tr>
                                            <th class="text-end pe-0 text-uppercase">총 상품금액</th>
                                            <td class="totalPrice text-uppercase text-end pe-0" style="width: 250px;">$1598</td>
                                        </tr>
                                        <tr>
                                            <th class="text-end pe-0 text-uppercase">총 배송비</th>
                                            <td class="totalDeliveryPrice text-uppercase text-end pe-0">Free</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-0" colspan="2">
                                                <hr>
                                            </td>
                                        </tr>
                                        <tr class="total">
                                            <th class="text-uppercase text-end pe-0">결제금액</th>
                                            <td class="payPrice text-uppercase text-end pe-0">$1598</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-0" colspan="2">
                                                <hr class="mb-0">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <form id="CartToCheckoutForm">
                                	<input type="hidden" name="member_id" value="${member_id}">
                                	
                                	<div id="CartToCheckoutFormInput"></div>
                                
	                                <button type="submit" class="butn primary float-end"><span>상품 구매하기</span></button>
                                
                                </form>
                                
                                
                            </div>
                        </div>
                    </div>
                    <!-- End Total Block Set -->
				</div>
                </div>

            </div>
        </section>
        <!-- end cart table section -->
        
        

<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->

<script>
	$(document).ready(function () {
		
		// 페이지 로드 시 총 상품금액 계산
		let totalPrice = 0; 
		$('.product-subtotal').each(function() {
			let subtotalPriceText = $(this).text().trim();
			let subtotalPrice = parseInt(subtotalPriceText.replace(/[^0-9]/g, ''));
			
			totalPrice += subtotalPrice;
		});
		
		let formattedtotalPrice = totalPrice.toLocaleString() + "원";
		$('.totalPrice').text(formattedtotalPrice);
		
		// 페이지 로드 시 배송비 계산
		let totalDeliveryPrice = 0;
		$('.dprice').each(function() {
			let deliveryPrice = $(this).data('dprice');
			
			totalDeliveryPrice += deliveryPrice;
		});
		
		let formattedtotalDeliveryPrice = totalDeliveryPrice.toLocaleString() + "원";
		$('.totalDeliveryPrice').text(formattedtotalDeliveryPrice);
		
		
		// 페이지 로드 시 결제금액 계산
		let payPrice = totalPrice + totalDeliveryPrice;
		let formattedpayPrice = payPrice.toLocaleString() + "원";
		$('.payPrice').text(formattedpayPrice);
		
		
		// 장바구니 비우기 클릭 시 로직
		$('.emptyCart').on('click', function(){
			$('.shop-cart tbody').empty();
			totalPriceCnt();
			emptyCart();
		});
		
		
		// 옵션 삭제 눌렀을 경우 td 없애기
		$('.option-remove').on('click', function(){
			let dcartid = $(this).data('dcartid');
			$(this).closest('tr').remove();
			totalPriceCnt();
			removeOption(dcartid);
			
		});
		
		// 상품 삭제 눌렀을 경우 상품관련 옵션 전부 없애기
		$('.product-remove').on('click', function(){
			pid = $(this).data('cartid');
			$('.' + pid).remove(); // 클래스명이 `pid`인 요소들 제거
			totalPriceCnt();
			removeProduct(pid);
		});
		
		// 수량 변경 로직
		$('.itemCntSpan').on('click', function () {
			
			// cart_detail_id 가져오기
			let dcartid = $(this).closest('tr').find('.option-remove').data('dcartid');
			console.log("dcartid : "+dcartid);
			
			// 숫자가 표시된 요소 선택
		    let countElement = $(this).siblings('.itemCnt'); 
		    let currentCount = parseInt(countElement.text()); // 현재 숫자 값
		    // 클래스에 따라 동작 분기
		    if ($(this).hasClass('plusBtn')) {
		        countElement.text(currentCount + 1); // 숫자 증가
		        quantityChange(dcartid, 1);
		    } else if ($(this).hasClass('minusBtn')) {
		        if (currentCount > 1) { // 최소값 1로 제한
		            countElement.text(currentCount - 1); // 숫자 감소
		            quantityChange(dcartid, -1);
		        }
		    }
		    
		 	// 합계 계산
		    let initPriceText = $(this).closest('tr').find('.price').text();
		    let initPrice = parseInt(initPriceText.replace(/[^0-9]/g, ''));
		    let Price = initPrice * parseInt(countElement.text());
		    let formattedPrice = Price.toLocaleString() + "원";
		    $(this).closest('tr').find('.product-subtotal').text(formattedPrice);
		    
		    totalPriceCnt();
		});
		
		// 상품 구매하기 클릭 시 상품 주문/주문상세 테이블에 저장
		$('#CartToCheckoutForm').on('submit', function(e){
			e.preventDefault();
			CartToCheckout();
			Swal.fire({
	  			  title: '주문페이지로 이동합니다.',
	  			  icon: 'success',
	  			  confirmButtonColor: '#3085d6',
	  			  customClass: {
	  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
	  			  }
	 			}).then((result) => {
	 			    if (result.isConfirmed) { 
	 			        window.location.href = '/orders/checkout'; // 이동할 URL
	 			    }
	 			});
		});
		
		
		
		
		
	});//readay
</script>


<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
