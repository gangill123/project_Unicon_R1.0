<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->
<style>



</style>



</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<section class="page-title-section bg-primary">
    <div class="container">
		
        <div class="row">
            <div class="col-md-12">
                <h1>unicon 고객센터</h1>
            </div>
            <div class="col-md-12">
                <ul class="ps-0">
                    <li><a href="inquiry"><i class="ti-home"></i></a></li>
                    <li class="active"><a href="question">자주묻는질문</a></li>
                </ul>
            </div>
        </div>	
    </div>
</section>
<section>
	 <div class="container">
		<div class="row box-hover">
                    <div class="section-heading col-12 box-hover">
                        <h2>Tab Style 06</h2>
                    </div>
                    <div class="col-12">
                        <div class="horizontaltab tab-style3" style="display: block; width: 100%; margin: 0px;">
                            <ul class="resp-tabs-list hor_1">
                                <li class="resp-tab-item hor_1" aria-controls="hor_1_tab_item-0" role="tab"><i class="fas fa-medkit"></i>
                                    <div class="tab-box">
                                        <h6>Pharmacy</h6><span>Nnde omnis iste</span></div>
                                </li>
                                <li class="resp-tab-item hor_1" aria-controls="hor_1_tab_item-1" role="tab"><i class="fas fa-cog"></i>
                                    <div class="tab-box">
                                        <h6>Marketing</h6><span>Nnde omnis iste</span></div>
                                </li>
                                <li class="resp-tab-item hor_1 resp-tab-active" aria-controls="hor_1_tab_item-2" role="tab"><i class="fas fa-flask"></i>
                                    <div class="tab-box">
                                        <h6>Growth</h6><span>Nnde omnis iste</span></div>
                                </li>
                            </ul>
                            <div class="resp-tabs-container hor_1">
                                <h2 class="resp-accordion hor_1" role="tab" aria-controls="hor_1_tab_item-0" style="background: none;"><span class="resp-arrow"></span><i class="fas fa-medkit"></i>
                                    <div class="tab-box">
                                        <h6>Pharmacy</h6><span>Nnde omnis iste</span></div>
                                </h2><div class="resp-tab-content hor_1" aria-labelledby="hor_1_tab_item-0">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna, euismod ut ornare non, volutpat vel tortor. Integer laoreet placerat suscipit. Sed sodales scelerisque commodo. Nam porta cursus lectus. Proin nunc erat, gravida a facilisis
                                    quis, ornare id lectus. Proin consectetur nibh quis urna gravida mollis.

                                </div>
                                <h2 class="resp-accordion hor_1" role="tab" aria-controls="hor_1_tab_item-1"><span class="resp-arrow"></span><i class="fas fa-cog"></i>
                                    <div class="tab-box">
                                        <h6>Marketing</h6><span>Nnde omnis iste</span></div>
                                </h2><div class="resp-tab-content hor_1" aria-labelledby="hor_1_tab_item-1">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna, euismod ut ornare non, volutpat vel tortor. Integer laoreet placerat suscipit. Sed sodales scelerisque commodo. Nam porta cursus lectus. Proin nunc erat, gravida a facilisis
                                    quis, ornare id lectus. Proin consectetur nibh quis urna gravida mollis.

                                </div>
                                <h2 class="resp-accordion hor_1 resp-tab-active" role="tab" aria-controls="hor_1_tab_item-2"><span class="resp-arrow"></span><i class="fas fa-flask"></i>
                                    <div class="tab-box">
                                        <h6>Growth</h6><span>Nnde omnis iste</span></div>
                                </h2><div class="resp-tab-content hor_1 resp-tab-content-active" aria-labelledby="hor_1_tab_item-2" style="display:block">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nibh urna, euismod ut ornare non, volutpat vel tortor. Integer laoreet placerat suscipit. Sed sodales scelerisque commodo. Nam porta cursus lectus. Proin nunc erat, gravida a facilisis
                                    quis, ornare id lectus. Proin consectetur nibh quis urna gravida mollis.

                                </div>
                            </div>
                        </div>
					</div>
				</div>
			</div>
</section>




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
