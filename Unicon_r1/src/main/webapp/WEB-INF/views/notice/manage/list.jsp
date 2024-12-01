<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>공지사항 관리</title>
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
    margin: 1rem auto !important;
    width: 100% !important;
    padding: 1rem !important;
    min-width: 0 !important;
}

.card .card-body {
    padding: 0 !important;
    width: 100% !important;
    min-width: 0 !important;
}

/* 검색 폼 */
#searchForm .row {
    background: #f8f9fa !important;
    margin: 0 !important;
    padding: 1rem !important;
    border-radius: 4px !important;
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

/* 체크박스 스타일 수정 */
.form-check-input {
    transform: scale(1.2) !important;  /* 체크박스 크기 조정 */
    margin: 0 !important;
}

/* 체크박스 셀 정렬 */
.table td:first-child,
.table th:first-child {
    text-align: center !important;
    vertical-align: middle !important;
}

/* 체크박스 컨테이너 정렬 */
.table td:first-child input[type="checkbox"],
.table th:first-child input[type="checkbox"] {
    display: inline-block !important;
    position: relative !important;
    top: 2px !important;
}

/* 체크박스 열 너비 고정 */
.table th:first-child,
.table td:first-child {
    width: 50px !important;
}

/* 카테고리 열 정렬 */
.table td:nth-child(3),
.table th:nth-child(3) {
    text-align: center !important;
    vertical-align: middle !important;
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

/* 모바일 반응형 */
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
    .table th:not(:nth-child(1)):not(:nth-child(3)):not(:nth-child(4)):not(:nth-child(8)),
    .table td:not(:nth-child(1)):not(:nth-child(3)):not(:nth-child(4)):not(:nth-child(8)) {
        display: none !important;
    }
    
    /* 제목 셀 말줄임표 처리 */
    .notice-title {
        max-width: 150px !important;
        white-space: nowrap !important;
        overflow: hidden !important;
        text-overflow: ellipsis !important;
    }

    .notice-title a {
        display: block !important;
        white-space: nowrap !important;
        overflow: hidden !important;
        text-overflow: ellipsis !important;
    }

    /* 남은 컬럼 너비 조정 */
    .table td:nth-child(1), 
    .table th:nth-child(1) {  /* 체크박스 */
        width: 40px !important;
    }

    .table td:nth-child(3), 
    .table th:nth-child(3) {  /* 카테고리 */
        width: 90px !important;
    }

    .table td:nth-child(4), 
    .table th:nth-child(4) {  /* 제목 */
        min-width: auto !important;
    }

    .table td:nth-child(8), 
    .table th:nth-child(8) {  /* 관리 */
        width: 100px !important;
    }

    /* 테이블 레이아웃 */
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

    /* 검색 폼 모바일 대응 */
    #searchForm .col-md-2,
    #searchForm .col-md-4 {
        width: 100% !important;
        margin-bottom: 0.5rem !important;
    }

    #searchForm .col-md-2:last-child {
        display: flex !important;
        gap: 10px !important;
    }

    #searchForm .col-md-2:last-child .btn {
        flex: 1 !important;
    }
}
</style>
</head>
<body>
<div class="container-scroller">
        <%@ include file="/WEB-INF/views/inc/admin_navbar_adpt.jsp"%>
        <div class="container-fluid page-body-wrapper">
            <%@ include file="/WEB-INF/views/inc/admin_sidebar_adpt.jsp"%>
		    <!-- 메인 컨텐츠 -->
			<div class="main-panel">
			    <div class="content-wrapper">
			        <div class="page-header d-flex justify-content-between mb-4">
			            <h4 class="mb-0" style="min-width: 200px;">공지사항 관리</h4>
			            <div class="d-flex gap-2">
			                <button class="btn btn-primary" onclick="location.href='/notice/manage/form'">
			                    <i class="fas fa-plus"></i> 공지사항 등록
			                </button>
			                <button class="btn btn-danger" onclick="deleteSelected()">
			                    <i class="fas fa-trash"></i> 선택 삭제
			                </button>
			            </div>
			        </div>
		        <!-- 검색 영역 -->
		        <div class="card">
		            <div class="card-body">
		                <form id="searchForm" class="row g-3">
		                    <div class="col-md-2">
		                        <select name="category" class="form-select">
		                            <option value="">전체 카테고리</option>
		                            <option value="안내사항" ${param.category == '안내사항' ? 'selected' : ''}>안내사항</option>
		                            <option value="이벤트" ${param.category == '이벤트' ? 'selected' : ''}>이벤트</option>
		                            <option value="센터소식" ${param.category == '센터소식' ? 'selected' : ''}>센터소식</option>
		                        </select>
		                    </div>
		                    <div class="col-md-3">
		                        <input type="text" name="keyword" class="form-control" 
		                               placeholder="제목 또는 내용 검색" value="${param.keyword}">
		                    </div>
		                    <div class="col-md-4">
		                        <div class="input-group">
		                            <input type="date" name="startDate" class="form-control" value="${param.startDate}">
		                            <span class="input-group-text">~</span>
		                            <input type="date" name="endDate" class="form-control" value="${param.endDate}">
		                        </div>
		                    </div>
		                    <div class="col-md-3">
		                        <div class="d-flex gap-2">
		                            <button type="submit" class="btn btn-primary w-50">
		                                <i class="fas fa-search"></i> 검색
		                            </button>
		                            <button type="button" class="btn btn-outline-secondary w-50" onclick="resetSearch()">
		                                <i class="fas fa-undo"></i> 초기화
		                            </button>
		                        </div>
		                    </div>
		                </form>
		            </div>
		        </div>
		        <!-- 공지사항 목록 -->
		        <div class="card">
				    <div class="card-body p-0">
				        <div class="table-responsive">
				            <table class="table">
				                <thead>
				                    <tr>
				                        <th class="text-center" style="width: 50px;">
				                            <input type="checkbox" class="form-check-input" id="headerCheckbox">
				                        </th>
				                        <th class="text-center" style="width: 80px;">번호</th>
				                        <th style="width: 100px;">카테고리</th>
				                        <th>제목</th>
				                        <th style="width: 100px;">작성자</th>
				                        <th style="width: 120px;">등록일</th>
				                        <th class="text-center" style="width: 80px;">조회수</th>
				                        <th style="width: 100px;">관리</th>
				                    </tr>
				                </thead>
				                <tbody>
				                    <c:forEach items="${boards}" var="notice">
				                        <tr>
				                            <td class="text-center">
				                                <input type="checkbox" class="form-check-input notice-check" value="${notice.noId}">
				                            </td>
				                            <td class="text-center">${notice.noId}</td>
				                            <td>
				                                <span class="badge bg-secondary">${notice.noCategory}</span>
				                            </td>
				                            <td class="notice-title">
				                                <a href="/notice/manage/${notice.noId}" class="text-decoration-none">
				                                    ${notice.important ? '<span class="important-badge">[중요]</span>' : ''}
				                                    ${notice.noTitle}
				                                    <c:if test="${not empty notice.noThumb}">
				                                        <i class="fas fa-image text-muted ms-1"></i>
				                                    </c:if>
				                                    <c:if test="${not empty notice.files}">
				                                        <i class="fas fa-paperclip text-muted ms-1"></i>
				                                    </c:if>
				                                </a>
				                            </td>
				                            <td>${notice.noWriter}</td>
				                            <td><fmt:formatDate value="${notice.noRegDate}" pattern="yyyy-MM-dd"/></td>
				                            <td class="text-center">${notice.viewCount}</td>
				                            <td>
				                                <div class="d-flex justify-content-center gap-1">
				                                    <button class="btn btn-sm btn-outline-primary" 
				                                            onclick="location.href='/notice/manage/form?noId=${notice.noId}'"
				                                            title="수정">
				                                        <i class="fas fa-edit"></i>
				                                    </button>
				                                    <button class="btn btn-sm btn-outline-danger" 
				                                            onclick="deleteNotice(${notice.noId})"
				                                            title="삭제">
				                                        <i class="fas fa-trash"></i>
				                                    </button>
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
				            <!-- 첫 페이지로 -->
				            <c:if test="${page > 1}">
				                <li class="page-item">
				                    <a class="page-link" href="javascript:goToPage(1)">
				                        <i class="fas fa-angle-double-left"></i>
				                    </a>
				                </li>
				                <!-- 이전 페이지로 -->
				                <li class="page-item">
				                    <a class="page-link" href="javascript:goToPage(${page - 1})">
				                        <i class="fas fa-angle-left"></i>
				                    </a>
				                </li>
				            </c:if>
				            <!-- 페이지 번호들 -->
				            <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
				                <li class="page-item ${pageNum == page ? 'active' : ''}">
				                    <a class="page-link" href="javascript:goToPage(${pageNum})">${pageNum}</a>
				                </li>
				            </c:forEach>
				            
				            <!-- 다음 페이지로 -->
				            <c:if test="${page < totalPages}">
				                <li class="page-item">
				                    <a class="page-link" href="javascript:goToPage(${page + 1})">
				                        <i class="fas fa-angle-right"></i>
				                    </a>
				                </li>
				                <!-- 마지막 페이지로 -->
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
    window.goToPage = function(page) {
        var category = $('select[name="category"]').val();
        var keyword = $('input[name="keyword"]').val();
        var startDate = $('input[name="startDate"]').val();
        var endDate = $('input[name="endDate"]').val();
        
        var params = new URLSearchParams();
        params.append('page', page);
        params.append('size', '10');
        
        if (category) params.append('category', category);
        if (keyword) params.append('keyword', keyword);
        if (startDate) params.append('startDate', startDate);
        if (endDate) params.append('endDate', endDate);
        
        window.location.href = '/notice/manage?' + params.toString();
    };

    // 검색 초기화
    window.resetSearch = function() {
        window.location.href = '/notice/manage?page=1&size=10';
    };

    // 공지사항 삭제
    window.deleteNotice = function(noId) {
        if (!confirm('정말 삭제하시겠습니까?')) {
            return;
        }
        
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        
        $.ajax({
            url: '/notice/api/delete/' + noId,
            type: 'POST',
            beforeSend: function(xhr) {
                if (token && header) {
                    xhr.setRequestHeader(header, token);
                }
            },
            success: function() {
                alert('삭제되었습니다.');
                location.reload();
            },
            error: function(xhr) {
                console.error('Error:', xhr);
                var errorMsg = xhr.responseText || '서버 오류가 발생했습니다.';
                alert('삭제 실패: ' + errorMsg);
            }
        });
    };
    
    // 공지사항 선택 삭제
    window.deleteSelected = function() {
    const selectedIds = [];
    $('.notice-check:checked').each(function() {
        selectedIds.push($(this).val());
    });
    
    if (selectedIds.length === 0) {
        alert('삭제할 항목을 선택해주세요.');
        return;
    }
    
    if (!confirm('선택한 ' + selectedIds.length + '개의 항목을 삭제하시겠습니까?')) {
        return;
    }
    
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    
    // 선택된 항목들을 순차적으로 삭제
    let deleteCount = 0;
    let errorCount = 0;
    
    function deleteNext(index) {
        if (index >= selectedIds.length) {
            if (errorCount === 0) {
                alert('선택한 항목이 모두 삭제되었습니다.');
                location.reload();
            } else {
                alert(deleteCount + '개 항목이 삭제되었으며, ' + errorCount + '개 항목 삭제 중 오류가 발생했습니다.');
                location.reload();
            }
            return;
        }
        
        $.ajax({
            url: '/notice/api/delete/' + selectedIds[index],
            type: 'POST',
            beforeSend: function(xhr) {
                if (token && header) {
                    xhr.setRequestHeader(header, token);
                }
            },
            success: function() {
                deleteCount++;
                deleteNext(index + 1);
            },
            error: function(xhr) {
                console.error('Error:', xhr);
                errorCount++;
                deleteNext(index + 1);
            }
        });
    }
    
    deleteNext(0);
	};

    // DOM이 완전히 로드된 후 이벤트 핸들러 설정
    $(document).ready(function() {
        // 검색 폼 제출
        $('#searchForm').on('submit', function(e) {
            e.preventDefault();
            goToPage(1);
        });
        
        // 전체 선택 체크박스
    $('#headerCheckbox').on('change', function() {
        $('.notice-check').prop('checked', $(this).is(':checked'));
    });
});
 	
</script>
</body>
</html>