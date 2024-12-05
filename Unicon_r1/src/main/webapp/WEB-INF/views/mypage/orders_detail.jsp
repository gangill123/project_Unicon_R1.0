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
	                        <div style="margin-bottom: 60px;">
		                        <h4 class="mb-1">주문상세</h4>
		                        <p class="mb-1">2024.12.05.(화) 주문(주문번호 123456789)</p>
	                        </div>
                        	
                       	  <h5 class="mb-3">상품정보</h5>
                          <div class="border rounded px-3 py-3 orderItem" style="margin-bottom: 60px;">
	                          <div class="row">
	                          	<div class="line-title col-sm-12 mb-2">
	                          		<div style="display: flex; justify-content: space-between; align-items: center;">
		                          		<div>
									        <h5 class="mb-0">유니콘스토어 <i class="fa-solid fa-store"></i></h5>
									        <p class="mb-1">무료배송</p>
		                          		</div>
		                          		<button type="button" class="btn btn-outline-secondary me-2" style="min-width: 150px;">문의하기</button>
	                          		</div>
							    </div>
	                              <div class="col-sm-12 my-2" style="display: flex; justify-content: space-between;">
	                              	<div>
	                              	  <h5 class="font-weight-600 mb-4" style="display: inline; color: #aaa;">구매확정완료</h5>
	                              	  <span style="color: #aaa;"> 12/05(목) 도착 완료</span>
	                              	</div>
	                              	  <a href="#!" class="readmore"><span>배송조회</span></a>
	                              </div>
	                              <div class="col-sm-2 mb-4 mb-md-0">
	                              	<div class="orderImage">
	                                  <img class="rounded" src="${pageContext.request.contextPath }/resources/new_assets/img/dog.jpg" alt="...">
	                              	</div>
	                              </div>
	                              <div class="col-sm-10">
	                                  <p class="mb-0">구매확정일 : 2024.12.05.(월)</p>
	                                  <p class="mb-0 font-weight-600">부드러운 슬림 카스테라 워싱 항균 옥수수솜 간절기/여름 이불세트</p>
	                                  <p class="mb-0" style="color: #aaa;">색상: 오션블루 / 구성 및 사이즈: 슈퍼싱글 이불베개세트(SS이불+베개커버1P)</p>
		                              <p class="mb-0" style="color: #aaa;">40,000원</p>
	                                  <div style="display:flex; justify-content: flex-end; align-items: end;">
		                                  <button type="button" class="btn btn-outline-secondary me-2" style="min-width: 150px;">문의하기</button>
		                                  <button type="button" class="btn btn-outline-success" style="min-width: 150px;">리뷰쓰기</button>
	                                  </div>
	                              </div>
	                          </div>
                          </div>
                          
                          <h5 class="mb-3">배송지정보</h5>
                          <div class="border rounded px-3 py-3 orderItem" style="margin-bottom: 60px;">
	                          <ul class="ps-0 mb-0">
	                          	<li class="row">
	                          		<div class="col-sm-2"><p class="mb-1" style="color: #aaa;">받는 사람</p></div>
	                          		<div class="col-sm-10"><p class="mb-1">징졩죵</p></div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-2"><p class="mb-1" style="color: #aaa;">연락처</p></div>
	                          		<div class="col-sm-10"><p class="mb-1">010-1234-1234</p></div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-2"><p class="mb-1" style="color: #aaa;">주소</p></div>
	                          		<div class="col-sm-10"><p class="mb-1">징졩죵징졩죵징졩죵징졩죵징졩죵</p></div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-2"><p class="mb-1" style="color: #aaa;">배송메모</p></div>
	                          		<div class="col-sm-10"><p class="mb-1">징졩죵징졩죵징졩죵징졩죵징졩죵</p></div>
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
		                          		<div class="col-sm-8" style="text-align: end;"><p class="mb-1">40,000원</p></div>
		                          	</li>
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2" style="color: #aaa;">배송비</p></div>
		                          		<div class="col-sm-8" style="text-align: end;"><p class="mb-1">0원</p></div>
		                          	</li>
		                          </ul>
		                          
		                          <div>
		                          	<div class="border-bottom my-3"></div>
		                          	<ul class="ps-0 mb-0">
		                          		<li class="row">
			                          		<div class="col-sm-4"><p class="mb-2">주문금액</p></div>
			                          		<div class="col-sm-8 font-weight-600" style="text-align: end; font-size: 1.2rem;"><p class="mb-1">40,000원</p></div>
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
		                          		<div class="col-sm-8"><p class="mb-1">징졩죵</p></div>
		                          	</li>
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2" style="color: #aaa;">연락처</p></div>
		                          		<div class="col-sm-8"><p class="mb-1">010-1234-1234</p></div>
		                          	</li>
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2" style="color: #aaa;">이메일</p></div>
		                          		<div class="col-sm-8"><p class="mb-1">jjj@jjjj.com</p></div>
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
