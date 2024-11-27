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
                    <li><a href="../inquiry"><i class="ti-home"></i></a></li>
                    <li class="active"><a href="../board">문의 게시글(돌아가기)</a></li>
                </ul>
            </div>
        </div>	
    </div>
</section>


<section class="blogs">
            <div class="container">
                <div class="row">

                    <!--  start blog left-->
                    <div class="col-lg-9 pe-lg-1-9 mb-1-9 mb-lg-0">
                        <div class="posts">
                            <!--  start post-->
                            <div class="post">
<!--                                 <div class="post-img"> -->
<!--                                     <img src="해당 게시글 번호의 첨부파일 주소 " alt="..."> -->
<!--                                 </div> -->
                                <div class="content">
                                    <div class="blog-list-simple-text">
                                        <div class="post-title">
                                            <h5>게시글 제목</h5>
                                        </div>
                                        <ul class="meta ps-0">
                                            <li>
                                                <a href="#!">
                                                    <i aria-hidden="true" class="fa fa-user"></i> 작성자 ${inquiryVO.member_name}
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#!">
                                                    <i aria-hidden="true" class="fa fa-folder-open"></i> 카테고리 ${inquiryVO.istatus}
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#!">
                                                    <i aria-hidden="true" class="fas fa-calendar-alt"></i>작성일 ${inquiryVO.created_at}
                                                </a>
                                            </li>
                                          
                                            <li>
                                                <a href="#!">
                                                    <i aria-hidden="true" class="fa fa-comments"></i>답변수  ${inquiryVO.dcontentCount}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="post-cont">
                                         	작성 내용 
                                    </div>
                                    <div class="share-post">
                                        <span>Share Post</span>
                                        <ul class="ps-0">
                                    <li><a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a href="https://x.com/?lang=ko"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a></li>
                                    <li><a href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a></li>      
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!--  start post-->

                            <!--  start comment-->
                            <div class="comments-area">
                                <div class="line-title">
                                    <h3>문의 답변</h3>
                                </div>

                                <div class="comment-box">
                                   
                                    <div class="comment-info">
                                        <h6>관리자</h6>
                                       		<p>관리자 관리자 답변 예정입니다. 관리자 관리자 답변 예정입니다.관리자 관리자 답변 예정입니다.관리자 관리자 답변 예정입니다.관리자 관리자 답변 예정입니다.관리자 관리자 답변 예정입니다.</p>
                                        <div class="reply">
                                            <a href="#!">
                                                <i class="fa fa-reply" aria-hidden="true"></i> Reply
                                            </a>
                                        </div>
                                    </div>
                                </div>
                              
                            </div>
                            <!-- end comment-->

                            <!--  start form-->
                            <div class="comment-form">

                                <div class="line-title">
                                    <h3>관리자 전용 문의 답변</h3>
                                </div>

                                <form method="post">

                                    <div class="row">

                                        <div class="col-sm-6">

                                            <div class="form-group">
                                                <input type="text" class="form-control" name="name" placeholder="Your name here">
                                            </div>

                                        </div>

                                        <div class="col-sm-6">

                                            <div class="form-group">
                                                <input type="email" class="form-control" name="email" placeholder="Your email here">
                                            </div>

                                        </div>

                                        <div class="col-sm-12">

                                            <div class="form-group">
                                                <textarea id="message" class="form-control" name="message" rows="3" placeholder="Tell us a few words"></textarea>
                                            </div>

                                        </div>

                                    </div>

                                    <button type="button" class="butn primary"><span>Send Message</span></button>

                                </form>

                            </div>
                            <!--  end form-->
                        </div>
                    </div>
                    <!--  end blog left-->

                    <!--  start blog right-->
                    <div class="col-lg-3">
                        <div class="side-bar">
                            <div class="widget">
                                <form class="search-form w-sm-90 mx-auto mx-lg-0" action="#!" method="post" enctype="multipart/form-data" onclick="">

                                    <div class="search-elements">

                                        <div class="row">

                                            <!-- Begin Text input element -->
                                            <div class="col-md-12">
                                                <div class="search-element">
                                                    <div class="search-input">
                                                        <input class="form-control" id="email" type="text" name="email" placeholder="Search Crizal...">
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Text input element -->

                                            <!-- Begin Submit button -->
                                            <div class="col-md-12">
                                                <div class="search-submit-inner">
                                                    <button class="btn btn-white text-primary m-0" type="submit"><i class="fas fa-search"></i></button>
                                                </div>
                                            </div>
                                            <!-- End Submit button -->

                                        </div>

                                    </div>

                                </form>
                            </div>

                            <div class="widget">
                                <div class="widget-title">
                                    <h6>내 문의 내역</h6>
                                </div>
                                <ul class="list-unstyled">
                                    <li><a href="../history">내 문의내역 바로가기</a></li>                          
                                </ul>
                            </div>

                            <div class="widget">
                                <div class="widget-title">
                                    <h6>자주 묻는 질문</h6>
                                </div>
                                <ul class="list-unstyled">
                                    <li><a href="../question">자주 묻는 질문 바로가기</a></li>
                                </ul>
                            </div>


                            <div class="widget">
                                <div class="widget-title">
                                    <h6>카테고리</h6>
                                </div>
                                <ul class="list-unstyled">
                                    <li><a href="../inquiry">고객센터 메인</a></li>
                                    <li><a href="../adoption">입양 관련 문의</a></li>
                                    <li><a href="../shop">쇼핑 관련 문의</a></li>
                                    <li><a href="../community">커뮤니티 관련 문의</a></li>
                                    <li><a href="../etc">기타 문의</a></li>
                                </ul>
                            </div>

                            <div class="widget">
                                <div class="widget-title">
                                    <h6>Follow Us</h6>
                                </div>
                                <ul class="social-listing ps-0">
                                    <li><a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a href="https://x.com/?lang=ko"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a></li>
                                    <li><a href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a></li>                                 
                                </ul>
                            </div>

                        </div>
                    </div>
                    <!--  end blog right-->

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
