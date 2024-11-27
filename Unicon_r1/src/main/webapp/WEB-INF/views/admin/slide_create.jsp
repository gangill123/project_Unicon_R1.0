<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
	
	<section style="padding-top: 50px;">
            <div class="container">
	            <div class="line-title">
			        <h4 class="mb-0">슬라이드 관리</h4>
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
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">슬라이드 관리</button>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#accordion">
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
                                                <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                  소식 관리
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion">
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
						<div class="line-title">
					        <h5 class="mb-0">슬라이드 등록</h5>
					    </div>
                        <div class="col-md-11 col-lg-12">
                        
                        <form class="quform" action="/admin/slide_create" method="post" enctype="multipart/form-data" onclick="">
                                <div class="quform-elements">
                                    <div class="row">
                                    
                                    <!-- Begin Upload element -->
                                        <div class="col-md-12">
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <div class="quform-input">
                                                    <label for="resume">슬라이드 이미지 <span class="quform-required">*</span></label>
                                                    <div class="custom-file">
                                                        <input class="custom-file-input" type="file" id="resume" name="news_file" required>
                                                        <label class="custom-file-label" data-browse="Browse">파일선택</label>
                                                    </div>
                                                    <p class="quform-description">이미지파일만 업로드 가능. 권장사이즈 1920x700</p>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                       <!-- End Upload element -->
                                    
                                    	<div class="col-md-12">
	                                      <div class="quform-element form-group">
	                                          <div id="slide_preview"></div>
	                                      </div>
	                                  </div>
                                    
                                        <!-- Begin Select element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                            	<label for="name">슬라이드 제목<span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="name" class="form-control" type="text" name="ms_name" placeholder="슬라이드 제목을 작성하세요">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Select element -->

										<!-- Begin Text input element -->
                                        <div class="col-md-3">
                                            <div class="quform-element form-group">
                                                <label for="textSelector">문구 적용유무<span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <select id="textSelector" class="form-control form-select" 
                                                    style="padding: 6px 12px;">
                                                        <option value="적용안함" selected>적용안함</option>
													    <option value="적용">적용</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-3">
                                            <div class="quform-element form-group">
                                                <label for="btnSelector">버튼 적용유무<span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <select id="btnSelector" class="form-control form-select" name="news_resion"
                                                    style="padding: 6px 12px;">
                                                        <option value="적용안함" selected>적용안함</option>
													    <option value="적용">적용</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_tText">상단문구 <span class="quform-required">*</span></label>
                                                <div>
                                                    <input id="ms_tText" class="form-control slide-text" type="text" name="news_place" placeholder="최대 10글자" disabled>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_bText1">하단문구(좌측) <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="ms_bText1" class="form-control slide-text" type="text" name="ms_bText1" placeholder="최대 5글자" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_sText">강조문구 <span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="ms_sText" class="form-control slide-text" type="text" name="ms_sText" placeholder="최대 5글자" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_bText1">하단문구(우측)<span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="ms_bText1" class="form-control slide-text" type="text" name="ms_bText1" placeholder="최대 5글자" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_btnText">버튼명</label>
                                                <div class="quform-input">
                                                    <input id="ms_btnText" class="form-control slide-btn" type="text" name="ms_btnText" placeholder="최대 5글자" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_btnUrl">버튼URL</label>
                                                <div class="quform-input">
                                                    <input id="ms_btnUrl" class="form-control slide-btn" type="text" name="ms_btnUrl" placeholder="ex)/admin/slide_manage" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        

                                        <!-- Begin Submit button -->
                                        <div class="col-md-12">
                                            <div class="text-center">
                                                <button class="butn w-100" type="submit"><span>등록하기</span></button>
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
        $(this).next('.custom-file-label').text(fileName || 'Choose file');
        
        const file = event.target.files[0]; // 업로드한 파일 가져오기
	    const $preview = $('#slide_preview'); // 미리보기 영역 선택
	    if (file) {
	    	const reader = new FileReader();
	        reader.onload = function(e) {
	        	createImagePreview(e, $preview);
	        };
	        reader.readAsDataURL(file); // 파일을 Data URL로 읽기
	        
	    } else {
	    	$preview.empty();
	    }
    });
    
    
    // 적용유무에 따라서 input 활성화
    // 문구
    $('#textSelector').on('change', function(){
		if($(this).val() === '적용'){
			console.log($(this).val());
			$('.slide-text').prop('disabled', false); // disabled 속성 해제
		} else {
			$('.slide-text').prop('disabled', true); // disabled 속성 해제
		}
	});
    
    // 버튼
    $('#btnSelector').on('change', function(){
		if($(this).val() === '적용'){
			console.log($(this).val());
			$('.slide-btn').prop('disabled', false); // disabled 속성 해제
		} else {
			$('.slide-btn').prop('disabled', true); // disabled 속성 해제
		}
	});
    
    
    
    
    
    
    
    
    
}); //jquery

</script>


<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
