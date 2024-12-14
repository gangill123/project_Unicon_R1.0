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
   	$(document).ready(function() {
   	    
   	    $('#create-notice').click(function() {
   	        window.location.href = '/store/admin/noticeForm'; // 예시 URL
   	    });
   	    
   		
   	    
   	});
   
   	function reject(product_id) {
   		const comment = prompt('반려사유를 입력하세요.');
	   	 if (comment !== null && comment.trim() !== '') {
	         // 코멘트가 입력된 경우 처리
	         console.log('Product ID:', product_id);
	         console.log('코멘트:', comment);
	
	         // 여기서 코멘트를 서버로 전송하는 로직 추가
	     } else {
	         alert('반려사유를 입력하세요.'); // 입력이 비어있을 경우 경고
	         
	     }
   	}
   	function preview(product_id) {
   		alert(product_id);
   		window.location.href = '/store/admin/product/preview/'+product_id; // 예시 URL
   		
   	}
	
	function handleClick(product_id) {
		if ($('#myModal'+product_id).css('display') === 'block') {
	    	$('#myModal'+product_id).css('display', 'none'); // 이미 보이고 있으면 숨기기
	    } else {
			$('.myModal').css('display', 'none'); // 모든 myModal 숨기기
	    	$('#myModal'+product_id).css('display', 'block'); // 보이지 않으면 보이게 설정
	    }
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
		/* justify-content: flex-end; */
		line-height: 2rem;
	
	}
	
/* 	#noticeTable thead { */
/*         display: none; /* 헤더 숨기기 */ */
/*     } */
	
	
	#create-notice {
		float: right;
    	margin-top: 20px;
	}
	.custom-message {
		    clear: both;
    color: #333;
    margin: 1em;
	}
	
	.myModal {
		display : none;
	    position: absolute;
        border: 1px solid;
	    top: 82%;
	    right: 0%;
	    background: #ffffff;
	}
	
	/* 미리보기 */
	.myModal .preview {
	    margin: 10px; /* 기본 스타일 */
	    transition: background-color 0.3s; /* 부드러운 색상 전환 */
	    cursor: pointer;
	}
	
	.myModal .preview:hover {
	    background-color: #f0f1f6; /* 호버 시 색상 변경 */
	}
	
	/* 반려 */
	.myModal .reject {
	    margin: 10px; /* 기본 스타일 */
	    transition: background-color 0.3s; /* 부드러운 색상 전환 */
	    cursor: pointer;
	}
	
	.myModal .reject:hover {
	    background-color: #f0f1f6; /* 호버 시 색상 변경 */
	}
	</style>    
    
    
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
                    <h4 class="card-title">신규 등록 상품</h4>
                    <table id="Table" class="table table-hover col-12">
	                    <thead>
							<tr>
								<th>상품명</th>
								<th>카테고리</th>
								<th>가격</th>
								<th>등록일자</th>
								<th>판매기간</th>
								<th>브랜드,제조사,원산지</th>
								<th>할인율</th>
								<th>옵션</th>
								<th></th>
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
		var aTable = $('#Table').DataTable({
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
				url: '/store/admin/products/new',
				type: 'GET',
				dataType: 'json',
				dataSrc: function(json) {
					return json.map(function(item) {
						const date = new Date(item.end_date);
						const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
						const formattedDate = date.toLocaleDateString('ko-KR', options);
 						item.end_date = formattedDate;
 						// create_date 포맷팅
 						const createDate = new Date(item.create_date);
 						const formattedCreateDate = createDate.toLocaleDateString('ko-KR', options);
 						item.create_date = formattedCreateDate;
						item.discount_rate = item.discount_rate+"%";
						return item;
					});
				}
			},
			
			"columns": [
	            { data: 'product_name' }, // 두 번째 열은 정렬 불가
	            { data: 'product_category_type' }, // 두 번째 열은 정렬 불가
	            { data: 'product_price' }, // 두 번째 열은 정렬 불가
	            { data: 'create_date' }, // 두 번째 열은 정렬 불가
	            { data: 'end_date' }, // 두 번째 열은 정렬 불가
	            { data: 'brand' }, // brand |manufacturer |product_origin 합쳐서
	            { data: 'discount_rate' }, // 두 번째 열은 정렬 불가
	            { data: 'option_type'}, // 세 번째 열은 정렬 불가
	            { 
	                data: 'product_id', // product_id 열
	                render: function(data, type, row) {
	                    return "<button class='item-button' onclick='handleClick(\"" + row.product_id + "\")'>" +
	                    "<span>:</span>" +
	                    "</button><div id='myModal"+row.product_id +"' class='myModal'>"+
	                    "<div class='preview' onclick='preview(\""+row.product_id +"\")'>미리보기</div>"
	                    +"<div class='dropdown-divider'></div><div class='reject' onclick='reject(\"" + row.product_id + "\")'>반려</div></div>";
	                }
	            }
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
	    /* $("#noticeTable").before('<div class="custom-message">전체보기</div>'); */
		// #noticeTable 요소 앞에 콘텐츠 추가
		
		
		
	});
    
    </script>
  </body>
</html>