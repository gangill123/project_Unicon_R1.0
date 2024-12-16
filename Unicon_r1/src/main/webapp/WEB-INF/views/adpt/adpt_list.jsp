<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->
<style>


.project-grid-img {
    width: 100%;
    aspect-ratio: 3 / 3.3; /* 원하는 가로:세로 비율 설정 */
    overflow: hidden;    /* 이미지가 컨테이너를 벗어나지 않도록 */
}

.project-grid-img img {
    width: 100%;
    height: 100%;
    object-fit: fill;   /* 이미지를 컨테이너에 맞추되 비율 유지 */
    border-radius: 0.75rem; /* 기존 rounded-3 스타일 유지 */
}

.filtering span{
	margin-right: 35px;
	font-size: 1.2rem;
}

.filtering{
	margin-bottom: 20px;
}

#adpt_image0 {
	width: 100%;
	aspect-ratio: 3 / 3; /* 원하는 가로:세로 비율 설정 */
	border-radius: 0.75rem; /* 기존 rounded-3 스타일 유지 */
}

.adpt_image_sub {
	width: 30%;
	aspect-ratio: 1 / 1;
	border-radius: 0.75rem;
}

.label-offer2 {
  position: absolute;
  right: 0;
  top: 0;
  height: 25px;
  line-height: 25px;
  display: inline-block;
  padding: 0px 12px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 600;
  font-size: 12px;
  z-index: 1; 
}

.scroll-hide {
	scrollbar-width: none;
	-ms-overflow-style: none;
}

.scroll-hide::-webkit-scrollbar {
	display: none;
}

.actGauge, .socialGauge {
	display: flex;
	width: 11rem;
	height: 1.5rem;
	background-color: #fff;
	border-radius: 5px;
}

.actGauge div, .socialGauge div {
	flex: 1;
	background-color: #86bc42;
	border-right: 1px solid #fff;
}

.actGauge div:last-child, .socialGauge div:last-child {
	border-right: none;
}

.actGauge .filled, .socialGauge .filled {
	background-color: #86bc42;
}

.actGauge .empty, .socialGauge .empty {
	background-color: #e0e0e0;
}

.readpre {
	font-weight: 700;
	transition: all 0.3s ease;
	-moz-transition: all 0.3s ease;
	-webkit-transition: all 0.3s ease;
	-ms-transition: all 0.3s ease;
	-o-transition: all 0.3s ease; 
}

.readpre:before {
	content: '\f104';
	font-size: 16px;
	vertical-align: top;
	font-family: Font Awesome\ 5 Free;
	padding-left: 8px;
	vertical-align: middle; 
}

.readpre:hover {
	color: #86bc42; 
}

.adpt_image_sub {
	cursor: pointer;
}

</style>


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
		
		<%-- ${newsAllInfo } --%>
		
		<section>
            <div class="container">
                <div class="section-heading">
                    <h2>입양하기</h2>
                    <p class="w-md-75 w-lg-55">전국 보호소에서 모집하고 있는 입양 글 정보를 안내드립니다.</p>
                </div>
            </div>

            <div class="container">
                <div class="row">

                    <!-- Start links -->
                    <div class="filtering col-sm-12 text-center">
                        <span data-filter='all' class="active">전체보기</span>
                        <span data-filter='dog'>개</span>
                        <span data-filter='cat'>고양이</span>
                        <span data-filter='etc'>기타</span>
                        <span data-filter='local'>우리 지역 글 보기</span>
                    </div>
                    <!-- End links -->

                </div>

                <!-- start portfolio gallery -->
                <div class="text-center row" id="adpt-grid">
                    
                </div>
                
                <div class="row mt-1-9 mt-lg-6">
	                     <div class="col-12">
	                         <div class="pagination text-small text-uppercase text-extra-dark-gray">
	                             <ul id="pagination"></ul>
	                         </div>
	                     </div>
               		</div>
                <!-- end portfolio gallery -->

            </div>

        </section>
        
        
        <!-- 모달2 -->
	<div class="modal fade" id="exampleModal3" tabindex="-1" 
		aria-labelledby="exampleModalLabel" data-bs-focus="false" aria-hidden="true" style="top: 20px;">
	    <div class="modal-dialog" style="max-width: 1200px;">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">소식 상세정보</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <!-- Start Product Section -->
                <div class="row mb-6 mb-sm-7 mb-md-8 mb-lg-9" style="margin-bottom: 0;">
                    <div class="col-lg-5 text-center text-lg-start mb-1-9 mb-lg-0">
                        <!-- product left start -->
                        <div>
                            <img class="mb-1-9" id="adpt_image0" 
                            	src="${pageContext.request.contextPath }/uploads/defaultAdpt.jpg" >
                        </div>
                        <div class="d-flex justify-content-center">
                        	<img class="adpt_image_sub mx-1" id="adpt_image1"
                        		src="${pageContext.request.contextPath }/uploads/defaultAdpt.jpg" >
                        	<img class="adpt_image_sub mx-1" id="adpt_image2"
                        		src="${pageContext.request.contextPath }/uploads/defaultAdpt.jpg" >
                        	<img class="adpt_image_sub mx-1" id="adpt_image3"
                        		src="${pageContext.request.contextPath }/uploads/defaultAdpt.jpg" >
                        </div>
                        <!-- product left end -->
                    </div>
                    <div class="col-lg-7 ps-lg-2-3">
                        <div class="product-detail">
                            <h4 class="mb-2">제목 <span class="label-sale bg-primary text-white text-uppercase display-30">진행중</span></h4>
                            <div class="bg-primary separator-line-horrizontal-full mb-4"></div>
                            <p class="rating-text"><span>이름 :</span> <span class="text-primary">동물이름</span
                            ><span>  /  보호소 :</span> <span class="text-primary">보호소이름</span></p>
                            <div class="row">
                            	<div class="col-8">
                            		<h6>소개</h6>
                            	</div>
	                            <div class="col-4">
                            		<h6>기타사항</h6>
                            	</div>
	                            <div class="col-8 scroll-hide" style="min-height:200px; max-height:200px; overflow-y: auto;">
	                            	<span>Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.
	                            	Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.
	                            	Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.</span>
	                            </div>
	                            <div class="col-4 scroll-hide" style="min-height:200px; max-height:200px; overflow-y: auto;">
	                            	<span>Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.
	                            	Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.
	                            	Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.</span>
	                            </div>
                            </div>
							<div class="row" style="margin-top: 30px;">
								<div class="col-6 d-flex">
									<h6 class="col-3">활동성</h6>
									<div class="actGauge col-7">
										<div class="filled"></div>
										<div class="empty"></div>
										<div class="empty"></div>
										<div class="empty"></div>
										<div class="empty"></div>
									</div>
									<div class="col-2 text-center"><h6 style="color:#86bc42;">1</h6></div>
								</div>
								<div class="col-6 d-flex">
									<h6 class="col-3">사회성</h6>
									<div class="socialGauge col-7">
										<div class="filled"></div>
										<div class="empty"></div>
										<div class="empty"></div>
										<div class="empty"></div>
										<div class="empty"></div>
									</div>
									<div class="col-2 text-center"><h6 style="color:#86bc42;">1</h6></div>
								</div>
                            </div>
                            
                            <div class="row" style="margin-top: 40px;">
                                <div class="col-12">
                                    <div class="inner-title">
                                        <h6 style="margin-bottom: 10px;">다음 글 알아보기</h6>
                                    </div>
                                </div>
                                <!-- start feature box item -->
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="col-sm-4 mb-4 mb-md-0">
                                            <img class="rounded" style="height: 100%; aspect-ratio: 1/1;"
                                            src="${pageContext.request.contextPath }/uploads/defaultAdpt.jpg" alt="...">
                                        </div>
                                        <div class="col-sm-8">
                                            <h5 class="h6 font-weight-600 mb-2">Life Insurance</h5>
                                            <div style="min-height: 150px; max-height: 150px; overflow: hidden;">
                                           		<p>이름 : 동물이름<br>보호소 : 보호소이름<br>Exhaustive technology of implementing multi Exhaustive technology of implementing multi</p>
                                            </div>
                                            <a href="#!" class="readmore"><span>다음 글 보기</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Product Section -->
	                
	            </div>
	        </div>
	    </div>
	</div>
        
        

<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->
<script src="${pageContext.request.contextPath }/resources/new_assets/js/adpt.js"></script>
<script>
$(document).ready(function () {
	let allData = []; // 전체 데이터를 저장
	let adptFilters = {};
	let adptFilter = 'all';
	adptFilters.adptFilter = adptFilter;
	
	// 화면 로드 시 페이징처리
	adptPaging(adptFilters);
	
	// 동작에 따른 페이지 처리
	$('.filtering span').on('click', function(){
		adptFilter = $(this).data('filter');
		
		if(adptFilter) {
			adptFilters.adptFilter = adptFilter;
		}
		
		adptPaging(adptFilters);
	});
		
		
	// 이름 클릭시 모달 열기
	$('#adpt-grid').on('click', '#newViewTag', function(){
		let adptId = $(this).data('adpt');
		
		adptModalProcess(adptId);
	});
	
	// 다음 소식 상세보기 시 모달 내용 교체
	$('.modal-content').on('click', '.readmore', function(){
		let nextAdptId = $(this).data('next-adpt-id');
		
		adptModalProcess(nextAdptId);
	});
	
	// 이전 소식 상세보기 시 모달 내용 교체
	$('.modal-content').on('click', '.readpre', function(){
		let nextAdptId = $(this).data('next-adpt-id');
		
		adptModalProcess(nextAdptId);
	});
	
	/*===== 이미지 교체 =====*/
	$('.modal-content').on('click', '.adpt_image_sub', function(){
		var imageSubSrc = $(this).attr('src');
		var imageMainSrc = $('#adpt_image0').attr('src');

		$('#adpt_image0').attr('src', imageSubSrc);
		$(this).attr('src', imageMainSrc);
	});
	/*===== 이미지 교체 =====*/
	

	/*===== 상담신청버튼 =====*/
	$('.modal-content').on('click', '#adptCounselbtn', function() {
		
		$.ajax({
			url:'/adpt/counsel',
			method:'POST',
			success: function(resp) {
				
				const gender_text = resp.member_gender == 'female' ? '여자' : '남자';
				const member_info = 
					'<div class="text-start">' +
				    '아이디 : <u style="text-underline-offset: 0.3em;"><span style="color:#86bc42;">' + resp.member_id + '</span></u> <br>' +
				    '전화번호 : <u style="text-underline-offset: 0.3em;"><span style="color:#86bc42;"> ' + resp.member_tel + '</span></u> <br>' +
				    '성별 : <u style="text-underline-offset: 0.3em;"><span style="color:#86bc42;">' + gender_text + '</span></u> <br>' +
				    '이름 : <u style="text-underline-offset: 0.3em;"><span style="color:#86bc42;">' + resp.member_name + '</span></u> <br>' +
				    '생년월일 : <u style="text-underline-offset: 0.3em;"><span style="color:#86bc42;">' + resp.member_birth + '</span></u> <br>' +
				    '이메일 : <u style="text-underline-offset: 0.3em;"><span style="color:#86bc42;">' + resp.member_email + '</span></u> <br>' +
				    '주소 : <u style="text-underline-offset: 0.3em;"><span style="color:#86bc42;">' + resp.road_address + ' ' + resp.detail_address + '</span></u> <br>' + '<br>' +
				    '<b>신청 정보가 맞다면 <span style="color:#86bc42;">"신청합니다"</span>를 입력해주세요!</b>' +
				    '</div>';
				
				Swal.fire({
					title: '상담신청을 하시겠습니까?',
					html: member_info,
					input: 'text',
					inputPlaceholder: '"신청합니다"를 입력해주세요',
					allowOutsideClick: false,
					showCancelButton: true,
					confirmButtonColor: '#86bc42',
					cancelButtonColor: '#aab2bd',
					confirmButtonText: '신청',
					cancelButtonText: '닫기',
					inputValidator: function(value) {
						if (!value || value != '신청합니다') {
							return '"신청합니다"를 입력해주세요';
						}
					}
				}).then(function(result) {
					if (result.isConfirmed) {
						console.log(resp.member_id);
						console.log($('#animal_id').val());
						$.ajax({
							url: '/adpt/counsel/submit',
							method: 'POST',
							contentType: 'application/json',
							data: JSON.stringify({ 
								"member_id" : resp.member_id, 
								"animal_id" : $('#animal_id').val() }),
							success: function() {
								Swal.fire({
									title: '신청이 완료되었습니다',
									icon: 'success',
									allowOutsideClick: false,
									confirmButtonColor: '#86bc42',
									confirmButtonText: '확인',
								}).then(function(result) {
									if (result.isConfirmed) {
										location.reload();
									}
								});
							},
							error: function(xhr, status, error) {
								console.error("AJAX 오류:", status, error);
								Swal.fire({
									title: '오류 발생',
									text: '상담 신청에 실패했습니다. 다시 시도해 주세요.',
									icon: 'error',
									allowOutsideClick: false,
									confirmButtonColor: '#86bc42',
									confirmButtonText: '확인'
								});
							}
						});
					}
				});
			},
			error: function () {
				Swal.fire({
					title: '로그인이 필요합니다!',
					text: '로그인을 해주세요',
					icon: 'warning',
					allowOutsideClick: false,
					confirmButtonColor: '#86bc42',
					confirmButtonText: '확인'
				});
			}
		});
	});
	/*===== 상담신청버튼 =====*/
	
	
}); //jquery


</script>


<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
