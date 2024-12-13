<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->
<style>
.bg-img {
	aspect-ratio: 1920 / 650; /* 원하는 가로:세로 비율 설정 */
}

.slider-fade-shop .owl-theme .owl-nav [class*='owl-'] {
	background: transparent !important;
}

.img-holder {
    width: 100%;
    aspect-ratio: 5 / 3; /* 원하는 가로:세로 비율 설정 */
    overflow: hidden;    /* 이미지가 컨테이너를 벗어나지 않도록 */
}

.img-holder img {
    width: 100%;
    height: 100%;
    object-fit: fill;   /* 이미지를 컨테이너에 맞추되 비율 유지 */
}

.about2-text{
    width: 100%;
    aspect-ratio: 3.3 / 4; /* 원하는 가로:세로 비율 설정 */
    overflow: fill;    /* 이미지가 컨테이너를 벗어나지 않도록 */
}

.about2-text img {
    width: 100%;
    height: 100%;
    object-fit: fill;   /* 이미지를 컨테이너에 맞추되 비율 유지 */
    border-radius: 0.75rem; /* 기존 rounded-3 스타일 유지 */
}

.butn-style2.small:hover{
	padding-right: 6em !important;
}

.about-style2 .about2-text span{
	-webkit-text-fill-color: #eee !important;
	font-size: 100px;
	left: 0px;
	bottom: -15px;
}

.about-style2 .about2-text h5{
	margin-top: 8px;
}

.testmonial-single p {
	font-weight: 500;
	margin-bottom: 20px;
	position: relative;
	margin-left: 25px;
	text-align: left;
}

.testmonial-single p:before{
	margin: 0;
	top: -5px;
	left: -45px;
	position: absolute;

}

@media (min-width: 1400px){ .container {max-width: 1250px;} }

.section-heading span{
	font-size: 18px;
}


</style>


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
		<%-- ${slideInfo } --%>
		<%-- ${shopInfo } --%>
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
                            <p class="m-0">유니콘 입양공고</p></div>
                    </div>
                    <div class="col-6 col-lg-3 mt-1-9">
                        <div class="counter-box black">
                            <h4 class="countup">1300</h4>
                            <p class="m-0">유니콘 입양완료</p></div>
                    </div>
                    <div class="col-6 col-lg-3 mt-1-9">
                        <div class="counter-box black">
                            <h4 class="countup">1500</h4>
                            <p class="m-0">유니콘 커뮤니티</p></div>
                    </div>
                    <div class="col-6 col-lg-3 mt-1-9">
                        <div class="counter-box black">
                            <h4 class="countup">1100</h4>
                            <p class="m-0">유니콘 보호센터</p></div>
                    </div>
                </div>
            </div>
        </section>
        
        
        <section style="padding: 50px 0;"> 
            <div class="container">
                <div class="section-heading" style="margin-bottom: 20px;"><span>안녕하세요!!</span>
                    <h2>유니콘 신규 입양공고</h2>
                </div>
				<div style="text-align: end; margin-bottom: 20px;">
					<button type="submit" class="butn-style2 small" style="font-size: 0.7rem;">
					<span>더보기</span></button>
				</div>
                <div class="row mt-n1-9">
                    <div class="col-md-6 col-lg-3 mt-1-9 wow fadeIn" data-wow-delay="100ms">
                        <div class="portfolio-style1">
                        	<div class="label-offer bg-red"><i class="fa-solid fa-dog"></i> Sale</div>
                            <img src="${pageContext.request.contextPath }/resources/new_assets/img/projects/portfolio-01.jpg" class="border-radius-10" alt="...">
                            <a href="#!" class="portfolio-text" data-bs-toggle="modal" data-bs-target="#exampleModal2">
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
        
        
        
        
        <section class="pb-0 pb-lg-5" style="padding-top: 50px; margin-bottom: 50px;">
            <div class="container">
            	<div class="section-heading"><span>알려드려요!!</span>
                    <h2>반려동물 행사소식</h2>
                </div>
            
                <div class="row about-style2">

                    <div class="col-lg-5 mb-2-3 mb-lg-0">
                        <div class="about2-text wow fadeInLeft" data-wow-delay="500ms">
                            <img src="${newsInfo.news_src }" class="rounded" alt="...">
                            <span class="wow fadeInRight" data-wow-delay="550ms">
                           	<c:set var="dateString" value="${newsInfo.news_startdate }"/>
                           	${fn:substring(dateString, 5, 7)}.${fn:substring(dateString, 8, 10)}	
                            </span>
                            <h5 class="wow fadeInLeft" data-wow-delay="550ms" style="text-align: end;">Year ${fn:substring(dateString, 0, 4) } News</h5>
                        </div>
                    </div>

                    <div class="offset-xl-1 col-lg-6 wow fadeInRight">
                        <div>
                            <div class="content mb-lg-1-6 mb-xl-7" style="height: 330px;">
                                <span class="title-style1">about news</span>
                                <h2 class="mb-3 font-weight-700 w-lg-90">${newsInfo.news_subject }</h2>
                                <p class="display-28 font-weight-600 fst-italic">장소 : ${newsInfo.news_place }</p>
                                <p class="mb-xl-1-9 w-lg-90">
                                ${fn:substring(newsInfo.news_content, 0, 150)}...
                                </p>
                                <a href="/news" class="butn-style2"><span>다양한 소식 보러가기</span></a>
                            </div>
                            <div class="about-bg d-none d-lg-flex text-center">
                                <div class="z-index-1 col-lg-6 border-end">
                                    <h6 class="text-white" style="font-size: 1.5rem;"><i class="fa-solid fa-building-columns"></i> 주관기관</h6>
                                    <p class="mb-0 text-white">${newsInfo.news_ins }</p>
                                </div>
                                <div class="z-index-1 col-lg-6 ">
                                    <h6 class="text-white" style="font-size: 1.5rem;"><i class="fa-solid fa-users-line"></i> 참석대상</h6>
                                    <p class="mb-0 text-white">${newsInfo.news_att }</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        
        
        
        
		
		<section style="padding: 60px 0;">
            <div class="container">
                <div class="section-heading"><span>축하해주세요!!</span>
                    <h2>유니콘 입양후기</h2>
                </div>
                <div style="text-align: end; margin-bottom: 20px;">
					<button type="button" class="butn-style2 small" style="font-size: 0.7rem;">
					<span>더보기</span></button>
				</div>
                <div class="service-grids owl-carousel owl-theme" id="service-grids">
                    <div class="service-block">
                        <div class="img-holder">
                            <img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/dog.jpg">
                        </div>
                        <div class="details">
                            <div class="number alt-font" style="aspect-ratio: 1/1; overflow: hidden;">
                            	<img style="width: 100%; height: 100%; object-fit:fill;" alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/dog.jpg">
                            </div>
                            <h4 style="color: #5c636a;">슈퍼스타징젱죵</h4>
                            <div class="testmonial-single mx-auto w-lg-85">
                                 <p>Exercitation ullamco laboris nisiut aliqu exeaea commo.</p>
                             </div>
                            
                            <!-- <p><i class="fa-solid fa-quote-left" style="color: #86bc42;"></i>  나의 입양베이비를 입양한 후기를 전달하겠슴</p> -->
                            <a class="read-more" href="#!">상세보기</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
		
		
		<section style="padding: 50px 0;"> 
            <div class="container">
                <div class="section-heading" style="margin-bottom: 20px;"><span>Sale!! Sale!!</span>
                    <h2>복지몰 Sale 아이템 소개</h2>
                </div>
				<div style="text-align: end; margin-bottom: 20px;">
					<button type="submit" class="butn-style2 small" style="font-size: 0.7rem;"
					onclick="location.href='/shop'"><span>더보기</span></button>
				</div>
                <div class="row mt-n1-9">
                <c:forEach var="shop" items="${shopInfo }">
                    <div class="col-md-6 col-lg-3 mt-1-9 wow fadeIn" data-wow-delay="200ms">
                        <div class="portfolio-style1">
                        <div class="label-offer bg-red">${shop.discount_rate }% Sale</div>
                            <img src="${shop.product_images[0].image_src }" class="border-radius-10" alt="...">
                            <a href="/shop/shop_detail/${shop.product_id }" class="portfolio-text">
                                <span class="display-31 font-weight-700 text-orange letter-spacing-2 
                                text-uppercase d-block mb-2">${shop.product_category_value }</span>
                                <h3 class="mb-0 h5">${shop.product_name }</h3>
                            </a>
                        </div>
                    </div>
                </c:forEach>
                    
                </div>
            </div>
        </section>
		
		<div class="section-clients bg-light-gray" style="margin-top: 60px;">
            <div class="container">
                <div class="owl-carousel owl-theme clients owl-loaded owl-drag" id="clients">
                <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-1926px, 0px, 0px); transition: 0.9s; width: 4404px;"><div class="owl-item cloned" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-02.png"></div></div><div class="owl-item cloned" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-03.png"></div></div><div class="owl-item cloned" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-04.png"></div></div><div class="owl-item cloned" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-05.png"></div></div><div class="owl-item cloned" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-06.png"></div></div><div class="owl-item" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-01.png"></div></div><div class="owl-item" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-02.png"></div></div><div class="owl-item active" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-03.png"></div></div><div class="owl-item active" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-04.png"></div></div><div class="owl-item active" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-05.png"></div></div><div class="owl-item active" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-06.png"></div></div><div class="owl-item cloned active" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-01.png"></div></div><div class="owl-item cloned" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-02.png"></div></div><div class="owl-item cloned" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-03.png"></div></div><div class="owl-item cloned" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-04.png"></div></div><div class="owl-item cloned" style="width: 195.2px; margin-right: 80px;"><div class="item"><img alt="partner-image" src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-05.png"></div></div></div></div><div class="owl-nav disabled"><button type="button" role="presentation" class="owl-prev"><span aria-label="Previous">‹</span></button><button type="button" role="presentation" class="owl-next"><span aria-label="Next">›</span></button></div><div class="owl-dots disabled"></div><div class="owl-thumbs"></div></div>
            </div>
        </div>
		
		

<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->




<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
