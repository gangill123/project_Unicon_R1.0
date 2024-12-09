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
		.a-first-column, .a-fifth-column {
			display: none;
		}
		
		.card .card-body {
			padding: 0.8rem;
		}
		
		.table th, .table td {
			font-size: 0.9rem !important;
		}
		
		.table td.a-six-column label {
			font-size: 1rem !important;
		}
		
		thead th.a-second-column {
			border-radius: 1rem 0 0 0;
		}
		
		tfoot th.a-second-column {
			border-radius: 0 0 0 1rem;
		}
	}
	
	@media(max-width:1200px) {
		.a-third-column {
			display: none;
		}
	}
	
	thead th.a-first-column {
		border-radius: 1rem 0 0 0;
	}
	
	tfoot th.a-first-column {
		border-radius: 0 0 0 1rem;
	}
	
	/* thead th:nth-child(7) {
		border-radius: 0 1rem 0 0;
	}
	
	tfoot th:nth-child(7) {
		border-radius: 0 0 1rem 0;
	} */
	
	.a-second-column i {
		color: #006e60
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
	
	.table td.a-six-column label {
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
		padding: 1.2rem 0.7rem !important;
	}
	
	.table td, .table tr {
		cursor: pointer;
		background-color: transparent !important;
	}
	
	th select {
		border-radius: 0.7rem;
	}
	
	table.dataTable {
		background-image: url('/resources/admin/images/pawbrownopacity10.png');
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
		overflow: hidden;
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
    
    
    /*=============== search-box css ===============*/
    .box {
	    background: #f1f1f1;
	    padding: 1.3rem;
	    align-items: center;
	    margin-bottom: 1rem;
	        flex-direction: column;
	    
    }
    .search-box {
	    align-items: center;
	    display: flex;
		width: 100%;
    }
    
    .search-box > div:first-child {
    	width: 13%;
    	
	}
	
	.search-select-box {
		display: flex;
		margin-bottom: 0.4rem;
		gap: 6rem;
	}
    
    .search-select-box > div:first-child {
    	width: 30%;
	}
    
    .search-select-box select {
   	    width: 10rem;
	    padding: 0.25rem;
	    border: 1px solid #dbdde2;font-size: 13px;
    }
    
    .order-btn {
    	border: 1px solid #dbdde2;
	    background-color: white;
	    padding: 0 0.6rem;
	    font-size: 12px;
    }
    .display-flex {
    	display: flex;
    }
	.btn-box {
		display: flex;
		margin-right: 3.4rem;
		height: 2.3rem;
	}
	.date-input input{
	    border: 1px solid #dbdde2;
	    padding: 4px 8px 4px 8px;
	    font-size: 14px;
	    transition: border 0.1s;	
	}
    
    
    
    </style>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:navbar.jsp -->
       <%@ include file="/WEB-INF/views/inc/admin_store_navbar.jsp"%>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:sidebar.jsp -->
        <%@ include file="/WEB-INF/views/inc/admin_store_sidebar.jsp"%>
        <!-- partial -->
		<div class="main-panel">
			<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">신규 상품 목록</h4>
										
										<table id="productsTable" class="table table-hover col-12">
											<thead>
												<tr>
													<th>상품고유번호</th>
													<th>판매자 ID</th>
													<th>카테고리</th>
													<th>상품명</th>
													<th>판매가</th>
													<th>판매날짜(시작 ~ 종료)</th>
													<th>브랜드</th>
													<th>제조사</th>
													<th>원산지</th>
													<th>유통기한, 유효일자</th>
													<th>택배사</th>
													<th>배송비</th>
													<th>출고지</th>
													<th>등록일자</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
											<!-- 셀렉트 박스내용들인가봄 -->
											<tfoot>
												<tr>
													<th></th>
													<th></th>
													<th></th>
													<th></th>
													<th>상태</th>
													<th>상태</th>
													<th>상태</th>
													<th>상태</th>
													<th>상태</th>
													<th>상태</th>
													<th>상태</th>
													<th>상태</th>
													<th>상태</th>
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
		var aTable = $('#productsTable').DataTable({
			"autoWidth": false, 
			"info": false,
		    "paging": true,
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
				url: '/admin/store/products/new',
				type: 'GET',
				dataType: 'json',
				dataSrc: function(json) {
					return json.map(function(item) {
						console.log(item);
						const date = new Date(item.animal_regdate);
						const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
						const formattedDate = date.toLocaleDateString('ko-KR', options);
						// 포멧팅 난 이거 create 그거 사용하면 됨
						item.animal_regdate = formattedDate;
						
						// 받아온 값 아이콘 넣는거임.
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
						// 뱃찌
						switch(item.status_value) {
							case '대기중': {
								item.status_value = '<label class="badge badge-warning">대기중</label>';
								break;
							}
							case '모집중': {
								item.status_value = '<label class="badge badge-primary">모집중</label>';
								break;
							}
							case '상담중': {
								item.status_value = '<label class="badge badge-danger">상담중</label>';
								break;
							}
							case '입양완료': {
								item.status_value = '<label class="badge badge-success">입양완료</label>';
								break;
							}
							case '종료': {
								item.status_value = '<label class="badge badge-secondary">종료</label>';
								break;
							}
						}
						return item;
					});
				}
			},
			"columns": [
				{ data: 'animal_id' },
				{ data: 'categoryDataVO.category_type' },
				{ data: 'categoryDataVO.category_value' },
				{ data: 'categoryDataVO.category_value' },
				{ data: 'categoryDataVO.category_value' },
				/*  */
				{ data: 'animal_name' },
				{ data: 'animal_regdate' },
				{ data: 'status_value' },
				{ data: 'status_value' },
				{ data: 'status_value' },
				{ data: 'status_value' },
				{ data: 'status_value' },
				{ data: 'status_value' },
				{ data: 'status_value' }
			],
			/*=============== DataTable ajax ===============*/
			// 어떤걸 기준으로 정렬할건지
			"order": [[4, "desc"]],
			"columnDefs": [
			],
			/*=============== DataTable 필터링 ===============*/
			//  풋터 자리에 있는드롭 다운 같은건가보네
			"initComplete": function() {
				var api = this.api();
				
				api.columns().every(function(index) {
					var column = this;
					  
					if (index === 0 || index === 3 || index === 4) {
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
				$(this).addClass('a-view-animal');
			});
			
			$('#animalTable thead tr').each(function() {
				$(this).find('th:eq(0)').addClass('a-first-column');
				$(this).find('th:eq(1)').addClass('a-second-column');
				$(this).find('th:eq(2)').addClass('a-third-column');
				$(this).find('th:eq(3)').addClass('a-fourth-column');
				$(this).find('th:eq(4)').addClass('a-fifth-column');
				$(this).find('th:eq(5)').addClass('a-six-column');
			});
			
			$('#animalTable tfoot tr').each(function() {
				$(this).find('th:eq(0)').addClass('a-first-column');
				$(this).find('th:eq(1)').addClass('a-second-column');
				$(this).find('th:eq(2)').addClass('a-third-column');
				$(this).find('th:eq(3)').addClass('a-fourth-column');
				$(this).find('th:eq(4)').addClass('a-fifth-column');
				$(this).find('th:eq(5)').addClass('a-six-column');
			});
		});
		/*=============== DataTable 열마다 클래스 부여 ===============*/
		/*=============== DataTable 라이브러리 ===============*/
		
		
		
		/*=============== tr 선택 상세 조회 ===============*/
// 		$('table').on('click', 'tr.a-view-animal', function() {
// 			const animal_id = $(this).find('td:eq(0)').text();
// 			window.location.href = '/AM/animals/list/' + animal_id;
// 		});
		/*=============== tr 선택 상세 조회 ===============*/
		
    });
	</script>
    <!-- End custom js for this page -->
  </body>
</html>