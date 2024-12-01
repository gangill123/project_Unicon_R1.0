<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

  <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/style.css" rel="stylesheet">

<!-- 추가 템플릿 css/js 작성란 -->
<style>



</style>
</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
	
	
	

<!-- start page title section -->
<section class="page-title-section bg-primary">
    <div class="container">
		
        <div class="row">
            <div class="col-md-12">
                <h1>unicon 고객센터</h1>
            </div>
            <div class="col-md-12">
                <ul class="ps-0">
                     <li><a href="inquiry"><i class="ti-home"></i></a></li>
                    <li class="active"><a href="inquiry">main</a></li>
                </ul>
            </div>
        </div>
	
    </div>
</section>
 <!-- end page title section -->                
 


<!-- start subscribe section -->
<section class="lg bg-very-light-gray bg-img" data-overlay-dark="0" data-background="img/bg/bg-pattern.png">
    <div class="container">

        <div class="section-heading title-style8">
            <h3>unicon &amp; FAQ <span class="inner-title">무엇을 도와드릴까요?</span></h3>
            <p class="w-lg-55 w-md-75 mx-auto">서비스명과 함께 검색해보세요.</p>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-7">

                <!-- start form here -->

                <form class="quform newsletter-rounded" action="quform/newsletter-two.php" method="post" enctype="multipart/form-data" onclick="">

                    <div class="quform-elements">

                        <div class="row">

                            <!-- Begin Text input element -->
                            <div class="col-md-12">
                                <div class="quform-element">
                                    <div class="quform-input">
                                        <input class="rounded-pill form-control" id="email_address" type="text" name="email_address" placeholder="문의사항을 입력하세요." />
                                    </div>
                                </div>
                            </div>
                            <!-- End Text input element -->

                            <!-- Begin Submit button -->
                            <div class="col-md-12">
                                <div class="quform-submit-inner">
                                    <button class="btn btn-white text-primary m-0 px-4" type="submit"><i class="fas fa-paper-plane"></i></button>
                                </div>
                                <div class="quform-loading-wrap"><span class="quform-loading"></span></div>
                            </div>
                            <!-- End Submit button -->

                        </div>

                    </div>

                </form>

                <!-- end form here -->

            </div>
        </div>

    </div>
</section>
<!-- end subscribe section -->

	
		
<section>
	  <div class="container">
		<div class="row mt-n1-9">
                    <div class="col-md-6 col-lg-3 mt-1-9">
					    <div class="service-block10">
					        <!-- 링크 추가: <a> 태그로 전체 블록을 감싸기 -->
					        <a href="board" class="service-link">
					            <div class="position-relative z-index-1">
					                <span class="mb-4 d-block"><i class="icon-lightbulb color-h-one"></i></span>
					                <h4>문의 게시판</h4>
					                <p class="mb-0">문의 목록을 한눈에 볼 수 있습니다.</p>
					            </div>
					        </a>
					        <!-- 링크 추가 끝 -->
					    </div>
					</div>
                    <div class="col-md-6 col-lg-3 mt-1-9">
                        <div class="service-block10">
							 <a href="history" class="service-link">
                            <div class="position-relative z-index-1">								
                                <span class="mb-4 d-block"><i class="icon-tools-2 color-h-two"></i></span>
                                <h4>내 문의내역</h4>
                                <p class="mb-0">나의 문의 현황을 한눈에 볼 수 있습니다.</p>
                            </div>
							</a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mt-1-9">
                        <div class="service-block10">
							<a href="question">
                            <div class="position-relative z-index-1">
								
                                <span class="mb-4 d-block"><i class="icon-mobile color-h-three"></i></span>
                                <h4>자주 묻는 질문</h4>
                                <p class="mb-0">자주 묻는 질문 목록을 한눈에 볼 수 있습니다.</p>
                            </div>
							</a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mt-1-9">
                        <div class="service-block10">
							<a href="write">
                            <div class="position-relative z-index-1">

                                <span class="mb-4 d-block"><i class="icon-layers color-h-four"></i></span>
                                <h4>문의하기</h4>
                                <p class="mb-0">각종 문의 사항을 작성 할 수 있습니다.</p>
							
                            </div>
							</a>
                        </div>
                    </div>
                  </div>
                </div>
</section>		
		
		


 <section class="project-single-two"  style="padding: 30px; margin-bottom: 20px;">

            <div class="container">
                <div class="section-heading">
                    <h2>서비스별 고객센터</h2>
                </div>
            </div>

            <div class="container-fluid p-0">

                <div class="owl-carousel owl-theme owl-loaded owl-drag">
 
                    
                <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all; width: 1933px;"><div class="owl-item active" style="width: 453.25px; margin-right: 30px;"><div class="project-grid-style3">
                        <div class="inner-box">
                            <div class="project-image">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/yang.jpg" alt="...">
                                <div class="overlay">
                                    <div class="overlay-inner">
                                        <div class="description">
                                            <div class="text"> 입양 관련 문의 </div>
                                            <a href="adoption" class="read-more"><span class="fa fa-angle-right"></span> Inquiry now </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="project-desc">
                                <div class="category">입양 문의</div>
                                <h3><a href="adoption">#입양 #입양 방법 #입양 현황</a></h3>
                            </div>
                        </div>
                    </div></div><div class="owl-item active" style="width: 453.25px; margin-right: 30px;"><div class="project-grid-style3">
                        <div class="inner-box">
                            <div class="project-image">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/yong.jpg" alt="...">
                                <div class="overlay">
                                    <div class="overlay-inner">
                                        <div class="description">
                                            <div class="text">애견 쇼핑몰 관련 문의</div>
                                            <a href="shop" class="read-more"><span class="fa fa-angle-right"></span>Inquiry now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="project-desc">
                                <div class="category">애견 용품 문의</div>
                                <h3><a href="shop">#애견옷 #애견 용품 #애견 용품 주문</a></h3>
                            </div>
                        </div>
                    </div></div><div class="owl-item active" style="width: 453.25px; margin-right: 30px;"><div class="project-grid-style3">
                        <div class="inner-box">
                            <div class="project-image">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/co.jpg" alt="...">
                                <div class="overlay">
                                    <div class="overlay-inner">
                                        <div class="description">
                                            <div class="text">애견 커뮤니티 관련 문의</div>
                                            <a href="community" class="read-more"><span class="fa fa-angle-right"></span>Inquiry now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="project-desc">
                                <div class="category">커뮤니티 문의</div>
                                <h3><a href="community">#커뮤니티 #애견 커뮤니티 </a></h3>

                            </div>
                        </div>
                    </div></div><div class="owl-item active" style="width: 453.25px; margin-right: 30px;"><div class="project-grid-style3">
                        <div class="inner-box">
                            <div class="project-image">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/git.jpg" alt="...">
                                <div class="overlay">
                                    <div class="overlay-inner">
                                        <div class="description">
                                            <div class="text">기타 관련 문의</div>
                                            <a href="etc" class="read-more"><span class="fa fa-angle-right"></span>Inquiry now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="project-desc">
                                <div class="category">기타 문의</div>
                                <h3><a href="etc">#결제 #시스템 #기타사항</a></h3>
                            </div>
                        </div>
                    </div></div></div></div><div class="owl-nav disabled"><button type="button" role="presentation" class="owl-prev"><span aria-label="Previous">‹</span></button><button type="button" role="presentation" class="owl-next"><span aria-label="Next">›</span></button></div><div class="owl-dots disabled"></div><div class="owl-thumbs"></div></div>
            </div>
        </section>
<script>
















</script>
	
	

<!--====================================작성부=====================================-->
<!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/counterup/counterup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/parallax/parallax.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath }/resources/assets_sub/js/main.js"></script>




<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
