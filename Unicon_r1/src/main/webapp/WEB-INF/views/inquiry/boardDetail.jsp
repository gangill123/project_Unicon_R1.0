<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 추가 템플릿 css/js 작성란 -->
<style>

/* 답변 영역 배경색 및 스타일 */
.comment-box {
    border: 1px solid #e0e0e0;  /* 얇은 회색 테두리 */
    background-color: #f9f9f9;  /* 밝은 회색 배경 */
    padding: 15px;
    margin-top: 15px;
    border-radius: 10px;  /* 둥근 모서리 */
}

.reply {
    padding: 10px;
    margin-bottom: 10px;
    background-color: #fff;  /* 답변의 배경색 */
    border-radius: 8px;
    border: 1px solid #ddd;  /* 답변의 테두리 */
}

.reply h6 {
    font-size: 16px;
    font-weight: bold;
    color: #333;  /* 작성자의 이름 색상 */
    margin-bottom: 5px;
}

.reply p {
    font-size: 14px;
    color: #555;  /* 답변 내용 색상 */
    line-height: 1.6;
}

.reply small {
    font-size: 12px;
    color: #888;  /* 날짜 색상 */
}

</style>



</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<section class="page-title-section bg-primary">
    <div class="container">
		
        <div class="row">
            <div class="col-md-12">
                <h1>Unicorn 고객센터</h1>
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

                                <div class="content">
                                    <div class="blog-list-simple-text">
                                        <div class="post-title">
                                            <h5>${boardDetail.title}</h5>
                                        </div>
                                     
                                        <ul class="meta ps-0">
                                            <li>
                                                <a href="#!">
                                                    <i aria-hidden="true" class="fa-sharp fa-solid fa-hashtag"></i> NO : ${boardDetail.bno}
                                                </a>
                                            </li>

                                            <li>
                                               <a href="#!">
											        <i aria-hidden="true" class="fa fa-user"></i> 작성자: 
											        <span id="author-name-placeholder">${boardDetail.member_name}</span>
											    </a>
                                            </li>                                
                                              <li>
                                                <a href="#!" id="masked-email">
												    <i aria-hidden="true" class="far fa-envelope"></i> 이메일: <span id="email-placeholder">${boardDetail.email}</span>
												</a>
                                            </li>
                                             <li>
                                               <a href="#!" id="masked-phone">
												    <i aria-hidden="true" class="fas fa-phone"></i> 전화번호: <span id="phone-placeholder">${boardDetail.phone}</span>
											   </a>
                                            </li>
                                            <li>
                                                <a href="#!">
                                                    <i aria-hidden="true" class="fas fa-calendar-alt"></i> 작성일: ${boardDetail.created_at}
                                                </a>
                                            </li>                                             
                                        </ul>
                                    </div>
                                       <hr>
                                    <div class="post-cont">
                                         	${boardDetail.content}
                     						<!-- boardDetail.jsp -->
											<c:if test="${not empty boardDetail.inquiryFile.thumbnailPath}">
											    <img src="${boardDetail.inquiryFile.thumbnailPath}" alt="Thumbnail" />
											</c:if>
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
							            <div class="reply">
											<c:choose>
											   <c:when test="${empty answers}">
											       <p>관리자가 문의 답변 예정입니다.</p>
											   </c:when>
											   <c:otherwise>
											       <c:forEach var="answer" items="${answers}">
											           <div class="answer-item">
											               <!-- 작성자 이름과 이미지 수정-->
											               <h6>
											                   <img src="${pageContext.request.contextPath}/resources/assets/images/U문의.jpg" 
											                        alt="U" class="rounded-circle me-2" style="width: 30px; height: 30px;">
											                   ${answer.dname}
											               </h6>
											               <!-- 답변 내용 -->
											               <p>${answer.dcontent}</p>
											               <!-- 답변 작성 날짜 -->
											               <p style="text-align: right;"><small>${answer.created_at}</small></p>
											           </div>
											       </c:forEach>
											   </c:otherwise>
											</c:choose>
							            </div>
							        </div>
							    </div>
							</div>
							<!-- end comment-->

                           
                        </div>
                    </div>
                    <!--  end blog lefts-->

                    <!--  start blog right-->
                    <div class="col-lg-3">
                        <div class="side-bar">
                            <div class="widget">
                                <form class="search-form w-sm-90 mx-auto mx-lg-0" id="searchForm" action="" method="get">

                                    <div class="search-elements">

                                        <div class="row">

                               <!-- Begin Text input element -->
											<div class="col-md-12">
											    <div class="quform-element" style="position: relative;">
											        <div class="quform-input">
											            <input class="rounded-pill form-control" id="searchInput" type="text" placeholder="검색..." style="padding-right: 40px;" />
											            <!-- 검색 버튼을 input 안에 배치 -->
											            <button id="searchBtn" class="btn btn-white text-primary" type="button" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%);">
											                <i class="fas fa-paper-plane"></i>
											            </button>
											        </div>
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
                                    <h6>문의하기(이메일)</h6>
                                </div>
                                <ul class="list-unstyled">
                                    <li><a href="../question">이메일로 문의하기</a></li>
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
        
        
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // 이메일을 받아와서 마스킹 처리
        const emailElement = document.getElementById("email-placeholder");
        const email = emailElement.textContent.trim();
        
        // 이메일 중간 부분 마스킹
        const maskedEmail = maskEmail(email);
        emailElement.textContent = maskedEmail;
    });

    // 이메일 마스킹 함수
    function maskEmail(email) {
        const atIndex = email.indexOf('@');
        if (atIndex > 1) {
            const masked = email.substring(0, 2) + "****" + email.substring(atIndex);
            return masked;
        }
        return email;
    }
</script>


<script>
    document.addEventListener("DOMContentLoaded", function() {
        // 휴대폰 번호를 받아와서 마스킹 처리
        const phoneElement = document.getElementById("phone-placeholder");
        const phone = phoneElement.textContent.trim();
        
        // 휴대폰 번호 마스킹
        const maskedPhone = maskPhoneNumber(phone);
        phoneElement.textContent = maskedPhone;
    });

    // 휴대폰 번호 마스킹 함수
    function maskPhoneNumber(phone) {
        // 번호가 최소 길이(10자 이상)가 되어야 마스킹 처리
        if (phone.length >= 10) {
            const masked = phone.substring(0, 3) + "*****" + phone.substring(8);
            return masked;
        }
        return phone; // 번호가 짧을 경우 그대로 반환
    }
</script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // 작성자 이름을 받아와서 마스킹 처리
        const nameElement = document.getElementById("author-name-placeholder");
        const name = nameElement.textContent.trim();
        
        // 작성자 이름 마스킹
        const maskedName = maskName(name);
        nameElement.textContent = maskedName;
    });

    // 작성자 이름 마스킹 함수
    function maskName(name) {
        // 이름이 최소 길이(2자 이상)가 되어야 마스킹 처리
        if (name.length >= 2) {
            const masked = name.charAt(0) + "*" + name.charAt(name.length - 1);
            return masked;
        }
        return name; // 이름이 짧을 경우 그대로 반환
    }
</script>

<script>
$(document).ready(function() {
	
	$('.navbar #inquiry').addClass('current');
	
    // 검색 버튼 클릭 이벤트
    $("#searchBtn").click(function() {
        performSearch();
    });

    // Enter 키 입력 시 검색 버튼 클릭 처리
    $("#searchInput").keypress(function(event) {
        if (event.which === 13) { // 13은 Enter 키의 키코드
            event.preventDefault(); // 폼 제출 방지
            performSearch(); // 검색 처리 함수 호출
        }
    });

    // 검색 처리 함수
    function performSearch() {
        const searchQuery = $("#searchInput").val().trim().toLowerCase();
        let targetPage = '';

        if (searchQuery.includes('입양') || searchQuery.includes('입양 방법') || searchQuery.includes('입양 현황')) {
            targetPage = '../adoption';  // 입양 관련 페이지로 이동
        } else if (searchQuery.includes('쇼핑') || searchQuery.includes('애견옷') || searchQuery.includes('쇼핑몰') || searchQuery.includes('애견 용품') || searchQuery.includes('애견 용품') || searchQuery.includes('애견 용품 주문')) {
            targetPage = '../shop';  // 쇼핑몰 페이지로 이동
        } else if (searchQuery.includes('커뮤니티') || searchQuery.includes('애견 커뮤니티')) {
            targetPage = '../community';  // 커뮤니티 페이지로 이동
        } else if (searchQuery.includes('기타') || searchQuery.includes('결제') || searchQuery.includes('오류') || searchQuery.includes('시스템') || searchQuery.includes('기타 사항')) {
            targetPage = '../etc';  // 기타 페이지로 이동
        } else if (searchQuery.includes('문의하기') || searchQuery.includes('게시판 작성') || searchQuery.includes('게시판 문의') || searchQuery.includes('질문') || searchQuery.includes('작성')) {
            targetPage = '../write';  // 문의 페이지로 이동         
        } else if (searchQuery.includes('이메일 문의') || searchQuery.includes('이메일') || searchQuery.includes('이메일 문의하기') || searchQuery.includes('email') || searchQuery.includes('이메일 작성')) {
            targetPage = '../question';  // 이메일 문의 페이지로 이동         
        }  else if (searchQuery.includes('게시판') || searchQuery.includes('문의게시판') || searchQuery.includes('문의 게시판') || searchQuery.includes('목록 게시판') || searchQuery.includes('목록')) {
            targetPage = '../board';  // 이메일 문의 페이지로 이동         
        }  else {
            alert('해당 검색어에 맞는 페이지가 없습니다.');
            return;  // 페이지 이동을 하지 않고 알림만 출력
        }

        // 페이지 이동
        window.location.href = targetPage;
    }
});
</script>


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
