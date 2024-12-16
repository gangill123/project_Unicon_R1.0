<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
    
<body>

    <!-- PAGE LOADING
    ================================================== -->
    <div id="preloader"></div>

    <!-- MAIN WRAPPER
    ================================================== -->
    <div class="main-wrapper">

        <!-- HEADER
        ================================================== -->
        <header>
            <div class="navbar-default">

                <!-- start top search -->
                <div class="top-search bg-black">
                    <div class="container">
                        <form class="search-form" action="search.html" method="GET" accept-charset="utf-8">
                            <div class="input-group">
                                <span class="input-group-addon cursor-pointer">
                                    <button class="search-form_submit fas fa-search text-white" type="submit"></button>
                                </span>
                                <input type="text" class="search-form_input form-control" name="s" autocomplete="off" placeholder="Type & hit enter...">
                                <span class="input-group-addon close-search"><i class="fas fa-times display-28 mt-1"></i></span>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- end top search -->
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="menu_area alt-font">
                                <nav class="navbar navbar-expand-lg navbar-light p-0">

                                    <div class="navbar-header navbar-header-custom">
                                        <!-- start logo -->
                                        <a href="/main" class="navbar-brand logodefault"><img id="logo" src="${pageContext.request.contextPath }/resources/new_assets/img/logos/logo.png" alt="logo"></a>
                                        <!-- end logo -->
                                    </div>

                                    <div class="navbar-toggler"></div>

                                    <!-- menu area -->
                                    <ul class="navbar-nav ms-3" id="nav" style="display: none;">
                                        <li id="home"><a href="/main">홈</a>
                                        </li>
                                        <li><a href="#!">입양</a>
                                        </li>
                                        <li><a href="/community/main">커뮤니티</a>
                                        </li>
                                        
                                        <li id="shop"><a href="/shop">복지몰</a>
                                        </li>
                                        
                                        <li><a href="/news">소식</a>
                                            <ul>
                                                <li><a href="/notice">공지사항</a></li>
                                                <li><a href="/news">행사소식</a></li>
                                                <li><a href="/volunteer">봉사활동 모집</a></li>
                                            </ul>
                                        </li>
                                        
                                        <li><a href="/inquiry/inquiry">고객센터</a>
                                        </li>
                                        
                                        <li id="slide"><a href="/admin/slide_manage">관리자페이지</a>
                                        </li>
                                    </ul>
                                    <!-- end menu area -->

									
									<c:choose>
										<c:when test="${!empty member_id }">
	                                    <div class="attr-nav me-lg-0 ms-auto">
	                                        <ul>
	                                            <li class="dropdown me-3 me-lg-0">
	                                                <a href="/shop/cart"><i class="fa-solid fa-shield-dog"></i>
	                                                    <span class="badge bg-primary">0</span>
	                                                </a>
	                                            </li>
	                                            <li class="dropdown me-3 me-lg-0">
	                                                <a href="/shop/cart"><i class="fas fa-shopping-cart"></i>
	                                                    <span class="badge bg-primary">${cartCount }</span>
	                                                </a>
	                                            </li>
	                                            
	                                            <li>
		                                            <a href="/mypage">
					                                	<img src="${pageContext.request.contextPath }/resources/new_assets/img/slider01.jpg"
					                                	 class="rounded-circle" style="width: 41px; height: 41px;">
					                            	</a>
				                            	</li>
	                                            
	                                            <li class="d-none d-xl-inline-block" style="margin-left: 10px;">
	                                            <a href="/community/insert" class="butn-style2 text-white small"><span>글쓰기</span></a></li>
	                                        </ul>
	                                    </div>
										</c:when>
										<c:otherwise>
										<div class="attr-nav me-lg-0 ms-auto">
	                                        <ul>
	                                            <li class="dropdown me-3 me-lg-0">
	                                                <a href="/login/customLogin" style="padding-right: 0;">
	                                                    <p class="mb-0 pe-3 border-end" style="display: inline; font-size: 14px;">로그인</p>
	                                                </a>
	                                            </li>
	                                            <li>
		                                            <a href="/register/mType" style="padding-right: 0;">
					                                	<p class="mb-0 pe-3 border-end" style="display: inline; font-size: 14px;">회원가입</p>
					                            	</a>
				                            	</li>
	                                            <li>
		                                            <a href="/mypage" style="padding-right: 0;">
					                                	<p class="mb-0" style="display: inline; font-size: 14px;">고객센터</p>
					                            	</a>
				                            	</li>
	                                        </ul>
	                                    </div>
										</c:otherwise>
									</c:choose>

                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </header>