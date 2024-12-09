<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<!-- 아래는 예시 -->
<!-- PAGE TITLE
        ================================================== -->
        ${addrDefalut }
        ${ordersInfo }
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
                          
                          <form id="addrInfoForm" method="post">
                          <div class="border-bottom mb-2" style="display: flex; justify-content: space-between; align-items: end;">
	                          <h5 class="mb-2">배송지</h5>
	                          <h6><a class="addrChange" href="#!" style="color: #86bc42 !important;">변경하기</a></h6>
                          </div>
                          <div class="py-3 orderItem" style="margin-bottom: 55px;">
	                          <ul class="ps-0 mb-0" style="list-style: none;">
	                          	<li>
	                          		<h5 id="addrName" style="display: inline;">${addrDefalut.address_name }</h5>
	                          		<c:if test="${addrDefalut.is_default_address == 'true' }">
		                          		<span class="isDefault label-sale text-white rounded px-1 ms-1" style="background:#86bc42;">기본배송지</span>
	                          		</c:if>
	                          		
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-6"><p class="mb-0" id="totalAddr"><span id="address">${addrDefalut.road_address }${addrDefalut.extra_address }</span>
	                          		, <span id="detail_address">${addrDefalut.detail_address }</span></p>
	                          		</div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="col-sm-6 display-30 mb-2">
		                          		<p id="recipient" class="pe-2 border-end" style="color: #aaa; display: inline;">${addrDefalut.recipient }</p>
		                          		<p id="recipient_phone" class="ps-2" style="color: #aaa; display: inline;">${addrDefalut.recipient_phone }</p>
	                          		</div>
	                          	</li>
	                          	<li class="row">
	                          		<div class="quform-input col-sm-6">
                                         <select id="itemOption1" class="form-control form-select" name="delivery_comment" style="padding: 3px 12px;">
									    	 <option value="부재 시 문앞에 놓아주세요">부재 시 문앞에 놓아주세요</option>
									    	 <option value="배송전에 미리 연락주세요">배송전에 미리 연락주세요</option>
									    	 <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
									    	 <option value="부재 시 전화주시거나 문자 남겨주세요">부재 시 전화주시거나 문자 남겨주세요</option>
									    	 <option value="0">직접입력</option>
                                         </select>
                                     </div>
	                          	</li>
	                          </ul>
	                          <input type="hidden" id="postCode" name="postal_code" value="${addrDefalut.postal_code }">
                          </div>	
                          
                          	<div class="mb-3 border-bottom">
	                          	<h5 class="mb-2" >주문자</h5>
                          	</div>
                   			<div class="pt-2 orderItem" style="margin-bottom: 65px;">
                   				<div>
		                          <ul class="ps-0 mb-0">
		                          	<li class="row mb-3" style="align-items: center;">
		                          		<div class="col-sm-2"><p class="mb-0" style="color: #aaa;">주문자</p></div>
		                          		<div class="col-sm-3">
			                          		<div class="quform-input">
		                                   		<input class="form-control" type="text" name="order_name"
		                                   		 value="${ordersInfo.memberVO.member_name }">
		                               		</div>
		                          		</div>
		                          	</li>
		                          	<li class="row mb-3" style="align-items: center;">
		                          		<div class="col-sm-2"><p class="mb-0" style="color: #aaa;">이메일</p></div>
		                          		<div class="col-sm-3">
			                          		<div class="quform-input">
		                                   		<input class="form-control" type="text"
		                                   		value="${ordersInfo.memberVO.member_email }">
		                               		</div>
		                          		</div>
		                          	</li>
		                          	<li class="row" style="align-items: center;">
		                          		<div class="col-sm-2"><p class="mb-0" style="color: #aaa;">전화번호</p></div>
		                          		<div class="col-sm-3">
			                          		<div class="quform-input">
		                                   		<input class="form-control" type="text"
		                                   		value="${ordersInfo.memberVO.member_tel }">
		                               		</div>
		                          		</div>
		                          	</li>
		                          	
		                          </ul>
                   				</div>
                          	</div>
                        	
                       	  <div class="mb-3 border-bottom">
	                          	<h5 class="mb-2" >주문상품</h5>
                          	</div>
                          	
                          <c:forEach var="list" items="${ordersInfo.ordersDetails }">
                          <div class="border rounded px-3 py-3 orderItem" style="margin-bottom: 20px;">
	                          <div class="row">
	                          	<div class="col-sm-12">
	                          		<div style="display: flex; justify-content: space-between; align-items: center;">
									    <h6 class="mb-0">${list.shopVO.product_name } <i class="fa-solid fa-store"></i></h6>
									    <p class="mb-0 font-weight-600">배송비 : 
									    <c:choose>
									    	<c:when test="${list.delivery_price != 0 }">
									    	<fmt:formatNumber value="${list.delivery_price}" type="number" />원
									    	</c:when>
									    	<c:otherwise>
									    	무료
									    	</c:otherwise>
									    </c:choose>
									    </p>
	                          		</div>
							    </div>
							    
							    <c:forEach var="list2" items="${list.odersDetailOptions }">
								    <div class="row">
								    <div class="line-title col-sm-12 mb-4"></div>
		                              <div class="col-sm-1 mb-md-0">
		                              	<div class="orderImage">
		                                  <img class="rounded" src="${list.shopVO.product_images[0].image_src }">
		                              	</div>
		                              </div>
		                              <div class="col-sm-10">
		                                  <p class="mb-0 font-weight-600">${list.shopVO.product_name }</p>
		                                  <p class="mb-0" style="color: #aaa;">${list2.product_option }</p>
			                              	<p class="mb-0 pe-2 border-end" style="display: inline;">
			                              	<fmt:formatNumber value="${list2.option_price }" type="number" />원</p>
			                              	<p class="mb-0 ps-2" style="color: #aaa; display: inline;">
			                              	${list2.quantity }개</p>
		                              </div>
		                            </div>  
							    </c:forEach>
	                            
	                          </div>
                          </div>
                          
                          </c:forEach>	
                          
                          <div class="row" style="margin-top: 65px;">
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
		                          		<div class="col-sm-8" style="text-align: end;"><p class="mb-1">
		                          		<fmt:formatNumber value="${ordersInfo.total_product_price }" type="number" />원</p></div>
		                          	</li>
		                          	<li class="row">
		                          		<div class="col-sm-4"><p class="mb-2">총 배송비</p></div>
		                          		<div class="col-sm-8" style="text-align: end;"><p class="mb-1">
		                          		<fmt:formatNumber value="${ordersInfo.total_delivery_price }" type="number" />원</p></div>
		                          	</li>
		                          </ul>
		                          
		                          <div>
		                          	<div class="border-bottom my-3"></div>
		                          	<ul class="ps-0 mb-0">
		                          		<li class="row">
			                          		<div class="col-sm-4"><p class="mb-2">최종 결제금액</p></div>
			                          		<div class="col-sm-8 font-weight-600" style="text-align: end; font-size: 1.2rem;"><p class="mb-1">
			                          		<fmt:formatNumber value="${ordersInfo.total_price }" type="number" />원</p></div>
		                          		</li>
		                          	</ul>
		                          </div>
                   				</div>
                          	</div>
                          	<button type="submit" class="checkoutBtn butn primary w-100"><span>
                          	결제하기</span></button>
                          	</div>
                          </div>
                          	<div id="addrInfoFormInput"></div>
                          	</form>
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
                <form id="saveAddrForm" method="post">
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
                        <button class="butn primary rounded w-100" onclick="requestPay()"><span class="saveBtnText">저장하기</span></button>
                    </div>
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
		
		// 배송지 선택 시 화면으로 정보 전달
		$('.choiceContentBody').on('click', '.addrSbtn', function(){
			//alert("ok");
			
			let addrId = $(this).data('id');
			SelectAddrInfo(addrId);
			
		});
		
		// 주소변경하기 클릭 시 모달열기 + 정보가져와서 출력
		$('.addrChange').on('click', function(){
			addrModalOpen();
			$('.choiceContent').show();
			$('.addressInputContent').hide();
			$('.addrModal').modal('show');
			$('#saveAddrForm').find('input[type="checkbox"]').prop('checked', false);
	    	$('#saveAddrForm').find('input:not([type="button"])').val('');
		});
		
		// 배송지 수정 버튼 시 로직
		$('.choiceContentBody').on('click', '.addrUbtn', function(){
			//alert("ok");
			
			let addrId = $(this).data('id');
			console.log("addrId : "+addrId);
			
			addrUBtn(addrId);
			$('.choiceContent').hide();
			$('.addressInputContent').show();
		});
		
		// 배송지 수정하기
		$('.addressInputContent').on('submit', '#updateAddrForm', function(e){
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
				url: '/orders/addressUpdate/'+$(this).data('addrid'),
				type: 'POST',
				data: formData,
				contentType: false,
				processData: false,
				success: function(response) {
					Swal.fire({
			  			  title: '수정을 완료하였습니다.',
			  			  text: "배송지를 선택하시기 바랍니다.",
			  			  icon: 'success',
			  			  confirmButtonColor: '#3085d6',
			  			  customClass: {
			  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			  			  }
			 			}).then((result) => {
			 			    if (result.isConfirmed) { 
			 			    	$("#updateAddrForm").attr("id", "saveAddrForm");
			 			    	$('#saveAddrForm').find('input[type="checkbox"]').prop('checked', false);
			 			    	$('#saveAddrForm').find('input:not([type="button"])').val('');
			 			    	$('.addrModal').modal('hide');
			 			    }
			 			});
				},
				error: function(jqXHR, textStatus, errorThrown) {
					
				}
			});
		});
		
		// 배송지 삭제하기 
		$('.choiceContentBody').on('click', '.addrDbtn', function(){
			let addrId = $(this).data('id');
			
			$.ajax({
				url: '/orders/addressDelete/'+addrId,
				type: 'POST',
				success: function() {
					Swal.fire({
			  			  title: '삭제를 완료하였습니다.',
			  			  text: "배송지를 선택하시기 바랍니다.",
			  			  icon: 'success',
			  			  confirmButtonColor: '#3085d6',
			  			  customClass: {
			  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			  			  }
			 			}).then((result) => {
			 			    if (result.isConfirmed) { 
			 			    	addrModalOpen();
			 			    	$('.choiceContent').show();
			 					$('.addressInputContent').hide();
			 			    	
			 			    }
			 			});
				},
				error: function(jqXHR, textStatus, errorThrown) {
					
				}
			});
			
		});
		
		// 배송지 추가 버튼 시 작성페이지 content 보이기
		$('.addAddressBtn').on('click', function(){
			$('#addressInputLabel').text('배송지 등록');
			$('.saveBtnText').text('등록하기');
			$('#saveAddrForm').find('input[type="checkbox"]').prop('checked', false);
	    	$('#saveAddrForm').find('input:not([type="button"])').val('');
			$('.choiceContent').hide();
			$('.addressInputContent').show();
			
		});
		
		// 배송지 저장하기 버튼 시 로직 처리(ajax)
		$('.modal-dialog').on('submit','#saveAddrForm', function(e){
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
			  			  title: '저정을 완료하였습니다.',
			  			  text: "배송지를 선택하시기 바랍니다.",
			  			  icon: 'success',
			  			  confirmButtonColor: '#3085d6',
			  			  customClass: {
			  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			  			  }
			 			}).then((result) => {
			 			    if (result.isConfirmed) { 
			 			    	$('.addrModal').modal('hide');
			 			    }
			 			});
				},
				error: function(jqXHR, textStatus, errorThrown) {
					
				}
			});
			
		});
		
		
		// 주문결제 페이지에서 결제하기 버튼 클릭 시 로직
		$('#addrInfoForm').on('submit', function(e){
			e.preventDefault();
			
			//alert("ok");
			
			Checkout('${ordersInfo.order_id}');
			
			
			
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
	
	
	IMP.init('imp16704003'); // Iamport Key 초기화
	
	function requestPay() {
        IMP.request_pay({
            pg: "html5_inicis", // PG사 코드
            pay_method: "card", // 결제수단 (card, trans, vbank 등)
            merchant_uid: "order_" + new Date().getTime(), // 주문번호
            name: "상품명: 결제 테스트",
            amount: 10000, // 결제 금액
            buyer_email: "test@example.com",
            buyer_name: "홍길동",
            buyer_tel: "010-1234-5678",
            buyer_addr: "서울특별시 강남구 역삼동",
            buyer_postcode: "123-456"
        }, function (rsp) {
            if (rsp.success) {
                // 성공 시 백엔드로 결제 정보 전송
                alert("결제가 완료되었습니다.");
                processPayment(rsp);
            } else {
                // 실패 처리
                alert("결제에 실패하였습니다. 에러: " + rsp.error_msg);
            }
        });
    }

    function processPayment(rsp) {
        // 결제 정보 전송
        fetch('/orders/complete', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(rsp)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert("서버 결제 검증 완료");
            } else {
                alert("서버 결제 검증 실패");
            }
        });
    }
	
	
	
	
</script>


<!--====================================script 작성부=====================================-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
