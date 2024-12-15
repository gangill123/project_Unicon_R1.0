<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

<style>

.filtering span{
	margin-right: 50px;
}

.product-grid > [class*="col-"]{
	margin-top: 0;
}

.services-single-menu li a {
	font-size: 20px;
}

.services-single-menu li a:after {
	height: 2px;
}


.process-step-xs h3{
	font-size: 16px;
}

.process-step-xs:hover,
.process-step-xs:hover h3 {
	color: black;
    font-weight: bold;
}

.orderImage {
	aspect-ratio: 1/1;
	overflow: hidden;
}

.orderImage img{
	width: 100%;
	height: 100%;
	object-fit: fill;
}

.btn-outline-success{
	color: #86bc42;
	border-color: #86bc42;
}

.btn-outline-success:hover{
	color: #fff;
    background-color: #86bc42;
    border-color: #86bc42;
}


</style>

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
	<%-- ${orderDetailInfo } --%>
	<section  style="padding-top: 50px;">
            <div class="container">
            	<div class="line-title">
			        <h4 class="mb-0">마이페이지</h4>
			    </div>
                <div class="row">

                    <!-- start left side section -->
                    <div class="col-lg-3 order-2 order-lg-1">
                        <div class="pe-lg-1-9 pe-xl-2-3">
                        <!-- start services -->
                        <div class="services-single-left-box">
                            <div class="services-single-menu mb-1-9">
                                <ul class="m-0 list-unstyled">
                                    <li><a href="/mypage">프로필 관리</a></li>
                                    <li><a href="#!">커뮤니티 관리</a></li>
                                    <li class="active"><a href="/mypage/orders">주문 관리</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- end services -->
                        
                    </div>
                    </div>
                    <!-- end left side section -->

                    <!-- start right side section -->
                    <div class="col-lg-9 order-1 order-lg-2 mb-1-9 mb-lg-0">
                        <div class="services-single-right">
	                        <div style="margin-bottom: 60px;">
		                        <h4 class="mb-1">주문상세</h4>
		                        <p class="mb-1">${orderDetailInfo.formatted_paydate }
		                         (주문번호 : ${orderDetailInfo.order_id })</p>
	                        </div>
                        	
                       	  <h5 class="mb-3">상품정보</h5>
                          <div class="border rounded px-3 py-3 orderItem" style="margin-bottom: 60px;">
	                          <div class="row">
	                          	<div class="col-sm-12 mb-2">
	                          		<div style="display: flex; justify-content: space-between; align-items: center;">
		                          		<div>
									        <h5 class="mb-0">${orderDetailInfo.ordersDetails[0].shopVO.product_seller_name } <i class="fa-solid fa-store"></i></h5>
									        <c:choose>
									        	<c:when test="${orderDetailInfo.ordersDetails[0].delivery_price == 0 }">
											        <p class="mb-1">무료배송</p>
									        	</c:when>
									        	<c:otherwise>
											        <p class="mb-1">배송비 : <fmt:formatNumber value="${orderDetailInfo.ordersDetails[0].delivery_price }" type="number" />원</p>
									        	</c:otherwise>
									        </c:choose>
		                          		</div>
	                          		</div>
							    </div>
							    <c:forEach var="ordersDetailOption" items="${orderDetailInfo.ordersDetails[0].ordersDetailOptions }">
	                              <div class="col-sm-12 border-top pt-3" style="display: flex; justify-content: space-between;">
	                              	<div>
	                              	  <h5 class="font-weight-600 mb-4" style="display: inline; color: #aaa;">${ordersDetailOption.orders_detail_option_status }</h5>
	                              	</div>
	                              	<c:if test="${ordersDetailOption.orders_detail_option_status == '배송중' || 
				                              	  ordersDetailOption.orders_detail_option_status == '배송완료' || 
				                              	  ordersDetailOption.orders_detail_option_status =='구매확정' }">
	                              	  <a href="#!" class="readmore"><span>배송조회</span></a>
	                              	</c:if>
	                              </div>
	                              <div class="col-sm-2" style="margin-bottom: 20px;">
	                              	<div class="orderImage">
	                                  <img class="rounded" src="${orderDetailInfo.ordersDetails[0].shopVO.product_images[0].image_src }" alt="...">
	                              	</div>
	                              </div>
	                              <div class="col-sm-10 mb-3">
	                                  <p class="mb-0">주문일 : ${orderDetailInfo.formatted_paydate }</p>
	                                  <a href="/shop/shop_detail/${orderDetailInfo.ordersDetails[0].shopVO.product_id }">
	                                  <p class="mb-0 font-weight-600">${orderDetailInfo.ordersDetails[0].shopVO.product_name }</p></a>
	                                  <p class="mb-0" style="color: #aaa;">${ordersDetailOption.product_option }</p>
		                              <p class="mb-0 pe-2 border-end" style="display: inline;">
	                              	  <fmt:formatNumber value="${ordersDetailOption.option_price }" type="number" />원</p>
	                              	  <p class="mb-0 ps-2" style="color: #aaa; display: inline;">
	                                  ${ordersDetailOption.quantity }개</p>
	                                  <div style="display:flex; justify-content: flex-end; align-items: end;">
		                                  <button type="button" class="inquiryBtn btn btn-outline-secondary me-2" data-id="${ordersDetailOption.order_detail_option_id }"
		                                  style="min-width: 150px;">문의하기</button>
	                                  	  <c:if test="${ordersDetailOption.orders_detail_option_status == '구매확정' }">
	                                  	  	<c:if test="${ordersDetailOption.review_check == 0 }">
			                                  	<button class="reviewBtn btn btn-outline-success" data-id="${ordersDetailOption.order_detail_option_id }"
			                                  	style="min-width: 150px;">리뷰쓰기</button>
	                                  	  	</c:if>
	                                  	  	<c:if test="${ordersDetailOption.review_check == 1 }">
			                                  	<button class="reviewBtn btn btn-outline-success" disabled style="min-width: 150px;">리뷰 작성완료</button>
	                                  	  	</c:if>
		                                  </c:if>
		                                  <c:if test="${ordersDetailOption.orders_detail_option_status == '결제완료' }">
		                                  	<button class="cancelBtn btn btn-outline-danger" data-id="${ordersDetailOption.order_detail_option_id }"
		                                  	style="min-width: 150px;">취소신청</button>
		                                  </c:if>
	                                  </div>
	                              </div>
	                              </c:forEach>
	                          </div>
                          </div>
                          
                          <h5 class="mb-3">배송지정보</h5>
                          <div class="border rounded px-3 py-3 orderItem" style="margin-bottom: 60px;">
	                          <ul class="ps-0 mb-0">
	                          	<li class="row">
	                          		<div class="col-sm-2"><p class="mb-1" style="color: #aaa;">받는 사람</p></div>
	                          		<div class="col-sm-10"><p class="mb-1">${orderDetailInfo.recipient }</p></div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-2"><p class="mb-1" style="color: #aaa;">연락처</p></div>
	                          		<div class="col-sm-10"><p class="mb-1">${orderDetailInfo.recipient_phone }</p></div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-2"><p class="mb-1" style="color: #aaa;">주소</p></div>
	                          		<div class="col-sm-10"><p class="mb-1">
	                          		${orderDetailInfo.address }, ${orderDetailInfo.detail_address }</p></div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-2"><p class="mb-1" style="color: #aaa;">배송메모</p></div>
	                          		<div class="col-sm-10"><p class="mb-1">${orderDetailInfo.delivery_comment }</p></div>
	                          	</li>
	                          </ul>
                          </div>
                          
                          <div class="row">
                          	<div class="col-sm-6">
                          	<h5 class="mb-3">결제정보</h5>
                   			<div class="border rounded px-3 py-3 orderItem mb-4">
                   				<div>
		                          <ul class="ps-0 mb-0">
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2" style="color: #aaa;">상품금액</p></div>
		                          		<div class="col-sm-8" style="text-align: end;"><p class="mb-1">
		                          		<fmt:formatNumber value="${orderDetailInfo.ordersDetails[0].product_subprice }" type="number" />원</p></div>
		                          	</li>
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2" style="color: #aaa;">배송비</p></div>
		                          		<div class="col-sm-8" style="text-align: end;"><p class="mb-1">
		                          		<fmt:formatNumber value="${orderDetailInfo.ordersDetails[0].delivery_price }" type="number" />원</p></div>
		                          	</li>
		                          </ul>
		                          
		                          <div>
		                          	<div class="border-bottom my-3"></div>
		                          	<ul class="ps-0 mb-0">
		                          		<li class="row">
			                          		<div class="col-sm-4"><p class="mb-2">주문금액</p></div>
			                          		<div class="col-sm-8 font-weight-600" style="text-align: end; font-size: 1.2rem;"><p class="product_total_price mb-1">
			                          		40,000원</p></div>
		                          		</li>
		                          	</ul>
		                          </div>
                   				</div>
                          	</div>
                          	</div>
                          	
                          	<div class="col-sm-6">
                          	<h5 class="mb-3">주문자정보</h5>
                   			<div class="border rounded px-3 pt-2 orderItem mb-3">
                   				<div>
		                          <ul class="ps-0 mb-0">
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2" style="color: #aaa;">주문자</p></div>
		                          		<div class="col-sm-8"><p class="mb-1">${orderDetailInfo.memberVO.member_name }</p></div>
		                          	</li>
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2" style="color: #aaa;">연락처</p></div>
		                          		<div class="col-sm-8"><p class="mb-1">${orderDetailInfo.memberVO.member_tel }</p></div>
		                          	</li>
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2" style="color: #aaa;">이메일</p></div>
		                          		<div class="col-sm-8"><p class="mb-1">${orderDetailInfo.memberVO.member_email }</p></div>
		                          	</li>
		                          </ul>
                   				</div>
                          	</div>
		                     <div class="bg-light rounded" style="text-align: center; padding: 7px;">
		                     	<p style="color: #aaa; display: inline;">유니콘 고객센터</p>
		                     	<p style="display: inline;">1234-1234</p>
		                     	</div>
                          	</div>
                          </div>
                        </div>
                        <div class="row" style="justify-content: center;">
		                    <div class="col-lg-4 order-1 order-lg-2 mt-5">
		                        <button class="butn w-100" onclick="location.href='/mypage/orders';"><span>이전으로</span></button>
							</div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
	
	
		<!-- 리뷰 모달 -->
        <div class="modal fade reviewModal" tabindex="-1" aria-labelledby="gridSystemModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog" role="document" style="min-width: 650px;">
            	<form id="reviewCreateForm" action="/mypage/reviewCreate" method="post">
                <div id="reviewModalContent" class="modal-content">
                </div>
                </form>
            </div>
        </div>
        
		<!-- 문의 모달 -->
        <div class="modal fade inquiryModal" tabindex="-1" aria-labelledby="gridSystemModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog" role="document" style="min-width: 650px;">
            	<form id="inquiryCreateForm" action="/mypage/inquiryCreate" method="post">
                <div id="inquiryModalContent" class="modal-content">
                </div>
                </form>
            </div>
        </div>
	
	

<!--====================================작성부=====================================-->

<script>
$(document).ready(function () {
	
	let product_total_price = '${orderDetailInfo.ordersDetails[0].product_subprice + orderDetailInfo.ordersDetails[0].delivery_price}';
	let formattedTotalPrice = new Intl.NumberFormat().format(product_total_price);
	
	//console.log(formattedTotalPrice);
	
	$('.product_total_price').text(formattedTotalPrice+'원');
	
	
	// 리뷰작성 클릭 시 모달열기
	$('.reviewBtn').on('click', function(){
		let order_detail_option_id = $(this).data('id');
		reviewModal(order_detail_option_id);
	});
	
	// 리뷰 submit 시 알람 및 submit
	$('#reviewCreateForm').on('submit',function(e){
		e.preventDefault();
		reviewAlert();
	});
	
	
	// 취소신청 클릭 시 알람창
	$('.cancelBtn').on('click', function(){
		let order_detail_option_id = $(this).data('id');
		let order_detail_id = '${orderDetailInfo.ordersDetails[0].order_detail_id }';
		cancelAlert(order_detail_id, order_detail_option_id);
	});
	
	
	// 문의하기 클릭 시 모달열기
	$('.inquiryBtn').on('click', function(){
		let order_detail_option_id = $(this).data('id');
		//console.log(order_detail_option_id);
		inquiryModal(order_detail_option_id);
	});
	
	// 리뷰 submit 시 알람 및 submit
	$('#inquiryCreateForm').on('submit',function(e){
		e.preventDefault();
		inquiryAlert();
	});
	
	
	
});//readay
</script>



<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
