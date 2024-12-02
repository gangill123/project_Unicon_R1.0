<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</style>

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
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
                <div class="text-center row">

                    <div class="col-lg-3 col-md-6 items finance mt-3">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-2.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!" data-bs-toggle="modal" data-bs-target="#exampleModal2">Investment Project</a></h4>
                                    <p>Finance Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items finance mt-3" data-src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-1.jpg" data-sub-html="<h4 class='text-white'>Investment Planning #02</h4><p>Finance Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-1.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Investment Planning</a></h4>
                                    <p>Finance Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items business mt-3" data-src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-3.jpg" data-sub-html="<h4 class='text-white'>Online Consulting #03</h4><p>Business Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-3.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Online Consulting</a></h4>
                                    <p>Business Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items consulting mt-3" data-src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-6.jpg" data-sub-html="<h4 class='text-white'>Saving Investments #04</h4><p>Consulting Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-6.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Saving Investments</a></h4>
                                    <p>Consulting Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items consulting mt-3" data-src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-5.jpg" data-sub-html="<h4 class='text-white'>Financial Analysis #05</h4><p>Consulting Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-5.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Financial Analysis</a></h4>
                                    <p>Consulting Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items business mt-3" data-src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-4.jpg" data-sub-html="<h4 class='text-white'>Business Consulting #06</h4><p>Business Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-4.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Business Consulting</a></h4>
                                    <p>Business Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items finance mt-3" data-src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-7.jpg" data-sub-html="<h4 class='text-white'>Financial Analysis #07</h4><p>Finance Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-7.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Financial Analysis</a></h4>
                                    <p>Finance Plan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 items business mt-3" data-src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-8.jpg" data-sub-html="<h4 class='text-white'>Business Consulting #08</h4><p>Business Plan</p>">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-8.jpg">
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

<!--====================================script 작성부=====================================-->




<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
