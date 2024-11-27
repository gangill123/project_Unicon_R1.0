<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ include file="../inc/new_topHeader.jsp" %>

<!-- CSS 파일 -->
<link href="${pageContext.request.contextPath}/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets_sub/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
	.volunteer-card {
	    cursor: pointer;
	    transition: transform 0.2s;
	    height: 100%;
	    border: 1px solid #dee2e6;
	    border-radius: 8px;
	}
	
	.volunteer-card:hover {
	    transform: translateY(-5px);
	    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
	}
	
	.status-badge {
	    position: absolute;
	    top: 10px;
	    right: 10px;
	    z-index: 1;
	}
	
	.card-info {
	    padding: 1.25rem;
	}
	
	.date-info {
	    font-size: 0.9rem;
	    color: #6c757d;
	}
	
	.tab-content {
	    padding: 20px 0;
	}
	
	.volunteer-info {
	    background: #f8f9fa;
	    padding: 2rem;
	    border-radius: 8px;
	    margin-bottom: 2rem;
	}
	
	.info-grid {
	    display: flex;
	    flex-direction: column;
	    gap: 2rem;
	}
	
	.info-grid .row:first-child {
	    margin-bottom: 0;
	}
	
	.info-grid .row {
	    display: flex;
	    margin: 0;
	}
	
	.info-grid .col-md-4 {
	    flex: 1;
	    padding: 0 1rem;
	}
	
	@media (max-width: 768px) {
    .info-grid .row {
        flex-direction: column;
        gap: 1.5rem;
    }
    
    .info-grid .col-md-4 {
        width: 100%;
    }
    
    .info-grid {
        gap: 1.5rem;
    }
}
	
	.info-item {
	    display: flex;
	    align-items: start;
	    gap: 1rem;
	}
	
	.info-icon {
	    font-size: 1.5rem;
	    color: #0d6efd;
	}
	
	.nav-tabs .nav-link {
	    padding: 1rem 2rem;
	    font-weight: 500;
	}
	
	.nav-tabs .nav-link.active {
	    border-bottom: 3px solid #0d6efd;
	}
</style>

<%@ include file="../inc/new_header.jsp" %>

<div class="container-xxl py-5">
    <div class="container">
        <!-- 봉사활동 안내 섹션 -->
        <div class="volunteer-info">
		    <h4 class="mb-4">봉사활동 안내</h4>
		    <div class="info-grid">
		        <!-- 첫 번째 줄: 봉사장소, 모집대상, 활동내용 -->
		        <div class="row mb-4">
		            <div class="col-md-4">
		                <div class="info-item">
		                    <i class="fas fa-map-marker-alt info-icon"></i>
		                    <div>
		                        <h6>봉사장소</h6>
		                        <p>${volunteerInfo.voLocation}</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-4">
		                <div class="info-item">
		                    <i class="fas fa-users info-icon"></i>
		                    <div>
		                        <h6>모집대상</h6>
		                        <p>${volunteerInfo.voTarget}</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-4">
		                <div class="info-item">
		                    <i class="fas fa-tasks info-icon"></i>
		                    <div>
		                        <h6>활동내용</h6>
		                        <p>${volunteerInfo.voContent}</p>
		                    </div>
		                </div>
		            </div>
		        </div>
		        
		        <!-- 두 번째 줄: 모집인원, 담당자, 연락처 -->
		        <div class="row">
		            <div class="col-md-4">
		                <div class="info-item">
		                    <i class="fas fa-user-friends info-icon"></i>
		                    <div>
		                        <h6>모집인원</h6>
		                        <p>${volunteerInfo.voCapacity}명</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-4">
		                <div class="info-item">
		                    <i class="fas fa-user-tie info-icon"></i>
		                    <div>
		                        <h6>담당자</h6>
		                        <p>${volunteerInfo.voManager}</p>
		                    </div>
		                </div>
		            </div>
		            <div class="col-md-4">
		                <div class="info-item">
		                    <i class="fas fa-phone info-icon"></i>
		                    <div>
		                        <h6>연락처</h6>
		                        <p>${volunteerInfo.voContact}</p>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>

        <!-- 공고 내역 탭 -->
        <ul class="nav nav-tabs mb-4" id="volunteerTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#ongoing">
                    모집중인 봉사활동
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" data-bs-toggle="tab" data-bs-target="#closed">
                    마감된 봉사활동
                </button>
            </li>
        </ul>

        <div class="tab-content">
            <!-- 모집중인 봉사활동 -->
            <div class="tab-pane fade show active" id="ongoing">
                <div class="row g-4">
                    <c:forEach items="${ongoingVolunteers}" var="volunteer">
                        <div class="col-lg-4 col-md-6">
                            <div class="volunteer-card">
                                <div class="status-badge">
                                    <span class="badge bg-success">모집중</span>
                                </div>
                                <div class="card-info">
                                    <h5 class="mb-3">${volunteer.voTitle}</h5>
                                    <div class="date-info mb-2">
                                        <p><i class="far fa-calendar-alt me-2"></i>모집기간: 
                                        <fmt:formatDate value="${volunteer.voRecruitStart}" pattern="yyyy.MM.dd"/> - 
                                        <fmt:formatDate value="${volunteer.voRecruitEnd}" pattern="yyyy.MM.dd"/></p>
                                        <p><i class="far fa-clock me-2"></i>봉사기간: 
                                        <fmt:formatDate value="${volunteer.voStartDate}" pattern="yyyy.MM.dd"/> - 
                                        <fmt:formatDate value="${volunteer.voEndDate}" pattern="yyyy.MM.dd"/></p>
                                    </div>
                                    <button class="btn btn-primary w-100" 
                                            onclick="location.href='/volunteer/apply/${volunteer.voId}'">
                                        신청하기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- 마감된 봉사활동 -->
            <div class="tab-pane fade" id="closed">
                <div class="row g-4">
                    <c:forEach items="${closedVolunteers}" var="volunteer">
                        <div class="col-lg-4 col-md-6">
                            <div class="volunteer-card">
                                <div class="status-badge">
                                    <span class="badge bg-secondary">마감</span>
                                </div>
                                <div class="card-info">
                                    <h5 class="mb-3">${volunteer.voTitle}</h5>
                                    <div class="date-info mb-2">
                                        <p><i class="far fa-calendar-alt me-2"></i>모집기간: 
                                        <fmt:formatDate value="${volunteer.voRecruitStart}" pattern="yyyy.MM.dd"/> - 
                                        <fmt:formatDate value="${volunteer.voRecruitEnd}" pattern="yyyy.MM.dd"/></p>
                                        <p><i class="far fa-clock me-2"></i>봉사기간: 
                                        <fmt:formatDate value="${volunteer.voStartDate}" pattern="yyyy.MM.dd"/> - 
                                        <fmt:formatDate value="${volunteer.voEndDate}" pattern="yyyy.MM.dd"/></p>
                                    </div>
                                    <button class="btn btn-secondary w-100" disabled>마감됨</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="../inc/new_footer.jsp" %>