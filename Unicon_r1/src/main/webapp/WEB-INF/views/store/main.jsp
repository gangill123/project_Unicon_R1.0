<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>판매자</title>
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/resources/admin/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/resources/admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	// 쿠키를 설정하는 함수
    function setCookie(name, value, days) {
        var expires = "";
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = "; expires=" + date.toUTCString();
        }
        document.cookie = name + "=" + (value || "") + expires + "; path=/";
    }

    // 쿠키를 가져오는 함수
    function getCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
        }
        return null;
    }
	 var popups = [];
    <c:forEach var="popup" items="${popups}">
        popups.push('${popup.anoId}'); // 각 팝업의 anoTitle을 popups 배열에 추가
    </c:forEach>
	
    $(document).ready(function() {
    	// popups 배열을 반복하여 각 모달을 열기
        // 모든 팝업에 대해 반복
        <c:forEach var="popup" items="${popups}">
            var popupId = '${popup.anoId}'; // 현재 팝업의 ID
            var cookieValue = getCookie('hideModal-' + popupId);

            if (!cookieValue) {
                $('#myModal-' + popupId).modal('show'); // 쿠키가 없으면 모달 열기
            }

            $('#confirmBtn-' + popupId).on('click', function() {
                // "확인" 버튼 클릭 시 쿠키에 저장
                setCookie('hideModal-' + popupId, 'true', 1); // 1일 동안 유효
                $('#myModal-' + popupId).modal('hide'); // 모달 닫기
            });
        </c:forEach>
    	
    	
        let currentIndex = 0; // 현재 슬라이드 인덱스
        const $slides = $('.slides');
        const totalSlides = $('.slide').length;

        function updateSlidePosition() {
            $slides.css('transform', 'translateX(' + (-currentIndex * 100) + '%)');
        }

        $('#next').on('click', function() {
            currentIndex = (currentIndex + 1) % totalSlides; // 다음 슬라이드로 이동
            updateSlidePosition();
        });

        $('#prev').on('click', function() {
            currentIndex = (currentIndex - 1 + totalSlides) % totalSlides; // 이전 슬라이드로 이동
            updateSlidePosition();
        });

        // 자동 슬라이드 기능
        setInterval(function() {
            currentIndex = (currentIndex + 1) % totalSlides; // 다음 슬라이드로 이동
            updateSlidePosition();
        }, 3000); // 3초마다 슬라이드 전환
        
        
        
        
        
    });
    </script>
	<style type="text/css">
	.modal-backdrop {
    	background: transparent !important; /* 배경을 투명하게 설정 */
	}
	.store-notice {
		color: black;
		line-height: 42px;
		position: relative;
	    overflow: hidden;
	    width: 100%; /* 슬라이드 너비를 100%로 설정 */
	}
	
	.store-notice-left{
		font-size: 32px;
	}
	
	.store-notice-right {
		font-size: 32px;
	}
	
	.store-flex, .store-card-flex {
		display: flex;
    	justify-content: space-between;
	}
	.store-flex h5,h6 , .store-card-title h5 {
		margin: 0;
		line-height: 26px;
	}
	.store-card-title {
		display: flex;
	}
	.store-card-title i{
		margin-left : 0.5rem;
		font-size: 20px;
	} 
	
	.store-card-flex a {
    	color: #8e94a9; 
    	transition: color 0.3s; 
	}
	/* 호버 시 색상 */
	.store-card-flex a:hover {
	    color: #bf94e4; 
	}
	.store-flex span a {
		color : gray;
	}
	
	.slides {
	    display: flex;
	    transition: transform 0.5s ease;
	}
	
	.slide {
	   min-width: 100%; /* 슬라이드 하나의 너비를 100%로 설정 */
	    box-sizing: border-box;
	    display: flex; /* 내용이 중앙에 오도록 설정 */
	    align-items: center; /* 수직 중앙 정렬 */
	    justify-content: center; /* 수평 중앙 정렬 */
	}
	/* 모달 */
	.modal-dialog {
		left: -20%;
    	top: 20%;
	}
	.modal-body {
		padding: 0 !important;
	}
	/* 모달 */
	</style>    
    
    
    
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:/WEB-INF/views/inc/admin_navbar.jsp -->
      <%@ include file="/WEB-INF/views/inc/admin_navbar_store.jsp"%>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:/WEB-INF/views/inc/admin_sidebar.jsp" -->
		<%@ include file="/WEB-INF/views/inc/admin_sidebar_store.jsp"%>
        <!-- partial -->
        <!-- 모달 -->
        <!-- 페이드 -->
<%-- 	<div class="modal fade" id="myModal-${popup.anoId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-${popup.anoId}" aria-hidden="true"> --%>
		<c:if test="${not empty popups}">
		    <c:forEach var="popup" items="${popups}">
		        <div class="modal" id="myModal-${popup.anoId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-${popup.anoId}" aria-hidden="true">
		            <div class="modal-dialog" role="document">
		                <div class="modal-content" style="width: ${popup.popupWidth}; height: ${popup.popupHeight};">
		                    <div class="modal-header">
		                        <h5 class="modal-title" id="myModalLabel-${popup.anoId}">${popup.anoTitle}</h5>
		                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                            <span aria-hidden="true">&times;</span>
		                        </button>
		                    </div>
		                    <div class="modal-body">
		                        <img style="width: 100%; height : 100%;" src="${popup.image_src}" alt="팝업이미지"> 
		                    </div>
		                    <div class="modal-footer">
		                       	<div id="confirmBtn-${popup.anoId}">
			                       	 오늘하루 안보기  <input type="checkbox" />
		                       	</div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </c:forEach>
		</c:if>
        <div class="main-panel">
          <div style="padding: .8rem 2.875rem 0 2.875rem;" class="content-wrapper">
            <div class="d-xl-flex justify-content-between align-items-start">
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                   <div style="padding: 1rem; display: flex" class="card-body text-center align-items-start justify-content-between">
                   		 <i class="mdi mdi-chevron-left store-notice-left"></i>
                   		 <div class="store-notice" id="store-notices">
                   		 	<div class="slides">
						        <c:forEach var="notice" items="${notices}">
						            <div class="slide">
						                <span>${notice.anoTitle}</span>
						            </div>
						        </c:forEach>
						    </div>
                   		 </div>
                   		 <i class="mdi mdi-chevron-right store-notice-right"></i>
                   </div>
                </div>
                <div class="tab-content tab-transparent-content">
                  <div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">
                    <div class="row">
                      <div class="col-xl-3 col-lg-3 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body ">
                            <h5 class="mb-4 text-dark font-weight-bold">주문/배송</h5>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">신규 주문</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
	                            
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">배송 준비</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">배송중</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">배송 완료</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-3 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body ">
                            <h5 class="mb-4 text-dark font-weight-bold">클레임</h5>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">취소 요청</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">반품 요청</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">교환 요청</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-3 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body ">
                          	<h5 class="mb-4 text-dark font-weight-bold">상품</h5>
                            <div class="dropdown-divider"></div>
                           	<div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">판매중 상품</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">품절 상품</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">등록/수정요청 상품</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-3 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body ">
                          	<h5 class="mb-4 text-dark font-weight-bold">문의</h5>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">이름</h5>
	                            <h5 class="text-dark font-weight-normal"></h5>
	                            <h6 class="text-dark font-weight-normal">2024.11.20</h6>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">이름</h5>
	                            <h5 class="text-dark font-weight-normal"></h5>
	                            <h6 class="text-dark font-weight-normal">2024.11.20</h6>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">이름</h5>
	                            <h5 class="text-dark font-weight-normal"></h5>
	                            <h6 class="text-dark font-weight-normal">2024.11.20</h6>
                            </div>
                            <div class="dropdown-divider"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-4 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body mb-4">
                            <h4 class="card-title text-dark">솔루션(AI)</h4>
                            <div style="display: flex;justify-content: center;align-items: center;height: 100%;margin-top: -2rem;">
	                            <a href="/#">	
		                            <img src="${pageContext.request.contextPath}/resources/admin/images/ChatGPT-Logo.svg.png">
	                            </a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-8  grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body">
                            <div class="d-xl-flex justify-content-between mb-2">
                              <h4 class="card-title">매출 통계</h4>
                              <div class="graph-custom-legend primary-dot" id="pageViewAnalyticLengend"></div>
                            </div>
                            <canvas id="page-view-analytic"></canvas>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:/WEB-INF/views/inc/admin_footer.jsp -->
		  <%@ include file="/WEB-INF/views/inc/admin_footer.jsp"%>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="/resources/admin/vendors/chart.js/Chart.min.js"></script>
    <script src="/resources/admin/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="/resources/admin/js/off-canvas.js"></script>
    <script src="/resources/admin/js/hoverable-collapse.js"></script>
    <script src="/resources/admin/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="/resources/admin/js/dashboard.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>