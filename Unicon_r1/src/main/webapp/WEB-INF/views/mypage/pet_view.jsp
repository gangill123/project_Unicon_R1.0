<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

<style>
.upload-container {
		position: relative;
		aspect-ratio: 1 / 1;
		border: 2px dashed #ccc;
		display: flex;
		justify-content: center;
		align-items: center;
		overflow: hidden;
		background-color: #f9f9f9;
	}
	
.upload-button {
		position: absolute;
		width: 100%;
		height: 100%;
		cursor: pointer;
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 0;
	}	
	
	.file-upload-default {
	    visibility: hidden;
	    position: absolute;
  }	
	
	#plusIcon1, #plusIcon2, #plusIcon3, #plusIcon4, #plusIcon5 {
		font-size: 2rem;
		color: #888;
	}
	
	#image-preview1, #image-preview2, #image-preview3, #image-preview4, #image-preview5 {
		width: 100%;
		height: 100%;
		object-fit: fill;
		display: none;
	}
	
</style>

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
	<%-- ${petInfo } --%>
	
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
                                    <li class="active"><a href="/mypage">프로필 관리</a></li>
                                    <li><a href="#!">커뮤니티 관리</a></li>
                                    <li><a href="#!">주문 관리</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- end services -->
                        
                    </div>
                    </div>
                    <!-- end left side section -->

                    <!-- start right side section -->
                
                    <div class="col-lg-9 order-1 order-lg-2 mb-1-9 mb-lg-0">
                      <form class="quform" action="/mypage/pet_update/+${petInfo.pet_id}" method="post" enctype="multipart/form-data" >
                        <div class="services-single-right">
                        	<div style="display: flex; justify-content:space-between; align-items: end; margin-bottom: 10px;">
						        <h4 class="mb-0" style="display: inline-block;">유니콘 정보</h4>
						        <button type="button" class="btn btn-secondary" onclick="location.href='/mypage';"
						        ><span class="small">이전으로</span></button>
							</div>
                        <div class="common-block" style="padding: 30px;">
                        <div class="row">
                          <div class="col-md-4"></div>
                                    
                          <!-- Begin Select element -->
                          <div class="col-md-4" style="text-align: center;">
                          	<div class="quform-element form-group" style="margin-bottom: 3rem;">
                          	  <label>유니콘 사진 <span class="quform-required">*</span></label>
                              <div class="upload-container rounded">
								<label for="image-input1" class="upload-button label-no-margin">
									<input type="file" class="file-upload-default image-input" 
										accept="image/*" id="image-input1" name="pet_file"/>
									<i id="plusIcon1" class="fa-solid fa-plus"></i>
									<img id="image-preview1" alt="이미지 미리보기" src="${petInfo.pet_src}"/>
								</label>
							</div>
							</div>
                          </div>
                          <!-- End Select element -->
                          </div>
                          
						<div class="row" style="justify-content: center;">
							<div class="col-md-5">
	                           <div class="quform-element form-group" style="margin-bottom: 2rem;">
	                               <label for="pet_name">유니콘 이름 <span class="quform-required">*</span></label>
	                               <div class="quform-input">
	                                   <input id="pet_name" class="form-control" type="text" name="pet_name" 
	                                   placeholder="유니콘 이름을 입력하세요." value="${petInfo.pet_name}">
	                               </div>
	                           </div>
	                         </div>
						
		               <!-- Begin Text input element -->
		               <div class="col-md-3">
		                   <div class="quform-element form-group" style="margin-bottom: 1.5rem;">
	                       	<label for="pet_gender">성별 <span class="quform-required">*</span></label>
	                       <div class="quform-input">
	                        <select id="pet_gender" class="form-control form-select" name="pet_gender"
	                        style="padding: 6px 12px;">
	                            <option value="" disabled selected>성별을 선택하세요</option>
						    	<option value="1">남아</option>
								<option value="2">여아</option>
		                           </select>
		                       </div>
		                   </div>
		               </div>
		               
		               <div class="col-md-3">
                           <div class="quform-element form-group" style="margin-bottom: 2rem;">
                               <label for="pet_color">색상 <span class="quform-required">*</span></label>
                               <div class="quform-input">
                                   <input id="pet_color" class="form-control" type="text" name="pet_color" 
                                   placeholder="유니콘 이름을 입력하세요." value="${petInfo.pet_color}">
                               </div>
                           </div>
                         </div>
						
						</div>
						
						<div class="row" style="justify-content: center;">
						
						<div class="col-md-4">
		                   <div class="quform-element form-group" style="margin-bottom: 2rem;">
	                       	<label for="pet_type">종류 <span class="quform-required">*</span></label>
	                       <div class="quform-input">
	                        <select id="pet_type" class="form-control form-select" name="pet_type" style="padding: 6px 12px;">
	                            <option value="" disabled selected>종류를 선택하세요</option>
						    	<option value="1000">강아지</option>
								<option value="2000">고양이</option>
								<option value="3000">기타</option>
	                           </select>
		                       </div>
		                   </div>
		               </div>
						
						<div class="col-md-4">
		                   <div class="quform-element form-group">
	                       	<label for="pet_code">세부종류 <span class="quform-required">*</span></label>
	                       	<div class="quform-input">
	                        <select id="pet_code" class="form-control form-select" name="pet_code"
	                        style="padding: 6px 12px;">
	                            <option value="" disabled selected>종류를 먼저 선택하세요</option>
		                           </select>
		                       </div>
		                   </div>
		               </div>
						
						<div class="col-md-3">
	                       	<div class="quform-element form-group">
	                           <label for="pet_etc_breed">세부종류 직접입력(선택)</label>
	                           <div class="quform-input">
	                               <input id="pet_etc_breed" class="form-control" type="text" 
	                               name="pet_etc_breed" placeholder="기타품종 시 작성 가능" disabled>
	                           </div>
	                       </div>
	                   </div>
						
						</div>
						
						
						
                         <div class="row" style="justify-content: center;">
							<div class="col-md-4">
	                           <div class="quform-element form-group" style="margin-bottom: 4rem;">
	                               <label for="pet_birthdate">탄생일 <span class="quform-required">*</span></label>
	                               <div class="quform-input">
	                                   <input id="pet_birthdate" class="form-control" type="date" name="pet_birthdate" 
	                                   value="${petInfo.pet_birthdate}">
	                               </div>
	                           </div>
	                         </div>
							<div class="col-md-4">
	                           <div class="quform-element form-group">
	                               <label for="pet_adopdate">입양(분양)일 <span class="quform-required">*</span></label>
	                               <div class="quform-input">
	                                   <input id="pet_adopdate" class="form-control" type="date" name="pet_adopdate" 
	                                   value="${petInfo.pet_adopdate}">
	                               </div>
	                           </div>
	                         </div>
                         </div>
						
	               
                  	<div class="row" style="justify-content: center;">		
	                    <div class="col-md-4">
	                        <div class="text-center">
	                            <button class="butn primary w-100" type="submit"><span>수정하기</span></button>
	                        </div>
	                    </div>
	                    <div class="col-md-4">
	                        <div class="text-center">
	                            <button class="deleteBtn butn w-100" type="button"
	                            data-id="${petInfo.pet_id}"><span>삭제하기</span></button>
	                        </div>
	                    </div>
                  	</div>			
                  				
                        
                        </div> <!-- common -->
                        </div>
                        <input type="hidden" name="pet_src">
                		</form>
                    </div>
                    <!-- end right side section -->

                </div>
            </div>
        </section>
	
	
	
	

<!--====================================작성부=====================================-->

<script>
$(document).ready(function () {
	
	// 화면 로드 시 사진 입력 후 출력
	$('#image-preview1').show();
	$('#plusIcon1').hide();
	
	// 성별 값 입력 후 출력
	$('select[name="pet_gender"]').val('${petInfo.pet_gender}');
	
	//수정하기 버튼 클릭 시 submit하기(썸네일 없을 시 swal)
	$('.quform').on('submit', function(event){
    	event.preventDefault();
    	// 기존사진x, 신규사진x
    	if (!$('#image-preview1').attr('src')) {
    		//swal("Error!", "교육 썸네일을 등록해주세요!", "error");
    		Swal.fire({
    			  title: '정보없음!!',
    			  text: "이미지파일을 확인하시기 바랍니다.",
    			  icon: 'warning',
    			  confirmButtonColor: '#86bc42',
    			  customClass: {
    			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
    			  }
   			});
    		
    	} else {
    		// 기존사진o
    	   if($('#image-input1').val()==''){
    		   $('input[name="pet_src"]').val($('#image-preview1').attr('src'));
    		   //console.log($('input[name="pet_src"]').val());
    		   updateSubmit();
    	   } else{
    		   // 신규사진o
    		   updateSubmit();
    	   }
    	}
    	
    	function updateSubmit(){
    		Swal.fire({
  			  title: '정보를 수정하시겠습니까?',
  			  text: "수정 전 정보를 다시 한번 확인하시기 바랍니다.",
  			  icon: 'warning',
  			  showCancelButton: true,
  			  confirmButtonColor: '#86bc42',
  			  cancelButtonColor: '#aaa',
  			  confirmButtonText: '수정',
  			  cancelButtonText: '취소',
  			  customClass: {
  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
 			  }
  			}).then((result) => {
  				if (result.isConfirmed) {
	  				Swal.fire({
	  	  			  title: '수정이 완료되었습니다!',
	  	  			  text: "수정하기를 통하여 재수정 가능합니다.",
	  	  			  icon: 'success',
	  	  			  confirmButtonColor: '#86bc42',
	  	  			  customClass: {
	  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
	 			 	  }
	  				}).then(function(){
	  					$('.quform').off('submit').submit();
	  				});
  				}
  			});
    	}
	}); //$('.quform')
	
	/*=============== 동물 종류 리스트 가져오기 ===============*/
	$('#pet_type').on('change', function() {
		
		let petOpt = $(this).val();
		
		$.ajax({
			url: '/mypage/pet_type/'+petOpt,
			type: 'GET',
			success: function(data){
				//console.log(data);
				$('#pet_code').empty();
				data.forEach(function(item){
					$('#pet_code').append("<option value='" + item.category_code + "'>" + item.category_value +"</option>");
				
					let petCode = $('#pet_code').val();
					
					if(petCode == '3000'){
						$('#pet_etc_breed').attr('disabled', false);
				} 
				});
				
				if(isFirstLoad){
					$('#pet_code').val('${petInfo.pet_code}').trigger('change');
				}
				
				
			},
			error: function() {
				console.error('AJAX 요청 실패');
			}
		});
	});
	/*=============== 동물 종류 리스트 가져오기 ===============*/
	
	
	/*=============== 기타품종 선택 시 입력창 활성화 ===============*/
	$('#pet_code').on('change', function() {
		
		let petCode = $(this).val();
		
		if(petCode == '1002' || petCode == '2002' || petCode == '3000'){
			$('#pet_etc_breed').attr('disabled', false);
		} else {
			$('#pet_etc_breed').attr('disabled', true);
			$('#pet_etc_breed').val('');
		}
		
		if(isFirstLoad){
			$('#pet_etc_breed').val('${petInfo.pet_etc_breed}');
			isFirstLoad = false;
		}
		
	});
	/*=============== 기타품종 선택 시 입력창 활성화 ===============*/
	
	
	
	// 최초 로드 시 종류 값 입력 -> 세부입력 출력 -> 세부종류 입력 (+ 선택일 경우 값 입력)
	// 최초 로드 플래그
	let isFirstLoad = true; 
	
	if(isFirstLoad){
		$('#pet_type').val('${petInfo.pet_type}').trigger('change');
	}
	
	/*=============== 이미지 미리보기 ===============*/
	$('.image-input').on('change', function(e) {
		const file = e.target.files[0];
		const reader = new FileReader();
		
		const inputId = e.target.id;
		const previewId = '#image-preview' + inputId.charAt(inputId.length - 1);
		const plusIconId = '#plusIcon' + inputId.charAt(inputId.length - 1);
		
		const fileTypeFilter = /(\.jpg|\.jpeg|\.png|\.gif|\.bmp|\.tiff|\.webp|\.svg|\.heic|\.ico|\.raw)$/i;
		
		if (file) {
			if(fileTypeFilter.exec(file.name)) {
				reader.onload = function(e) {
					$(previewId).attr('src', e.target.result).show();
					$(plusIconId).hide();
				}
				reader.readAsDataURL(file);
			} else {
				$(this).val('');
			}
		} else {
			$(previewId).hide();
			$(plusIconId).show();
			$('#image-preview1').attr('src','');
		}
	});
	/*=============== 이미지 미리보기 ===============*/
	
	
	// 펫 정보 삭제하기 로직
	$('.deleteBtn').on('click', function(){
		let pet_id = $(this).data('id');
		//console.log(pet_id);
		
		Swal.fire({
  			  title: '정말 삭제하시겠습니까?',
  			  text: "삭제 전 다시 한번 확인하시기 바랍니다.",
  			  icon: 'warning',
  			  showCancelButton: true,
  			  confirmButtonColor: '#86bc42',
  			  cancelButtonColor: '#aaa',
  			  confirmButtonText: '삭제',
  			  cancelButtonText: '취소',
  			  customClass: {
  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
 			  }
  			}).then((result) => {
  				if (result.isConfirmed) {
  					$.ajax({
  						url: '/mypage/pet_delete/'+pet_id,
  						type: 'POST',
  						success: function(){
  							//alert("ok");
  							Swal.fire({
  			  	  			  title: '삭제를 완료하였습니다!',
  			  	  			  text: "등록하기를 통하여 재등록 가능합니다.",
  			  	  			  icon: 'success',
  			  	  			  confirmButtonColor: '#86bc42',
  			  	  			  customClass: {
  			  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
  			 			 	  }
  			  				}).then(function(){
  			  					window.location.href = "/mypage"; // 이동할 URL
  			  				});
  						},
  						error: function(){
  							alert("no");
  						}
  					});
	  				
  				}
  			});
		
		
		
	});
	
	
	
	
	
	
	
	
});//readay

</script>



<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
