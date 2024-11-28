<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../inc/new_topHeader.jsp" %>

<!-- CSS 파일 -->
<link href="${pageContext.request.contextPath}/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets_sub/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
    .application-card {
        border: 1px solid #dee2e6;
        border-radius: 8px;
        transition: transform 0.2s;
        margin-bottom: 1.5rem;
        background-color: #fff;
    }
    
    .application-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    
    .card-header {
        background-color: #f8f9fa;
        border-bottom: 1px solid #dee2e6;
        padding: 1rem;
        border-radius: 8px 8px 0 0;
    }
    
    .card-body {
        padding: 1.5rem;
    }
    
    .status-badge {
        font-size: 0.9rem;
        padding: 0.5rem 1rem;
        border-radius: 20px;
    }
    
    .status-pending {
        background-color: #ffd700;
        color: #000;
    }
    
    .status-approved {
        background-color: #28a745;
        color: #fff;
    }
    
    .status-rejected {
        background-color: #dc3545;
        color: #fff;
    }
    
    .info-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 1rem;
        margin-bottom: 1rem;
    }
    
    .info-item {
        display: flex;
        align-items: start;
        gap: 0.5rem;
    }
    
    .info-icon {
        color: #0d6efd;
        font-size: 1.2rem;
        width: 24px;
    }
    
    .page-title {
        margin-bottom: 2rem;
        padding-bottom: 1rem;
        border-bottom: 2px solid #dee2e6;
    }
    
    .cancel-btn {
        background-color: #6c757d;
        color: white;
        border: none;
        padding: 0.5rem 1rem;
        border-radius: 4px;
        transition: background-color 0.2s;
    }
    
    .cancel-btn:hover {
        background-color: #5a6268;
    }
    
    .cancel-btn:disabled {
        background-color: #dee2e6;
        cursor: not-allowed;
    }
    
    @media (max-width: 768px) {
        .info-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<%@ include file="../inc/new_header.jsp" %>

<div class="container-xxl py-5">
    <div class="container">
        <div class="page-title">
            <h3><i class="fas fa-clipboard-list me-3"></i>나의 봉사활동 신청현황</h3>
        </div>

        <div class="application-list">
            <c:forEach items="${applications}" var="application">
                <div class="application-card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <%-- <h5 class="mb-0">${application.voTitle}</h5> --%>
                        <h5 class="mb-0">신청일자 ${application.voRegDate}</h5>
                        
                        <span class="status-badge 
                            ${application.status eq 'PENDING' ? 'status-pending' : 
                              application.status eq 'APPROVED' ? 'status-approved' : 
                              'status-rejected'}">
                            ${application.status eq 'PENDING' ? '신청대기' : 
                              application.status eq 'APPROVED' ? '신청완료' : 
                              '신청거절'}
                        </span>
                    </div>
                    <div class="card-body">
                        <div class="info-grid">
                            <div class="info-item">
                                <i class="fas fa-user info-icon"></i>
                                <div>
                                    <strong>봉사활동명</strong><br>
                                    ${application.voTitle}
                                </div>
                            </div>
                            <div class="info-item">
                                <i class="fas fa-tasks info-icon"></i>
                                <div>
                                    <strong>활동내용</strong><br>
                                    ${application.voContent}
                                </div>
                            </div>
                            <div class="info-item">
                                <i class="fas fa-map-marker-alt info-icon"></i>
                                <div>
                                    <strong>장소</strong><br>
                                    ${application.voLocation}
                                </div>
                            </div>
                            <div class="info-item">
                                <i class="far fa-calendar-alt info-icon"></i>
                                <div>
                                    <strong>봉사기간</strong><br>
                                    <fmt:formatDate value="${application.voStartDate}" pattern="yyyy.MM.dd"/> - 
                                    <fmt:formatDate value="${application.voEndDate}" pattern="yyyy.MM.dd"/>
                                </div>
                            </div>
                            <div class="info-item">
                                <i class="fas fa-user-tie info-icon"></i>
                                <div>
                                    <strong>담당자</strong><br>
                                    ${application.voManager}
                                </div>
                            </div>
                            <div class="info-item">
                                <i class="fas fa-phone info-icon"></i>
                                <div>
                                    <strong>연락처</strong><br>
                                    ${application.voContact}
                                </div>
                            </div>
                        </div>
                        
                        <c:if test="${not empty application.rejectReason}">
                            <div class="alert alert-danger mt-3">
                                <strong>거절사유:</strong> ${application.rejectReason}
                            </div>
                        </c:if>

                        <c:if test="${application.status eq 'PENDING'}">
                            <button class="cancel-btn" 
                                    onclick="cancelApplication(${application.voId})"
                                    ${application.status ne 'PENDING' ? 'disabled' : ''}>
                                신청취소
                            </button>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty applications}">
                <div class="text-center py-5">
                    <i class="fas fa-clipboard fa-3x mb-3 text-muted"></i>
                    <p class="text-muted">신청한 봉사활동이 없습니다.</p>
                </div>
            </c:if>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
function cancelApplication(voId) {
    if (confirm('봉사활동 신청을 취소하시겠습니까?')) {
        $.ajax({
            url: '/volunteer/cancel/' + voId,
            type: 'POST',
            data: {
                reason: '신청자 취소'
            },
            success: function(response) {
                alert('신청이 취소되었습니다.');
                location.reload();
            },
            error: function(xhr, status, error) {
                alert('신청 취소 중 오류가 발생했습니다.');
            }
        });
    }
}
</script>

<%@ include file="../inc/new_footer.jsp" %>