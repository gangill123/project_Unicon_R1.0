<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

  <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">

  <!-- Template Stylesheet -->
  <link href="${pageContext.request.contextPath }/resources/assets_sub/css/style.css" rel="stylesheet">

  <!-- 추가 템플릿 css/js 작성란 -->
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>

/* Owl Carousel 기본 스타일을 반응형으로 만들기 */
.owl-carousel {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.owl-item {
    flex: 1 1 100%;
    margin-right: 30px;
}

/* Owl Carousel 기본 스타일을 반응형으로 설정 */
.owl-carousel {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.owl-item {
    flex: 1 1 100%;
    margin-right: 30px;
}


/* 모바일 화면에서 한 열로 표시 */
@media (max-width: 768px) {
    .service-block10 {
        padding: 15px;
    }
    .service-block10 h4 {
        font-size: 1rem;
    }
    .service-block10 p {
        font-size: 0.75rem;
    }
}

/* 작은 화면에서 두 개씩 표시 */
@media (min-width: 768px) and (max-width: 991px) {
    .col-md-6 {
        flex: 1 1 48%;
        margin-bottom: 20px;
    }
}

/* 큰 화면에서 4개씩 표시 */
@media (min-width: 992px) {
    .col-lg-3 {
        flex: 1 1 23%;
    }
}

.project-single-two {
    padding: 20px 30px;
}

.owl-carousel .project-grid-style3 {
    width: 100%;
}

.project-grid-style3 img {
    max-width: 100%;
    height: auto;
    display: block;
}

.project-desc h3 a {
    color: #333;
    text-decoration: none;
}

.project-desc h3 a:hover {
    text-decoration: underline;
}
</style>
</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
	
	
	

<!-- start page title section -->
<section class="page-title-section bg-primary">
    <div class="container">
		
        <div class="row">
            <div class="col-md-12">
                <h1>Unicorn 고객센터</h1>
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
            <h3>Unicorn &amp; FAQ <span class="inner-title">무엇을 도와드릴까요?</span></h3>
            <p class="w-lg-55 w-md-75 mx-auto">서비스명과 함께 검색해보세요.</p>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-7">

				   <!-- start form here -->
					<form class="quform newsletter-rounded" id="searchForm" action="" method="get">
					    <div class="quform-elements">
					        <div class="row">
					            <!-- Begin Text input element -->
					            <div class="col-md-12">
					                <div class="quform-element">
					                    <div class="quform-input">
					                        <input class="rounded-pill form-control" id="searchInput" type="text" placeholder="" />
					                    </div>
					                </div>
					            </div>
					            <!-- End Text input element -->
					
					            <!-- Begin Submit button -->
					            <div class="col-md-12">
					                <div class="quform-submit-inner">
					                    <button id="searchBtn" class="btn btn-white text-primary m-0 px-4" type="button"><i class="fas fa-paper-plane"></i></button>
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
                                <h4>문의하기(이메일)</h4>
                                <p class="mb-0">이메일로 문의 할수있고 답변을 받아볼수있습니다.</p>
                            </div>
							</a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mt-1-9">
                        <div class="service-block10">
							<a href="write">
                            <div class="position-relative z-index-1">

                                <span class="mb-4 d-block"><i class="icon-layers color-h-four"></i></span>
                                <h4>문의하기(게시판)</h4>
                                <p class="mb-0">각종 문의 사항을 작성 할 수 있습니다.</p>
							
                            </div>
							</a>
                        </div>
                    </div>
                  </div>
                </div>
</section>		
		
		
<section class="project-single-two" style="padding: 30px; margin-bottom: 20px;">
    <div class="container">
        <div class="section-heading">
            <h2>서비스별 고객센터</h2>
        </div>
    </div>

    <div class="container-fluid p-0">
        <div class="owl-carousel owl-theme">
            <!-- 첫 번째 아이템 -->
            <div class="project-grid-style3">
                <div class="inner-box">
                    <div class="project-image">
                        <img src="${pageContext.request.contextPath}/resources/assets/images/yang.jpg" alt="...">
                        <div class="overlay">
                            <div class="overlay-inner">
                                <div class="description">
                                    <div class="text">입양 관련 문의</div>
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
            </div>

            <!-- 두 번째 아이템 -->
            <div class="project-grid-style3">
                <div class="inner-box">
                    <div class="project-image">
                        <img src="${pageContext.request.contextPath}/resources/assets/images/yong.jpg" alt="...">
                        <div class="overlay">
                            <div class="overlay-inner">
                                <div class="description">
                                    <div class="text">애견 쇼핑몰 관련 문의</div>
                                    <a href="shop" class="read-more"><span class="fa fa-angle-right"></span> Inquiry now </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="project-desc">
                        <div class="category">애견 용품 문의</div>
                        <h3><a href="shop">#애견옷 #애견 용품 #애견 용품 주문</a></h3>
                    </div>
                </div>
            </div>

            <!-- 세 번째 아이템 -->
            <div class="project-grid-style3">
                <div class="inner-box">
                    <div class="project-image">
                        <img src="${pageContext.request.contextPath}/resources/assets/images/co.jpg" alt="...">
                        <div class="overlay">
                            <div class="overlay-inner">
                                <div class="description">
                                    <div class="text">애견 커뮤니티 관련 문의</div>
                                    <a href="community" class="read-more"><span class="fa fa-angle-right"></span> Inquiry now </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="project-desc">
                        <div class="category">커뮤니티 문의</div>
                        <h3><a href="community">#커뮤니티 #애견 커뮤니티</a></h3>
                    </div>
                </div>
            </div>

            <!-- 네 번째 아이템 -->
            <div class="project-grid-style3">
                <div class="inner-box">
                    <div class="project-image">
                        <img src="${pageContext.request.contextPath}/resources/assets/images/git.jpg" alt="...">
                        <div class="overlay">
                            <div class="overlay-inner">
                                <div class="description">
                                    <div class="text">기타 관련 문의</div>
                                    <a href="etc" class="read-more"><span class="fa fa-angle-right"></span> Inquiry now </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="project-desc">
                        <div class="category">기타 문의</div>
                        <h3><a href="etc">#결제 #시스템 #기타사항</a></h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
$(document).ready(function(){
    $(".owl-carousel").owlCarousel({
        items: 4,            // 화면에 표시할 아이템 개수 (한 줄에 4개)
        loop: false,         // 마지막 아이템 이후 반복 비활성화
        margin: 10,          // 아이템 간 간격 최소화
        responsive: {
            0: {
                items: 1     // 모바일에서는 한 개씩 표시
            },
            768: {
                items: 2     // 태블릿에서는 두 개씩 표시
            },
            992: {
                items: 4     // 데스크탑에서는 네 개씩 표시
            }
        }
    });
});
</script>


<script>
$(document).ready(function() {
    // 검색 버튼 클릭 이벤트
    $("#searchBtn").click(function() {
        performSearch();
    });

    // Enter 키 입력 시 검색 버튼 클릭 처리
    $("#searchInput").keypress(function(event) {
        if (event.which === 13) { // 13은 Enter 키의 키코드
            event.preventDefault(); // 폼 제출 방지
            performSearch(); // 검색 처리 함수 호출
        }
    });

    // 검색 처리 함수
    function performSearch() {
        const searchQuery = $("#searchInput").val().trim().toLowerCase();
        let targetPage = '';

        if (searchQuery.includes('입양') || searchQuery.includes('입양 방법') || searchQuery.includes('입양 현황')) {
            targetPage = 'adoption';  // 입양 관련 페이지로 이동
        } else if (searchQuery.includes('쇼핑') || searchQuery.includes('애견옷') || searchQuery.includes('쇼핑몰') || searchQuery.includes('애견 용품') || searchQuery.includes('애견 용품') || searchQuery.includes('애견 용품 주문')) {
            targetPage = 'shop';  // 쇼핑몰 페이지로 이동
        } else if (searchQuery.includes('커뮤니티') || searchQuery.includes('애견 커뮤니티')) {
            targetPage = 'community';  // 커뮤니티 페이지로 이동
        } else if (searchQuery.includes('기타') || searchQuery.includes('결제') || searchQuery.includes('오류') || searchQuery.includes('시스템') || searchQuery.includes('기타 사항')) {
            targetPage = 'etc';  // 기타 페이지로 이동
        } else if (searchQuery.includes('문의하기') || searchQuery.includes('게시판 작성') || searchQuery.includes('게시판 문의') || searchQuery.includes('질문') || searchQuery.includes('작성')) {
            targetPage = 'write';  // 문의 페이지로 이동         
        } else if (searchQuery.includes('이메일 문의') || searchQuery.includes('이메일') || searchQuery.includes('이메일 문의하기') || searchQuery.includes('email') || searchQuery.includes('이메일 작성')) {
            targetPage = 'question';  // 이메일 문의 페이지로 이동         
        }  else if (searchQuery.includes('게시판') || searchQuery.includes('문의게시판') || searchQuery.includes('문의 게시판') || searchQuery.includes('목록 게시판') || searchQuery.includes('목록')) {
            targetPage = 'board';  // 이메일 문의 페이지로 이동         
        }  else {
            alert('해당 검색어에 맞는 페이지가 없습니다.');
            return;  // 페이지 이동을 하지 않고 알림만 출력
        }

        // 페이지 이동
        window.location.href = targetPage;
    }
});
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
