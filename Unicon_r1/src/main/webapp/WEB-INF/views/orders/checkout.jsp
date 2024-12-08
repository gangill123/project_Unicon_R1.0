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


.form-control {
	min-height: 40px;
}

.orderImage{
	aspect-ratio: 1/1;
	overflow: hidden;
}

.orderImage img{
	width: 100%;
	height: 100%;
	object-fit: fill;
}

</style>

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<!-- 아래는 예시 -->
<!-- PAGE TITLE
        ================================================== -->
        
        <section class="page-title-section bg-img cover-background" data-overlay-dark="7" data-background="${pageContext.request.contextPath }/resources/new_assets/img/bg/bg5.jpg">
            <div class="container">

                <div class="row" style="justify-content: center;">
                <div class="col-lg-10">
                    <div class="col-md-4">
                        <h1>Shop Cart</h1>
                    </div>
                    <div class="col-md-12">
                        <ul class="text-md-end mt-3 mt-md-0 ps-0">
                            <li><a href="home-1.html">Home</a></li>
                            <li><a href="#!">Shop Cart</a></li>
                        </ul>
                    </div>
                </div>
 				</div>
            </div>
        </section>

        <!-- SHOP CART
        ================================================== -->
        <section style="padding: 60px 0;">
            <div class="container">

                <div class="row" style="justify-content: center;">

					<div class="col-lg-10 order-1 order-lg-2 mb-1-9 mb-lg-0">
                        <div class="services-single-right">
	                        <div style="margin-bottom: 70px;">
		                        <h4 class="mb-1">주문/결제</h4>
	                        </div>
                          
                          
                          <div class="border-bottom mb-2" style="display: flex; justify-content: space-between; align-items: end;">
	                          <h5 class="mb-2">배송지</h5>
	                          <h6><a class="addrChange" href="#!" style="color: #86bc42 !important;">변경하기</a></h6>
                          </div>
                          <div class="py-3 orderItem" style="margin-bottom: 55px;">
	                          <ul class="ps-0 mb-0">
	                          	<li class="row">
	                          		<h5>배송이름1</h5>
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-6"><p class="mb-0">부산광역시 부산진구 디딜로 12(징졩죵내), 1001호</p></div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-6 display-30 mb-2">
		                          		<p class="pe-2 border-end" style="color: #aaa; display: inline;">징젱죵</p>
		                          		<p class="ps-2" style="color: #aaa; display: inline;">010-1234-1324</p>
	                          		</div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="quform-input col-sm-6">
                                         <select id="itemOption1" class="form-control form-select" style="padding: 3px 12px;">
									    	 <option value="1">부재 시 문앞에 놓아주세요</option>
									    	 <option value="2">배송전에 미리 연락주세요</option>
									    	 <option value="3">부재 시 경비실에 맡겨주세요</option>
									    	 <option value="4">부재 시 전화주시거나 문자 남겨주세요</option>
									    	 <option value="0">직접입력</option>
                                         </select>
                                     </div>
	                          	</li>
	                          </ul>
                          </div>	
                          
                          	<div class="mb-3 border-bottom">
	                          	<h5 class="mb-2" >주문자</h5>
                          	</div>
                   			<div class="pt-2 orderItem" style="margin-bottom: 55px;">
                   				<div>
		                          <ul class="ps-0 mb-0">
		                          	<li class="row mb-3" style="align-items: center;">
		                          		<div class="col-sm-2"><p class="mb-0" style="color: #aaa;">주문자</p></div>
		                          		<div class="col-sm-3">
			                          		<div class="quform-input">
		                                   		<input class="form-control" type="text" name="pet_name">
		                               		</div>
		                          		</div>
		                          	</li>
		                          	<li class="row mb-3" style="align-items: center;">
		                          		<div class="col-sm-2"><p class="mb-0" style="color: #aaa;">이메일</p></div>
		                          		<div class="col-sm-3">
			                          		<div class="quform-input">
		                                   		<input class="form-control" type="text" name="pet_name">
		                               		</div>
		                          		</div>
		                          	</li>
		                          	<li class="row" style="align-items: center;">
		                          		<div class="col-sm-2"><p class="mb-0" style="color: #aaa;">전화번호</p></div>
		                          		<div class="col-sm-3">
			                          		<div class="quform-input">
		                                   		<input class="form-control" type="text" name="pet_name">
		                               		</div>
		                          		</div>
		                          	</li>
		                          	
		                          </ul>
                   				</div>
                          	</div>
                          
                        	
                       	  <div class="mb-3 border-bottom">
	                          	<h5 class="mb-2" >주문상품</h5>
                          	</div>
                          <div class="border rounded px-3 py-3 orderItem" style="margin-bottom: 55px;">
	                          <div class="row">
	                          	<div class="col-sm-12">
	                          		<div style="display: flex; justify-content: space-between; align-items: center;">
									    <h6 class="mb-0">유니콘스토어 <i class="fa-solid fa-store"></i></h6>
									    <p class="mb-0 font-weight-600">배송</p>
	                          		</div>
							    </div>
							    
							    
							    <div class="row">
							    <div class="line-title col-sm-12 mb-4"></div>
	                              <div class="col-sm-1 mb-md-0">
	                              	<div class="orderImage">
	                                  <img class="rounded" src="/resources/new_assets/img/dog.jpg">
	                              	</div>
	                              </div>
	                              <div class="col-sm-10">
	                                  <p class="mb-0 font-weight-600">부드러운 슬림 카스테라 워싱 항균 옥수수솜 간절기/여름 이불세트</p>
	                                  <p class="mb-0" style="color: #aaa;">색상: 오션블루 / 구성 및 사이즈: 슈퍼싱글 이불베개세트(SS이불+베개커버1P)</p>
		                              	<p class="mb-0 pe-2 border-end" style="display: inline;">40,000원</p>
		                              	<p class="mb-0 ps-2" style="color: #aaa; display: inline;">1개</p>
	                              </div>
	                            </div>  
	                            
							    <div class="row">
							    	<div class="line-title col-sm-12 mb-4"></div>
	                              <div class="col-sm-1 mb-4 mb-md-0">
	                              	<div class="orderImage">
	                                  <img class="rounded" src="/resources/new_assets/img/dog.jpg">
	                              	</div>
	                              </div>
	                              <div class="col-sm-10">
	                                  <p class="mb-0 font-weight-600">부드러운 슬림 카스테라 워싱 항균 옥수수솜 간절기/여름 이불세트</p>
	                                  <p class="mb-0" style="color: #aaa;">색상: 오션블루 / 구성 및 사이즈: 슈퍼싱글 이불베개세트(SS이불+베개커버1P)</p>
		                              	<p class="mb-0 pe-2 border-end" style="display: inline;">40,000원</p>
		                              	<p class="mb-0 ps-2" style="color: #aaa; display: inline;">1개</p>
	                              </div>
	                            </div> 
	                             
							    <div class="row">
							    	<div class="line-title col-sm-12 mb-4"></div>
	                              <div class="col-sm-1 mb-4 mb-md-0">
	                              	<div class="orderImage">
	                                  <img class="rounded" src="/resources/new_assets/img/dog.jpg">
	                              	</div>
	                              </div>
	                              <div class="col-sm-10">
	                                  <p class="mb-0 font-weight-600">부드러운 슬림 카스테라 워싱 항균 옥수수솜 간절기/여름 이불세트</p>
	                                  <p class="mb-0" style="color: #aaa;">색상: 오션블루 / 구성 및 사이즈: 슈퍼싱글 이불베개세트(SS이불+베개커버1P)</p>
		                              	<p class="mb-0 pe-2 border-end" style="display: inline;">40,000원</p>
		                              	<p class="mb-0 ps-2" style="color: #aaa; display: inline;">1개</p>
	                              </div>
	                            </div>  
	                            
	                          </div>
                          </div>
                          
                          
                          
                          <div class="row">
                          	<div class="col-sm-6">
                          	<h5 class="mb-3">결제방법</h5>
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
                          	<h5 class="mb-3">결제금액</h5>
                   			<div class="border rounded px-3 py-3 orderItem mb-4">
                   				<div>
		                          <ul class="ps-0 mb-0">
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2">총 상품금액</p></div>
		                          		<div class="col-sm-8" style="text-align: end;"><p class="mb-1">40,000원</p></div>
		                          	</li>
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2">총 배송비</p></div>
		                          		<div class="col-sm-8" style="text-align: end;"><p class="mb-1">0원</p></div>
		                          	</li>
		                          </ul>
		                          
		                          <div>
		                          	<div class="border-bottom my-3"></div>
		                          	<ul class="ps-0 mb-0">
		                          		<li class="row">
			                          		<div class="col-sm-4"><p class="mb-2">최종 결제금액</p></div>
			                          		<div class="col-sm-8 font-weight-600" style="text-align: end; font-size: 1.2rem;"><p class="mb-1">40,000원</p></div>
		                          		</li>
		                          	</ul>
		                          </div>
                   				</div>
                          	</div>
                          	<button type="submit" class="checkoutBtn butn primary w-100"><span>
                          	결제하기</span></button>
                          	</div>
                          	
                          </div>
                        </div>
                    </div>



                </div>

            </div>
        </section>
        <!-- end cart table section -->
        
        <!-- 배송지 모달 -->
        <div class="modal fade addrModal" tabindex="-1" aria-labelledby="gridSystemModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog" role="document">
            
                <div class="modal-content choiceContent">
                    <div class="modal-header">
                        <h4 class="modal-title" id="gridSystemModalLabel">배송지 선택</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="choiceContentBody modal-body bg-medium-light-gray">
                    
	                    
	                    
                    </div>
                    <div class="modal-footer">
                        <button class="addAddressBtn butn primary rounded w-100"><span>배송지 추가</span></button>
                    </div>
                </div>
                
                <div class="modal-content addressInputContent" style="display: none;">
                <form id="saveAddressForm" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title" id="addressInputLabel">배송지 추가</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
	                    <div style="padding: 10px;">
	                    <div class="row mb-3" id="font_size">
                           <label for="address_name" class="col-sm-3 col-form-label">배송지명</label>
                           <div class="col-sm-9" id="sst">
                             <input type="text" name="address_name" class="form-control"  id="submit_check_name" placeholder="배송지명을 입력해주세요">
                           </div>
                         </div>
                         
	                    <div class="row mb-3" id="font_size">
                           <label for="recipient" class="col-sm-3 col-form-label">받는사람</label>
                           <div class="col-sm-9" id="sst">
                             <input type="text" name="recipient" class="form-control" placeholder="받는사람을 입력해주세요">
                           </div>
                         </div>
                         
	                    <div class="row mb-3" id="font_size">
                           <label for="recipient_phone" class="col-sm-3 col-form-label">전화번호</label>
                           <div class="col-sm-9" id="sst">
                             <input type="text" name="recipient_phone" class="form-control" placeholder="숫자만 입력해주세요">
                           </div>
                         </div>
	                    
	                    <div class="row mb-3" id="font_size">
					        <label for="memberaddress" class="col-sm-3 col-form-label" id="fst">주소</label>
					        <div class="col-sm-9 juso_search" id="sst">
					            <input type="button" class="form-control mb-1" onclick="sample6_execDaumPostcode()" value="주소찾기" style="display: inline; width: 100px;">
					            <input type="text" class="form-control mb-1" name="postal_code" id="postal_code" placeholder="우편번호" style="width: 223px; display: inline;">
					            <input type="text" class="form-control mb-1" name="road_address" id="road_address" placeholder="주소">
					            <input type="text" class="form-control mb-1" name="detail_address" id="detail_address" placeholder="상세주소">
					            <input type="text" class="form-control" name="extra_address" id="extra_address" placeholder="추가주소">
					        </div>
					    </div>
					    
					    <div class="row mb-3" id="font_size">
                           <label for="phone_number" class="col-sm-3 col-form-label"></label>
                           <div class="col-sm-9" id="sst">
	                           <div class="custom-control custom-checkbox">
	                                <input type="checkbox" name="is_default_address" value="true">
	                                <label class="custom-control-label">기본배송지로 저장</label>
	                            </div>
                           </div>
                         </div>
                    </div>
                    </div>
                    <div class="modal-footer">
                        <button class="saveAddressBtn butn primary rounded w-100" type="submit"><span>저장하기</span></button>
                    </div>
                    <input type="hidden" name="member_id" value="${member_id}">
                    </form>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        
        
        
        

<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->

<script>
	$(document).ready(function () {
		
		// 주소변경하기 클릭 시 모달열기 + 정보가져와서 출력
		$('.addrChange').on('click', function(){
			addrModalOpen();
			$('.choiceContent').show();
			$('.addressInputContent').hide();
			$('.addrModal').modal('show');
			$('#saveAddressForm').find('input[type="checkbox"]').prop('checked', false);
	    	$('#saveAddressForm').find('input:not([type="button"])').val('');
		});
		
		// 배송지 수정 버튼 시 로직
		$('.choiceContentBody').on('click', '.addrUbtn', function(){
			//alert("ok");
			
			let addrId = $(this).data('id');
			addrUBtn(addrId);
			$('.choiceContent').hide();
			$('.addressInputContent').show();
			
			
			
		});
		
		
		// 배송지 추가 버튼 시 작성페이지 content 보이기
		$('.addAddressBtn').on('click', function(){
			$('.choiceContent').hide();
			$('.addressInputContent').show();
			
		});
		
		// 배송지 저장하기 버튼 시 로직 처리(ajax)
		$('.modal-dialog').on('submit','#saveAddressForm', function(e){
			e.preventDefault();
			
			var formData = new FormData(this);
			
			 // 체크박스 상태 확인
		    let isChecked = $('input[name="is_default_address"]').prop('checked');
		    console.log(isChecked);

		    // 체크박스의 상태에 따라 값 추가
		    if (isChecked) {
		        formData.set('is_default_address', 'true'); // 체크된 경우
		    } else {
		        formData.set('is_default_address', 'false'); // 체크되지 않은 경우
		    }
			
			$.ajax({
				url: '/orders/addressCreate',
				type: 'POST',
				data: formData,
				contentType: false,
				processData: false,
				success: function(response) {
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
			 			    	$('#saveAddressForm').find('input[type="checkbox"]').prop('checked', false);
			 			    	$('#saveAddressForm').find('input:not([type="button"])').val('');
			 			    	$('.addrModal').modal('hide');
			 			    }
			 			});
				},
				error: function(jqXHR, textStatus, errorThrown) {
					
				}
			});
			
		});
		
		
		
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
	
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extra_address").value = extraAddr;
                } else {
                    document.getElementById("extra_address").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postal_code').value = data.zonecode;
                document.getElementById("road_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detail_address").focus();
            }
        }).open();
    }
	
</script>


<!--====================================script 작성부=====================================-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
