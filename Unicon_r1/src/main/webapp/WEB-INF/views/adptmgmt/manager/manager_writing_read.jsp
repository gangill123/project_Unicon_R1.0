<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>유니콘</title>
    <!-- plugins:css -->
    <!-- dataTables.css -->
    <!-- Font-Awesome CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
    <style type="text/css">
    /*=============== badge css ===============*/
    /* <label class="badge badge-warning">대기중</label> */
    /* <label class="badge badge-primary">모집중</label> */
    /* <label class="badge badge-danger">상담중</label> */
    /* <label class="badge badge-success">입양완료</label> */
    /* <label class="badge badge-secondary">종료</label> */
    /*=============== badge css ===============*/


    /*=============== 테이블 css ===============*/
	@media(max-width:650px) {
		.a-first-column, .a-six-column {
			display: none;
		}
		
		.card .card-body {
			padding: 0.8rem;
		}
		
		.table th, .table td {
			font-size: 0.9rem !important;
			padding: 0.5rem 0 !important;
		}
		
		.table td.a-seven-column label {
			font-size: 0.7rem !important;
		}
		
	}
	
	@media(max-width:1600px) {
		.a-fourth-column {
			display: none;
		}
	}
	
	@media(max-width:1440px){
		.a-second-column {
			display: none;
		}
	}
	
	@media(max-width:1280px){
		.a-first-column {
			display: none;
		}
	}
	
	.a-third-column i {
		color: #006e60;
	}
	
	.dataTables_wrapper .dataTables_length select, .dataTables_wrapper .dataTables_filter input {
		border-radius: 1rem;
		padding: 0.3rem;
		margin-left: 0.5rem;
		background: #fff;
	}
	
	.dataTables_wrapper .dataTables_paginate {
		padding-top: 0.3rem;
	}
	
	.dataTables_wrapper .dataTables_paginate .paginate_button.current {
		background: #ccc;
	}
	
	.dataTables_wrapper .dataTables_paginate .paginate_button.current,
	.dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
		background: #006e60;
		border: #006e60;
		border-radius: 3rem;
		color: white !important;
	}
	
	.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
		background: #006e60;
		border: #006e60;
		border-radius: 3rem;
	}
	
	.dataTables_length label, .dataTables_filter label {
		padding: 0.2rem 0.5rem;
		margin-bottom: 0.5rem;
	}
	
	.table td.a-seven-column label {
		font-size: 1.1rem;
	}
		
	.table td {
		font-size: 1.2rem;
		text-align: center;
		padding: 0.7rem 0.5rem !important;
	}
	
	.table th {
		font-size: 1.2rem;
		text-align: center;
		color: white;
		background: #006e60;
	}
	
	.table td, .table tr {
		cursor: pointer;
	}
	
	th select {
		border-radius: 0.7rem;
	}
	
    /*=============== 테이블 css ===============*/
    
    
    /*=============== 바탕 css ===============*/
    .card {
		border-radius: 2rem;
	}
	
	.card-body {
		min-height: 80vh;
		height: auto;
	}
    /*=============== 바탕 css ===============*/
    
    
    </style>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:navbar.jsp -->
      <%@ include file="/WEB-INF/views/inc/admin_navbar_adpt.jsp"%>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:sidebar.jsp -->
        <%@ include file="/WEB-INF/views/inc/admin_sidebar_adpt.jsp"%>
        <!-- partial -->
		<div class="main-panel">
			<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">관리자 페이지 - 입양글 관리</h4>
										<table id="animalTable" class="table table-hover col-12">
											<thead>
												<tr>
													<th>입양글ID</th>
													<th>동물ID</th>
													<th>동물종류</th>
													<th>세부종류</th>
													<th>동물이름</th>
													<th>등록일자</th>
													<th>상태</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
											<tfoot>
												<tr>
													<th></th>
													<th></th>
													<th>동물종류</th>
													<th>세부종류</th>
													<th></th>
													<th></th>
													<th>상태</th>
												</tr>
											</tfoot>
										</table>
								</div>
							</div>
						</div>
					</div>
			</div>
          
          
          
          <!-- content-wrapper ends -->
          <!-- partial:footer.jsp -->
          <%@ include file="/WEB-INF/views/inc/admin_footer_adpt.jsp"%>
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
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <!-- dataTables.js -->
	<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="/resources/admin/js/off-canvas.js"></script>
    <script src="/resources/admin/js/hoverable-collapse.js"></script>
    <script src="/resources/admin/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script>
    $(function() {
    	
    	/*=============== DataTable 라이브러리 ===============*/
		var aTable = $('#animalTable').DataTable({
			"autoWidth": false, 
			"info": false,
		    "paging": true,
		    "lengthMenu": [10, 20, 50, 80],
		    "searching": true,
		    "language": {
				"lengthMenu": "표시 항목수 _MENU_",
				"emptyTable": "원하는 데이터를 찾을 수 없습니다.",
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
				url: '/adptmgmt/writings/manager',
				type: 'GET',
				dataType: 'json',
				dataSrc: function(json) {
					return json.map(function(item) {
						const adate = new Date(item.adptVO.adpt_regdate);
						const year = adate.getFullYear();
						const month = String(adate.getMonth() + 1).padStart(2, '0');
						const day = String(adate.getDay()).padStart(2, '0');
						const formattedDate = year + '-' + month + '-' + day;
						
						item.adptVO.adpt_regdate = formattedDate;
						
						switch(item.categoryDataVO.category_type) {
							case '개': {
								item.categoryDataVO.category_type = '개<i class="fa-solid fa-dog"></i>';
								break;
							}
							case '고양이': {
								item.categoryDataVO.category_type = '고양이<i class="fa-solid fa-cat"></i>';
								break;
							}
							case '기타': {
								item.categoryDataVO.category_type = '기타<i class="fa-solid fa-dove"></i>';
								break;
							}
						}
						
						switch(item.adptVO.adpt_status_value) {
							case '승인대기': {
								item.adptVO.adpt_status_value = '<label class="badge badge-warning">승인대기</label>';
								break;
							}
							case '승인': {
								item.adptVO.adpt_status_value = '<label class="badge badge-primary">승인</label>';
								break;
							}
							case '승인취소': {
								item.animal_status_value = '<label class="badge badge-danger">승인취소</label>';
								break;
							}
						}
						return item;
					});
				}
			},
			"columns": [
				{ data: 'adptVO.adpt_id' },
				{ data: 'animal_id' },
				{ data: 'categoryDataVO.category_type' },
				{ data: 'categoryDataVO.category_value' },
				{ data: 'memberVO.member_name' },
				{ data: 'adptVO.adpt_regdate' },
				{ data: 'adptVO.adpt_status_value' }
			],
			/*=============== DataTable ajax ===============*/
			"order": [[5, "desc"]],
			"columnDefs": [
			],
			/*=============== DataTable 필터링 ===============*/
			"initComplete": function() {
				var api = this.api();
				
				api.columns().every(function(index) {
					var column = this;
					  
					if (index === 0 || index == 1 || index === 5) {
						return;
					}
					
					var select = $('<select><option value=""></option></select>')
									.appendTo($(column.footer()).empty())
									.on('change', function() {
										var val = $.fn.dataTable.util.escapeRegex($(this).val());
										column.search(val ? '^' + val + '$' : '', true, false).draw();
									});
					
					column.data().unique().sort().each(function(d, j) {
						var textValue = typeof d === 'string' ? d : $(d).text();
						textValue = textValue.replace(/<[^>]*>/g, ''); 
						select.append('<option value="' + textValue + '">' + textValue + '</option>');
					});
				});
			}
			/*=============== DataTable 필터링 ===============*/
		});
		
		/*=============== DataTable 열마다 클래스 부여 ===============*/
		aTable.on('draw', function() {
			$('#animalTable tbody').find('td').each(function() {
				$(this).html($(this).html());
			});
			
			$('#animalTable tbody tr').each(function() {
				$(this).find('td:eq(0)').addClass('a-first-column');
				$(this).find('td:eq(1)').addClass('a-second-column');
				$(this).find('td:eq(2)').addClass('a-third-column');
				$(this).find('td:eq(3)').addClass('a-fourth-column');
				$(this).find('td:eq(4)').addClass('a-fifth-column');
				$(this).find('td:eq(5)').addClass('a-six-column');
				$(this).find('td:eq(6)').addClass('a-seven-column');
				$(this).addClass('a-view-writing');
			});
			
			$('#animalTable thead tr').each(function() {
				$(this).find('th:eq(0)').addClass('a-first-column');
				$(this).find('th:eq(1)').addClass('a-second-column');
				$(this).find('th:eq(2)').addClass('a-third-column');
				$(this).find('th:eq(3)').addClass('a-fourth-column');
				$(this).find('th:eq(4)').addClass('a-fifth-column');
				$(this).find('th:eq(5)').addClass('a-six-column');
				$(this).find('th:eq(6)').addClass('a-seven-column');
			});
			
			$('#animalTable tfoot tr').each(function() {
				$(this).find('th:eq(0)').addClass('a-first-column');
				$(this).find('th:eq(1)').addClass('a-second-column');
				$(this).find('th:eq(2)').addClass('a-third-column');
				$(this).find('th:eq(3)').addClass('a-fourth-column');
				$(this).find('th:eq(4)').addClass('a-fifth-column');
				$(this).find('th:eq(5)').addClass('a-six-column');
				$(this).find('th:eq(6)').addClass('a-seven-column');
			});
		});
		/*=============== DataTable 열마다 클래스 부여 ===============*/
		/*=============== DataTable 라이브러리 ===============*/
		
		
		
		/*=============== tr 선택 상세 조회 ===============*/
		$('table').on('click', 'tr.a-view-writing', function() {
			const animal_id = $(this).find('td:eq(1)').text();
			window.location.href = '/AM/manager/writings/total/'+ animal_id;
		});
		/*=============== tr 선택 상세 조회 ===============*/
		
		
		
		
		
		
		
	});
	</script>
    <!-- End custom js for this page -->
  </body>
</html>