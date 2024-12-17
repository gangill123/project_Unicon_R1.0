<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>유니콘</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- plugins:css -->
<!-- dataTables.css -->
<!-- Font-Awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="/resources/admin/vendors/css/vendor.bundle.base.css">
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
table.dataTable thead .sorting {
	background-image: none !important;
}

/*=============== 테이블 css ===============*/
@media ( max-width :650px) {
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

@media ( max-width :1200px) {
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
	/* border-radius: 0 1rem 0 0; */
	
}

tfoot th:nth-child(7) {
	border-radius: 0 0 1rem 0;
}

.a-second-column i {
	color: #006e60
}

.dataTables_wrapper .dataTables_length select, .dataTables_wrapper .dataTables_filter input
	{
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
	.dataTables_wrapper .dataTables_paginate .paginate_button.current:hover
	{
	background: #006e60;
	border: #006e60;
	color: white !important;
}

.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
	background: #006e60;
	border: #006e60;
}

.dataTables_length label, .dataTables_filter label {
	padding: 0.2rem 0.5rem;
	margin-bottom: 0.5rem;
}

.table td.a-six-column label {
	font-size: 1.1rem;
}

.table td {
	font-size: 13px;
	text-align: center;
	padding: 0.7rem 0.5rem !important;
}

.table th {
	border: 1px solid #eee !important;
	font-size: 14px;
	text-align: center;
	color: #555555;
	background: #f9f9f9;
	padding: 1.2rem 0.7rem !important;
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
.search-box {
	height: 150px;
	background: #f1f1f1;
	padding: 1.3rem;
	display: flex;
	align-items: center;
	margin-bottom: 1rem;
	color: #212529;
}

.search-box>div:first-child {
	width: 13%;
}

.search-select-box {
	display: flex;
	margin-bottom: 0.4rem;
	gap: 0rem;
	max-width: 53rem;
}

.search-select-box>div:first-child {
	width: 38%;
}

.search-select-box select {
	width: 10rem;
	padding: 0.25rem;
	border: 1px solid #dbdde2;
	font-size: 13px;
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

.date-input input {
	border: 1px solid #dbdde2;
	padding: 4px 8px 4px 8px;
	font-size: 14px;
	transition: border 0.1s;
}

.item-button {
	border: none;
	background: #d9d7d7;
	padding: 6px;
	border-radius: 5px;
	color: #eee;
}

.c-modal {
	width: 130%;
	height: 112vh;
	z-index: 1030;
	position: absolute;
	top: -15.5%;
	background: rgba(0, 0, 0, 0.5); /* 투명한 그레이 */
	left: -26%;
	display: none; /* 초기 상태: 숨김 */
	justify-content: center;
	align-items: center;
	opacity: 0; /* 투명 상태 */
	transform: translateY(-100%); /* 화면 위쪽으로 이동 */
	transition: opacity 1.5s ease, transform 1.5s ease; /* 부드러운 전환 */
}

.c-modal.show {
	display: flex; /* 화면에 표시 */
	opacity: 1; /* 불투명 상태 */
	transform: translateY(0); /* 원래 위치로 내려옴 */
}

.box-card {
	width: 50%;
	color: #767a83;
	border-radius: 2rem;
	background: #ffffff;
	max-height: 80vh; /* 화면 높이의 80%까지 허용 */
	overflow-y: auto; /* 내용이 넘치면 스크롤 */
	margin-bottom: 7rem;
	padding: 1rem 2rem 2rem; /* 내부 여백 추가 */
}

.box-header {
	width: 100%;
	padding: 0 1.5rem 0.5rem;
	margin-bottom: 1rem;
	display: flex;
	justify-content: space-between;
	font-size: 2rem;
	border-bottom: 1px solid #a5a5a5;
	align-items: center;
}

.box-header button {
	border: none;
	background: transparent;
	font-size: 1.5rem;
	cursor: pointer;
}

.detail-text {
	margin-top: 2rem;
	display: flex;
	flex-direction: column; /* 내용 세로 배치 */
	gap: 1.5rem; /* 각 항목 간격 */
}

.editable-input {
	width: 50%; /* 셀의 너비에 맞게 */
	height: 24px; /* 셀의 높이에 맞게 */
	box-sizing: border-box; /* padding, border 포함 */
	border: none; /* 테두리 제거 */
	font-size: inherit; /* 셀의 폰트 크기 상속 */
	text-align: center; /* 텍스트 가운데 정렬 */
	padding: 0; /* 여백 제거 */
}
</style>


<script type="text/javascript">

    function closeModal() {
        // 모달 닫기 (페이드 효과 제거)
        $(".c-modal").removeClass("show");
    }
    function handleClick(id) {
        // 모달 열기 (페이드 효과 추가)
        $(".c-modal").addClass("show");
    	// 모달 열리고 요청 보내면 됨
		$.ajax({
            url: "/store/manage/"+id, // 테스트용 API
            type: "GET",
            success: function(response) {
            	console.log(response);

                // 기존 내용을 비우기
                $(".detail-text").html(""); // 또는 .empty()
            	response.forEach(function(item) {
            	    $(".detail-text").append(
            	        "<div style='display:flex;'>" +
            	        "<img src='" + item.image_src + "' alt='Product Image' style='max-width: 140px; display: block; margin-top: 10px;'>" +
            	        "<div style='margin-top: 1rem;margin-left: 4rem;'>"+
            	        "<p>" + item.product_option + "</p>" +
            	        "<p><strong>수량:</strong> " + item.quantity + " 개</p>" +
            	        "</div>"+
            	        "</div>"
            	    );
            	});
            },
            error: function(xhr, status, error) {
                // 에러 시 처리
                console.error("Error: ", error);
                $("#result").html("데이터를 가져오는데 실패했습니다.");
            }
        });
		
		
	}
    
    $(document).ready(function() {
        $("#select-value-detail").on("change", function() {
            var selectedValue = $(this).val(); // 선택된 값 가져오기
            
            if (selectedValue === "all") {
                // "전체"를 선택하면 input 비활성화
                $("input[name='detailValue']").val("").prop("disabled", true);
            } else {
                // 다른 옵션을 선택하면 input 활성화
                $("input[name='detailValue']").prop("disabled", false);
            }
        });
    });
	
    
    </script>
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
									<div class="c-modal">
										<div class="box-card">
											<div class="box-header">
												<h3 style="margin: 10px 0 0 0;">상세 정보</h3>
												<button onclick="closeModal()">X</button>
											</div>
											<div class="box-text">
												<div class="detail-text"></div>
											</div>
										</div>
									</div>
									<h4 class="card-title">발주(주문)확인/발송관리</h4>
									<div class="search-box">
										<div>조회기간</div>
										<div style="width: 100%;">
											<!-- 조건 select 박스로 -->
											<div class="search-select-box">
												<div>
													<select id="select-value">
														<option value="payment_date" selected="selected">결제일</option>
														<option value="shipping_date">발송처리일</option>
													</select>
												</div>
												<div class="detail">
													<span>상세조건</span> <select id="select-value-detail">
														<option value="all" selected="selected">전체</option>
														<option value="order_name">구매자명</option>
														<option value="member_id">구매자ID</option>
														<option value="recipient">수취인명</option>
														<option value="recipient_phone">구매자연락처</option>
													</select> <input
														style="width: 10rem; padding: 0.31rem; border: 1px solid #dbdde2; font-size: 13px;"
														type="text" name="detailValue" disabled="disabled">
												</div>
											</div>

											<!-- 여긴 버튼으로 기간 선택하는 곳. -->
											<div class="display-flex">
												<div class="btn-box">
													<button class="order-btn" id="today">오늘</button>
													<button class="order-btn" id="oneWeek">1주일</button>
													<button class="order-btn" id="oneMonth">1개월</button>
													<button class="order-btn" id="threeMonths">3개월</button>
												</div>
												<div class="date-input">
													<input type="date" id="startDate"> <span
														style="line-height: 36px; margin: 0 0.5em">~</span> <input
														type="date" id="endDate" max="">
												</div>
											</div>

										</div>
										<!-- 여긴 버튼으로 기간 선택하는 곳. -->
										<div class="display-flex"
											style="justify-content: center; margin-right: 8rem; margin-top: 0.5rem;">
											<div>
												<button class="search-btn"
													style="background: #006e60; height: 3rem; width: 10rem; border: none; color: #eee;">검색</button>
											</div>
										</div>
									</div>

									<table id="orderTable" class="table table-hover col-12">
										<thead>
											<tr>
												<th>상품주문번호</th>
												<th>구매자</th>
												<th>주소</th>
												<th>수취인</th>
												<th>수취인 전화번호</th>
												<th>상태</th>
												<th>변경</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
										<!-- 셀렉트 박스내용들인가봄 -->
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
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script src="/resources/admin/js/off-canvas.js"></script>
	<script src="/resources/admin/js/hoverable-collapse.js"></script>
	<script src="/resources/admin/js/misc.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script>
 	// 오늘 날짜와 1년 전 날짜 초기화
    const today = new Date();
    const formattedToday = today.toISOString().split('T')[0];
    const oneYearAgo = new Date(today);
    oneYearAgo.setDate(today.getDate() - 30 );
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
   
	
    $(function() {
    	
    	/*=============== DataTable 라이브러리 ===============*/
		var aTable = $('#orderTable').DataTable({
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
				url: '/store/orders',
				type: 'GET',
				data: function(d) {
	                // 검색 조건을 추가
	                d.searchKey = $('#select-value-detail').val(); // select 값
	                d.searchValue = $("input[name='detailValue']").val(); // input 값
	                d.startDate = $('#startDate').val() + " 00:00:00"; // 시작일 00:00:00
	                d.endDate = $('#endDate').val() + " 23:59:59";    // 종료일 23:59:59
	            },
				dataSrc: function(json) {
					return json.map(function(item) {
						console.log(item);
						/* const date = new Date(item.animal_regdate);
						const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
						const formattedDate = date.toLocaleDateString('ko-KR', options);
						
						item.animal_regdate = formattedDate; */
						
						item.address = "("+item.postal_code+") " +item.address + " "+item.detail_address;
						return item;
					});
				}
			},
			"columns": [
				{ data: 'order_id' },
				{ data: 'order_name' },
				{ data: 'address' },
				{ data: 'recipient' },
				{ data: 'recipient_phone' },
				{ data: 'status' },
				{ 
	                data: 'order_id', // product_id 열
	                render: function(data, type, row) {
	                    return "<button class='item-button' onclick='handleClick(\"" + row.order_id + "\")'>" +
	                        "<span>변경</span>" +
	                        "</button>";
	                }
	            }
			],
			/*=============== DataTable ajax ===============*/
			"order": [[0, "desc"]],
			"columnDefs": [
			],
			/*=============== DataTable 필터링 ===============*/
			"initComplete": function() {
				var api = this.api();
				
				api.columns().every(function(index) {
					var column = this;
					  
					if (index === 0 || index === 3 || index === 4) {
						return;
					}
					
					/* var select = $('<select><option value=""></option></select>')
									.appendTo($(column.footer()).empty())
									.on('change', function() {
										var val = $.fn.dataTable.util.escapeRegex($(this).val());
										column.search(val ? '^' + val + '$' : '', true, false).draw();
									});
					
					column.data().unique().sort().each(function(d, j) {
						var textValue = typeof d === 'string' ? d : $(d).text();
						textValue = textValue.replace(/<[^>]*>/g, ''); 
						select.append('<option value="' + textValue + '">' + textValue + '</option>');
					}); */
				});
			}
			/*=============== DataTable 필터링 ===============*/
		});
		
		/*=============== DataTable 열마다 클래스 부여 ===============*/
		/* aTable.on('draw', function() {
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
		}); */
		/*=============== DataTable 열마다 클래스 부여 ===============*/
		/*=============== DataTable 라이브러리 ===============*/
		
		
		
		/*=============== tr 선택 상세 조회 ===============*/
		/* $('table').on('click', 'tr.a-view-animal', function() {
			const animal_id = $(this).find('td:eq(0)').text();
			window.location.href = '/AM/animals/list/' + animal_id;
		}); */
		/*=============== tr 선택 상세 조회 ===============*/
		
		
		
		/*=============== 날짜 버튼 js ===============*/
		
		 // 검색 버튼 클릭 이벤트
	    $('.search-btn').on('click', function() {
	        aTable.ajax.reload(); // DataTables 데이터 새로 불러오기
	    });
		
	    $('#orderTable tbody').on('dblclick', 'td', function() {
	        var cell = aTable.cell(this); // 현재 셀 데이터 가져오기
	        var originalValue = cell.data(); // 기존 값 저장
	        var $cell = $(this); // jQuery 객체로 셀 참조

	        // 셀의 크기 가져오기
	        var cellWidth = $cell.outerWidth();
	        var cellHeight = $cell.outerHeight();

	        // input 요소 생성 및 기존 값 삽입
	        $cell.html('<input type="text" class="editable-input" value="' + originalValue + '">');
	        var input = $cell.find('input');

	        // input 크기 동적으로 셀과 맞추기
	        input.css({
	            width: cellWidth + 'px',
	            height: cellHeight + 'px'
	        });

	        input.focus();

	        // 엔터 키 입력 시 값 변경
	        input.on('keypress', function(e) {
	            if (e.which === 13) { // 엔터 키 확인
	                var newValue = $(this).val(); // 입력된 값 가져오기
	                cell.data(newValue).draw(); // 데이터 테이블의 셀 값 변경
	            }
	        });

	        // 포커스를 잃으면 원래 값 또는 변경된 값 적용
	        input.on('blur', function() {
	            var newValue = $(this).val();
	            if (newValue !== originalValue) {
	                cell.data(newValue).draw();
	            } else {
	                cell.data(originalValue).draw();
	            }
	        });
	    });
		
		
	});
	</script>
	<!-- End custom js for this page -->
</body>
</html>