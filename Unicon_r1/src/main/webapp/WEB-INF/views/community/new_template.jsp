<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<!-- 아래는 예시 -->
	<section>

            <div class="container">
                <div class="section-heading">
                    <h2>Our Latest Projects</h2>
                    <p class="w-md-75 w-lg-55">Business consectetur adipisicing elit eiusmod tempor incididunt ut labore et dolore magna aliqua quis nostrud exercitation consequat.</p>
                </div>
            </div>

            <div class="container">
                <div class="row">

                    <!-- Start links -->
                    <div class="filtering col-sm-12 text-center">
                        <span data-filter='*' class="active">All</span>
                        <span data-filter='.business'>Business</span>
                        <span data-filter='.finance'>Finance</span>
                        <span data-filter='.consulting'>Consulting</span>
                    </div>
                    <!-- End links -->

                </div>

                <!-- start portfolio gallery -->
                <div class="portfolio-gallery-isotope text-center row">

                    <div class="col-lg-3 col-md-6 items finance mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-2.jpg" data-sub-html="<h4 class='text-white'>Investment Project #01</h4><p>Finance Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-2.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Investment Project</a></h4>
                                    <p>Finance Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items finance mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-1.jpg" data-sub-html="<h4 class='text-white'>Investment Planning #02</h4><p>Finance Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-1.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Investment Planning</a></h4>
                                    <p>Finance Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items business mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-3.jpg" data-sub-html="<h4 class='text-white'>Online Consulting #03</h4><p>Business Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-3.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Online Consulting</a></h4>
                                    <p>Business Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items consulting mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-6.jpg" data-sub-html="<h4 class='text-white'>Saving Investments #04</h4><p>Consulting Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-6.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Saving Investments</a></h4>
                                    <p>Consulting Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items consulting mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-5.jpg" data-sub-html="<h4 class='text-white'>Financial Analysis #05</h4><p>Consulting Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-5.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Financial Analysis</a></h4>
                                    <p>Consulting Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items business mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-4.jpg" data-sub-html="<h4 class='text-white'>Business Consulting #06</h4><p>Business Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-4.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Business Consulting</a></h4>
                                    <p>Business Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items finance mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-7.jpg" data-sub-html="<h4 class='text-white'>Financial Analysis #07</h4><p>Finance Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-7.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Financial Analysis</a></h4>
                                    <p>Finance Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items business mt-3" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-8.jpg" data-sub-html="<h4 class='text-white'>Business Consulting #08</h4><p>Business Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-8.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Business Consulting</a></h4>
                                    <p>Business Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end portfolio gallery -->

            </div>

        </section>

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
