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

                <div class="row">

                    <!-- Start Product Table -->
                    <div class="col-12 shop-cart-table">
                        <table class="table shop-cart text-center">
                            <colgroup>
                                <col class="w-100px">
                                <col>
                                <col class="w-1px">
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
                                    <th class="text-start text-uppercase font-weight-500">합계</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="product-thumbnail text-start">
                                        <a href="#!" class="d-inline-block w-70px">
                                        <img src="${cartAllInfo[0].shopVO.product_images[0].image_src }" class="w-70px"></a>
                                    </td>
                                    <td class="text-start">
                                        <a href="#!">${cartAllInfo[0].shopVO.product_name }</a>
                                        <span class="text-uppercase d-block">
                                        ${cartAllInfo[0].cart_list[0].option_name} : ${cartAllInfo[0].cart_list[0].option_value}
                                        / ${cartAllInfo[0].cart_list[0].option_name2} : ${cartAllInfo[0].cart_list[0].option_value2}</span>
                                        <a href="#!" class="small"><i class="fas fa-edit"></i> Edit</a>
                                    </td>
                                    <td class="text-start" style="width: 10%;">
                                        <fmt:formatNumber value="${(cartAllInfo[0].shopVO.product_price + cartAllInfo[0].cart_list[0].option_price)
                                        *(100 - cartAllInfo[0].shopVO.discount_rate)/100}"
		                                 type="number" />원
                                    </td>
                                    <td class="product-quantity">
                                        <div class="itemCntBox">
			                            	<span class="minusBtn itemCntSpan">-</span>
			                            	<span class="itemCnt">${cartAllInfo[0].cart_list[0].quantity}</span>
			                            	<span class="plusBtn itemCntSpan">+</span>
			                            </div>
                                    </td>
                                    <td class="product-subtotal text-start">
                                    <fmt:formatNumber value="${(((cartAllInfo[0].shopVO.product_price + cartAllInfo[0].cart_list[0].option_price)
                                    *(100 - cartAllInfo[0].shopVO.discount_rate)/100)*cartAllInfo[0].cart_list[0].quantity/100)*100}"
		                                 type="number" />원
                                    
                                    </td>
                                    <td class="product-remove text-center">
                                        <a href="#!"><i class="fas fa-times"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- End Product Table -->

                    <!-- Start Button Set -->
                    <div class="col-12 border-bottom py-4 py-lg-5 mb-4 mb-lg-0">
                        <button class="butn small mb-2 mb-md-0"><span>Empty Cart</span></button>
                        <button class="butn small float-end ms-2 mb-2 mb-md-0"><span>Continue Shopping</span></button>
                        <button class="butn small float-end ms-2"><span>Update Shopping Cart</span></button>
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

                                                <form method="post">

                                                    <div class="row">

                                                        <div class="col-12">

                                                            <div class="form-group">
                                                                <input type="text" class="form-control" name="coupon" placeholder="Enter Your Coupon code">
                                                            </div>

                                                        </div>

                                                    </div>

                                                    <button type="button" class="butn small"><span>Apply Code</span></button>

                                                </form>

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

                                                <form method="post">

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

                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6 offset-lg-1 col-md-7 offset-md-0">
                                <table class="table cart-sub-total">
                                    <tbody>
                                        <tr>
                                            <th class="text-end pe-0 text-uppercase">Cart Subtotal</th>
                                            <td class="text-uppercase text-end pe-0">$1598</td>
                                        </tr>
                                        <tr>
                                            <th class="text-end pe-0 text-uppercase">Shipping and Handling</th>
                                            <td class="text-uppercase text-end pe-0">Free</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-0" colspan="2">
                                                <hr>
                                            </td>
                                        </tr>
                                        <tr class="total">
                                            <th class="text-uppercase text-end pe-0">Order Total</th>
                                            <td class="text-uppercase text-end pe-0">$1598</td>
                                        </tr>
                                        <tr>
                                            <td class="pe-0" colspan="2">
                                                <hr class="mb-0">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <a class="butn primary medium float-end" href="#!"><span>Proceed to Checkout</span></a>
                            </div>
                        </div>
                    </div>
                    <!-- End Total Block Set -->

                </div>

            </div>
        </section>
        <!-- end cart table section -->
        
        

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
			shopToCart('${optionInfo[0].option_name}', '${optionInfo[0].option_name2}');
			Swal.fire({
  			  title: '장바구니에 담았습니다.',
  			  text: "장바구니 페이지로 이동합니다.",
  			  icon: 'success',
  			  confirmButtonColor: '#3085d6',
  			  customClass: {
  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
  			  }
 			});
			
		});
		
		
		
		
		
	});//readay
</script>


<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
