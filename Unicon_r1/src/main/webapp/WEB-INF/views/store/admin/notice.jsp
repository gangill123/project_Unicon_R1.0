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
	
	
	<script type="text/javascript">
	// 클릭 이벤트 핸들러 함수 정의
   	function handleClick(anoId) {
		window.location.href = '/store/admin/notices/detail/' + anoId;
	}
	
	</script>
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
                    <div class="notice-btn">
                    	<div>
					        <button>공지사항</button>
					        <div class="underline selected"></div>
					    </div>
					    <div>
					        <button>팝업</button>
					        <div class="underline"></div>
					    </div>
                    </div>
                    <table id="noticeTable" class="table table-hover col-12">
	                    <thead>
							<tr>
								<th>전체보기</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<!-- 셀렉트 박스내용들인가봄 -->
						<tfoot>
						</tfoot>
					</table>
                    <div>
                    	<button class="btn btn-primary btn-fw" id="create-notice">글 생성</button>
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
    
    
   <script type="text/javascript">
	$(document).ready(function() {

    	/*=============== DataTable 라이브러리 ===============*/
		var aTable = $('#noticeTable').DataTable({
			"autoWidth": false, 
			"info": false,
		    "paging": true,
		    "lengthChange": false, //
		    "ordering" : false, // 정렬 기능 비활성화 */
		    "lengthMenu": [10, 20, 50, 80], 
		    "language": {
				"lengthMenu": "표시 항목수 _MENU_",
				"search": "검색",
				"paginate": {
					next: "다음",
					previous: "이전"
				}
			},
			"stateSave": true,
			"stateDuration": -1,
			/*=============== DataTable ajax ===============*/
			"ajax": {
				url: '/store/admin/notices',
				type: 'GET',
				dataType: 'json',
				dataSrc: function(json) {
					return json.map(function(item) {
						const date = new Date(item.anoRegdate);
						const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
						const formattedDate = date.toLocaleDateString('ko-KR', options);
 						item.anoRegdate = formattedDate;
						
						if(item.important === 1) {
							item.anoTitle = "<button class='item-button' onclick='handleClick(" + item.anoId + ")'>"
										    + "<span class='badge'>중요</span>"
										    + item.anoTitle 
										    + "</button>";
						}else {
							item.anoTitle = "<button class='item-button' onclick='handleClick(" + item.anoId + ")'>"
						    + item.anoTitle 
						    + "</button>";
						}
						
						console.log(item);
						return item;
					});
				}
			},
			"columns": [
	            { data: 'anoTitle' }, // 두 번째 열은 정렬 불가
	            { data: 'anoRegdate'} // 세 번째 열은 정렬 불가
	        ],
			/*=============== DataTable ajax ===============*/
			
			 "columnDefs": [],
			/*=============== DataTable 필터링 ===============*/
			"initComplete": function() {
				var api = this.api();
				
				api.columns().every(function(index) {
					var column = this;
					  
					if (index === 0 || index === 3 || index === 4) {
						return;
					}
				});
			}
			/*=============== DataTable 필터링 ===============*/
			
		});
		
		/*=============== DataTable 열마다 클래스 부여 ===============*/
// 		aTable.on('draw', function() {
// 			$('#animalTable tbody').find('td').each(function() {
// 				$(this).html($(this).html());
// 			});
			
// 			$('#animalTable tbody tr').each(function() {
// 				$(this).find('td:eq(0)').addClass('a-first-column');
// 				$(this).find('td:eq(1)').addClass('a-second-column');
// 				$(this).find('td:eq(2)').addClass('a-third-column');
// 				$(this).find('td:eq(3)').addClass('a-fourth-column');
// 				$(this).find('td:eq(4)').addClass('a-fifth-column');
// 				$(this).find('td:eq(5)').addClass('a-six-column');
// 				$(this).addClass('a-view-animal');
// 			});
			
// 			$('#animalTable thead tr').each(function() {
// 				$(this).find('th:eq(0)').addClass('a-first-column');
// 				$(this).find('th:eq(1)').addClass('a-second-column');
// 				$(this).find('th:eq(2)').addClass('a-third-column');
// 				$(this).find('th:eq(3)').addClass('a-fourth-column');
// 				$(this).find('th:eq(4)').addClass('a-fifth-column');
// 				$(this).find('th:eq(5)').addClass('a-six-column');
// 			});
			
// 			$('#animalTable tfoot tr').each(function() {
// 				$(this).find('th:eq(0)').addClass('a-first-column');
// 				$(this).find('th:eq(1)').addClass('a-second-column');
// 				$(this).find('th:eq(2)').addClass('a-third-column');
// 				$(this).find('th:eq(3)').addClass('a-fourth-column');
// 				$(this).find('th:eq(4)').addClass('a-fifth-column');
// 				$(this).find('th:eq(5)').addClass('a-six-column');
// 			});
// 		});
// 		/*=============== DataTable 열마다 클래스 부여 ===============*/
		
		
// 		/*=============== DataTable 라이브러리 ===============*/
		
		
		
// 		/*=============== tr 선택 상세 조회 ===============*/
// 		$('table').on('click', 'tr.a-view-animal', function() {
// 			const animal_id = $(this).find('td:eq(0)').text();
// 			window.location.href = '/AM/animals/list/' + animal_id;
// 		});
// 		/*=============== tr 선택 상세 조회 ===============*/
		
		// #noticeTable 요소 앞에 콘텐츠 추가
	    $("#noticeTable").before('<div class="custom-message">전체보기</div>');
		// #noticeTable 요소 앞에 콘텐츠 추가
		
		
		
	});
    
    </script>
  </body>
</html>