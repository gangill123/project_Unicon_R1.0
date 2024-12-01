<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->
<style>
.bg-img {
	aspect-ratio: 1920 / 650; /* 원하는 가로:세로 비율 설정 */
}

</style>


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
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
        
        
        <section class="box-hover" style="padding: 40px 0;">
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
        
        
        <section style="padding: 40px 0;"> 
            <div class="container">
                <div class="section-heading"><span>Welcome</span>
                    <h2>새로운 유니콘 소개</h2>
                    <p class="w-95 w-sm-85 w-md-75 w-lg-55">Business consectetur adipisicing elit</p>
                </div>

                <div class="row portfolio-gallery mt-n1-9">

                    <div class="col-md-6 col-lg-3 mt-1-9 wow fadeIn" data-wow-delay="100ms" data-src="${pageContext.request.contextPath }/resources/new_assets/img/projects/portfolio-01.jpg" data-sub-html="<h4 class='text-white'>Business Consultation #01</h4><p>Business</p>">
                        <div class="portfolio-style1">
                        	<div class="label-offer bg-red"><i class="fa-solid fa-dog"></i> Sale</div>
                            <img src="${pageContext.request.contextPath }/resources/new_assets/img/projects/portfolio-01.jpg" class="border-radius-10" alt="...">
                            <a href="#!" class="portfolio-text">
                                <span class="display-31 font-weight-700 text-orange letter-spacing-2 text-uppercase d-block mb-2">Business</span>
                                <h3 class="mb-0 h5">Business Consultation</h3>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mt-1-9 wow fadeIn" data-wow-delay="200ms" data-src="${pageContext.request.contextPath }/resources/new_assets/img/projects/portfolio-02.jpg" data-sub-html="<h4 class='text-white'>Finance Strategy #02</h4><p>Finance</p>">
                        <div class="portfolio-style1">
                            <img src="${pageContext.request.contextPath }/resources/new_assets/img/projects/portfolio-02.jpg" class="border-radius-10" alt="...">
                            <a href="#!" class="portfolio-text">
                                <span class="display-31 font-weight-700 text-orange letter-spacing-2 text-uppercase d-block mb-2">Finance</span>
                                <h3 class="mb-0 h5">Finance Strategy</h3>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mt-1-9 wow fadeIn" data-wow-delay="300ms" data-src="${pageContext.request.contextPath }/resources/new_assets/img/projects/portfolio-03.jpg" data-sub-html="<h4 class='text-white'>Digital Marketing #03</h4><p>Marketing</p>">
                        <div class="portfolio-style1">
                            <img src="${pageContext.request.contextPath }/resources/new_assets/img/projects/portfolio-03.jpg" class="border-radius-10" alt="...">
                            <a href="#!" class="portfolio-text">
                                <span class="display-31 font-weight-700 text-orange letter-spacing-2 text-uppercase d-block mb-2">Marketing</span>
                                <h3 class="mb-0 h5">Digital Marketing</h3>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mt-1-9 wow fadeIn" data-wow-delay="400ms" data-src="${pageContext.request.contextPath }/resources/new_assets/img/projects/portfolio-04.jpg" data-sub-html="<h4 class='text-white'>Enterprise Loan #04</h4><p>Business</p>">
                        <div class="portfolio-style1">
                            <img src="${pageContext.request.contextPath }/resources/new_assets/img/projects/portfolio-04.jpg" class="border-radius-10" alt="...">
                            <a href="#!" class="portfolio-text">
                                <span class="display-31 font-weight-700 text-orange letter-spacing-2 text-uppercase d-block mb-2">Business</span>
                                <h3 class="mb-0 h5">Enterprise Loan</h3>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        
        
        
        
        <section class="pb-0 pb-lg-5">
            <div class="container">
                <div class="row about-style2">

                    <div class="col-lg-5 mb-2-3 mb-lg-0">
                        <div class="about2-text wow fadeInLeft" data-wow-delay="500ms">
                            <img src="${pageContext.request.contextPath }/resources/new_assets/img/content/about-07.jpg" class="rounded" alt="...">
                            <span class="wow fadeInRight bg-img" data-background="${pageContext.request.contextPath }/resources/new_assets/img/content/about-09.jpg" data-wow-delay="550ms">25</span>
                            <h5 class="wow fadeInLeft" data-wow-delay="550ms">Years of experience</h5>
                        </div>
                    </div>

                    <div class="offset-xl-1 col-lg-6 wow fadeInRight">
                        <div>
                            <div class="content mb-lg-1-6 mb-xl-7">
                                <span class="title-style1">about us</span>
                                <h2 class="mb-3 font-weight-700 w-lg-90">We provide the perfect solution for company</h2>
                                <p class="display-28 font-weight-600 fst-italic">25 Years of experience in marketing service</p>
                                <p class="mb-xl-1-9 w-lg-90">We should encourage people everywhere who want help getting started on building something great from start-ups so they can earn extra money online before starting up business.</p>
                                <a href="#!" class="butn-style2"><span>More Services</span></a>
                            </div>
                            <div class="about-bg d-none d-lg-flex">
                                <div class="z-index-1 me-5 pe-5 border-end">
                                    <h6 class="text-white">William Fox</h6>
                                    <p class="mb-0 text-white">CEO of company</p>
                                </div>
                                <div class="z-index-1">
                                    <img src="${pageContext.request.contextPath }/resources/new_assets/img/content/signature-01.png" alt="...">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        
        
        
        
		
		<section style="padding: 60px 0;">
            <div class="container">
                <div class="section-heading"><span>축하해주세요!</span>
                    <h2>유니콘 입양후기</h2>
                    <p class="w-95 w-sm-85 w-md-75 w-lg-55">Business consectetur adipisicing elit eiusmod tempor incididunt ut labore et dolore magna aliqua quis nostrud exercitation consequat.</p>
                </div>
                <div class="service-grids owl-carousel owl-theme" id="service-grids">
                    <div class="service-block">
                        <div class="img-holder">
                            <img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/content/services/service-1b.jpg">
                        </div>
                        <div class="details">
                            <div class="number alt-font">01</div>
                            <h4>Business Growth</h4>
                            <p>Exhaustive technology of implementing multi purpose project.</p>
                            <a class="read-more" href="#!">Read More</a>
                        </div>
                    </div>
                    <div class="service-block">
                        <div class="img-holder">
                            <img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/content/services/service-2b.jpg">
                        </div>
                        <div class="details">
                            <div class="number alt-font">02</div>
                            <h4>Investment Plan</h4>
                            <p>Exhaustive technology of implementing multi purpose project.</p>
                            <a class="read-more" href="#!">Read More</a>
                        </div>
                    </div>
                    <div class="service-block">
                        <div class="img-holder">
                            <img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/content/services/service-3b.jpg">
                        </div>
                        <div class="details">
                            <div class="number alt-font">03</div>
                            <h4>Business Plan</h4>
                            <p>Exhaustive technology of implementing multi purpose project.</p>
                            <a class="read-more" href="#!">Read More</a>
                        </div>
                    </div>
                    <div class="service-block">
                        <div class="img-holder">
                            <img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/content/services/service-4b.jpg">
                        </div>
                        <div class="details">
                            <div class="number alt-font">04</div>
                            <h4>Risk Management</h4>
                            <p>Exhaustive technology of implementing multi purpose project.</p>
                            <a class="read-more" href="#!">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
		
		
		
		

<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->




<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
