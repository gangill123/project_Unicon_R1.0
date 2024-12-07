<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>유니콘 - 봉사활동 관리</title>
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- SweetAlert2 CSS -->
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>

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
        background: #ffffff !important;
        transition: all 0.3s ease !important;
        z-index: 1000 !important;
    }
	
	.content-wrapper .card { 
	    margin: 1rem auto !important;  
	    width: 100% !important;
	    padding: 1rem !important;
	    min-width: 0 !important;
	}
	
	/* 메인 패널 */
	.main-panel {
        display: flex !important;
        flex-direction: column !important;
        min-height: 100vh !important;
        background: #f8f9fa !important;
        margin-left: 250px !important;
        width: calc(100% - 250px) !important;
    }
	
	/* 컨텐츠 영역 */
	.content-wrapper {
        flex: 1 !important;
        padding: 2rem !important;
        background: #f8f9fa !important;
        width: 100% !important;
    }
	
	/* 모달 스타일 */
	.modal-xl {
	    max-width: 95% !important;
	    margin: 1.75rem auto;
	}
	
	.modal-content {
	    background: #ffffff;
	    border-radius: 12px;
	}
	
	.modal-header {
	    border-bottom: none;
	    padding: 1.5rem;
	}
	
	.modal-body {
	    padding: 1.5rem;
	}
	
	/* 카드 컴포넌트 */
	.card {
        background: #ffffff !important;
	    border: none !important;
	    box-shadow: 0 2px 4px rgba(0,0,0,0.1) !important;
	    border-radius: 1rem !important;
	    margin-bottom: 20px !important;
	    overflow: hidden !important;
    }
    
    .card-body {
	    padding: 0.5rem !important;
	}
    
    /* 테이블 카드 스타일 */
    .table-card {
        border-radius: 1rem !important;
        overflow: hidden !important;
    }
    
    /* 테이블 반응형 컨테이너 */
    .table-responsive {
        margin: 0 !important;
        border: none !important;
    }
    
    /* 검색 폼 카드 */
    #searchForm {
	    background: #ffffff !important;
	    border: 1px solid #dee2e6 !important;
	    border-radius: 0.5rem !important;
	    padding: 1rem !important;
	    margin-bottom: 1.5rem !important;
	    width: 100% !important;
	}
	
	.row.g-3 {
	    margin: 0 !important;
	}
		
	.row g-3 {
		background: #f8f9fa !important;
	    padding: 1rem !important;
	    border-radius: 4px !important;
	    margin-bottom: 1rem !important;	
	}
	
	.input-group .input-group-text.bg-light {
	    border-right: none !important;
	    background-color: #f8f9fa !important;
	    font-size: 0.9rem !important;
	}
	
	.input-group input[type="date"] {
	    border-left: none !important;
	}
	
	.input-group span:not(.bg-light) {
	    background-color: #e9ecef !important;
	}
	
	.table {
	    margin: 0 !important;
	    width: 100% !important;
	    border-collapse: collapse !important;
	    text-align: center;
	}
	
	.table th {
        background: #006e60 !important;
        font-weight: 600 !important;
        color: #ffffff !important;
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
	
	.content-wrapper .card .table td:nth-child(3) {
	    text-align: left !important;
	}
	
	/* 폼 요소 */
	.card .form-select, 
	.card .form-control {
	    height: 38px !important;
	    border: 1px solid #dee2e6 !important;
	}
	
	/* 신청자 정보 스타일 */
	.applicant-info-row td {
	    background-color: #ffffff;
	    border-bottom: none !important;
	}
	
	.reason-row td {
	    background-color: #f8f9fa;
	    padding-top: 0 !important;
	}
	
	.reason-content {
	    text-align: left;
	    padding: 1rem;
	    margin: 0 1rem;
	    background: #ffffff;
	    border-radius: 4px;
	    border: 1px solid #dee2e6;
	}
	
	/* 상태 뱃지 */
	.status-badge {
	    padding: 0.4rem 0.8rem;
	    border-radius: 20px;
	    font-size: 0.85rem;
	    font-weight: 500;
	    display: inline-block;
	}
	
	.status-pending { 
	    background-color: #fff3cd; 
	    color: #856404; 
	}
	
	.status-approved { 
	    background-color: #d4edda; 
	    color: #155724; 
	}
	
	.status-rejected { 
	    background-color: #f8d7da; 
	    color: #721c24; 
	}
	
	.status-canceled { 
	    background-color: #e9ecef; 
	    color: #495057; 
	}
	
	.btn {
	    padding: 0.5rem 1rem !important;
	    font-weight: 500 !important;
	    height: 38px !important;
	}
	
	.reason-row td {
	    background-color: #f8f9fa;
	    padding: 0 !important;
	    transition: all 0.3s ease;
	}
	
	.reason-content {
	    text-align: left;
	    padding: 1rem;
	    margin: 0.5rem 1rem;
	    background: #ffffff;
	    border-radius: 4px;
	    border: 1px solid #dee2e6;
	}
	
	.reason-text {
	    color: #2c3e50;
	    font-size: 0.95rem;
	    line-height: 1.6;
	    white-space: pre-wrap;      /* 줄바꿈 유지 */
	    word-wrap: break-word;      /* 긴 단어 줄바꿈 */
	    max-width: 100%;            /* 가로 스크롤 방지 */
	}
	
	.action-buttons {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    gap: 0.5rem;
	}
	
	.btn-group {
	    display: inline-flex;
	    gap: 0.25rem;
	}
	
	.btn-primary {
        background-color: #006e60 !important;
        border-color: #006e60 !important;
    }
    
    .btn-primary:hover {
        background-color: #005a4e !important;
        border-color: #005a4e !important;
    }
    
    .btn-outline-primary {
        color: #006e60 !important;
        border-color: #006e60 !important;
    }
    
    .btn-outline-primary:hover {
        background-color: #006e60 !important;
        color: #fff !important;
    }
	
	/* 사유보기 버튼 스타일 */
	.btn-outline-primary.active {
	    background-color: #e7f1ff;
	}
	
	/* 애니메이션 효과 */
	.reason-row {
	    transition: all 0.3s ease-in-out;
	}
	
	.pagination .page-item.active .page-link {
        background-color: #006e60 !important;
        border-color: #006e60 !important;
    }
    
    .pagination .page-link {
        color: #006e60 !important;
    }
    
    .pagination .page-item.active .page-link {
        color: #ffffff !important;
    }
	
	/* Footer */
	.footer {
	    background: #f8f9fa !important;
	}
	
	/* SweetAlert2 커스텀 스타일 */
	.swal2-popup .swal2-actions {
	    justify-content: center;
	}
	
	.swal2-popup .swal2-confirm {
	    background-color: #86bc42 !important;
	}
	
	.swal2-popup .swal2-cancel {
	    background-color: #aaa !important;
	}
	
	.swal2-popup {
	    font-size: 0.9rem !important;
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
	   
	   .modal-dialog.modal-xl {
	       width: 95% !important;
	       margin: 1rem auto !important;
	   }
	   
	   .page-header {
	       flex-direction: column !important;
	       gap: 0.5rem !important;
	       align-items: center !important;
	       text-align: center !important;
	   }
	   
	   .page-header .d-flex.gap-2 {
	       width: 100% !important;
	       gap: 10px !important;
	   }
	   
	   .page-header .btn {
	       flex: 1 !important;
	       width: 50% !important;
	       white-space: nowrap !important;
	   }
	   
	   .content-wrapper {
            padding: 1rem !important;
        }
	   
		/* 메인 테이블 모바일 스타일 */
	    .content-wrapper .table:not(#volunteerDetailModal .table) th:not(:nth-child(3)):not(:nth-child(8)),
	    .content-wrapper .table:not(#volunteerDetailModal .table) td:not(:nth-child(3)):not(:nth-child(8)) {
	        display: none !important;
	    }
	    
	    .content-wrapper .table:not(#volunteerDetailModal .table) td:nth-child(3),
	    .content-wrapper .table:not(#volunteerDetailModal .table) th:nth-child(3) {  
	        width: 60% !important;
	    }
	    
	    .content-wrapper .table:not(#volunteerDetailModal .table) td:nth-child(8),
	    .content-wrapper .table:not(#volunteerDetailModal .table) th:nth-child(8) { 
	        width: 40% !important;
	    }
	   
	   /* 모달 테이블 모바일 스타일 */
	   #volunteerDetailModal .table th:not(:nth-child(1)):not(:nth-child(2)):not(:nth-child(8)),
	   #volunteerDetailModal .table td:not(:nth-child(1)):not(:nth-child(2)):not(:nth-child(8)) {
	       display: none !important;
	   }
	   
	   #volunteerDetailModal .table td:nth-child(1),
	   #volunteerDetailModal .table th:nth-child(1) {  /* 상태 */
	       width: 25% !important;
	   }
	   
	   #volunteerDetailModal .table td:nth-child(2),
	   #volunteerDetailModal .table th:nth-child(2) {  /* 이름 */
	       width: 35% !important;
	   }
	   
	   #volunteerDetailModal .table td:nth-child(8),
	   #volunteerDetailModal .table th:nth-child(8) {  /* 관리 */
	       width: 40% !important;
	   }
	   
	   /* 모바일에서 사유 버튼과 행 숨기기 */
	   #volunteerDetailModal .btn-outline-primary,
	   #volunteerDetailModal .reason-row {
	       display: none !important;
	   }
	   
	   .table-responsive {
	       overflow-x: hidden !important;
	   }
	   
	   .action-buttons {
	       flex-direction: column;
	       gap: 0.25rem !important;
	       justify-content: flex-end !important;
	   }
	   
	   .btn-group {
	       width: 100%;
	   }
	   
	   .btn-group .btn {
	       flex: 1;
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
		    <div class="row">
		        <div class="col-12 grid-margin stretch-card">
		            <div class="card border-0">
		                <div class="card-body p-0">
		                    <!-- 헤더 영역 -->
		                    <div class="page-header d-flex justify-content-between mb-4">
		                        <h4 class="mb-0" style="min-width: 200px;">봉사활동 관리</h4>
		                        <div class="d-flex gap-2">
		                            <button class="btn btn-primary" onclick="location.href='/volunteer/manage/volForm'">
		                                <i class="fas fa-plus"></i> 공고 등록
		                            </button>
		                        </div>
		                    </div>
		
		                <!-- 검색 필터 -->
		                <div class="mb-4">
		                        <form id="searchForm" class="row g-3">
						            <div class="col-md-2">
									    <select name="recruitStatus" class="form-select">
									        <option value="">전체 상태</option>
									        <option value="OPEN" ${param.recruitStatus == 'OPEN' ? 'selected' : ''}>모집중</option>
									        <option value="CLOSE" ${param.recruitStatus == 'CLOSE' ? 'selected' : ''}>마감</option>
									    </select>
									</div>
						            <div class="col-md-2">
						                <input type="text" class="form-control" name="keyword" 
						                       placeholder="봉사활동명 검색" value="${param.keyword}">
						            </div>
						            <div class="col-md-5">
									    <div class="input-group">
									        <span class="input-group-text bg-light">모집일</span>
									        <input type="date" class="form-control" name="startDate" value="${param.voStartDate}">
									        <span class="input-group-text">~</span>
									        <!-- <span class="input-group-text bg-light">봉사종료일</span> -->
									        <input type="date" class="form-control" name="endDate" value="${param.voEndDate}">
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
		
		                <!-- 공고 목록 -->
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
													    <a href="#" class="text-decoration-none" onclick="showVolunteerDetail(${vol.voId})">
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
		                                                            onclick="location.href='/volunteer/manage/volForm?voId=${vol.voId}'"
						                                            title="수정">
		                                                        <i class="fas fa-edit"></i>
		                                                    </button>
		                                                    <button type="button" class="btn btn-sm btn-outline-danger"
		                                                            onclick="deleteVolunteer(${vol.voId})"
						                                            title="삭제">
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
		                
			                <!-- 상세보기 모달 -->
							<div class="modal fade" id="volunteerDetailModal" tabindex="-1" aria-labelledby="volunteerDetailModalLabel" aria-hidden="true">
							    <div class="modal-dialog modal-xl">
							        <div class="modal-content">
							            <div class="modal-header">
							                <h5 class="modal-title" id="volunteerDetailModalLabel">신청자 목록</h5>
							                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							            </div>
							            <div class="modal-body">
							                <div class="table-responsive">
							                    <table class="table">
							                        <colgroup>
							                            <col style="width: 10%">
							                            <col style="width: 12%">
							                            <col style="width: 12%">
							                            <col style="width: 15%">
							                            <col style="width: 20%">
							                            <col style="width: 10%">
							                            <col style="width: 10%">
							                            <col style="width: 11%">
							                        </colgroup>
							                        <thead>
							                            <tr>
							                                <th>상태</th>
							                                <th>이름</th>
							                                <th>생년월일</th>
							                                <th>연락처</th>
							                                <th>이메일</th>
							                                <th>반려동물 경험</th>
							                                <th>정보수신동의</th>
							                                <th>관리</th>
							                            </tr>
							                        </thead>
							                        <tbody id="applicantsList">
							                            <!-- 동적으로 채워질 영역 -->
							                        </tbody>
							                    </table>
							                </div>
							            </div>
							        </div>
							    </div>
							</div>
			
							
							<!-- 거절 사유 입력 모달 -->
							<div class="modal fade" id="rejectReasonModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="static">
							    <div class="modal-dialog modal-dialog-centered">
							        <div class="modal-content">
							            <div class="modal-header">
							                <h5 class="modal-title">신청 거절 사유</h5>
							                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							            </div>
							            <div class="modal-body">
							                <input type="hidden" id="rejectApplicationId">
							                <div class="mb-3">
							                    <label for="rejectReason" class="form-label">거절 사유</label>
							                    <select class="form-select" id="rejectReason" required>
							                        <option value="">선택해주세요</option>
							                        <option value="정원초과">정원초과</option>
							                        <option value="일정변경">일정변경</option>
							                        <option value="자격미달">자격미달</option>
							                        <option value="신청정보 부적절">신청정보 부적절</option>
							                        <option value="봉사자 요건 미충족">봉사자 요건 미충족</option>
							                        <option value="기타">기타</option>
							                    </select>
							                </div>
							                <div class="mb-3">
							                    <label for="rejectReasonDetail" class="form-label">거절 사유 상세</label>
							                    <textarea class="form-control" id="rejectReasonDetail" rows="3" 
							                        placeholder="거절 사유에 대해 자세히 설명해주세요." required></textarea>
							                </div>
							            </div>
							            <div class="modal-footer">
							                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							                <button type="button" class="btn btn-danger" onclick="submitReject()">거절하기</button>
							            </div>
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
		             		</div>
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
$(document).ready(function() {
    // 검색 폼 제출
    $('#searchForm').on('submit', function(e) {
        e.preventDefault();
        goToPage(1);
    });

 	// 거절 사유 모달이 닫힐 때 처리
    $('#rejectReasonModal').on('hidden.bs.modal', function () {
        // 입력 필드 초기화
        $('#rejectReason').val('');
        $('#rejectReasonDetail').val('');
        
        // backdrop이 남아있는 경우 처리
        if ($('.modal-backdrop').length > 1) {
            $('.modal-backdrop').not(':first').remove();
        }
    });

    // 메인 모달이 닫힐 때 처리
    $('#volunteerDetailModal').on('hidden.bs.modal', function () {
        // backdrop과 모달 관련 클래스 제거
        $('.modal-backdrop').remove();
        $('body').removeClass('modal-open').css('padding-right', '');
    });
});

window.deleteVolunteer = function(voId) {
    Swal.fire({
        title: '삭제 확인',
        text: '해당 봉사활동 공고를 삭제하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '삭제',
        cancelButtonText: '취소',
        reverseButtons: false
    }).then((result) => {
        if (result.isConfirmed) {
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            
            $.ajax({
                url: '/volunteer/manage/delete/' + voId,
                type: 'POST',
                beforeSend: function(xhr) {
                    if (token && header) {
                        xhr.setRequestHeader(header, token);
                    }
                },
                success: function() {
                    Swal.fire({
                        title: '삭제 완료',
                        text: '성공적으로 삭제되었습니다.',
                        icon: 'success',
                        confirmButtonText: '확인'
                    }).then(() => {
                        location.reload();
                    });
                },
                error: function(xhr) {
                    console.error('Error:', xhr);
                    var errorMsg = xhr.responseText || '서버 오류가 발생했습니다.';
                    Swal.fire({
                        title: '삭제 실패',
                        text: errorMsg,
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            });
        }
    });
};

function closeRecruitment(voId) {
    Swal.fire({
        title: '모집 마감',
        text: '해당 봉사활동 모집을 마감하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '마감',
        cancelButtonText: '취소',
        reverseButtons: false
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '/volunteer/manage/close/' + voId,
                type: 'POST',
                success: function() {
                    Swal.fire({
                        title: '마감 완료',
                        text: '모집이 마감되었습니다.',
                        icon: 'success',
                        confirmButtonText: '확인'
                    }).then(() => {
                        location.reload();
                    });
                },
                error: function() {
                    Swal.fire({
                        title: '마감 실패',
                        text: '마감 처리 중 오류가 발생했습니다.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            });
        }
    });
}

function openRecruitment(voId) {
    Swal.fire({
        title: '모집 시작',
        text: '해당 봉사활동 모집을 시작하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '시작',
        cancelButtonText: '취소',
        reverseButtons: false
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '/volunteer/manage/open/' + voId,
                type: 'POST',
                success: function() {
                    Swal.fire({
                        title: '모집 시작',
                        text: '모집이 시작되었습니다.',
                        icon: 'success',
                        confirmButtonText: '확인'
                    }).then(() => {
                        location.reload();
                    });
                },
                error: function() {
                    Swal.fire({
                        title: '시작 실패',
                        text: '모집 처리 중 오류가 발생했습니다.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            });
        }
    });
}

function formatDate(dateString) {
    if (!dateString) return '';
    var date = new Date(dateString);
    return date.getFullYear() + '-' + 
           String(date.getMonth() + 1).padStart(2, '0') + '-' + 
           String(date.getDate()).padStart(2, '0');
}

function showVolunteerDetail(voId) {
	const volunteerDetailModal = document.getElementById('volunteerDetailModal');
    volunteerDetailModal.setAttribute('data-volunteer-id', voId);
    
    $.ajax({
        url: '/volunteer/manage/detail/' + voId,
        type: 'GET',
        success: function(response) {
            const applicantsList = $('#applicantsList');
            applicantsList.empty();
            
            if (response.applications && response.applications.length > 0) {
                response.applications.forEach(function(app) {
                    // 신청자 정보 행
                    const infoRow = '<tr class="applicant-info-row">' +
                        '<td>' + getStatusBadge(app.status) + '</td>' +
                        '<td>' + app.voApplicant + '</td>' +
                        '<td>' + formatDate(app.voBirth) + '</td>' +
                        '<td>' + app.voTel + '</td>' +
                        '<td>' + app.voEmail + '</td>' +
                        '<td>' + (app.voExperience === 'Y' ? '있음' : '없음') + '</td>' +
                        '<td>' + (app.voAgree === 'Y' ? '동의' : '거부') + '</td>' +
                        '<td>' +
                            '<div class="action-buttons">' +
                                (app.status === 'PENDING' ? 
                                    '<div class="btn-group me-2">' +
                                        '<button type="button" class="btn btn-sm btn-success" onclick="approveApplication(' + app.voId + ')">' +
                                            '승인' +
                                        '</button>' +
                                        '<button type="button" class="btn btn-sm btn-danger" onclick="showRejectModal(' + app.voId + ')">' +
                                            '거절' +
                                        '</button>' +
                                    '</div>' : '') +
                                '<button type="button" class="btn btn-sm btn-outline-primary" onclick="toggleReason(this, ' + app.voId + ')">' +
                                    '<i class="fas fa-chevron-down"></i> 사유' +
                                '</button>' +
                            '</div>' +
                        '</td>' +
                    '</tr>';
                    
                    // 신청사유 행 (초기에는 숨김)
                    const reasonRow = '<tr class="reason-row" id="reason-' + app.voId + '" style="display: none;">' +
                        '<td colspan="8">' +
                            '<div class="reason-content">' +
                                '<strong>신청사유</strong><br>' +
                                '<div class="reason-text">' + (app.voReason || '-') + '</div>' +
                            '</div>' +
                        '</td>' +
                    '</tr>';
                    
                    applicantsList.append(infoRow + reasonRow);
                });
            } else {
                applicantsList.append('<tr><td colspan="8" class="text-center">신청자가 없습니다.</td></tr>');
            }
            
            const modal = new bootstrap.Modal(document.getElementById('volunteerDetailModal'));
            modal.show();
        },
        error: function() {
            alert('데이터를 불러오는 중 오류가 발생했습니다.');
        }
    });
}

// 사유 토글 함수 추가
function toggleReason(button, voId) {
    const reasonRow = document.getElementById('reason-' + voId);
    const icon = button.querySelector('i');
    
    if (reasonRow.style.display === 'none') {
        reasonRow.style.display = '';
        icon.classList.remove('fa-chevron-down');
        icon.classList.add('fa-chevron-up');
        button.classList.add('active');
    } else {
        reasonRow.style.display = 'none';
        icon.classList.remove('fa-chevron-up');
        icon.classList.add('fa-chevron-down');
        button.classList.remove('active');
    }
}

function getStatusBadge(status) {
    const statusMap = {
        'PENDING': '<span class="status-badge status-pending">신청대기</span>',
        'APPROVED': '<span class="status-badge status-approved">신청완료</span>',
        'REJECTED': '<span class="status-badge status-rejected">신청거절</span>',
        'CANCELED': '<span class="status-badge status-canceled">취소완료</span>'
    };
    return statusMap[status] || '';
}

function approveApplication(voId) {
    Swal.fire({
        title: '승인 확인',
        text: '해당 신청을 승인하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '승인',
        cancelButtonText: '취소',
        reverseButtons: false
    }).then((result) => {
        if (result.isConfirmed) {
            const volunteerDetailModal = document.getElementById('volunteerDetailModal');
            const currentVolId = volunteerDetailModal.getAttribute('data-volunteer-id');
            
            $.ajax({
                url: '/volunteer/manage/approve/' + voId,
                type: 'POST',
                success: function() {
                    Swal.fire({
                        title: '승인 완료',
                        text: '신청이 승인되었습니다.',
                        icon: 'success',
                        confirmButtonText: '확인'
                    }).then(() => {
                        showVolunteerDetail(currentVolId);
                    });
                },
                error: function() {
                    Swal.fire({
                        title: '승인 실패',
                        text: '승인 처리 중 오류가 발생했습니다.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            });
        }
    });
}

function showRejectModal(voId) {
    $('#rejectApplicationId').val(voId);
    $('#rejectReason').val('');
    $('#rejectReasonDetail').val('');

    // 거절 모달 열기 전 세팅
    const rejectModal = new bootstrap.Modal(document.getElementById('rejectReasonModal'), {
        backdrop: 'static'  // 배경 클릭으로 모달이 닫히지 않도록 설정
    });
    rejectModal.show();
}

function showRejectModal(voId) {
    const rejectModal = new bootstrap.Modal(document.getElementById('rejectReasonModal'), {
        backdrop: 'static'
    });
    $('#rejectApplicationId').val(voId);
    $('#rejectReason').val('');
    $('#rejectReasonDetail').val('');
    rejectModal.show();
}

// 거절 제출
function submitReject() {
    const voId = $('#rejectApplicationId').val();
    const reason = $('#rejectReason').val();
    const reasonDetail = $('#rejectReasonDetail').val();
    const currentVolId = document.getElementById('volunteerDetailModal').getAttribute('data-volunteer-id');
    
    if (!reason) {
        Swal.fire({
            title: '입력 필요',
            text: '거절 사유를 선택해주세요.',
            icon: 'warning',
            confirmButtonText: '확인'
        });
        return;
    }
    if (!reasonDetail) {
        Swal.fire({
            title: '입력 필요',
            text: '거절 사유 상세내용을 입력해주세요.',
            icon: 'warning',
            confirmButtonText: '확인'
        });
        return;
    }
    
    Swal.fire({
        title: '거절 확인',
        text: '해당 신청을 거절하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '거절',
        cancelButtonText: '취소',
        reverseButtons: false
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '/volunteer/manage/reject/' + voId,
                type: 'POST',
                data: { 
                    reason: reason,
                    reasonDetail: reasonDetail
                },
                success: function() {
                    Swal.fire({
                        title: '거절 완료',
                        text: '신청이 거절되었습니다.',
                        icon: 'success',
                        confirmButtonText: '확인'
                    }).then(() => {
                        // 거절 사유 모달 닫기
                        const rejectModal = bootstrap.Modal.getInstance(document.getElementById('rejectReasonModal'));
                        if (rejectModal) {
                            rejectModal.hide();
                        }
                        // 신청자 목록 새로고침
                        showVolunteerDetail(currentVolId);
                    });
                },
                error: function() {
                    Swal.fire({
                        title: '거절 실패',
                        text: '거절 처리 중 오류가 발생했습니다.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            });
        }
    });
}

window.goToPage = function(page) {
    var recruitStatus = $('select[name="recruitStatus"]').val();
    var keyword = $('input[name="keyword"]').val();
    var startDate = $('input[name="startDate"]').val();
    var endDate = $('input[name="endDate"]').val();
    
    var params = new URLSearchParams();
    params.append('page', page);
    params.append('size', '10');
    
    if (recruitStatus) params.append('recruitStatus', recruitStatus);
    if (keyword) params.append('keyword', keyword);
    if (startDate) params.append('startDate', startDate);
    if (endDate) params.append('endDate', endDate);
    
    window.location.href = '/volunteer/manage?' + params.toString(); 
};

// 검색 초기화
window.resetSearch = function() {
    window.location.href = '/volunteer/manage?page=1&size=10';
};

</script>
</body>
</html>