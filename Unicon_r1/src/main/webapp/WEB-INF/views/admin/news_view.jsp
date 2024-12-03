<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
	<%-- ${newsInfo } --%>
	<section style="padding-top: 50px;">
            <div class="container">
	            <div class="line-title">
			        <h4 class="mb-0">소식 관리</h4>
			    </div>
                <div class="row">

                    <!-- start product grid left panel -->
                    <div class="col-lg-3">

                        <div class="side-bar">

                            <div class="widget">

                                <div id="accordion" class="accordion-style2">
                                    <div class="card">
                                        <div class="card-header" id="headingOne">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">슬라이드 관리</button>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="/admin/slide_create">슬라이드 등록</a></li>
                                                    <li><a href="/admin/slide_manage">슬라이드 등록내역</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingTwo">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                  소식 관리
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="/admin/news_create">소식 등록</a></li>
                                                    <li><a href="/admin/news_manage">소식 등록내역</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingThree">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                Accessories
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">Drives &amp; Storage</a></li>
                                                    <li><a href="#!">Networking Devices</a></li>
                                                    <li><a href="#!">Software</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingFour">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                  Clothes
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">T-Shirt</a></li>
                                                    <li><a href="#!">Pants</a></li>
                                                    <li><a href="#!">Saree</a></li>
                                                    <li><a href="#!">Joggers</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingFive">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                  Mobile
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">Intex</a></li>
                                                    <li><a href="#!">Google</a></li>
                                                    <li><a href="#!">Samsung</a></li>
                                                    <li><a href="#!">Apple</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                    <!-- end product grid left panel -->

                    <!-- start right panel section -->
                    <div class="col-lg-9 ps-lg-1-9">
						<div class="line-title" style="margin-bottom: 15px;">
					        <div style="display: flex; justify-content:space-between;">
						        <h5 class="mb-0" style="display: inline-block;">소식 수정</h5>
						        <button type="button" class="btn btn-secondary" onclick="location.href='/admin/news_manage?resion=${param.resion }&currentPage=${param.currentPage}';"
						        ><span class="small">목록으로</span></button>
							</div>
					    </div>
					    
                        <div class="col-md-11 col-lg-12">

                        <form class="quform" action="/admin/news_update/${newsInfo.news_id }?resion=${param.resion}&currentPage=${param.currentPage}" 
                        method="post" enctype="multipart/form-data" onclick="">
                                <div class="quform-elements">
                                    <div class="row">
                                    
                                        <!-- Begin Select element -->
                                        <div class="col-md-12">
                                            <div class="quform-element form-group">
                                            	<label for="name">소식명<span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="name" class="form-control" type="text" 
                                                    name="news_subject" placeholder="First Name" value="${newsInfo.news_subject }">
                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Select element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="applyfor">지역 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <select id="applyfor" class="form-control form-select" name="news_resion"
                                                    style="padding: 6px 12px;">
                                                        <option value="" disabled selected>지역을 선택하세요</option>
													    <option value="서울특별시" ${newsInfo.news_resion == '서울특별시' ? 'selected' : ''}>서울특별시</option>
													    <option value="부산광역시" ${newsInfo.news_resion == '부산광역시' ? 'selected' : ''}>부산광역시</option>
													    <option value="대구광역시" ${newsInfo.news_resion == '대구광역시' ? 'selected' : ''}>대구광역시</option>
													    <option value="인천광역시" ${newsInfo.news_resion == '인천광역시' ? 'selected' : ''}>인천광역시</option>
													    <option value="광주광역시" ${newsInfo.news_resion == '광주광역시' ? 'selected' : ''}>광주광역시</option>
													    <option value="대전광역시" ${newsInfo.news_resion == '대전광역시' ? 'selected' : ''}>대전광역시</option>
													    <option value="울산광역시" ${newsInfo.news_resion == '울산광역시' ? 'selected' : ''}>울산광역시</option>
													    <option value="세종특별자치시" ${newsInfo.news_resion == '세종특별자치시' ? 'selected' : ''}>세종특별자치시</option>
													    <option value="경기도" ${newsInfo.news_resion == '경기도' ? 'selected' : ''}>경기도</option>
													    <option value="강원도" ${newsInfo.news_resion == '강원도' ? 'selected' : ''}>강원도</option>
													    <option value="충청북도" ${newsInfo.news_resion == '충청북도' ? 'selected' : ''}>충청북도</option>
													    <option value="충청남도" ${newsInfo.news_resion == '충청남도' ? 'selected' : ''}>충청남도</option>
													    <option value="전라북도" ${newsInfo.news_resion == '전라북도' ? 'selected' : ''}>전라북도</option>
													    <option value="전라남도" ${newsInfo.news_resion == '전라남도' ? 'selected' : ''}>전라남도</option>
													    <option value="경상북도" ${newsInfo.news_resion == '경상북도' ? 'selected' : ''}>경상북도</option>
													    <option value="경상남도" ${newsInfo.news_resion == '경상남도' ? 'selected' : ''}>경상남도</option>
													    <option value="제주특별자치도" ${newsInfo.news_resion == '제주특별자치도' ? 'selected' : ''}>제주특별자치도</option>
                                                    </select>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="last_name">장소 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="last_name" class="form-control" type="text" 
                                                    name="news_place" placeholder="장소를 입력하세요" value="${newsInfo.news_place }">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="last_name">주관기관 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="last_name" class="form-control" type="text" 
                                                    name="news_ins" placeholder="주관기관을 입력하세요" value="${newsInfo.news_ins }">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="last_name">참여대상 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="last_name" class="form-control" type="text" 
                                                    name="news_att" placeholder="참여대상을 입력하세요" value="${newsInfo.news_att }">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="news_startdate">행사시작일 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="news_startdate" class="form-control" type="date" 
                                                    name="news_startdate" value="${newsInfo.news_startdate }">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="news_enddate">행사종료일 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="email" class="form-control" type="date" 
                                                    name="news_enddate" value="${newsInfo.news_enddate }">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Textarea element -->
                                        <div class="col-md-12">
                                            <div class="quform-element form-group">
                                                <label for="message">내용 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <textarea id="message" class="form-control" 
                                                    name="news_content" rows="10" placeholder="내용을 입력하세요">${newsInfo.news_content }</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Textarea element -->
                                        
                                        <!-- Begin Upload element -->
                                        <div class="col-md-12">
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <div class="quform-input">
                                                    <label for="resume">소식 이미지 <span class="quform-required">*</span></label>
                                                    <div class="custom-file">
                                                        <input class="custom-file-input" type="file" name="news_file">
                                                        <label class="custom-file-label" data-browse="Browse">이미지선택</label>
                                                    </div>
                                                    <p class="quform-description">이미지파일만 업로드 가능. 최대크기 10MB.</p>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                       <!-- End Upload element -->
                                        
                                        <div class="col-md-3">
                                            <div class="quform-element form-group">
                                                <div id="news_preview">
                                               		<img src="${newsInfo.news_src }" style="max-width: 100%; max-height: 100%; object-fit: cover;" />
                                                </div>
                                                <input name="news_src" type="hidden">
                                                <input name="news_id" type="hidden" value=${newsInfo.news_id }>
                                            </div>
                                        </div>

                                        <!-- Begin Submit button -->
                                        <div class="col-md-12">
                                            <div class="text-center">
                                                <button class="butn w-100" type="submit"><span>수정하기</span></button>
                                            </div>
                                            <div class="quform-loading-wrap"><span class="quform-loading"></span></div>
                                        </div>
                                        <!-- End Submit button -->

                                    </div>

                                </div>
                            </form>
                    </div>
                </div>
            </div>
            </div>
        </section>

<!--====================================작성부=====================================-->

<script>
$(document).ready(function () {
    
	// 파일 선택 이벤트 처리
    $('.custom-file-input').on('change', function (event) {
        // 선택된 파일 이름 가져오기
        var fileName = $(this).val().split('\\').pop(); // 파일 경로에서 이름만 분리
        // 파일 이름을 라벨에 적용
        $(this).next('.custom-file-label').text(fileName || '파일선택');
        
        const file = event.target.files[0]; // 업로드한 파일 가져오기
	    const $preview = $('#news_preview'); // 미리보기 영역 선택
	    if (file) {
	    	const reader = new FileReader();
	        reader.onload = function(e) {
	          const imgTag = 
	            "<img src='" + e.target.result + "' alt='Uploaded Image' " +
	            "style='max-width: 100%; max-height: 100%; object-fit: cover;' />";
	          $preview.html(imgTag);
	        };
	        reader.readAsDataURL(file); // 파일을 Data URL로 읽기
	    } else {
	    	$preview.empty();
	    }
    });
    
	
  //수정하기 버튼 클릭 시 submit하기(썸네일 없을 시 swal)
    $('.quform').on('submit', function(event){
    	event.preventDefault();
    	// 기존사진x, 신규사진x
    	if (!$('#news_preview img').attr('src')) {
    		//swal("Error!", "교육 썸네일을 등록해주세요!", "error");
    		Swal.fire({
    			  title: '정보없음!!',
    			  text: "이미지파일을 확인하시기 바랍니다.",
    			  icon: 'warning',
    			  customClass: {
    			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
    			  }
   			});
    		
    	} else {
    		// 기존사진o
    	   if($('.custom-file-input').val()==''){
    		   $('input[name="news_src"]').val($('#news_preview img').attr('src'));
    		   console.log($('input[name="news_src"]').val());
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
  			  confirmButtonColor: '#3085d6',
  			  cancelButtonColor: '#d33',
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
    
    
    
    
    
}); //jquery

</script>

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
