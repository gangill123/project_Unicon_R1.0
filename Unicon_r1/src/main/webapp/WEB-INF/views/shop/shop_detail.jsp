<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

<style>

.xzoom5 {
    width: 100%;
    aspect-ratio: 1 / 1; /* 원하는 가로:세로 비율 설정 */
    height: 100%;
    border-radius: 0.5rem;
}

.xzoom-gallery5{
	aspect-ratio: 1 / 1; /* 원하는 가로:세로 비율 설정 */
	border-radius: 0.3rem;
}

.xzoom-preview, .xzoom-source{
	all: unset !important;
	display: none !important;
}

.btn-close{
	position: absolute;
	display: inline-block;
	top: 0px;
	right: 0px;
	width: 0.3em;
	height: 0.3em;
	margin-right: 15px;
	margin-top: 15px;
}

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
	margin-top: 12px;
}

.itemCntSpan{
	display: inline-block;
	font-size: 25px;
	line-height: 1;
	cursor: pointer;
}

</style>

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<!-- 아래는 예시 -->
<!-- PAGE TITLE
        ================================================== -->
        ${productInfo}
        ${optionInfo}
        
        <section class="page-title-section bg-img cover-background" data-overlay-dark="7" data-background="${pageContext.request.contextPath }/resources/new_assets/img/bg/bg5.jpg">
            <div class="container">

                <div class="row">
                    <div class="col-md-7">
                        <h1>Shop Product Details</h1>
                    </div>
                    <div class="col-md-5">
                        <ul class="text-md-end mt-3 mt-md-0 ps-0">
                            <li><a href="home-1.html">Home</a></li>
                            <li><a href="#!">Shop Product Details</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </section>

        <!-- PRODUCT DETAILS
        ================================================== -->
        <section>
            <div class="container">

                <!-- Start Product Section -->
                <div class="row mb-6 mb-sm-7 mb-md-8 mb-lg-9">
                    <div class="col-lg-6 text-center mb-1-9 mb-lg-0">

                        <!-- product left start -->
                        <div>
                            <img class="xzoom5 mb-1-9" src="${productInfo.product_images[0].image_src}" >
                            <div class="m-0">
                                <a href="${productInfo.product_images[0].image_src}"><img class="xzoom-gallery5" width="80" src="${productInfo.product_images[0].image_src}" ></a>
                                <c:if test="${productInfo.product_images.size() > 1 }">
	                                <c:forEach var="i" begin="1" end="${productInfo.product_images.size() - 1 }">
	                                	<a href="${productInfo.product_images[i].image_src}"><img class="xzoom-gallery5" width="80" src="${productInfo.product_images[i].image_src}" alt="..." ></a>
	                                </c:forEach>
                                </c:if>
                                
                            </div>
                        </div>
                        <!-- product left end -->

                    </div>
                    <div class="col-lg-6 ps-lg-2-3">
                        <div class="product-detail">
                            <h3 class="mb-2">${productInfo.product_name} <span class="label-sale bg-red text-white text-uppercase display-30">Sale</span></h3>
                            <div class="bg-primary separator-line-horrizontal-full mb-2"></div>
                            <div style="display: flex; justify-content: space-between;">
                            	<p class="font-weight-600" style="color: #575a7b;">판매자 : ${productInfo.memberVO.memberName}</p>
                            	<p class="font-weight-600" style="color: #575a7b;">${productInfo.product_category_type} <i class="fa-solid fa-angle-right"></i>
                            	<a class="text-primary" href="#!"> ${productInfo.product_category_value}</a></p>
                            </div>
                            <div class="mb-2">
                                <div class="d-inline-block me-2" style="color: #86bc42;">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>
                                <div class="d-inline-block">
                                    <a class="text-primary font-weight-700" href="#!">0000개 리뷰</a>
                                </div>
                            </div>
                            <div class="mb-4">
                                <p class="mb-0"><span class="display-27 font-weight-700 me-2">${productInfo.discount_rate}%</span>
                                <span class="display-27" style="text-decoration: line-through; color: #aaa;">
                                <fmt:formatNumber value="${productInfo.product_price}" type="number" />원</span></p>
                                <p><span class="me-3 display-15 font-weight-600" style="color: rgb(240, 86, 86); line-height: 2rem;"
                                ><fmt:formatNumber value="${(productInfo.product_price*(100-productInfo.discount_rate)/100).intValue()}" 
                                type="number" />원</span><span class="display-28 font-weight-600" style="color: rgb(240, 86, 86);">할인가</span></p>
                            </div>
                            
                            <p class="mb-1"><span class="display-27 font-weight-600">옵션선택</span></p>

                            <div class="row optionSelect">
                            <div class="col-md-12">
                                    <div class="quform-element form-group">
                                        <div class="quform-input">
                                            <select id="itemOption1" class="form-control form-select" name="news_resion"
                                            style="padding: 6px 12px;">
                                                <option value="${optionInfo[0].option_name}" disabled selected>${optionInfo[0].option_name}</option>
											    <c:forEach var="list" items="${optionInfo}">
											    	<option value="${list.option_value}">${list.option_value}</option>
											    </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            <div class="col-md-12">
                                    <div class="quform-element form-group">
                                        <div class="quform-input">
                                            <select id="itemOption2" class="form-control form-select" name="news_resion"
                                            style="padding: 6px 12px;">
                                                <option value="옵션2" disabled selected>옵션2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- 옵션1,옵션2 선택 시 추가되는 창 -->
                            <div id="selectItems" style="position: relative;">
                            	
                            </div>
                            

							<div style="display: flex; justify-content: space-between; margin-bottom: 20px; margin-top: 70px;">
								<p class="mb-1"><span class="display-29 font-weight-600">주문금액</span></p>
								<p class="mb-1"><span class="display-27 font-weight-700">0원</span></p>
							</div>

                            <div class="row mb-4">
                                <div class="col-lg-6">
                                    <button class="butn primary w-100"><span><i class="fas fa-shopping-cart me-1"></i> 장바구니</span></button>
                                </div>
                                <div class="col-lg-6">
                                    <button class="butn text-uppercase w-100"><span><i class="fa-regular fa-credit-card"></i> 바로구매</span></button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- End Product Section -->


            </div>
        </section>

        <!-- CLIENTS
        ================================================== -->
        <div class="section-clients bg-light-gray">
            <div class="container">
                <div class="owl-carousel owl-theme clients" id="clients">
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-01.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-02.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-03.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-04.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-05.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-06.png"></div>
                </div>
            </div>
        </div>

<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->

<script>
	$(document).ready(function () {
		
		// 옵션1 선택시 옵션2 세부옵션값 가져오기
		$('#itemOption1').on('change',function(){
			//alert("123");
			getOption('${productInfo.product_id}');
		});
		
		// 옵션2 선택 시 선택블록 생성 후 옵션창 초기화
		$('#itemOption2').on('change', function(){
			
			let option_name = '옵션1';
			let option_value = $('#itemOption1').val();
			let option_name2 = '옵션2';
			let option_value2 = $('#itemOption2').val();
			
			appendselectItems(option_name, option_value, option_name2, option_value2);
			
		});
		
		
		
	});//readay
</script>


<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
