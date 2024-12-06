<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<%-- ${petAllInfo } --%>
	
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
                        <h4 style="margin-bottom: 40px;">주문배송관리</h4>
                        
                        <div class="filtering col-sm-12 text-center" style="margin-bottom: 40px;">
	                        <span id="myUni" class="active">주문배송내역</span>
	                        <span id="inUni">관심상품</span>
	                        <span id="inItem">리뷰작성</span>
	                    </div>
                        
                        <div id="ordersContent">
                        
                        <div class="box-shadow-large px-3 pt-4 pb-1" style="margin-bottom: 40px;">
                        	<div class="process-steps-xs">
                                <ul class="left-holder row mb-0" style="padding-left: 0;">
                                    <li class="col-6 col-md-2">
                                        <a href="#!"><div class="process-step-xs center-holder">
                                            <div class="process-step-icon"><i class="fa-regular fa-hourglass-half"></i></div>
                                            <h3>결제대기</h3>
                                            <h3>1</h3>
                                        </div></a>
                                    </li>
                                    <li class="col-6 col-md-2">
                                        <a href="#!"><div class="process-step-xs center-holder">
                                            <div class="process-step-icon"><i class="fa-regular fa-credit-card"></i></div>
                                            <h3>결제완료</h3>
                                            <h3>1</h3>
                                        </div></a>
                                    </li>
                                    <li class="col-6 col-md-2">
                                        <div class="process-step-xs center-holder">
                                            <div class="process-step-icon"><i class="fa-solid fa-box-open"></i></div>
                                            <h3>배송준비중</h3>
                                        </div>
                                    </li>
                                    <li class="col-6 col-md-2">
                                        <div class="process-step-xs center-holder">
                                            <div class="process-step-icon"><i class="fa-solid fa-truck-fast"></i></div>
                                            <h3>배송중</h3>
                                        </div>
                                    </li>
                                    <li class="col-6 col-md-2">
                                        <div class="process-step-xs center-holder">
                                            <div class="process-step-icon"><i class="fa-solid fa-people-carry-box"></i></div>
                                            <h3>배송완료</h3>
                                        </div>
                                    </li>
                                    <li class="col-6 col-md-2">
                                        <div class="process-step-xs center-holder">
                                            <div class="process-step-icon"><i class="fa-solid fa-check-to-slot"></i></div>
                                            <h3>구매확정</h3>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div> <!-- common -->
                        
                        <div class="row" style="margin-bottom: 40px;">
                              <div class="col-12 col-md-auto">
                                  <div class="row justify-content-center">
                                      <div class="col-auto my-2 my-md-0">
                                      	<select id="resionSelector" class="form-control form-select" name="news_resion">
                                              <option value="전체">전체기간</option>
											    <option value="1개월">1개월 전</option>
											    <option value="3개월">3개월 전</option>
											    <option value="6개월">6개월 전</option>
											    <option value="1년">1년 전</option>
                                           </select>
                                      </div>
                                      <div class="col-auto my-2 my-md-0" style="padding-left: 0;">
                                      	<select id="filterSelector" class="form-control form-select">
                                              <option value="0">정렬</option>
                                              <option value="1">결제완료</option>
                                              <option value="2">배송중</option>
                                              <option value="3">배송완료</option>
                                              <option value="4">구매확정</option>
                                           </select>
                                      </div>
                                  </div>
                              </div>
                          </div>
                        	
                       	  <div id="orderItems">
                       	  
                          <div class="border rounded ps-3 pe-4 py-3 orderItem mb-4">
	                          <div class="row">
	                              <div class="col-sm-12 mb-4 mb-md-0" style="display: flex; justify-content: space-between;">
	                              	  <h5 class="h6 font-weight-600 mb-4">구매확정완료</h5>
	                              	  <a href="#!" class="readmore"><span>배송조회</span></a>
	                              </div>
	                              <div class="col-sm-2 mb-4 mb-md-0">
	                              	<div class="orderImage">
	                                  <img class="rounded" src="${pageContext.request.contextPath }/resources/new_assets/img/dog.jpg" alt="...">
	                              	</div>
	                              </div>
	                              <div class="col-sm-10">
	                                  <p class="mb-0">주문일 : 2024.12.05.(월)</p>
	                                  <p class="mb-0 font-weight-600">부드러운 슬림 카스테라 워싱 항균 옥수수솜 간절기/여름 이불세트</p>
	                                  <p class="mb-0" style="color: #aaa;">색상: 오션블루 / 구성 및 사이즈: 슈퍼싱글 이불베개세트(SS이불+베개커버1P)</p>
	                                  <div style="display:flex; justify-content: space-between; align-items: end;">
	                                  	<div>
		                                  <h5 class="mb-2">40,000원</h5>
		                                  <a href="/mypage/orders_detail" class="readmore"><span>상세보기</span></a>
	                                  	</div>
	                                  	<div>
		                                  <button class="btn btn-outline-secondary me-2" style="min-width: 150px;">문의하기</button>
		                                  <button class="btn btn-outline-success" style="min-width: 150px;">리뷰쓰기</button>
	                                  	</div>
	                                  </div>
	                              </div>
	                          </div>
                          </div>
                          
                        
                        
                        
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
	
	
	
});//readay

</script>



<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
