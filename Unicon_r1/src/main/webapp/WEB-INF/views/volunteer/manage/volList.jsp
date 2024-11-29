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
	
	.form-select, .form-control, .btn {
	    height: 38px;
	    line-height: 1.5;
	}
	
	.input-group-text {
	    height: 38px;
	    display: flex;
	    align-items: center;
	}
	
	/* 버튼 간격 조정 */
	.gap-2 {
	    gap: 0.5rem !important;
	}
	
	/* 검색 영역의 각 요소 높이 통일 */
	#searchForm .form-select,
	#searchForm .form-control,
	#searchForm .btn,
	#searchForm .input-group {
	    height: 38px !important;
	}
	
	/* 모바일 대응을 위한 반응형 스타일 */
	@media (max-width: 768px) {
	    .page-header {
	        flex-direction: column;
	        gap: 1rem;
	    }
	    
	    .page-header .d-flex {
	        width: 100%;
	    }
	    
	    .page-header .btn {
	        flex: 1;
	    }
	    /* 모바일에서 숨길 컬럼 */
        .hide-on-mobile {
            display: none;
        }
        
        /* 테이블 너비 조정 */
        .table {
            width: 100%;
            min-width: unset;
        }
        
        /* 테이블 셀 패딩 줄이기 */
        .table td, .table th {
            padding: 0.5rem;
        }
        
        /* 상태 뱃지 크기 조정 */
        .badge {
            font-size: 0.7rem;
            padding: 0.3rem 0.5rem;
        }
        
        /* 버튼 그룹 조정 */
        .btn-group .btn {
            padding: 0.2rem 0.5rem;
            font-size: 0.75rem;
        }
    }
}
</style>
</head>
<body>
<!-- ======================================================================= -->
<div class="container-scroller">
    <%@ include file="/WEB-INF/views/inc/admin_navbar.jsp"%>
    <div class="container-fluid page-body-wrapper">
        <%@ include file="/WEB-INF/views/inc/admin_sidebar.jsp"%>
        
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header d-flex justify-content-between align-items-center">
				    <h3 class="page-title">봉사활동 관리</h3>
				    <div class="d-flex gap-2"> 
				        <button type="button" class="btn btn-info" onclick="location.href='/volunteer/manage/volGuideForm'">
				            <i class="fas fa-edit"></i> 안내문 수정
				        </button>
				        <button class="btn btn-primary" onclick="location.href='/volunteer/manage/volForm'">
				            <i class="fas fa-plus"></i> 공고 등록
				        </button>
				    </div>
				</div>

                <!-- 검색 필터 -->
                <div class="card mb-4">
				    <div class="card-body">
				        <form id="searchForm" class="row g-3">
				            <!-- 상태 선택 -->
				            <div class="col-md-2">
				                <select class="form-select h-100" name="recruitStatus">
								    <option value="">전체 상태</option>
								    <option value="OPEN">모집중</option>
								    <option value="CLOSE">마감</option>
								</select>
				            </div>
				            <!-- 검색어 입력 -->
				            <div class="col-md-4">
				                <input type="text" class="form-control" name="keyword" placeholder="봉사활동명 검색">
				            </div>
				            <!-- 날짜 선택 -->
				            <div class="col-md-4">
				                <div class="input-group h-100">
				                    <input type="date" class="form-control" name="startDate">
				                    <span class="input-group-text">~</span>
				                    <input type="date" class="form-control" name="endDate">
				                </div>
				            </div>
				            <!-- 검색 버튼 -->
				            <div class="col-md-2">
				                <button type="submit" class="btn btn-primary w-100 h-100">검색</button>
				            </div>
				        </form>
				    </div>
				</div>

                <!-- 공고 목록 -->
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
						    <thead>
						        <tr>
						            <th class="hide-on-mobile">번호</th>
						            <th>상태</th>
						            <th>봉사활동명</th>
						            <th class="hide-on-mobile">모집기간</th>
						            <th class="hide-on-mobile">봉사기간</th>
						            <th>모집인원</th>
						            <th>신청인원</th>
						            <th class="hide-on-mobile">관리</th>
						        </tr>
						    </thead>
						    <tbody>
						        <c:forEach items="${volunteers}" var="vol">
						            <tr>
						                <td class="hide-on-mobile">${vol.voId}</td>
						                <td>
						                    <span class="badge ${vol.recruitStatus == 'OPEN' ? 'bg-success' : 'bg-secondary'}">
						                        ${vol.recruitStatus == 'OPEN' ? '모집중' : '마감'}
						                    </span>
						                </td>
						                <td>
						                    <a href="/admin/volunteer/detail/${vol.voId}">${vol.voTitle}</a>
						                </td>
						                <td class="hide-on-mobile">
						                    <fmt:formatDate value="${vol.voRecruitStart}" pattern="yyyy.MM.dd"/> -
						                    <fmt:formatDate value="${vol.voRecruitEnd}" pattern="yyyy.MM.dd"/>
						                </td>
						                <td class="hide-on-mobile">
						                    <fmt:formatDate value="${vol.voStartDate}" pattern="yyyy.MM.dd"/> -
						                    <fmt:formatDate value="${vol.voEndDate}" pattern="yyyy.MM.dd"/>
						                </td>
						                <td>${vol.voCapacity}명</td>
						                <td>${vol.applicationCount}명</td>
						                <td class="hide-on-mobile">
						                    <div class="btn-group">
						                        <button type="button" class="btn btn-sm btn-outline-primary"
						                                onclick="location.href='/admin/volunteer/edit/${vol.voId}'">
						                            수정
						                        </button>
						                        <button type="button" class="btn btn-sm btn-outline-danger"
						                                onclick="deleteVolunteer(${vol.voId})">
						                            삭제
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
                    </div>
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