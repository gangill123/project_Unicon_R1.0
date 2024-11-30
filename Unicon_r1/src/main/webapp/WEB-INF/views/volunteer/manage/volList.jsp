<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>봉사활동 관리</title>
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<style>
/* 기본 레이아웃 */
body,
.container-scroller,
.page-body-wrapper,
.main-panel,
.content-wrapper,
.page-header,
.card,
.card-body {
    background: #ffffff !important;
}

/* 사이드바 */
.sidebar { 
    width: 250px !important; 
    position: fixed !important; 
    left: 0 !important; 
    height: 100vh !important;
    background: #f8f9fa !important; 
    transition: all 0.3s ease !important;
}

.content-wrapper .card { 
    margin: 1rem auto !important;  
    width: 100% !important;
    padding: 1rem !important;
    min-width: 0 !important;
}

/* 메인 패널 */
.main-panel { 
    margin-left: 250px !important; 
    padding: 20px 0 !important;
    width: calc(100% - 250px) !important;
    min-width: 0 !important;
}

/* 컨텐츠 영역 */
.content-wrapper {
    width: 100% !important;
    padding: 0 20px !important;
    min-width: 0 !important;
    flex: 1 1 auto !important;
}

/* 카드 컴포넌트 */
.card { 
    margin: 1rem !important;
    width: 100% !important;
    padding: 1rem !important;
    min-width: 0 !important;
	
	.card-body {
	    padding: 0 !important;
	    width: 100% !important;
	    min-width: 0 !important;
	}
}

.row g-3 {
	background: #f8f9fa !important;
    padding: 1rem !important;
    border-radius: 4px !important;
    margin-bottom: 1rem !important;	
}

/* 테이블 */
.table-responsive {
    margin: 0 !important;
    border: 1px solid #dee2e6 !important;
    border-left: none !important;
    border-right: none !important;
}

.table {
    margin: 0 !important;
    width: 100% !important;
    border-collapse: collapse !important;
}

.table th {
    background: #f8f9fa !important;
    font-weight: 600 !important;
    color: #000000 !important;
    text-align: center !important;
    height: 45px !important;
    padding: 0.75rem !important;
}

.table td {
    padding: 0.75rem !important;
    height: 45px !important;
    font-size: 0.95rem !important;
    border-bottom: 1px solid #dee2e6 !important;
}

.table tbody tr:hover {
    background-color: #f8f9fa !important;
}

/* 폼 요소 */
.card .form-select, 
.card .form-control {
    height: 38px !important;
    border: 1px solid #dee2e6 !important;
}

.btn {
    padding: 0.5rem 1rem !important;
    font-weight: 500 !important;
    height: 38px !important;
}

/* Footer */
.footer {
    background: #f8f9fa !important;
}

/* 모바일 대응 */
@media (max-width: 768px) {
    .main-panel {
        margin-left: 0 !important;
        width: 100% !important;
    }

    .sidebar {
        width: 0 !important;
    }

    .page-header {
        flex-direction: column !important;
        gap: 1rem !important;
        align-items: center !important;  
        text-align: center !important;
    }
    
    .page-header .d-flex.gap-2 {
        display: flex !important;
        width: 100% !important;
        gap: 10px !important;
    }

    .page-header .btn {
        flex: 1 !important;  
        width: 50% !important;
        white-space: nowrap !important;
    }
    
    /* 테이블 컬럼 제어 */
    .table th:not(:nth-child(2)):not(:nth-child(3)):not(:nth-child(6)):not(:nth-child(7)),
    .table td:not(:nth-child(2)):not(:nth-child(3)):not(:nth-child(6)):not(:nth-child(7)) {
        display: none !important;
    }

    /* 남은 컬럼 너비 조정 */
    .table td:nth-child(2), 
    .table th:nth-child(2) {  /* 상태 */
        width: 80px !important;
    }

    .table td:nth-child(3), 
    .table th:nth-child(3) {  /* 봉사활동명 */
        min-width: auto !important;
        max-width: none !important;
    }

    .table td:nth-child(6), 
    .table th:nth-child(6),
    .table td:nth-child(7), 
    .table th:nth-child(7) {  /* 모집인원, 신청인원 */
        width: 70px !important;
    }

    /* 테이블 전체 width 관련 */
    .table-responsive {
        overflow-x: hidden !important;
    }

    .table {
        width: 100% !important;
        table-layout: fixed !important;
    }

    .table td, .table th {
        padding: 0.5rem !important;
        font-size: 0.875rem !important;
    }

    .hide-on-mobile {
        display: none !important;
    }
    
    .action-buttons {
           display: flex !important;
           gap: 0.25rem !important;
           justify-content: flex-end !important;
       }
}
</style>
</head>
<body>
<div class="container-scroller">
    <%@ include file="/WEB-INF/views/inc/admin_navbar_adpt.jsp"%>
    <div class="container-fluid page-body-wrapper">
        <%@ include file="/WEB-INF/views/inc/admin_sidebar_adpt.jsp"%>
        
        <div class="main-panel">
            <div class="content-wrapper">
			    <div class="page-header d-flex justify-content-between mb-4">
			        <h4 class="mb-0" style="min-width: 200px;">봉사활동 관리</h4>
			        <div class="d-flex gap-2" justify-content: flex-end;"> 
			            <button type="button" class="btn btn-info" onclick="location.href='/volunteer/manage/volGuideForm'">
			                <i class="fas fa-edit"></i> 안내문 수정
			            </button>
			            <button class="btn btn-primary" onclick="location.href='/volunteer/manage/volForm'">
			                <i class="fas fa-plus"></i> 공고 등록
			            </button>
			        </div>
			    </div>

                <!-- 검색 필터 -->
                <div class="card">
                    <div class="card-body">
                        <form id="searchForm" class="row g-3">
                            <div class="col-md-2">
                                <select class="form-select" name="recruitStatus">
                                    <option value="">전체 상태</option>
                                    <option value="OPEN">모집중</option>
                                    <option value="CLOSE">마감</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" name="keyword" placeholder="봉사활동명 검색">
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <input type="date" class="form-control" name="startDate">
                                    <span class="input-group-text">~</span>
                                    <input type="date" class="form-control" name="endDate">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="fas fa-search"></i> 검색
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- 공고 목록 -->
                <div class="card">
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="width: 80px;">번호</th>
                                        <th style="width: 100px;">상태</th>
                                        <th>봉사활동명</th>
                                        <th style="width: 200px;">모집기간</th>
                                        <th style="width: 200px;">봉사기간</th>
                                        <th style="width: 100px;">모집인원</th>
                                        <th style="width: 100px;">신청인원</th>
                                        <th style="width: 150px;">관리</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${volunteers}" var="vol">
                                        <tr>
                                            <td class="text-center">${vol.voId}</td>
                                            <td class="text-center">
                                                <span class="badge ${vol.recruitStatus == 'OPEN' ? 'bg-success' : 'bg-secondary'}">
                                                    ${vol.recruitStatus == 'OPEN' ? '모집중' : '마감'}
                                                </span>
                                            </td>
                                            <td>
                                                <a href="/admin/volunteer/detail/${vol.voId}" class="text-decoration-none">
                                                    ${vol.voTitle}
                                                </a>
                                            </td>
                                            <td class="text-center">
                                                <fmt:formatDate value="${vol.voRecruitStart}" pattern="yyyy.MM.dd"/> -
                                                <fmt:formatDate value="${vol.voRecruitEnd}" pattern="yyyy.MM.dd"/>
                                            </td>
                                            <td class="text-center">
                                                <fmt:formatDate value="${vol.voStartDate}" pattern="yyyy.MM.dd"/> -
                                                <fmt:formatDate value="${vol.voEndDate}" pattern="yyyy.MM.dd"/>
                                            </td>
                                            <td class="text-center">${vol.voCapacity}명</td>
                                            <td class="text-center">${vol.applicationCount}명</td>
                                            <td>
                                                <div class="d-flex justify-content-center gap-1">
                                                    <button type="button" class="btn btn-sm btn-outline-primary"
                                                            onclick="location.href='/admin/volunteer/edit/${vol.voId}'">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-sm btn-outline-danger"
                                                            onclick="deleteVolunteer(${vol.voId})">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                    <c:if test="${vol.recruitStatus == 'OPEN'}">
                                                        <button type="button" class="btn btn-sm btn-outline-warning"
                                                                onclick="closeRecruitment(${vol.voId})">
                                                            마감
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${vol.recruitStatus == 'CLOSE'}">
                                                        <c:set var="now" value="<%=new java.util.Date()%>"/>
                                                        <c:if test="${vol.voRecruitEnd > now && vol.applicationCount < vol.voCapacity}">
                                                            <button type="button" class="btn btn-sm btn-outline-success"
                                                                    onclick="openRecruitment(${vol.voId})">
                                                                모집
                                                            </button>
                                                        </c:if>
                                                    </c:if>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- 페이지네이션 -->
                <div class="d-flex justify-content-center mt-4">
                    <nav>
                        <ul class="pagination">
                            <c:if test="${page > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goToPage(1)">
                                        <i class="fas fa-angle-double-left"></i>
                                    </a>
                                </li>
                            </c:if>
                            
                            <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
                                <li class="page-item ${pageNum == page ? 'active' : ''}">
                                    <a class="page-link" href="javascript:goToPage(${pageNum})">${pageNum}</a>
                                </li>
                            </c:forEach>
                            
                            <c:if test="${page < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:goToPage(${totalPages})">
                                        <i class="fas fa-angle-double-right"></i>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
                <%@ include file="/WEB-INF/views/inc/admin_footer_adpt.jsp"%>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
<script src="/resources/admin/js/off-canvas.js"></script>
<script src="/resources/admin/js/hoverable-collapse.js"></script>
<script src="/resources/admin/js/misc.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
function deleteVolunteer(id) {
    if (!confirm('해당 봉사활동 공고를 삭제하시겠습니까?')) {
        return;
    }
    
    $.ajax({
        url: '/admin/volunteer/delete/' + id,
        type: 'POST',
        success: function() {
            alert('삭제되었습니다.');
            location.reload();
        },
        error: function() {
            alert('삭제 중 오류가 발생했습니다.');
        }
    });
}

function closeRecruitment(id) {
    if (!confirm('해당 봉사활동 모집을 마감하시겠습니까?')) {
    
    	return;
    }
    
    $.ajax({
    	url: '/volunteer/manage/close/' + id,
        type: 'POST',
        success: function() {
            alert('모집이 마감되었습니다.');
            location.reload();
        },
        error: function() {
            alert('마감 처리 중 오류가 발생했습니다.');
        }
    });
}

function openRecruitment(id) {
    if (!confirm('해당 봉사활동 모집을 시작하시겠습니까?')) {
        return;
    }
    
    $.ajax({
        url: '/volunteer/manage/open/' + id,
        type: 'POST',
        success: function() {
            alert('모집이 시작되었습니다.');
            location.reload();
        },
        error: function() {
            alert('모집 처리 중 오류가 발생했습니다.');
        }
    });
}

function goToPage(page) {
    const form = $('#searchForm');
    const pageInput = $('<input>').attr({
        type: 'hidden',
        name: 'page',
        value: page
    });
    
    form.append(pageInput);
    form.submit();
}

$(document).ready(function() {
    // 검색 폼 제출
    $('#searchForm').on('submit', function(e) {
        e.preventDefault();
        goToPage(1);
    });
});
</script>
</body>
</html>