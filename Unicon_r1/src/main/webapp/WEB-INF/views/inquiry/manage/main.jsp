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
    <!-- endinject -->
    <!-- Plugin css for this page -->
    
    <style>
    
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
.status {
	font-weight: bold;
	color: #2ecc71; /* 진행중 상태는 초록색 */
}
th.istatus {
	font-weight: bold;
	text-align: center;	
}

/* 검색창 스타일 */
.search-bar {
	text-align: center;
	margin-bottom: 20px;
}

/* 게시판 제목 */
h2 {
	font-size: 24px;
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

/* 글쓰기 버튼 스타일 */
.write-btn-container {
    text-align: right; /* 오른쪽 정렬 */
    margin: 20px 390px 20px 40px; /* 페이지 우측 공간과 상단 여백 설정 */
}

.write-btn {
    background-color: #2ecc71; /* 버튼 색상 */
    color: white; /* 텍스트 색상 */
    font-size: 14px; /* 폰트 크기 */
    font-weight: bold;
    padding: 10px 20px; /* 버튼 여백 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 둥근 모서리 */
    cursor: pointer; /* 마우스 커서 변경 */
    transition: background-color 0.3s ease; /* 호버 효과 추가 */
}

.write-btn:hover {
    background-color: #27ae60; /* 호버 시 색상 변경 */
}

/* 상태 열 스타일 - 가로 정렬 */
.status {
    font-weight: bold;
    color: green;
    writing-mode: horizontal-tb; /* 텍스트를 가로 방향으로 설정 */
    text-align: left; /* 기본 정렬 */
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
}

/* th 요소는 제외하고, td 요소의 istatus에만 스타일 적용 */
td.istatus {
    font-weight: bold;
    color: #333;
    writing-mode: horizontal-tb;
    text-align: center; 
    background-color: #e6f7ff;
    padding: 5px 20px;
    border-radius: 1px;    
    display: inline-flex;
    align-items: center; /* 아이콘과 텍스트를 수평 정렬 */
	line-height: 30px; /* 텍스트가 수직으로 중앙에 오게 설정 */
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

.pagination li a:hover,
.pagination li.active a {
    background-color: #2ecc71;
    color: white;
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
                    <h4 class="card-title">Unicon Q&A 문의게시판</h4>
                    <p class="card-description"> <code>문의 게시판 관리자 페이지</code>
                    </p>
                    <table class="table table-striped" id="inquiryTable">
                      <thead>
                        <tr>
                          <th class="no">No</th>
							<th class="istatus">카테고리</th>
							<th class="title">제목</th>
							<th class="member">작성자</th>
							<th class="date">작성일</th>
							<th class="status">상태</th>
                        </tr>
                      </thead>
                      <tbody>
                       
                      </tbody>
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
$(document).ready(function () {
    // 현재 페이지와 페이지 크기
    let currentPage = 1;
    const pageSize = 10;

    function loadPage(page) {
        $.ajax({
            url: "/api/boards",
            method: "GET",
            data: { page: page, size: pageSize },
            dataType: "json",
            success: function (response) {
                const data = response.boards; // 서버에서 가져온 데이터
                const totalPages = response.totalPages; // 전체 페이지 수

                let tbody = "";
                data.forEach(function (inquiry) {
                    let statusText = inquiry.status === 1 ? "진행 중" : "답변 완료";
                    let statusClass = inquiry.status === 1 ? "status-ongoing" : "status-completed";

                    tbody +=
                        '<tr>' +
                        '<td class="no">' + inquiry.bno + '</td>' +
                        '<td class="istatus">' + inquiry.istatus + '</td>' +
                        '<td class="title"><a href="/inquiry/manage/' + inquiry.bno + '">' + inquiry.title + '</a></td>' + // 게시글 제목에 링크 추가
                        '<td class="member">' + inquiry.member_name + '</td>' +
                        '<td class="date">' + inquiry.created_at + '</td>' +                       
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

    function renderPagination(totalPages, currentPage) {
        let paginationHtml = "";

        // 이전 버튼
        if (currentPage > 1) {
            paginationHtml +=
                '<li>' +
                '<a href="#" data-page="' + (currentPage - 1) + '">«</a>' +
                '</li>';
        }

        // 페이지 번호
        for (let i = 1; i <= totalPages; i++) {
            paginationHtml +=
                '<li class="' + (i === currentPage ? "active" : "") + '">' +
                '<a href="#" data-page="' + i + '">' + i + '</a>' +
                '</li>';
        }

        // 다음 버튼
        if (currentPage < totalPages) {
            paginationHtml +=
                '<li>' +
                '<a href="#" data-page="' + (currentPage + 1) + '">»</a>' +
                '</li>';
        }

        $("#pagination").html(paginationHtml);
    }

    // 페이지네이션 클릭 이벤트
    $(document).on("click", ".pagination a", function (e) {
        e.preventDefault();
        const page = $(this).data("page");
        currentPage = page;
        loadPage(page);
    });

    // 초기 페이지 로드
    loadPage(currentPage);
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