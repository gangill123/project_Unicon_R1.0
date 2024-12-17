<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>유니콘</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- plugins:css -->
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="preload" href="http://localhost:8088/resources/admin/fonts/Nunito/Nunito-Regular.woff2" as="font" type="font/woff2" crossorigin="anonymous">    
    <!-- endinject -->
    <!-- Plugin css for this page -->
    
    <style>
    
/* 또는 !important 사용 */
.status-ongoing {
    color: #2ecc71 !important;
}

.status-completed {
    color: #3498db !important;
}
    
    
/* 메인 타이틀 스타일 */
.main-title {
    font-size: 2rem;
    font-weight: bold;
    margin: 60px 0 20px 200px;
    color: black;       
}


/* 테이블 스타일 */
table {
	width: 60%; /* 테이블 너비를 조금 줄임 */
	margin: 20px auto; /* 테이블의 위치를 중앙에 배치 */
	font-size: 12px; /* 폰트 크기 줄임 */
	border-collapse: collapse; /* 셀 간격 제거 */
}

th, td {
	padding: 8px; /* 셀의 padding을 줄여서 공간 절약 */
	text-align: left;
	border: 1px solid #ddd;
	font-weight: normal;
}

th {
	background-color: #f4f4f4;
	color: #333;
}

td {
	background-color: #fff;
	color: #555;
}

/* 모든 세로줄 (열의 경계) 제거 */
td, th {
    border-left: none; /* 모든 셀의 왼쪽 세로줄 제거 */
    border-right: none; /* 모든 셀의 오른쪽 세로줄 제거 */
}


/* 글 번호 스타일 */
.no {
	width: 5%;
	text-align: center;
	font-weight: bold;
}



/* 제목 스타일 */
.title {
    width: 60%;
    text-align: left;
    font-weight: bold;
 
}

/* 글쓴이와 작성일 */
.member, .date {
	width: 15%;
	text-align: center;
	font-size: 12px;
	font-weight: bold;
}

/* 상태 및 검색 필터 */
td.status {
	font-weight: bold;
	color: #2ecc71; /* 진행중 상태는 초록색 */
}
th.istatus {
	font-weight: bold;
	text-align: center;	
}



/* 게시판 제목 */
h2 {
	font-size: 24px;
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}




/* th 요소는 제외하고, td 요소의 istatus에만 스타일 적용 */
/* 기본 상태 */
td.istatus {
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
    font-weight: bold;
}

/* 카테고리별 스타일 */
td.istatus.입양_문의 {
    background-color: rgba(255, 87, 51, 0.7); /* 입양 문의에 대한 색상 */
    color: white;
}

td.istatus.쇼핑몰_문의 {
    background-color: rgba(51, 255, 87, 0.7); /* 쇼핑몰 문의에 대한 색상 */
    color: white;
}

td.istatus.커뮤니티_문의 {
    background-color: rgba(51, 87, 255, 0.7); /* 커뮤니티 문의에 대한 색상 */
    color: white;
}

td.istatus.기타_문의 {
    background-color: rgba(255, 51, 161, 0.7); /* 기타 문의에 대한 색상 */
    color: white;
}


.pagination {
    display: flex; /* 가로 정렬 */
    justify-content: center; /* 가운데 정렬 */
    margin-top: 20px;
    padding: 0;
}

.pagination ul {
    display: flex; /* 가로 정렬 */
    padding: 0; /* 기본 ul 스타일 제거 */
    list-style: none; /* 기본 리스트 스타일 제거 */
}

.pagination li {
    margin: 0 5px; /* 버튼 간격 */
}

.pagination li a {
    display: block;
    padding: 8px 12px;
    text-decoration: none;
    border: 1px solid #ddd;
    color: #333;
    border-radius: 4px;
    transition: background-color 0.3s ease;
    font-size: 14px; /* 텍스트 크기 */
}

th {
    cursor: pointer; /* 마우스를 올렸을 때 클릭 가능하게 손 모양 표시 */
}

th:hover {
    background-color: #f1f1f1; /* 마우스를 올렸을 때 색상 변경 */
}

th.sort-asc::after {
    content: ' ↑'; /* 오름차순 화살표 표시 */
}

th.sort-desc::after {
    content: ' ↓'; /* 내림차순 화살표 표시 */
}    
    
    </style>
    
    
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
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
          
          
 <div class="card">
    <div class="card-body">
        <h4 class="card-title">Unicorn Q&A 문의게시판</h4>
        <p class="card-description"><code>문의 게시판 관리자 페이지</code></p>
		        
		        <!-- 필터 -->
		<div class="row mb-3">
		    <div class="col-md-3">
		        <label for="startDate">작성일 시작 날짜</label>
		        <input type="date" id="startDate" class="form-control">
		    </div>
		    <div class="col-md-3">
		        <label for="endDate">작성일 종료 날짜</label>
		        <input type="date" id="endDate" class="form-control">
		    </div>
		    <div class="col-md-3">
		        <label for="category">카테고리</label>
		        <select id="category" class="form-control">
		            <option value="">전체</option>
		            <option value="입양 문의">입양 문의</option>
		            <option value="쇼핑몰 문의">쇼핑몰 문의</option>
		            <option value="커뮤니티 문의">커뮤니티 문의</option>
		            <option value="기타 문의">기타 문의</option>
		        </select>
		    </div>
		    <div class="col-md-3 d-flex align-items-end"> <!-- d-flex와 align-items-end로 버튼을 아래로 맞추기 -->
		        <button id="searchBtn" class="btn btn-inverse-primary btn-fw ">검색</button> <!-- 버튼을 전체 너비로 맞춤 -->
		    </div>
		</div>

        <!-- 테이블 -->
        <div class="mb-2">
            <button id="selectAll" class="btn btn-outline-primary btn-fw">전체 선택</button>
            <button id="deselectAll" class="btn btn-outline-secondary btn-fw">전체 선택 해제</button>
            <button id="deleteSelected" class="btn btn-outline-danger btn-fw">선택 삭제</button>
        </div>
        <table class="table table-striped" id="inquiryTable">
            <thead>
                <tr>
                    <th><input type="checkbox" id="checkAll"></th>
                    <th class="no">No</th>
                    <th class="istatus">카테고리</th>
                    <th class="title">제목</th>
                    <th class="member">작성자</th>
                    <th class="date">작성일</th>
                    <th class="view_count">조회수</th>
                    <th class="status">상태</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>


<!-- 페이지네이션 -->
<div class="pagination">
    <ul class="ps-0 mb-0" id="pagination"></ul>
</div>



<br>
<br>

<script>
let currentPage = 1;
const pageSize = 10;

// 페이지 로드 함수
function loadPage(page) {
    $.ajax({
        url: "/api/boards",
        method: "GET",
        data: { page: page, size: pageSize },
        dataType: "json",
        success: function (response) {
            const data = response.boards;
            const totalPages = response.totalPages;
			
            
            
            let tbody = "";
            data.forEach(function (inquiry) {
                let statusText = inquiry.status === 1 ? "진행 중" : "답변 완료";
                let statusClass = inquiry.status === 1 ? "status-ongoing" : "status-completed";
				
                // inquiry.istatus 값에 따라 동적으로 클래스를 변경
                let istatusClass = '';
                switch (inquiry.istatus) {
                    case '입양 문의':
                        istatusClass = '입양_문의';
                        break;
                    case '쇼핑몰 문의':
                        istatusClass = '쇼핑몰_문의';
                        break;
                    case '커뮤니티 문의':
                        istatusClass = '커뮤니티_문의';
                        break;
                    case '기타 문의':
                        istatusClass = '기타_문의';
                        break;
                    default:
                        istatusClass = '기타_문의'; // 기본값 설정 (필요시)
                        break;
                }
                
                
                tbody +=
                    '<tr>' +
                    '<td><input type="checkbox" class="row-check" value="' + inquiry.bno + '"></td>' +
                    '<td class="no">' + inquiry.bno + '</td>' +
                    '<td class="istatus ' + istatusClass + '">' + inquiry.istatus + '</td>' +
                    '<td class="title"><a href="/inquiry/manage/' + inquiry.bno + '">' + inquiry.title + '</a></td>' +
                    '<td class="member">' + inquiry.member_name + '</td>' +
                    '<td class="date">' + inquiry.created_at + '</td>' +
                    '<td class="view_count">' + inquiry.view_count + '</td>' +
                    '<td class="status ' + statusClass + '">' + statusText + '</td>' +
                    '</tr>';
            });

            $("#inquiryTable tbody").html(tbody);
            renderPagination(totalPages, page);
        },
        error: function (error) {
            console.error("데이터 로드 실패:", error);
        }
    });
}

// 페이지네이션 렌더링 함수
function renderPagination(totalPages, currentPage) {
    let paginationHtml = "";
    if (currentPage > 1) {
        paginationHtml +=
            '<li><a href="#" data-page="' + (currentPage - 1) + '">«</a></li>';
    }
    for (let i = 1; i <= totalPages; i++) {
        paginationHtml +=
            '<li class="' + (i === currentPage ? "active" : "") + '">' +
            '<a href="#" data-page="' + i + '">' + i + '</a></li>';
    }
    if (currentPage < totalPages) {
        paginationHtml +=
            '<li><a href="#" data-page="' + (currentPage + 1) + '">»</a></li>';
    }
    $("#pagination").html(paginationHtml);
}

// 페이지네이션 클릭 이벤트
$(document).on("click", "#pagination a", function (e) {
    e.preventDefault();
    const page = $(this).data("page");
    currentPage = page;
    loadPage(page);
});

// 검색 버튼 클릭 이벤트
$("#searchBtn").click(function () {
    const startDate = $("#startDate").val();
    const endDate = $("#endDate").val();
    const istatus = $("#category").val();

    // 검색 후 첫 번째 페이지로 리셋
    currentPage = 1;

    // 검색 요청
    $.ajax({
        url: "/api/search",
        method: "GET",
        data: {
            startDate: startDate,
            endDate: endDate,
            istatus: istatus,
            page: currentPage,
            size: pageSize
        },
        dataType: "json",
        success: function (response) {
            const data = response.boards;
            const totalPages = response.totalPages;
            const currentPage = response.currentPage; // 검색 결과에 맞는 페이지 번호로 업데이트

            // 게시글 데이터 출력
            let tbody = "";
            data.forEach(function (inquiry) {
                let statusText = inquiry.status === 1 ? "진행 중" : "답변 완료";
                let statusClass = inquiry.status === 1 ? "status-ongoing" : "status-completed";
				
                // inquiry.istatus 값에 따라 동적으로 클래스를 변경
                let istatusClass = '';
                switch (inquiry.istatus) {
                    case '입양 문의':
                        istatusClass = '입양_문의';
                        break;
                    case '쇼핑몰 문의':
                        istatusClass = '쇼핑몰_문의';
                        break;
                    case '커뮤니티 문의':
                        istatusClass = '커뮤니티_문의';
                        break;
                    case '기타 문의':
                        istatusClass = '기타_문의';
                        break;
                    default:
                        istatusClass = '기타_문의'; // 기본값 설정 (필요시)
                        break;
                }
                
                
                
                tbody +=
                    '<tr>' +
                    '<td><input type="checkbox" class="row-check" value="' + inquiry.bno + '"></td>' +
                    '<td class="no">' + inquiry.bno + '</td>' +
                    '<td class="istatus ' + istatusClass + '">' + inquiry.istatus + '</td>' +
                    '<td class="title"><a href="/inquiry/manage/' + inquiry.bno + '">' + inquiry.title + '</a></td>' +
                    '<td class="member">' + inquiry.member_name + '</td>' +
                    '<td class="date">' + inquiry.created_at + '</td>' +
                    '<td class="view_count">' + inquiry.view_count + '</td>' +
                    '<td class="status ' + statusClass + '">' + statusText + '</td>' +
                    '</tr>';
            });

            // 게시글 데이터 테이블에 삽입
            $("#inquiryTable tbody").html(tbody);

            // 페이지네이션 처리
            renderPagination(totalPages, currentPage);
        },
        error: function (error) {
            console.error("검색 실패:", error);
        }
    });
});

// 전체 선택
$("#selectAll").click(function () {
    $(".row-check").prop("checked", true);
});

// 전체 선택 해제
$("#deselectAll").click(function () {
    $(".row-check").prop("checked", false);
});

// "모두 선택" 체크박스 기능
$(document).on("change", "#checkAll", function () {
    $(".row-check").prop("checked", $(this).prop("checked"));
});

// 선택 삭제
$("#deleteSelected").click(function () {
    const selectedIds = $(".row-check:checked")
        .map(function () {
            return $(this).val();
        })
        .get();

    if (selectedIds.length === 0) {
        alert("삭제할 항목을 선택하세요.");
        return;
    }

    if (confirm("선택한 항목을 삭제하시겠습니까?")) {
        $.ajax({
            url: "/api/delete",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({ ids: selectedIds }),
            success: function () {
                alert("삭제가 완료되었습니다.");
                loadPage(currentPage);
            },
            error: function (error) {
                console.error("삭제 실패:", error);
            }
        });
    }
});

// 초기 페이지 로드
loadPage(currentPage);

</script>
    
       
<script>
$(document).ready(function() {
    var sortOrder = true; // true: 오름차순, false: 내림차순

    // 테이블 헤더 클릭 시 정렬 기능
    $('#inquiryTable th').on('click', function() {
        var index = $(this).index(); // 클릭한 헤더의 인덱스
        var rows = $('#inquiryTable tbody tr').get(); // 테이블의 모든 행 가져오기

        // 기존 정렬 상태 초기화
        $('#inquiryTable th').removeClass('sort-asc sort-desc');
        
        // 현재 클릭한 헤더에 정렬 표시
        if (sortOrder) {
            $(this).addClass('sort-asc');
        } else {
            $(this).addClass('sort-desc');
        }

        // 행 정렬
        rows.sort(function(a, b) {
            var cellA = $(a).children('td').eq(index).text();
            var cellB = $(b).children('td').eq(index).text();

            // 숫자일 경우
            if ($.isNumeric(cellA) && $.isNumeric(cellB)) {
                return sortOrder ? parseFloat(cellA) - parseFloat(cellB) : parseFloat(cellB) - parseFloat(cellA);
            }

            // 문자열일 경우
            return sortOrder ? cellA.localeCompare(cellB) : cellB.localeCompare(cellA);
        });

        // 정렬된 행을 다시 테이블에 추가
        $.each(rows, function(index, row) {
            $('#inquiryTable tbody').append(row);
        });

        // 정렬 순서 토글
        sortOrder = !sortOrder;
    });
});

</script>
       
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
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
    <script src="/resources/admin/js/off-canvas.js"></script>
    <script src="/resources/admin/js/hoverable-collapse.js"></script>
    <script src="/resources/admin/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>