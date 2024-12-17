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
	
	small.roadHidden {
		display: none;
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
    
    
    /*=============== 모달 css ===============*/
	.counsel-modal {
		display: none;
		position: fixed;
		z-index: 1080;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgba(0, 0, 0, 0.5);
	}

	.counsel-modal-content {
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		margin: auto;
		padding: 1rem;
		width: 80%;
		max-width: 600px;
		background-color: white;
		border-radius: 8px;
	}
    /*=============== 모달 css ===============*/
    
    
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
									<h4 class="card-title">입양 관리 - 입양 상담 신청 목록</h4>
										<table id="animalTable" class="table table-hover col-12">
											<thead>
												<tr>
													<th>입양글ID</th>
													<th>동물이름</th>
													<th>신청자ID</th>
													<th>동물종류</th>
													<th>동물ID</th>
													<th>신청날짜</th>
													<th>상태</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
											<tfoot>
												<tr>
													<th>입양글ID</th>
													<th></th>
													<th>신청자ID</th>
													<th>동물종류</th>
													<th>동물ID</th>
													<th>신청날짜</th>
													<th>상태</th>
												</tr>
											</tfoot>
										</table>
								</div>
							</div>
						</div>
					</div>
			</div>
          
			<div id="counselModal" class="counsel-modal">
				<div class="counsel-modal-content">
				
					<div class="modal-body">
						<div class="row">
							<div class="col-12">
								<div class="form-group row justify-content-center">
									<div class="col-12 col-xl-6 col-lg-6 col-md-6 mb-3">
										<label for="aName" class="text-dark custom-label">동물 이름</label>
										<div class="input-group">
										<input type="text" id="aName" name="animal_name" class="form-control custom-text"
										placeholder="최대 6자" maxlength="6" required/>
										</div>
										<label for="aName" class="text-dark custom-label">동물 이름</label>
										<div class="input-group">
										<input type="text" id="aName" name="animal_name" class="form-control custom-text"
										placeholder="최대 6자" maxlength="6" required/>
										</div>
										<label for="aName" class="text-dark custom-label">동물 이름</label>
										<div class="input-group">
										<input type="text" id="aName" name="animal_name" class="form-control custom-text"
										placeholder="최대 6자" maxlength="6" required/>
										</div>
									</div>
								</div>
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
				url: '/adptmgmt/counsel/list',
				type: 'GET',
				dataType: 'json',
				dataSrc: function(json) {
			        let result = [];
			        json.forEach(item => {
						item.adptCounselList.forEach(VO => {
							const csdate = new Date(VO.counsel_subdate);
							VO.counsel_subdate = csdate.getFullYear() + '-' + 
												String(csdate.getMonth() + 1).padStart(2, '0') + '-' + 
												String(csdate.getDate()).padStart(2, '0');
							
			                switch(VO.counsel_status) {
			                    case 1: VO.counsel_status = '<label class="badge badge-warning">신청중</label>'; break;
			                    case 2: VO.counsel_status = '<label class="badge badge-primary">상담중</label>'; break;
			                    case 3: VO.counsel_status = '<label class="badge badge-danger">취소</label>'; break;
			                    case 4: VO.counsel_status = '<label class="badge badge-success">상담완료</label>'; break;
			                }

			                result.push({
			                    adpt_id: item.adptVO.adpt_id,
			                    animal_id: item.animal_id,
			                    member_id: VO.member_id,
			                    category_value: item.categoryDataVO.category_value,
			                    animal_name: item.animal_name,
			                    counsel_subdate: VO.counsel_subdate,
			                    counsel_status: VO.counsel_status
			                });
			            });
			        });
			        return result;
			    }
			},
			"columns": [
			    { data: 'adpt_id' },
			    { data: 'animal_name' },
			    { data: 'member_id' },
			    { data: 'category_value' },
			    { data: 'animal_id' },
			    { data: 'counsel_subdate' },
			    { data: 'counsel_status' }
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
					  
					if (index == 1) {
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
			const member_id = $(this).find('td:eq(2)').text();
			const currentRow = $(this);
			
			$.ajax({
				url: '/adptmgmt/counsel/list/member',
				method: 'GET',
				data: { member_id: member_id },
				success: function(resp) {
					const member_gender = resp.member_gender == 'female'?'여성':'남성';
				    const roadAddressParts = resp.road_address.split(' ');
					let formattedNumber = '';
				    let infoAdress = '';
				    
				    for (let i = 0; i < roadAddressParts.length; i += 2) {
				    	infoAdress += '<small class="roadHidden">'+ roadAddressParts[i];
				        if (i + 1 < roadAddressParts.length) {
				            infoAdress += ' ' + roadAddressParts[i + 1];
				        }
				        infoAdress += '<br></small>';
				    }
					
					if (resp.member_tel.length === 11) {
						formattedNumber = resp.member_tel.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
					}
					
					
					
					$('#counselModal').show();
				},
				error: function(error) {
					console.error('오류:',error);
				}
				
			});
			
			

		});
		/*=============== tr 선택 상세 조회 ===============*/

		
		
		$('.counselModalClose').click(function() {
			$('#counselModal').hide();
		});
		
		$(window).click(function(event) {
			if ($(event.target).is('#counselModal')) {
				$('#counselModal').hide();
			}
		});
		
		
		
		
		
	});
	</script>
    <!-- End custom js for this page -->
  </body>
</html>