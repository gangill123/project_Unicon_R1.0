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
		@media(max-width:600px) {
			.a-first-column, .a-fourth-column {
				display: none;
			}
		}
    /*=============== 테이블 css ===============*/
    
    
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
				<div class="page-header">
					<h3 class="page-title"> Basic Tables </h3>
				</div>
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Hoverable Table</h4>
									<div class="row justify-content-center">
										<table id="animalTable" class="table table-hover col-8">
											<thead>
												<tr>
													<th>동물ID</th>
													<th>동물종류</th>
													<th>동물이름</th>
													<th>등록일자</th>
													<th>상태</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
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
		var aTable = $('#animalTable').DataTable({
			"info": false,
		    "paging": true,
		    "lengthMenu": [10, 20, 50, 80], 
		    "language": {
				"lengthMenu": "표시 항목수 _MENU_"
			}, 
			"ajax": {
				url: '/adptmgmt/animals',
				type: 'GET',
				dataType: 'json',
				dataSrc: function(json) {
					return json.map(function(item) {
						const date = new Date(item.animal_regdate);
						const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
						const formattedDate = date.toLocaleDateString('ko-KR', options);
						item.animal_regdate = formattedDate;
						
						switch(item.status_value) {
							case '대기중': {
								item.status_value = '<label class="badge badge-warning">대기중</label>';
								return item;
								break;
							}
							case '모집중': {
								item.status_value = '<label class="badge badge-primary">모집중</label>';
								return item;
								break;
							}
							case '상담중': {
								item.status_value = '<label class="badge badge-danger">상담중</label>';
								return item;
								break;
							}
							case '입양완료': {
								item.status_value = '<label class="badge badge-success">입양완료</label>';
								return item;
								break;
							}
							case '종료': {
								item.status_value = '<label class="badge badge-secondary">종료</label>';
								return item;
								break;
							}
							default : break;
						}
					});
				}
			},
			columns: [
				{ data: 'animal_id' },
				{ data: 'categoryDataVO.category_value' },
				{ data: 'animal_name' },
				{ data: 'animal_regdate' },
				{ data: 'status_value' }
			]
		});

		aTable.on('draw', function() {
			$('#animalTable tbody').find('td').each(function() {
				$(this).html($(this).html());
			});
			
			$('#animalTable tbody tr').each(function() {
				$(this).find('td:eq(0)').addClass('a-first-column');
				$(this).find('td:eq(3)').addClass('a-fourth-column');
			});
			
			$('#animalTable thead tr').each(function() {
				$(this).find('th:eq(0)').addClass('a-first-column');
				$(this).find('th:eq(3)').addClass('a-fourth-column');
			});
		});
	});
	</script>
    <!-- End custom js for this page -->
  </body>
</html>