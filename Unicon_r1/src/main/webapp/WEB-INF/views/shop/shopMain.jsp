<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 추가 템플릿 css/js 작성란 -->
<style>
.product-details:hover img {
    opacity: 0.7; /* 투명도 설정 */
    transition: opacity 0.3s ease; /* 부드러운 애니메이션 효과 */
}

.product-img {
    width: 100%;
    aspect-ratio: 1 / 1; /* 원하는 가로:세로 비율 설정 */
    overflow: hidden;    /* 이미지가 컨테이너를 벗어나지 않도록 */
}

.product-img img {
    width: 100%;
    height: 100%;
    object-fit: fill;   /* 이미지를 컨테이너에 맞추되 비율 유지 */
    border-radius: 0.75rem; /* 기존 rounded-3 스타일 유지 */
}

.product-grid .product-info{
	padding: 5px;
}


</style>



</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<!-- 아래는 예시 -->
<!-- PAGE TITLE
        ================================================== -->
        ${productAllInfo}
        
        <section class="page-title-section bg-img cover-background" data-overlay-dark="7" data-background="${pageContext.request.contextPath }/resources/new_assets/img/bg/bg5.jpg">
            <div class="container">

                <div class="row">
                    <div class="col-md-7">
                        <h1>Shop Product Grid</h1>
                    </div>
                    <div class="col-md-5">
                        <ul class="text-md-end mt-3 mt-md-0 ps-0">
                            <li><a href="home-1.html">Home</a></li>
                            <li><a href="#!">Shop Product Grid</a></li>
                        </ul>
                    </div>
                </div>

            </div>
        </section>

        <!-- PRODUCT GRID
        ================================================== -->
        <section>
            <div class="container">
                <div class="row">

                    <!-- start product grid left panel -->
                    <div class="col-lg-3">
                        <div class="side-bar">
                            <div class="widget">
                                <div id="accordion" class="accordion-style2">
                                    <div class="card">
                                        <div class="card-header" id="headingOne">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> Electrical</button>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">Flash Lights</a></li>
                                                    <li><a href="#!">Tool Organisers</a></li>
                                                    <li><a href="#!">Safety Cables</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingTwo">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                  Watch
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">Women's Watch</a></li>
                                                    <li><a href="#!">Men's Watch</a></li>
                                                    <li><a href="#!">Kids Watch</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingThree">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                Accessories
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">Drives &amp; Storage</a></li>
                                                    <li><a href="#!">Networking Devices</a></li>
                                                    <li><a href="#!">Software</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingFour">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                  Clothes
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">T-Shirt</a></li>
                                                    <li><a href="#!">Pants</a></li>
                                                    <li><a href="#!">Saree</a></li>
                                                    <li><a href="#!">Joggers</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingFive">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                  Mobile
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">Intex</a></li>
                                                    <li><a href="#!">Google</a></li>
                                                    <li><a href="#!">Samsung</a></li>
                                                    <li><a href="#!">Apple</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="widget">
                                <div class="widget-title">
                                    <h5>Popular Products</h5>
                                </div>
                                <div class="d-flex align-items-center mb-4">
                                    <div class="flex-shrink-0">
                                        <img src="${pageContext.request.contextPath }/resources/new_assets/img/shop/thumb-01.jpg" alt="...">
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <a href="#!" class="mb-1 font-weight-600 text-extra-dark-gray">Echo Dot Speaker</a>
                                        <span class="d-block">$15.00</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mb-4">
                                    <div class="flex-shrink-0">
                                        <img src="${pageContext.request.contextPath }/resources/new_assets/img/shop/thumb-02.jpg" alt="...">
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <a href="#!" class="mb-1 font-weight-600 text-extra-dark-gray">Steel Wall Clock</a>
                                        <span class="d-block">$12.10</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="flex-shrink-0">
                                        <img src="${pageContext.request.contextPath }/resources/new_assets/img/shop/thumb-03.jpg" alt="...">
                                    </div>
                                    <div class="flex-grow-1 ms-3">
                                        <a href="#!" class="mb-1 font-weight-600 text-extra-dark-gray">Sony Digital Device</a>
                                        <span class="d-block">$10.20</span>
                                    </div>
                                </div>
                            </div>

                            <div class="widget">
                                <div class="offer-banner bg-primary text-center d-none d-lg-block">
                                    <a href="#!"><img src="${pageContext.request.contextPath }/resources/new_assets/img/shop/left-panel-banner.png" alt="..."></a>
                                </div>
                            </div>

                        </div>

                    </div>
                    <!-- end product grid left panel -->

                    <!-- start right panel section -->
                    <div class="col-lg-9 ps-lg-1-9">
                        <div class="row">
                            <div class="col-12">
                                <div class="row g-0 align-items-center bg-light rounded p-3">
                                    <div class="col-12 col-md-6 col-lg-7 mb-2 mb-md-0 text-center text-md-start">Showing 1–9 of 27 results</div>
                                </div>
                            </div>
                        </div>

                        <div class="row product-grid">
                        
                        <c:forEach var="list" items="${productAllInfo}" varStatus="status">
                            <div class="col-xl-3 col-sm-6">
                                <div class="product-details">
                                    <div class="product-img">
                                    <c:if test="${list.discount_rate != 0 }">
                                        <div class="label-offer bg-red">Sale</div>
                                    </c:if>
                                        <img src="${list.product_images[0].image_src}" alt="...">
                                        <div class="product-cart">
                                            <a href="/shop/shop_detail/${list.product_id}"><i class="fa-solid fa-magnifying-glass"></i></a>
                                            <a href="#!"><i class="fas fa-heart"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-info">
                                        <a href="/shop/shop_detail/${list.product_id }" style="margin-bottom: 0;">${list.product_name}</a>
                                        <p class="price text-center m-0">
                                        <c:choose>
                                        	<c:when test="${list.discount_rate != 0 }">
                                        		<span class="line-through me-2" style="font-size: 15px;">
                                        		<fmt:formatNumber value="${list.product_price}" type="number" /></span>
                                            	<span class="red"><fmt:formatNumber 
                                            	value="${(list.product_price*(100-list.discount_rate)/100)}" type="number" />원</span>
                                        	</c:when>
                                        	<c:otherwise>
                                            	<span><fmt:formatNumber value="${list.product_price}" type="number" />원</span>
                                        	</c:otherwise>
                                        </c:choose>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        
                            
                            
                    </div>
                    <!-- end right panel section -->

                </div>
            </div>
            </div>
        </section>

        <!-- CLIENTS
        ================================================== -->
        <div class="section-clients bg-light-gray">
            <div class="container">
                <div class="owl-carousel owl-theme clients" id="clients">
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-01.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-02.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-03.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-04.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-05.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-06.png"></div>
                </div>
            </div>
        </div>




<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->

<script>
	$(document).ready(function () {
		
		//console.log('${productAllInfo}');
		
		
	});

</script>


<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
