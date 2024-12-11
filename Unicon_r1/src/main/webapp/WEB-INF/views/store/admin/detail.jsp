<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>유니콘</title>
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/resources/admin/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/resources/admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	
	<style type="text/css">
	.item-button {
		border: none;
    	background: transparent;
	}
	.badge {
		border: 1px solid;
	    margin-right: 5px;
	    color: red;
	}
	#noticeTable_filter {
	
	}
	
	tr td:last-child {
		display: flex;
		justify-content: flex-end;
		line-height: 2rem;
	
	}
	
	#noticeTable thead {
        display: none; /* 헤더 숨기기 */
    }
	.notice-btn {
		padding: 1rem 1rem 1rem 0;
		display: flex;
		align-items: center;	
	
	}
	
	.notice-btn button {
	    padding-bottom: 1rem;
	    color: #333;
	    background: #fff;
	    border: 0;
	    width: 300px;
	}
	
	.underline {
	    height: 2px; /* 언더라인의 높이 */
	    background: #ccc; /* 기본 언더라인 색상 */
	    transition: background 0.3s ease; /* 트랜지션 추가 */
	}
	
	.selected {
	    background: #333; /* 선택된 상태의 언더라인 색상 */
	}
	
	#create-notice {
		float: right;
    	margin-top: 20px;
	}
	.custom-message {
		    clear: both;
    color: #333;
    margin: 1em;
	}
	</style>    
    
    <script type="text/javascript">
    $(document).ready(function() {
        $('.notice-btn button').on('click', function() {
        	// 모든 언더라인에서 selected 클래스 제거
            $('.underline').removeClass('selected');
            console.log("실행");
            
            // 클릭한 버튼의 다음 언더라인에 selected 클래스 추가
            $(this).next('.underline').addClass('selected');
        });
        
        $('#create-notice').click(function() {
            window.location.href = '/store/admin/noticeForm'; // 예시 URL
        });

        
    });
    </script>
    
    
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:/WEB-INF/views/inc/admin_navbar.jsp -->
      <%@ include file="/WEB-INF/views/inc/admin_store_navbar.jsp"%>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:/WEB-INF/views/inc/admin_sidebar.jsp" -->
		<%@ include file="/WEB-INF/views/inc/admin_store_sidebar.jsp"%>
        <!-- partial -->
        <div class="main-panel">
          <div style="padding: .8rem 2.875rem 0 2.875rem;" class="content-wrapper">
            <div class="d-xl-flex justify-content-between align-items-start">
            </div>
            <div class="row">
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">공지사항</h4>
                    <div>
                    	<div class="d-xl-flex justify-content-between align-items-start">
                    		<div>
							    <!-- important가 1인 경우의 로직 -->
                    			<c:if test="${list.important == 1}">
								    <div>
								        <span class="badge">중요</span>
								        ${list.anoTitle}
								    </div>
								</c:if>
								
								<c:if test="${list.important != 1}">
								    <!-- important가 1이 아닌 경우의 로직 -->
								    <div>
								        ${list.anoTitle}
								    </div>
								</c:if>
                    		</div>
                    		<div>
		                    	${list.anoRegdate}
                    		</div>
                    	</div>
                    	<div class="dropdown-divider"></div>
                    	<div class="d-xl-flex justify-content-center align-items-start">${list.anoContent}</div>
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
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="/resources/admin/js/off-canvas.js"></script>
    <script src="/resources/admin/js/hoverable-collapse.js"></script>
    <script src="/resources/admin/js/misc.js"></script>
    <!-- End custom js for this page -->
    
  </body>
</html>