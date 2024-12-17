<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

<style>
.product-details:hover .image {
    opacity: 0.7; /* 투명도 설정 */
    transition: opacity 0.3s ease; /* 부드러운 애니메이션 효과 */
}

.product-img {
    width: 100%;
    aspect-ratio: 1920 / 700; /* 원하는 가로:세로 비율 설정 */
    overflow: hidden;    /* 이미지가 컨테이너를 벗어나지 않도록 */
}

.product-img img {
    width: 100%;
    height: 100%;
    object-fit: cover;   /* 이미지를 컨테이너에 맞추되 비율 유지 */
    border-radius: 0.75rem; /* 기존 rounded-3 스타일 유지 */
}

</style>

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
	<%-- ${sildeAllInfo } --%>
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
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> 슬라이드 관리</button>
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
                                                <button class="btn btn-link" data-bs-toggle="collapse" 
                                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
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
						        <h5 class="mb-0" style="display: inline-block;">슬라이드 등록내역</h5>
						        <button type="button" class="btn btn-secondary" onclick="location.href='/admin/slide_create';"
						        ><span class="small">등록하기</span></button>
							</div>
					    </div>
					    
                        <div class="row product-grid" id="data-grid">
                        
                        
                        </div>
                    <!-- end right panel section -->
					<div class="row mt-1-9 mt-lg-6">
	                     <div class="col-12">
	                         <div class="pagination text-small text-uppercase text-extra-dark-gray">
	                             <ul id="pagination"></ul>
	                         </div>
	                     </div>	
               		</div>
                    
                </div>
            </div>
            </div>
            
        </section>
        

<!--====================================작성부=====================================-->

<script>
$(document).ready(function () {
	$('.navbar #slide').addClass('current');
	let currentPage = 1;
	
	if(!'${param.currentPage}' == ''){
		currentPage = parseInt('${param.currentPage}', 10);
		console.log(currentPage);
	}
	
	//페이징 처리 호출
	slidePaging(currentPage);
	
});//readay

</script>



<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
