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
	
	thead th:nth-child(7) {
		border-radius: 0 1rem 0 0;
	}
	
	tfoot th:nth-child(7) {
		border-radius: 0 0 1rem 0;
	}
	
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
       <%@ include file="/WEB-INF/views/inc/admin_navbar_store.jsp"%>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:sidebar.jsp -->
        <%@ include file="/WEB-INF/views/inc/admin_sidebar_store.jsp"%>
        <!-- partial -->
		<div class="main-panel">
			<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">판매방해 고객관리</h4>
									<div class="dropdown-divider" style="width: 100%; margin: 1.5rem 0;"></div>
									<span>판매방해 고객이란, 판매자님 상품을 구매 의사없이 반복구매 후 취소하는 등 판매활동을 방해하는 고객을 의미합니다.</span>
									<span>판매방해 고객의 구매를 제한하기 위해서는 해당 고객ID 또는 상품주문번호를 판매방해 고객으로 등록하시면 판매자님의 모든 채널에서 상품 구매가 제한됩니다.</span>
									<span>판매방해 고객 ID는 최대 1,000개 (1회 등록 시 최대 100개)까지 등록하실 수 있으며, 해제를 원하는 경우 ‘해제하기’를 통해 리스트에서 삭제하실 수 있습니다.</span>
										<div class="display-flex box">
										    <h5>등록하기</h5>
										    <div>
										    	<div>등록조건</div>
										    	<div>
										    		<div>
										    			<select>
										    				<option value="member_id">구매자ID</option>
										    				<option value="prod_id">상품주문번호</option>
									    				</select>
									    				<textarea rows="" cols=""></textarea>
									    				<span>복수 등록(, 로 구분)</span>
									    				<span>0/3000</span>
								    				</div>
							    				</div>
										    	<div>제한사유</div>
										    	<div>
										    		<input type="radio" value="구매의사 없는 반복구매">	
										    		<input type="radio" value="언어폭력">	
										    		<input type="radio" value="영업방해">	
										    		<input type="radio" value="기타">	
									    			<textarea rows="" cols=""></textarea>
									    			<span>복수 등록(, 로 구분)</span>
								    				<span>0/3000</span>
										    	</div>
										    	<div>
										    		<button>
										    			등록
										    		</button>
									    		</div>
										    </div>
										    <h5>판매방해 고객 리스트</h5>
										    <div>
										    	<div>조회조건</div>
										    	<div>
									    			<select>
									    				<option value="member_id">구매자ID</option>
									    				<option value="prod_id">상품주문번호</option>
								    				</select>
								    				<input >
								    				<button>
										    			등록
										    		</button>
							    				</div>
										    </div>
										    
										    <div>
										    	<div>체크박스</div>
										    	<div>구매자ID</div>
										    	<div>상품주문번호</div>
										    	<div>등록일자</div>
										    	<div>등록사유</div>
										    </div>
										    <!-- 밑에는 리스트에서 들어올 값. -->
										    <div>
										    	<div>체크박스</div>
										    	<div>구매자ID</div>
										    	<div>상품주문번호</div>
										    	<div>등록일자</div>
										    	<div>등록사유</div>
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
		
		
		
		/*=============== 날짜 버튼 js ===============*/
		
		// 오늘 날짜와 1년 전 날짜 초기화
        const today = new Date();
        const formattedToday = today.toISOString().split('T')[0];
        const oneYearAgo = new Date(today);
        oneYearAgo.setDate(today.getDate() -0 );
        const formattedOneYearAgo = oneYearAgo.toISOString().split('T')[0];

        // 시작일과 종료일 필드 설정
        $('#startDate').val(formattedOneYearAgo).attr('max', formattedToday);
        $('#endDate').val(formattedToday).attr('max', formattedToday);

        // 날짜 포맷을 YYYY-MM-DD로 변환
        const formatDate = (date) => {
            if (!(date instanceof Date) || isNaN(date)) {
                console.error("Invalid date:", date);
                return ""; // 유효하지 않은 경우 빈 문자열 반환
            }
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            return (year+"-"+month+"-"+day);
        };

        function setDate(days) {
            const startDate = new Date(today);
            const endDate = new Date(today);
            startDate.setDate(today.getDate() - days);
            endDate.setDate(today.getDate());

            $('#startDate').val(formatDate(startDate));
            $('#endDate').val(formatDate(endDate));
        }

        // 버튼 클릭 이벤트
        $('#today').click(function() {
            setDate(0); // 오늘
        });

        $('#oneWeek').click(function() {
            setDate(7); // 1주일 전
        });

        $('#oneMonth').click(function() {
            setDate(30); // 1개월 전 (대략)
        });

        $('#threeMonths').click(function() {
            setDate(90); // 3개월 전 (대략)
        });

        $('#today, #oneWeek, #oneMonth, #threeMonths').click(function() {
            $('#startDate').attr('readonly', false); // 리드온리 해제
            $('#endDate').attr('readonly', false); // 리드온리 해제
        });
		/*=============== 날짜 버튼 js ===============*/
		
		
		
		
		
	</script>
    <!-- End custom js for this page -->
  </body>
</html>