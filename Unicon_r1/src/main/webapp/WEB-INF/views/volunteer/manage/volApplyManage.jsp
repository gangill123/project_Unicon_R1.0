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
            <div class="page-header">
                <h3 class="page-title">봉사활동 신청자 관리</h3>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col">
                            <select class="form-select" id="volunteerSelect">
                                <option value="">봉사활동 선택</option>
                                <c:forEach items="${volunteers}" var="vol">
                                    <option value="${vol.voId}">${vol.voTitle}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col">
                            <select class="form-select" id="statusSelect">
                                <option value="">전체 상태</option>
                                <option value="PENDING">대기중</option>
                                <option value="APPROVED">승인</option>
                                <option value="REJECTED">거절</option>
                            </select>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>신청일</th>
                                    <th>봉사활동명</th>
                                    <th>신청자명</th>
                                    <th>연락처</th>
                                    <th>반려동물 경험</th>
                                    <th>상태</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${applications}" var="app">
                                    <tr>
                                        <td><fmt:formatDate value="${app.voRegDate}" pattern="yyyy-MM-dd"/></td>
                                        <td>${app.volunteerInfo.voTitle}</td>
                                        <td>${app.voApplicant}</td>
                                        <td>${app.voTel}</td>
                                        <td>${app.voExperience == 'Y' ? '있음' : '없음'}</td>
                                        <td>
                                            <span class="badge ${app.status == 'PENDING' ? 'bg-warning' : 
                                                                 app.status == 'APPROVED' ? 'bg-success' : 'bg-danger'}">
                                                ${app.status == 'PENDING' ? '대기' : 
                                                 app.status == 'APPROVED' ? '승인' : '거절'}
                                            </span>
                                        </td>
                                        <td>
                                            <c:if test="${app.status == 'PENDING'}">
                                                <button type="button" class="btn btn-sm btn-success" 
                                                        onclick="approveApplication(${app.voId})">승인</button>
                                                <button type="button" class="btn btn-sm btn-danger" 
                                                        onclick="showRejectModal(${app.voId})">거절</button>
                                            </c:if>
                                            <button type="button" class="btn btn-sm btn-info" 
                                                    onclick="viewDetails(${app.voId})">상세</button>
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

			            <!-- 거절 사유 입력 모달 -->
			            <div class="modal fade" id="rejectModal" tabindex="-1">
			                <div class="modal-dialog">
			                    <div class="modal-content">
			                        <div class="modal-header">
			                            <h5 class="modal-title">거절 사유 입력</h5>
			                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			                        </div>
			                        <div class="modal-body">
			                            <textarea class="form-control" id="rejectReason" rows="3" 
			                                      placeholder="거절 사유를 입력해주세요"></textarea>
			                        </div>
			                        <div class="modal-footer">
			                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			                            <button type="button" class="btn btn-danger" id="confirmReject">확인</button>
			                        </div>
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
		// 승인 처리
		function approveApplication(voId) {
		    if (!confirm('해당 신청을 승인하시겠습니까?')) return;
		    
		    $.ajax({
		        url: '/admin/volunteer/approve/' + voId,
		        type: 'POST',
		        success: function(response) {
		            alert('승인되었습니다.');
		            location.reload();
		        },
		        error: function(xhr) {
		            alert('승인 처리 중 오류가 발생했습니다.');
		        }
		    });
		}
		
		// 거절 모달 표시
		let selectedVoId;
		function showRejectModal(voId) {
		    selectedVoId = voId;
		    $('#rejectModal').modal('show');
		}
		
		// 거절 처리
		$('#confirmReject').click(function() {
		    const reason = $('#rejectReason').val().trim();
		    if (!reason) {
		        alert('거절 사유를 입력해주세요.');
		        return;
		    }
		    
		    $.ajax({
		        url: '/admin/volunteer/reject/' + selectedVoId,
		        type: 'POST',
		        data: { reason: reason },
		        success: function(response) {
		            alert('거절되었습니다.');
		            $('#rejectModal').modal('hide');
		            location.reload();
		        },
		        error: function(xhr) {
		            alert('거절 처리 중 오류가 발생했습니다.');
		        }
		    });
		});
		
		// 상세 정보 보기
		function viewDetails(voId) {
		    window.location.href = '/admin/volunteer/application/' + voId;
		}
		
		// 필터링
		$('#volunteerSelect, #statusSelect').change(function() {
		    const volunteerId = $('#volunteerSelect').val();
		    const status = $('#statusSelect').val();
		    
		    let url = '/admin/volunteer/applications?page=1';
		    if (volunteerId) url += '&volunteerId=' + volunteerId;
		    if (status) url += '&status=' + status;
		    
		    window.location.href = url;
		});
	</script>
</body>
</html>