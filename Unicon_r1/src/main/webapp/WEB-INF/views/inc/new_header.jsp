<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
                                    <ul class="navbar-nav ms-5" id="nav" style="display: none;">
                                        <li><a href="/main">홈</a>
                                        </li>
                                        <li><a href="#!">Pages</a>
                                            <ul>
                                                <li><a href="#!">About Us</a>
                                                    <ul>
                                                        <li><a href="about.html">About Us 01</a></li>
                                                        <li><a href="about-2.html">About Us 02</a></li>
                                                        <li><a href="about-3.html">About Us 03</a></li>
                                                        <li><a href="about-me.html">About Me</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Our Team</a>
                                                    <ul>
                                                        <li><a href="team.html">Our Team 01</a></li>
                                                        <li><a href="team-2.html">Our Team 02</a></li>
                                                        <li><a href="team-3.html">Our Team 03</a></li>
                                                        <li><a href="team-4.html">Our Team 04</a></li>
                                                        <li><a href="team-5.html">Our Team 05</a></li>
                                                        <li><a href="team-6.html">Our Team 06</a></li>
                                                        <li><a href="team-7.html">Our Team 07</a></li>
                                                        <li><a href="team-8.html">Our Team 08</a></li>
                                                        <li><a href="team-single.html">Team Single</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Services</a>
                                                    <ul>
                                                        <li><a href="services.html">Services 01</a></li>
                                                        <li><a href="services-2.html">Services 02</a></li>
                                                        <li><a href="services-3.html">Services 03</a></li>
                                                        <li><a href="services-4.html">Services 04</a></li>
                                                        <li><a href="cases.html">Cases</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Service Detail</a>
                                                    <ul>
                                                        <li><a href="financial-planning.html">Financial Planning</a></li>
                                                        <li><a href="personal-insurance.html">Personal Insurance</a></li>
                                                        <li><a href="business-analysis.html">Business Analysis</a></li>
                                                        <li><a href="market-research.html">Market Research</a></li>
                                                        <li><a href="online-consulting.html">Online Consulting</a></li>
                                                        <li><a href="investment-planning.html">Investment Planning</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Contact Us</a>
                                                    <ul>
                                                        <li><a href="contact.html">Contact Us 01</a></li>
                                                        <li><a href="contact-2.html">Contact Us 02</a></li>
                                                        <li><a href="contact-3.html">Contact Us 03</a></li>
                                                        <li><a href="contact-4.html">Contact Us 04</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">FAQ</a>
                                                    <ul>
                                                        <li><a href="faq.html">FAQ 01</a></li>
                                                        <li><a href="faq-2.html">FAQ 02</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Additional Pages</a>
                                                    <ul>
                                                        <li><a href="career.html">Career</a></li>
                                                        <li><a href="login.html">Login</a></li>
                                                        <li><a href="registration.html">Registration</a></li>
                                                        <li><a href="forgot-password.html">Forgot Password</a></li>
                                                        <li><a href="404.html">Error 404</a></li>
                                                        <li><a href="maintenance.html">Maintenance</a></li>
                                                        <li><a href="comingsoon.html">Comingsoon</a></li>
                                                    </ul>
                                                </li>

                                            </ul>
                                        </li>
                                        <li><a href="#!">Features</a>
                                            <ul>
                                                <li><a href="#!">Headers</a>
                                                    <ul>
                                                        <li><a href="header-1.html">Header Style 1</a></li>
                                                        <li><a href="header-2.html">Header Style 2</a></li>
                                                        <li><a href="header-3.html">Header Style 3</a></li>
                                                        <li><a href="header-4.html">Header Style 4</a></li>
                                                        <li><a href="header-5.html">Header Style 5</a></li>
                                                        <li><a href="header-6.html">Header Style 6</a></li>
                                                        <li><a href="header-7.html">Header Style 7</a></li>
                                                        <li><a href="header-8.html">Header Style 8</a></li>
                                                        <li><a href="header-9.html">Header Style 9</a></li>
                                                        <li><a href="header-10.html">Header Style 10</a></li>
                                                        <li><a href="header-11.html">Header Style 11</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Classic Footers</a>
                                                    <ul>
                                                        <li><a href="footer-1.html">Footer Style 1</a></li>
                                                        <li><a href="footer-2.html">Footer Style 2</a></li>
                                                        <li><a href="footer-3.html">Footer Style 3</a></li>
                                                        <li><a href="footer-4.html">Footer Style 4</a></li>
                                                        <li><a href="footer-5.html">Footer Style 5</a></li>
                                                        <li><a href="footer-6.html">Footer Style 6</a></li>
                                                        <li><a href="footer-7.html">Footer Style 7</a></li>
                                                        <li><a href="footer-8.html">Footer Style 8</a></li>
                                                        <li><a href="footer-9.html">Footer Style 9</a></li>
                                                        <li><a href="footer-10.html">Footer Style 10</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Creative Footers</a>
                                                    <ul>
                                                        <li><a href="footer-11.html">Footer Style 11</a></li>
                                                        <li><a href="footer-12.html">Footer Style 12</a></li>
                                                        <li><a href="footer-13.html">Footer Style 13</a></li>
                                                        <li><a href="footer-14.html">Footer Style 14</a></li>
                                                        <li><a href="footer-15.html">Footer Style 15</a></li>
                                                        <li><a href="footer-16.html">Footer Style 16</a></li>
                                                        <li><a href="footer-17.html">Footer Style 17</a></li>
                                                        <li><a href="footer-18.html">Footer Style 18</a></li>
                                                        <li><a href="footer-19.html">Footer Style 19</a></li>
                                                        <li><a href="footer-20.html">Footer Style 20</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Page titles</a>
                                                    <ul>
                                                        <li><a href="page-title-1.html">Page Title 1</a></li>
                                                        <li><a href="page-title-2.html">Page Title 2</a></li>
                                                        <li><a href="page-title-3.html">Page Title 3</a></li>
                                                        <li><a href="page-title-4.html">Page Title 4</a></li>
                                                        <li><a href="page-title-5.html">Page Title 5</a></li>
                                                        <li><a href="page-title-6.html">Page Title 6</a></li>
                                                        <li><a href="page-title-7.html">Page Title 7</a></li>
                                                        <li><a href="page-title-8.html">Page Title 8</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Revolution Sliders</a>
                                                    <ul>
                                                        <li><a href="rs-slider1.html">Revolution Slider 1</a></li>
                                                        <li><a href="rs-slider2.html">Revolution Slider 2</a></li>
                                                        <li><a href="rs-slider3.html">Revolution Slider 3</a></li>
                                                        <li><a href="rs-slider4.html">Revolution Slider 4</a></li>
                                                        <li><a href="rs-slider5.html">Revolution Slider 5</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Owl Sliders</a>
                                                    <ul>
                                                        <li><a href="owl-slider1.html">Owl Slider 1</a></li>
                                                        <li><a href="owl-slider2.html">Owl Slider 2</a></li>
                                                        <li><a href="owl-slider3.html">Owl Slider 3</a></li>
                                                        <li><a href="owl-slider4.html">Owl Slider 4</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Creative Banners</a>
                                                    <ul>
                                                        <li><a href="creative-banner.html">Creative Banner 1</a></li>
                                                        <li><a href="creative-banner-2.html">Creative Banner 2</a></li>
                                                        <li><a href="creative-banner-3.html">Creative Banner 3</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Shape Banners</a>
                                                    <ul>
                                                        <li><a href="shape-banner.html">Shape Banner 1</a></li>
                                                        <li><a href="shape-banner-2.html">Shape Banner 2</a></li>
                                                        <li><a href="shape-banner-3.html">Shape Banner 3</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#!">Parallax Banners</a>
                                                    <ul>
                                                        <li><a href="parallax-banner.html">Parallax Banner 1</a></li>
                                                        <li><a href="parallax-banner-2.html">Parallax Banner 2</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="video-banner.html">Video Banner</a></li>
                                                <li><a href="loading-bar-banner.html">Loading Bar Banner</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="/news">소식</a>
                                            <ul>
                                                <li><a href="/news">지자체 행사소식</a></li>
                                                <li><a href="blog-grid-classic.html">Blog Grid Classic</a></li>
                                            </ul>
                                        </li>
                                        
                                        
                                           <li><a href="/inquiry/inquiry">고객센터</a>
                                            <ul>
                                                <li><a href="/inquiry/inquiry">고객센터</a></li>                                               
                                            </ul>
                                           </li>
                                        
                                        <li><a href="/admin/slide_manage">관리자페이지</a>
                                            <ul>
                                                <li><a href="/admin/slide_manage">슬라이드관리</a></li>
                                                <li><a href="/admin/news_manage">소식관리</a></li>
                                            </ul>
                                        </li>
                                        
                                        <li><a href="/shop">복지몰</a>
                                            <ul>
                                                <li><a href="#!">복지몰 홈</a></li>
                                                <li><a href="#!">카테고리</a></li>
                                                <li><a href="#!">베스트</a></li>
                                                <li><a href="#!">기획전</a></li>
                                            </ul>
                                        </li>
                                        
                                        
                                        
                                        <li></li>
                                    </ul>
                                    <!-- end menu area -->

                                    <!-- start attribute navigation -->
                                    <div class="attr-nav me-lg-0 ms-auto">
                                        <ul>
                                            <li class="dropdown me-3 me-lg-0">
                                                <a href="/shop/cart"><i class="fas fa-shopping-cart"></i>
                                                    <span class="badge bg-primary">3</span>
                                                </a>
                                            </li>
                                            <li class="search"><a href="#!"><i class="fas fa-search"></i></a></li>
                                            <li><a href="/mypage">
			                                	<img src="${pageContext.request.contextPath }/resources/new_assets/img/slider01.jpg"
			                                	 class="rounded-circle" style="width: 41px; height: 41px;">
			                            	</a></li>
                                            
                                            <li class="d-none d-xl-inline-block" style="margin-left: 10px;">
                                            <a href="contact.html" class="butn-style2 text-white small"><span>글쓰기</span></a></li>
                                        </ul>
                                    </div>
                                    <!-- end attribute navigation -->

                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </header>