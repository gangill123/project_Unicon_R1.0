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
                                    
                                    
                                </div>
                            </div>

                        </div>

                    </div>
                    <!-- end product grid left panel -->

                    <!-- start right panel section -->
                    <div class="col-lg-9 ps-lg-1-9">
						<div class="line-title" style="margin-bottom: 15px;">
							<div style="display: flex; justify-content:space-between;">
						        <h5 class="mb-0" style="display: inline-block;">슬라이드 등록</h5>
						        <button type="button" class="btn btn-secondary" onclick="location.href='/admin/slide_manage';"
						        ><span class="small">목록으로</span></button>
							</div>
					    </div>
					    
                        <div class="col-md-11 col-lg-12">
                        
                        <form class="quform" action="/admin/slide_create" method="post" enctype="multipart/form-data">
                                <div class="quform-elements">
                                    <div class="row">
                                    
                                    <!-- Begin Upload element -->
                                        <div class="col-md-12">
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <div class="quform-input">
                                                    <label for="ms_file">슬라이드 이미지 <span class="quform-required">*</span></label>
                                                    <div class="custom-file">
                                                        <input class="custom-file-input" type="file" id="ms_file" name="ms_file" required>
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
                                        <div class="col-md-8">
                                            <div class="quform-element form-group">
                                            	<label for="ms_name">슬라이드 제목<span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="ms_name" class="form-control" type="text" name="ms_name" placeholder="슬라이드 제목을 작성하세요">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Select element -->

										<!-- Begin Text input element -->
                                        <div class="col-md-4">
                                            <div class="quform-element form-group">
                                                <label for="textSelector">문구 및 버튼 적용유무</label>
                                                <div class="quform-input">
                                                    <select id="textSelector" class="form-control form-select" 
                                                    style="padding: 6px 12px;">
													    <option value="적용" selected>적용</option>
                                                        <option value="적용안함">적용안함</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_tText">상단문구</label>
                                                <div>
                                                    <input id="ms_tText" class="form-control slide-text" type="text" name="ms_tText" placeholder="최대 10글자">
                                                </div>
                                            </div>

                                        </div>
                                        <!-- End Text input element -->

                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_bText1">하단문구(좌측)</label>
                                                <div class="quform-input">
                                                    <input id="ms_bText1" class="form-control slide-text" type="text" name="ms_bText1" placeholder="최대 5글자">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_sText">강조문구</label>
                                                <div class="quform-input">
                                                    <input id="ms_sText" class="form-control slide-text" type="text" name="ms_sText" placeholder="최대 5글자">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_bText2">하단문구(우측)</label>
                                                <div class="quform-input">
                                                    <input id="ms_bText2" class="form-control slide-text" type="text" name="ms_bText2" placeholder="최대 5글자">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_btnText">버튼명</label>
                                                <div class="quform-input">
                                                    <input id="ms_btnText" class="form-control slide-text" type="text" name="ms_btnText" placeholder="최대 5글자">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_btnUrl">버튼URL</label>
                                                <div class="quform-input">
                                                    <input id="ms_btnUrl" class="form-control slide-text" type="text" name="ms_btnUrl" placeholder="ex)/admin/slide_manage">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_startdate">개시 시작일<span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="ms_startdate" class="form-control" type="date" name="ms_startdate" required>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        
                                        <!-- Begin Text input element -->
                                        <div class="col-md-6">
                                            <div class="quform-element form-group">
                                                <label for="ms_enddate">개시 종료일<span class="quform-required">*</span></label>
                                                <div class="quform-input">
                                                    <input id="ms_enddate" class="form-control" type="date" name="ms_enddate" required>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Text input element -->
                                        

                                        <!-- Begin Submit button -->
                                        <div class="col-md-12">
                                            <div class="text-center">
                                                <button class="butn w-100" type="submit"><span>등록하기</span></button>
                                            </div>
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
	$('.navbar #slide').addClass('current');
	
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
	    
	   $('#textSelector').val('적용');
	   $('.slide-text').val('');
	   $('.slide-text').prop('disabled', false); // disabled 속성 해제
	    
    });
    
    
    // 적용유무에 따라서 input 활성화
    $('#textSelector').on('change', function(){
		if($(this).val() === '적용'){
			console.log($(this).val());
			$('.slide-text').prop('disabled', false); // disabled 속성 해제
			$('#slide_textField').show();
		} else {
			$('.slide-text').prop('disabled', true); // disabled 속성 적용
			$('.slide-text').val(''); // input값 초기화
			$('#slide_textField').hide();
		}
	});
    
    // 문구내용 작성에 따른 슬라이드 반응
    $('#ms_tText').on('input', function(){
    	$('.main-font').text($(this).val());
    });
    $('#ms_bText1').on('input', function(){
    	$('#left_btm').text($(this).val());
    });
    $('#ms_sText').on('input', function(){
    	$('.subheading strong').text($(this).val());
    });
    $('#ms_bText2').on('input', function(){
    	$('#right_btm').text($(this).val());
    });
    $('#ms_btnText').on('input', function(){
    	$('#btnText').text($(this).val());
    });
    
    
}); //jquery

</script>


<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
