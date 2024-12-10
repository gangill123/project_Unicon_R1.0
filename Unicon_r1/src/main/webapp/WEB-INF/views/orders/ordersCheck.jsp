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
	<%-- ${checkoutOrderInfo} --%>
	
	<section  style="padding-top: 50px;">
            <div class="container">
                <div class="row" style="justify-content: center;">
                    <!-- start right side section -->
                    <div class="col-lg-10 order-1 order-lg-2 mb-1-9 mb-lg-0">
                        <div class="services-single-right">
	                        <div style="margin-bottom: 60px;">
		                        <h4 class="mb-1">주문확인</h4>
		                        <p class="mb-1">${checkoutOrderInfo.formatted_paydate } (주문ID : ${checkoutOrderInfo.order_id })</p>
	                        </div>
                        	
                       	  <h5 class="mb-3">주문상품</h5>
                          <c:forEach var="ordersDetail" items="${checkoutOrderInfo.ordersDetails }">
                          
                          <div class="border rounded px-3 py-3 orderItem" style="margin-bottom: 60px;">
	                          <div class="row">
	                          	<div class="col-sm-12 mb-2">
	                          		<div style="display: flex; justify-content: space-between; align-items: center;">
		                          		<div>
									        <h5 class="mb-0">${ordersDetail.shopVO.product_seller_name } <i class="fa-solid fa-store"></i></h5>
									        <c:choose>
									        	<c:when test="${ordersDetail.delivery_price == 0 }">
											        <p class="mb-1">무료배송</p>
									        	</c:when>
									        	<c:otherwise>
											        <p class="mb-1">배송비 : <fmt:formatNumber value="${ordersDetail.delivery_price }" type="number" />원</p>
									        	</c:otherwise>
									        </c:choose>
		                          		</div>
	                          		</div>
							    </div>
							    
							    <c:forEach var="ordersDetailOption" items="${ordersDetail.ordersDetailOptions }">
							  		
	                              <div class="col-sm-12 border-top pt-3" style="display: flex; justify-content: space-between;">
	                              	<div>
	                              	  <h5 class="font-weight-600 mb-4" style="display: inline; color: #aaa;">${ordersDetailOption.status }</h5>
	                              	</div>
	                              </div>
	                              <div class="col-sm-2" style="margin-bottom: 15px;">
	                              	<div class="orderImage">
	                                  <img class="rounded" src="${ordersDetail.shopVO.product_images[0].image_src}" alt="...">
	                              	</div>
	                              </div>
	                              <div class="col-sm-10">
	                                  <p class="mb-0">주문일 : ${checkoutOrderInfo.formatted_paydate }</p>
	                                  <p class="mb-0 font-weight-600">${ordersDetail.shopVO.product_name }</p>
	                                  <p class="mb-0" style="color: #aaa;">${ordersDetailOption.product_option }</p>
		                              <p class="mb-0" style="color: #aaa; display: inline;">
		                              <fmt:formatNumber value="${ordersDetailOption.option_price }" type="number" />원</p>
		                              <p class="mb-0 ps-2" style="color: #aaa; display: inline;">
			                              	${ordersDetailOption.quantity }개</p>
	                                  <div style="display:flex; justify-content: flex-end; align-items: end;">
		                                  <button type="button" class="btn btn-outline-secondary me-2" style="min-width: 150px;">문의하기</button>
	                                  </div>
	                              </div>
	                              
	                                </c:forEach>
	                          </div>
                          </div>
                          </c:forEach>
                          
                          
                          <h5 class="mb-3">배송지정보</h5>
                          <div class="border rounded px-3 py-3 orderItem" style="margin-bottom: 60px;">
	                          <ul class="ps-0 mb-0">
	                          	<li class="row">
	                          		<div class="col-sm-2"><p class="mb-1" style="color: #aaa;">받는 사람</p></div>
	                          		<div class="col-sm-10"><p class="mb-1">${checkoutOrderInfo.recipient }</p></div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-2"><p class="mb-1" style="color: #aaa;">연락처</p></div>
	                          		<div class="col-sm-10"><p class="mb-1">${checkoutOrderInfo.recipient_phone }</p></div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-2"><p class="mb-1" style="color: #aaa;">주소</p></div>
	                          		<div class="col-sm-10"><p class="mb-1">
	                          		${checkoutOrderInfo.address }, ${checkoutOrderInfo.detail_address }</p></div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-2"><p class="mb-1" style="color: #aaa;">배송메모</p></div>
	                          		<div class="col-sm-10"><p class="mb-1">${checkoutOrderInfo.delivery_comment }</p></div>
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
		                          		<fmt:formatNumber value="${checkoutOrderInfo.total_product_price }" type="number" />원</p></div>
		                          	</li>
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2" style="color: #aaa;">배송비</p></div>
		                          		<div class="col-sm-8" style="text-align: end;"><p class="mb-1">
		                          		<fmt:formatNumber value="${checkoutOrderInfo.total_delivery_price }" type="number" />원</p></div>
		                          	</li>
		                          </ul>
		                          
		                          <div>
		                          	<div class="border-bottom my-3"></div>
		                          	<ul class="ps-0 mb-0">
		                          		<li class="row">
			                          		<div class="col-sm-4"><p class="mb-2">주문금액</p></div>
			                          		<div class="col-sm-8 font-weight-600" style="text-align: end; font-size: 1.2rem;">
			                          		<p class="mb-1"><fmt:formatNumber value="${checkoutOrderInfo.total_price }" type="number" />원</p></div>
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
		                          		<div class="col-sm-8"><p class="mb-1">${checkoutOrderInfo.memberVO.member_name }</p></div>
		                          	</li>
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2" style="color: #aaa;">연락처</p></div>
		                          		<div class="col-sm-8"><p class="mb-1">${checkoutOrderInfo.memberVO.member_tel }</p></div>
		                          	</li>
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2" style="color: #aaa;">이메일</p></div>
		                          		<div class="col-sm-8"><p class="mb-1">${checkoutOrderInfo.memberVO.member_email }</p></div>
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
                    <div class="col-lg-4 order-1 order-lg-2 mt-5">
                        <button class="butn primary w-100" onclick="location.href='/main';"><span>메인으로 이동하기</span></button>
                    <!-- end right side section -->
					</div>
                </div>
            </div>
        </section>
	
	
	
	
	

<!--====================================작성부=====================================-->

<script>
$(document).ready(function () {
	
	
	
});//readay
</script>



<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
