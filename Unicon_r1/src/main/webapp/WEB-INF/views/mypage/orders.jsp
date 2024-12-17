<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

<style>

.filtering span{
	margin-right: 50px;
	font-size: 18px;
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

.orderItem:hover Img{
    transform: scale(1.1); /* 10% 확대 */
    transition: transform 0.5s ease;
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
<%-- 	${ordersInfos } --%>
<%-- 	${ordersCntInfo } --%>
	
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
                                    <li><a href="/community/mypage/profile">커뮤니티 관리</a></li>
                                    <li class="active"><a href="/mypage/orders">주문 관리</a></li>
                                    <li><a href="/volunteer/mylist">봉사활동 관리</a></li>
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
                        <h4 style="margin-bottom: 40px;">주문배송관리</h4>
                        
                        <div id="ordersContent">
                        
                        <div class="box-shadow-large px-3 pt-4 pb-1" style="margin-bottom: 40px;">
                        	<div class="process-steps-xs">
                                <ul class="left-holder row mb-0" style="padding-left: 0; justify-content: center;">
                                    <li class="col-6 col-md-2">
                                        <a class="ordersStatusCheck" href="#!"><div class="process-step-xs center-holder">
                                            <div class="process-step-icon"><i class="fa-regular fa-credit-card"></i></div>
                                            <h3>결제완료</h3>
                                            <h3>${ordersCntInfo[0] }</h3>
                                        </div></a>
                                    </li>
                                    <li class="col-6 col-md-2">
                                        <a class="ordersStatusCheck" href="#!"><div class="process-step-xs center-holder">
                                            <div class="process-step-icon"><i class="fa-solid fa-box-open"></i></div>
                                            <h3>배송준비중</h3>
                                            <h3>${ordersCntInfo[1] }</h3>
                                        </div></a>
                                    </li>
                                    <li class="col-6 col-md-2">
                                        <a class="ordersStatusCheck" href="#!"><div class="process-step-xs center-holder">
                                            <div class="process-step-icon"><i class="fa-solid fa-truck-fast"></i></div>
                                            <h3>배송중</h3>
                                            <h3>${ordersCntInfo[2] }</h3>
                                        </div></a>
                                    </li>
                                    <li class="col-6 col-md-2">
                                        <a class="ordersStatusCheck" href="#!"><div class="process-step-xs center-holder">
                                            <div class="process-step-icon"><i class="fa-solid fa-people-carry-box"></i></div>
                                            <h3>배송완료</h3>
                                            <h3>${ordersCntInfo[3] }</h3>
                                        </div></a>
                                    </li>
                                    <li class="col-6 col-md-2">
                                        <a class="ordersStatusCheck" href="#!"><div class="process-step-xs center-holder">
                                            <div class="process-step-icon"><i class="fa-solid fa-check-to-slot"></i></div>
                                            <h3>구매확정</h3>
                                            <h3>${ordersCntInfo[4] }</h3>
                                        </div></a>
                                    </li>
                                </ul>
                            </div>
                        </div> <!-- common -->
                        
                        <div class="row" style="margin-bottom: 40px;">
                              <div class="col-12 col-md-auto">
                                  <div class="row justify-content-center">
                                      <div class="col-auto my-2 my-md-0">
                                      	<select id="timeSelector" class="form-control form-select" name="news_resion">
                                              <option value="0">전체기간</option>
											    <option value="1">1개월 전</option>
											    <option selected value="3">3개월 전</option>
											    <option value="6">6개월 전</option>
											    <option value="12">1년 전</option>
											    <option value="24">2년 전</option>
											    <option value="36">3년 전</option>
                                           </select>
                                      </div>
                                      <div class="col-auto my-2 my-md-0" style="padding-left: 0;">
                                      	<select id="statusSelector" class="form-control form-select">
                                              <option disabled selected value="0">정렬</option>
                                              <option value="결제완료">결제완료</option>
                                              <option value="배송준비중">배송준비중</option>
                                              <option value="배송중">배송중</option>
                                              <option value="배송완료">배송완료</option>
                                              <option value="구매확정">구매확정</option>
                                           </select>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          
                        <div id ="orderItemsContent">
                        
                        <c:forEach var="orders" items="${ordersInfos }">
                        <div style="margin-bottom: 50px;">
                        <h5 style="display: inline;">${orders.formatted_paydate }</h5>
                        <p style="display: inline; color: #aaa;">(주문번호 : ${orders.order_id })</p>
                        <c:forEach var="ordersDetail" items="${orders.ordersDetails }">
                        
                       	  <div id="orderItems">
                       	  
                          <div class="border rounded ps-3 pe-4 py-3 orderItem mb-1">
	                          <div class="row">
	                              <div class="col-sm-12 mb-4 mb-md-0" style="display: flex; justify-content: space-between;">
	                              	  <h5 class="h6 font-weight-600 mb-4">${ordersDetail.orders_detail_status}</h5>
	                              	  <c:if test="${ordersDetail.orders_detail_status == '배송중' || 
				                              	  ordersDetail.orders_detail_status == '배송완료' || 
				                              	  ordersDetail.orders_detail_status =='구매확정' }">
		                              	  <a href="/orders/orders_detail/${ordersDetail.order_detail_id }" class="readmore"><span>배송조회</span></a>
	                              	  </c:if>
	                              </div>
	                              <div class="col-sm-2 mb-4 mb-md-0">
	                              	<div class="orderImage">
	                                  <img class="rounded" src="${ordersDetail.shopVO.product_images[0].image_src }" alt="...">
	                              	</div>
	                              </div>
	                              <div class="col-sm-10">
	                                  <p class="mb-0">주문일 : ${orders.formatted_paydate }</p>
	                                  <a href="/shop/shop_detail/${ordersDetail.shopVO.product_id }">
	                                  <p class="mb-0 font-weight-600">${ordersDetail.shopVO.product_name }</p></a>
	                                  <p class="mb-0" style="color: #aaa;">${ordersDetail.ordersDetailOptions[0].product_option }
	                                   외 ${ordersDetail.ordersDetailOptions.size() -1 }건</p>
	                                  <div style="display:flex; justify-content: space-between; align-items: end;">
	                                  	<div>
		                                  <h5 class="mb-2"><fmt:formatNumber value="${ordersDetail.product_subprice + ordersDetail.delivery_price }" type="number" />원</h5>
		                                  <a href="/mypage/orders_detail/${ordersDetail.order_detail_id }" class="readmore"><span>상세보기</span></a>
	                                  	</div>
	                                  	<div>
		                                  <button class="btn btn-outline-secondary me-2" style="min-width: 150px;"
		                                  onclick="location.href='/mypage/orders_detail/${ordersDetail.order_detail_id }';">문의하기</button>
		                                  <c:if test="${ordersDetail.orders_detail_status == '구매확정' }">
		                                  	<button class="btn btn-outline-success" style="min-width: 150px;"
		                                  onclick="location.href='/mypage/orders_detail/${ordersDetail.order_detail_id }';">리뷰쓰기</button>
		                                  </c:if>
		                                  <c:if test="${ordersDetail.orders_detail_status == '결제완료' }">
		                                  	<button class="btn btn-outline-danger" style="min-width: 150px;"
		                                  	onclick="location.href='/mypage/orders_detail/${ordersDetail.order_detail_id }';">취소신청</button>
		                                  </c:if>
	                                  	</div>
	                                  </div>
	                              </div>
	                          </div>
                          </div>
                          
                          </div>
                          </c:forEach>
                          </div>
                        </c:forEach>
                        
                        
                        </div>	
                        
                        	</div>
                        </div>
                    </div>
                    <!-- end right side section -->

                </div>
            </div>
        </section>
	
	
	
	
	

<!--====================================작성부=====================================-->

<script>
$(document).ready(function () {
	
	// 주문상태 클릭 시 화면 재구성
	$('.ordersStatusCheck').on('click',function(){
		//alert("ok");
		$('#timeSelector').val(0);
		status = $(this).find('h3:first').text();
		monthVal = 0;
		//console.log(status);
		getOrdersInfoToStatus(status, monthVal);
	});
	
	// 시간필터 선택시 상태 필터값 초기화
	$('#timeSelector').on('change',function(){
		$('#statusSelector').val(0);
	});
	
	// 시간필터 선택 후 상태필터 적용 시 화면 재구성
	$('#statusSelector').on('change',function(){
		
		status = $(this).val();
		monthVal = parseInt($('#timeSelector').val(), 10);
	    
		getOrdersInfoToStatus(status, monthVal);
	});
	
	
	// 마이페이지 상단 탭 클릭 시 화면 전환
	$('.filtering span').on('click', function(){
		//console.log($(this).data('id'));
		let tapValue = $(this).data('id');
		
		if(tapValue == 'orders'){
			//console.log(tapValue);
			getOrdersInfoToStatus('all', 36);
		}else {
			console.log(tapValue);
		}	
		
		
	});
	
	
	
	
	
	
	
	
	
});//readay

</script>



<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
