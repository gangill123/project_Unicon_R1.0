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

#news_image {
	width: 100%;
	aspect-ratio: 3 / 4.65; /* 원하는 가로:세로 비율 설정 */
	border-radius: 0.75rem; /* 기존 rounded-3 스타일 유지 */
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
  z-index: 1; }


</style>


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
		
		<%-- ${newsAllInfo } --%>
		
		<section>
            <div class="container">
                <div class="section-heading">
                    <h2>반려동물 행사 정보</h2>
                    <p class="w-md-75 w-lg-55">전국 지자체에서 개최하고 있는 반려동물 행사 정보를 안내드립니다.</p>
                </div>
            </div>

            <div class="container">
                <div class="row">

                    <!-- Start links -->
                    <div class="filtering col-sm-12 text-center">
                        <span data-id='lastest' class="active">모두보기</span>
                        <span data-id='upcoming'>다가오는 행사</span>
                        <span data-id='local'>우리 지역 행사</span>
                        <span data-id='closed'>종료된 행사</span>
                    </div>
                    <!-- End links -->

                </div>

                <!-- start portfolio gallery -->
                <div class="text-center row" id="news-grid">
                    
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
		aria-labelledby="exampleModalLabel" aria-hidden="true" style="top: 20px;">
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
                            <img class="mb-1-9" id="news_image" src="${pageContext.request.contextPath }/resources/new_assets/img/news01.jpg" >
                        </div>
                        <!-- product left end -->
                    </div>
                    <div class="col-lg-7 ps-lg-2-3">
                        <div class="product-detail">
                            <h3 class="mb-2">새해맞이 축제 <span class="label-sale bg-primary text-white text-uppercase display-30">진행중</span></h3>
                            <div class="bg-primary separator-line-horrizontal-full mb-4"></div>
                            <p class="rating-text"><span>주관 :</span> <span class="text-primary">해운대구청</span
                            ><span>  /  참여대상 :</span> <span class="text-primary">전국민 누구나</span></p>
                            <div style="min-height:200px; max-height:200px; overflow-y: auto;">
                            	<p>Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.
                            	Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.
                            	Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.</p>
                            </div>
							<div class="row" style="margin-top: 30px;">
                                <div class="col-lg-6 text-center">
                                    <h6 style="font-size: 1.3rem;"><i class="fa-solid fa-map-location-dot"></i> 행사장소</h6>
                                    <p class="mb-0">부산시청</p>
                                </div>
                                <div class="col-lg-5 text-center">
                                    <h6 style="font-size: 1.3rem;"><i class="fa-solid fa-calendar-days"></i> 행사일</h6>
                                    <p class="mb-0">전국민 누구나</p>
                                </div>
                            </div>
                            
                            <div class="row" style="margin-top: 40px;">
                                <div class="col-12">
                                    <div class="inner-title">
                                        <h6 style="margin-bottom: 10px;">다음 소식 알아보기</h6>
                                    </div>
                                </div>
                                <!-- start feature box item -->
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="col-sm-4 mb-4 mb-md-0">
                                            <img class="rounded" style="height: 100%; aspect-ratio: 1/1;"
                                            src="${pageContext.request.contextPath }/resources/new_assets/img/news02.jpg" alt="...">
                                        </div>
                                        <div class="col-sm-8">
                                            <h5 class="h6 font-weight-600 mb-2">Life Insurance</h5>
                                            <div style="min-height: 150px; max-height: 150px; overflow: hidden;">
                                           		<p>행사일 : 2024.11.12<br>장소 : 우리나라 어디선가 진행됨<br>Exhaustive technology of implementing multi Exhaustive technology of implementing multi</p>
                                            </div>
                                            <a href="#!" class="readmore"><span>소식 상세보기</span></a>
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

<script>
$(document).ready(function () {
	let allData = []; // 전체 데이터를 저장
	
	let id = 'lastest';
	// 화면 로드 시 페이징처리
	newspagePaging(id)
	
	// 동작에 따른 페이지 처리
	$('.filtering span').on('click', function(){
		id = $(this).data('id');
		console.log(id);
		newspagePaging(id);
	});
		
		
	// 이름 클릭시 모달 열기
	$('#news-grid').on('click', '#newViewTag', function(){
		let newsId = $(this).data('news');
		console.log(newsId);
		
		newsModalProcess(newsId);
	});
	
	// 다음 소식 상세보기 시 모달 내용 교체
	$('.modal-content').on('click', '.readmore', function(){
		//alert("next");
		let nextId = $(this).data('nextid');
		console.log("nextId : " + nextId);
		
		newsModalProcess(nextId);
	});
	
}); //jquery


</script>


<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
