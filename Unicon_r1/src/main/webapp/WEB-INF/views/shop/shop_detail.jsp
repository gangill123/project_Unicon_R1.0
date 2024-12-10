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
	right: 0px;
	width: 0.3em;
	height: 0.3em;
	margin-right: 15px;
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
        <%-- ${productInfo}
        ${optionInfo}
        ${optionInfoForSole} --%>
        
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
				<div class="row" style="justify-content: center;">
				<div class="col-lg-10">
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
                            <h3 class="mb-2">${productInfo.product_name} 
                            <c:if test="${productInfo.discount_rate != 0}">
                            	<span class="label-sale bg-red text-white text-uppercase display-30">Sale</span>
                            </c:if>
                            </h3>
                            <div class="bg-primary separator-line-horrizontal-full mb-2"></div>
                            <div style="display: flex; justify-content: space-between;">
                            	<p class="font-weight-600" style="color: #575a7b;">판매자 : ${productInfo.memberVO.member_name}</p>
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

							<c:choose>
								<c:when test="${productInfo.discount_rate != 0 }">
		                            <div class="mb-4">
		                                <p class="mb-0"><span class="display-27 font-weight-700 me-2">${productInfo.discount_rate}%</span>
		                                <span class="display-27" style="text-decoration: line-through; color: #aaa;">
		                                <fmt:formatNumber value="${productInfo.product_price}" type="number" />원</span></p>
		                                <p><span class="me-3 display-15 font-weight-600" style="color: rgb(240, 86, 86); line-height: 2rem;"
		                                ><fmt:formatNumber value="${(productInfo.product_price*(100-productInfo.discount_rate)/100)}" type="number" />원</span>
		                                <span class="display-28 font-weight-600" style="color: rgb(240, 86, 86);">할인가</span></p>
		                            </div>
								</c:when>
								<c:otherwise>
									<div class="mb-4 mt-4">
		                                <p><span class="me-3 display-15 font-weight-600" style="line-height: 2rem;"
		                                ><fmt:formatNumber value="${(productInfo.product_price*(100-productInfo.discount_rate)/100)}"
		                                 type="number" />원</span></p>
		                            </div>
								</c:otherwise>
							</c:choose>                            
                            
                            
                            <p class="mb-1"><span class="display-27 font-weight-600">옵션선택</span></p>

                            <div class="row optionSelect">
                            
                            <c:choose>
                            	<c:when test="${productInfo.option_type == '조합형'}">
                            		<div class="col-md-12">
	                                    <div class="quform-element form-group">
	                                        <div class="quform-input">
	                                            <select id="itemOption1" class="form-control form-select" 
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
		                                        <select id="itemOption2" class="form-control form-select" 
		                                        style="padding: 6px 12px;">
		                                            <option value="옵션2" disabled selected>옵션2</option>
		                                        </select>
		                                    </div>
		                                </div>
		                            </div>
                            	</c:when>
                            	<c:otherwise>
	                            	
                            		<div class="col-md-12">
	                                    <div class="quform-element form-group">
	                                        <div class="quform-input">
	                                            <select id="SoleItemOption" class="form-control form-select" 
	                                            style="padding: 6px 12px;">
	                                                <option value="${optionInfo[0].option_name}" disabled selected>${optionInfo[0].option_name}</option>
												    <c:forEach var="list" items="${optionInfoForSole}">
												    	<option value="${list.option_value}">${list.option_value}
												    	<c:if test="${list.option_price != 0}">
												    	( +<fmt:formatNumber value="${list.option_price}" type="number" />원 )
												    	</c:if>
												    	</option>
												    </c:forEach>
	                                            </select>
	                                        </div>
	                                    </div>
	                                </div>
                            	</c:otherwise>
                            </c:choose>
                                
                            </div>
                            
                            <!-- 옵션1,옵션2 선택 시 추가되는 창 -->
                            <div id="selectItems" style="position: relative;">
                            	
                            </div>
                            

							<div style="display: flex; justify-content: space-between; margin-bottom: 20px; margin-top: 70px;">
								<p class="mb-1"><span class="display-29 font-weight-600">주문금액</span></p>
								<p class="mb-1"><span class="orderPrice display-25 font-weight-800">0원</span></p>
							</div>

							<form id="ShopToCartForm">
								<input type="hidden" name="member_id" value="${member_id}">
								<input type="hidden" name="product_id" value="${productInfo.product_id }"> 
								<div id="ShopToCartFormInput"></div>
                            <div class="row mb-4">
                                <div class="col-lg-6">
                                    <button class="butn text-uppercase w-100" type="button"
                                    onclick="location.href='/shop?categoryType=${param.categoryType}&categoryValue=${param.categoryValue}&currentPage=${param.currentPage}'">
                                    <span><i class="fa-solid fa-rotate-left"></i> 이전으로</span></button>
                                </div>
                                <div class="col-lg-6">
                                    <button type="submit" class="cartBtn butn primary w-100"><span><i class="fas fa-shopping-cart me-1"></i> 장바구니</span></button>
                                </div>
                            </div>
							</form>
                        </div>
                    </div>
                </div>
                
                <div class="row mb-6 mb-sm-7 mb-md-8 mb-lg-9">
                    <div class="col-12">
                        <div class="horizontaltab tab-style2" style="display: block; width: 100%; margin: 0px;">
                            <ul class="resp-tabs-list hor_1 text-start">
                                <li class="resp-tab-item hor_1 resp-tab-active" aria-controls="hor_1_tab_item-0" role="tab">Description</li>
                                <li class="resp-tab-item hor_1" aria-controls="hor_1_tab_item-1" role="tab">Additional Info</li>
                                <li class="resp-tab-item hor_1" aria-controls="hor_1_tab_item-2" role="tab">Reviews (2)</li>
                            </ul>
                            <div class="resp-tabs-container hor_1">

                                <h2 class="resp-accordion hor_1 resp-tab-active" role="tab" aria-controls="hor_1_tab_item-0" style="background: none;">
                                <span class="resp-arrow"></span>상품정보</h2>
                                <div class="resp-tab-content hor_1 resp-tab-content-active" 
                                aria-labelledby="hor_1_tab_item-0" style="display:block">
                                ${productInfo.product_content }
                                </div>
								
                                <h2 class="resp-accordion hor_1" role="tab" aria-controls="hor_1_tab_item-1"><span class="resp-arrow"></span>문의</h2><div class="resp-tab-content hor_1" aria-labelledby="hor_1_tab_item-1">

                                </div>

                                <h2 class="resp-accordion hor_1" role="tab" aria-controls="hor_1_tab_item-2"><span class="resp-arrow"></span>리뷰</h2><div class="resp-tab-content hor_1" aria-labelledby="hor_1_tab_item-2">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <!-- End Product Section -->
				</div>
			</div>
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
		
		// 옵션 선택 시 옵션값 담는 배열 선언
		let optionArray = [];
		
		// 단독형 옵션 선택 시 선택블록 생성
		$('#SoleItemOption').on('change', function(){
			
			let option_name = '${optionInfo[0].option_name}';
			let option_value = $('#SoleItemOption').val();
			
			if (optionArray.includes(option_value)) {
		        alert("이미 선택한 옵션입니다.");
		    } else {
		        // 중복되지 않으면 배열에 추가하고 선택박스 생성
		        optionArray.push(option_value);
				appendSoleSelectItems('${productInfo.product_id}', option_name, option_value,
						'${productInfo.product_price}', '${productInfo.discount_rate}');
				
				//console.log(optionArray);
		    }
		});
		
		
		// 조합형 - 옵션1 선택시 옵션2 세부옵션값 가져오기
		$('#itemOption1').on('change',function(){
			//alert("123");
			console.log('${productInfo.product_id}');
			console.log($(this).val());
			getOption('${productInfo.product_id}', $(this).val());
		});
		
		// 조합형 - 옵션2 선택 시 선택블록 생성
		$('#itemOption2').on('change', function(){
			
			let option_name = '${optionInfo[0].option_name}';
			let option_value = $('#itemOption1').val();
			let option_name2 = '${optionInfo[0].option_name2}';
			let option_value2 = $('#itemOption2').val();
			
			let exists = optionArray.some(item => item.opt1 == option_value && item.opt2 == option_value2);
			
			if (exists) {
		        alert("이미 선택한 옵션입니다.");
			} else {
				 // 중복되지 않으면 배열에 추가하고 선택박스 생성
				optionArray.push({opt1:option_value, opt2:option_value2});
				appendSelectItems('${productInfo.product_id}', option_name, option_value, option_name2, option_value2,
						'${productInfo.product_price}', '${productInfo.discount_rate}');
				console.log(optionArray);
			}
			
			
		});
		
		
		// x 눌렀을 경우 selectItem 없애기
		$('#selectItems').on('click','.btn-close', function(){
			//alert("ok");
			$(this).closest('.selectItem').remove();
			orderPriceCnt();
			
			// 삭제 시 배열의 옵션값 삭제(단독,조합)
			if('${productInfo.option_type}' == '단독형'){
				let delOpt = $(this).closest('.row').find('.optionVal1').data('opt');
				let index = optionArray.indexOf(delOpt);
				if (index !== -1) {
					optionArray.splice(index, 1); // index 위치에서 1개 요소를 삭제
				}

				//console.log(optionArray);
			} else{
				let delOpt1 = $(this).closest('.row').find('.optionVal1').data('opt');
				let delOpt2 = $(this).closest('.row').find('.optionVal2').data('opt');
				let index = optionArray.findIndex(item => item.opt1 == delOpt1 && item.opt2 == delOpt2);
				if (index !== -1) {
					optionArray.splice(index, 1); // 해당 인덱스의 객체 제거
				}
				
				console.log(optionArray);
			}
			
			
			
		});
		
		// 수량 변경 로직
		$('#selectItems').on('click', '.itemCntSpan', function () {
			// 숫자가 표시된 요소 선택
		    let countElement = $(this).siblings('.itemCnt'); 
		    let currentCount = parseInt(countElement.text()); // 현재 숫자 값
		    // 클래스에 따라 동작 분기
		    if ($(this).hasClass('plusBtn')) {
		        countElement.text(currentCount + 1); // 숫자 증가
		    } else if ($(this).hasClass('minusBtn')) {
		        if (currentCount > 1) { // 최소값 1로 제한
		            countElement.text(currentCount - 1); // 숫자 감소
		        }
		    }
		    
		 	// 할인 전 금액 가져오기
		    let initTotalPrice = $(this).closest('.row').find('.totalPrice').data('price');
		    let totalPrice = initTotalPrice * parseInt(countElement.text());
		    let formattedTotalPrice = totalPrice.toLocaleString() + "원";
		    $(this).closest('.row').find('.totalPrice').text(formattedTotalPrice);
		 	
		 	// 할인 금액 가져오기
		    let initdiscountPrice = $(this).closest('.row').find('.discountPrice').data('price');
		    let discountPrice = initdiscountPrice * parseInt(countElement.text());
		    let formatteddiscountPrice = discountPrice.toLocaleString() + "원";
		    $(this).closest('.row').find('.discountPrice').text(formatteddiscountPrice);
		    
		    orderPriceCnt();
		});
		
		
		// 장바구니 클릭 시 선택아이템(selectItems) -> 디비 저장
		$('#ShopToCartForm').on('submit', function(e){
			event.preventDefault();
			
			let selectItemsLength = $('.selectItem').length;
			
			if(selectItemsLength < 1){
				alert("상품을 선택해주세요");
			} else {
				shopToCart('${optionInfo[0].option_name}', '${optionInfo[0].option_name2}');
				Swal.fire({
	  			  title: '장바구니에 담았습니다.',
	  			  text: "장바구니 페이지로 이동합니다.",
	  			  icon: 'success',
	  			  confirmButtonColor: '#3085d6',
	  			  customClass: {
	  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
	  			  }
	 			}).then((result) => {
	 			    if (result.isConfirmed) { 
	 			        window.location.href = '/shop/cart'; // 이동할 URL
	 			    }
	 			});
			}
			
		});
		
		
		
		
		
	});//readay
</script>


<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
