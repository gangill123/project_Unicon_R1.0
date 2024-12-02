<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->
<style>


.project-grid-img {
    width: 100%;
    aspect-ratio: 3 / 4; /* 원하는 가로:세로 비율 설정 */
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
}

.filtering{
	margin-bottom: 20px;
}

#news_image {
	aspect-ratio: 3 / 4; /* 원하는 가로:세로 비율 설정 */
}
</style>

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
                        <span data-id='lastest' class="active">최신등록순</span>
                        <span data-id='this-week'>이번 주 행사</span>
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
		aria-labelledby="exampleModalLabel" aria-hidden="true" style="top: 50px;">
	    <div class="modal-dialog" style="max-width: 1200px;">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <!-- Start Product Section -->
                <div class="row mb-6 mb-sm-7 mb-md-8 mb-lg-9" style="margin-bottom: 1rem;">
                    <div class="col-lg-5 text-center text-lg-start mb-1-9 mb-lg-0">

                        <!-- product left start -->
                        <div>
                            <img class="mb-1-9" id="news_image" src="${pageContext.request.contextPath }/resources/new_assets/img/dog.jpg" >
                        </div>
                        <!-- product left end -->

                    </div>
                    <div class="col-lg-7 ps-lg-2-3">
                        <div class="product-detail">
                            <h3 class="mb-2">Crop Top for Girls <span class="label-sale bg-primary text-white text-uppercase display-30">Sale</span></h3>
                            <div class="bg-primary separator-line-horrizontal-full mb-4"></div>
                            <p class="rating-text"><span>SKU:</span> <span class="text-primary">290397</span></p>
                            <p>Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.</p>

                            <div class="mb-4">

                                <div class="d-inline-block me-3 pe-3 border-end border-color-extra-medium-gray">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>

                                <div class="d-inline-block">
                                    <a class="text-primary" href="#!">Write a review</a>
                                </div>

                            </div>
                            <div class="mb-4">
                                <span class="me-3 display-25 font-weight-600 offer-price">$499.00</span>
                                <span class="display-25 font-weight-700 text-primary">$299.00</span>
                            </div>

                            <div class="row">
                                <div class="col-4 col-md-2 col-lg-2">
                                    <label>Size:</label>

                                    <select class="mb-4">
                                        <option value="S">S</option>
                                        <option value="M">M</option>
                                        <option value="L">L</option>
                                        <option value="XL">XL</option>
                                    </select>

                                </div>
                                <div class="col-6 col-md-2 col-lg-3">
                                    <div class="product-color">
                                        <label>Color:</label>
                                        <select class="mb-4">
                                            <option value="Red">Black</option>
                                            <option value="Black">Red</option>
                                            <option value="Beige">Beige</option>
                                            <option value="White">White</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4 col-lg-2">
                                    <label>Qty:</label>
                                    <input type="text" class="form-control mb-4" value="1" placeholder="1">
                                </div>

                            </div>

                            <div class="row mb-4">
                                <div class="col-lg-12">
                                    <button class="butn primary me-2 mb-2 mb-md-0"><span><i class="fas fa-shopping-cart me-1"></i> Add to Cart</span></button>
                                    <button class="butn text-uppercase"><span><i class="fas fa-heart me-1"></i> Add to wishlist</span></button>
                                </div>
                            </div>

                            <div class="row">

                                <div class="col-lg-7">

                                    <label>Share on:</label>
                                    <ul class="social-icon-style3 ps-0">
                                        <li><a href="#!"><i class="fab fa-facebook-f"></i></a></li>
                                        <li><a href="#!"><i class="fab fa-twitter"></i></a></li>
                                        <li><a href="#!"><i class="fab fa-instagram"></i></a></li>
                                        <li><a href="#!"><i class="fab fa-youtube"></i></a></li>
                                        <li><a href="#!"><i class="fab fa-linkedin-in"></i></a></li>
                                    </ul>

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
		let newsId = $(this).data('id');
		console.log(newsId);
	});
	
	
	
	
	
}); //jquery


</script>


<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
