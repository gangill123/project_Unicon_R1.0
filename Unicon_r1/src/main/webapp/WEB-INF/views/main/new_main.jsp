<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->
<style>
.bg-img {
    height: 550px; /* 고정 높이 */
    width: 100%; /* 너비를 100%로 설정 */
}
</style>
</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
		<%-- ${slideInfo } --%>
		<div class="container-fluid p-0">
            <div class="row slider-fade-shop">
                <div class="owl-carousel owl-theme w-100">
                <c:forEach var="list" items="${slideInfo }">
                	<div class="text-start item bg-img cover-background" data-overlay-dark="0" data-background="${list.ms_src }">
                        <c:if test="${not empty list.ms_tText}">
                        <div class="caption" >
                            <div class="container">
                                <div class="overflow-hidden w-md-85 w-lg-75">
                                    <h1 class="main-font">${list.ms_tText }</h1>
                                    <div class="subheading">${list.ms_bText1 }
                                    <strong>${list.ms_sText }</strong>${list.ms_bText2 }</div>
	                                    <a href="${list.ms_btnUrl }" class="butn primary">
	                                        <span class="alt-font">${list.ms_btnText }</span>
	                                    </a>
                                </div>
                            </div>
                        </div>
                        </c:if>
                    </div>
                </c:forEach>
                </div>
            </div>
        </div>
        
        <section class="box-hover" style="padding: 60px 0;">
            <div class="container">
                <div class="row position-relative mt-n1-9">
                    <div class="col-6 col-lg-3 mt-1-9">
                        <div class="counter-box black">
                            <h4 class="countup">1800</h4>
                            <p class="m-0">Happy Clients</p></div>
                    </div>
                    <div class="col-6 col-lg-3 mt-1-9">
                        <div class="counter-box black">
                            <h4 class="countup">1300</h4>
                            <p class="m-0">Projects Finished</p></div>
                    </div>
                    <div class="col-6 col-lg-3 mt-1-9">
                        <div class="counter-box black">
                            <h4 class="countup">1500</h4>
                            <p class="m-0">Business Solutions</p></div>
                    </div>
                    <div class="col-6 col-lg-3 mt-1-9">
                        <div class="counter-box black">
                            <h4 class="countup">1100</h4>
                            <p class="m-0">Effective Answers</p></div>
                    </div>
                </div>
            </div>
        </section>
        
        
        <section style="padding: 30px 0;">
            <div class="container">
                <div class="section-heading"><span>Welcome</span>
                    <h2>What We Do</h2>
                    <p class="w-95 w-sm-85 w-md-75 w-lg-55">Business consectetur adipisicing elit eiusmod tempor incididunt ut labore et dolore magna aliqua quis nostrud exercitation consequat.</p>
                </div>
            </div>
            <div class="container">
                <!-- start portfolio gallery -->
                <div class="portfolio-gallery-isotope text-center row" style="position: relative; height: 664px;">
                    <div class="col-lg-3 col-md-6 items finance mt-3" data-src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-2.jpg" data-sub-html="<h4 class='text-white'>Investment Project #01</h4><p>Finance Plan</p>" style="position: absolute; left: 0px; top: 0px;">
                        <div class="project-grid">
                            <div class="project-grid-img"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/projects/pro-2.jpg">
                            </div>
                            <div class="project-grid-overlay">
                                <div class="w-100 px-3">
                                    <h4><a href="#!">Investment Project</a></h4>
                                    <p>Finance Plan</p>
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
