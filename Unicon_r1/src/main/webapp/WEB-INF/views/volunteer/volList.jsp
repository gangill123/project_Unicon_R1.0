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
/* 탭 스타일 */
.nav-tabs {
    border-bottom: 1px solid #dee2e6;
    margin-bottom: 2rem;
}

.nav-tabs .nav-link {
    border: none;
    padding: 1rem 2rem;
    font-weight: 500;
    color: #6c757d;
    position: relative;
}

.nav-tabs .nav-link.active {
    background: transparent;
    color: #86BC42;
    border-bottom: 3px solid #86BC42;
}

/* 카드 스타일 */
.volunteer-card {
    cursor: pointer;
    transition: transform 0.2s;
    height: 100%;
    border: 1px solid #e9ecef;
    border-radius: 12px;
    background: white;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
}

.volunteer-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

.card-info {
    padding: 1.5rem;
}

.vol-category {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
    margin-bottom: 1rem;
    justify-content: space-between;
    align-items: center;
    min-width: 0;
}

.card-info-left {
    display: flex;
    align-items: center;
    flex: 1;
    min-width: 0; /* 이 속성이 없으면 말줄임표가 적용되지 않을 수 있음 */
    gap: 8px; /* 뱃지 사이 간격 */
}

.target-badge {
    background-color: #e7f3ff;  
    color: #0d6efd;
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 0.875rem;
    font-weight: 500;
}

.location-badge {
    background-color: #f8f9fa;
    color: #495057;
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 0.875rem;
    font-weight: 500;
}

.target-badge, .location-badge {
    max-width: 200px; /* 적절한 최대 너비 설정 */
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    display: inline-block;
}

.vol-title {
    color: #1a1a1a;
    font-size: 1.25rem;
    font-weight: 600;
    line-height: 1.4;
    margin-bottom: 1rem;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2; /* 최대 2줄까지 표시 */
    -webkit-box-orient: vertical;
    word-break: keep-all; /* 단어 단위로 줄바꿈 */
}

.date-info {
    background-color: #f8f9fa;
    border-radius: 8px;
    padding: 1rem;
    margin-bottom: 1rem;
}

.date-info p {
    margin-bottom: 0.5rem;
    color: #495057;
    font-size: 0.925rem;
}

.date-info p:last-child {
    margin-bottom: 0;
}

.date-info i {
    color: #86BC42;
}

/* 장바구니 뱃지 스타일 */
.cart-badge {
    position: absolute;
    top: -10px;
    right: -10px;
    padding: 4px 6px;
    border-radius: 50%;
    font-size: 10px;
}

/* 상태 뱃지 스타일 */
.status-badge {
    display: inline-block;
    padding: 5px 10px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: 600;
}

.status-badge.bg-success {
    background-color: #28a745;
    color: white;
}

.status-badge.bg-secondary {
    background-color: #6c757d;
    color: white;
}

.btn-primary {
    text-transform: none;
    font-weight: 600;
    padding: 0.75rem 1.5rem;
    border-radius: 8px;
    background-color: #86BC42;
    border-color: #86BC42;
}

.btn-primary:hover {
	color: white;
    background-color: #348E38;
    border-color: #348E38;
    box-shadow: 0 4px 12px rgba(134, 188, 66, 0.15);
}

/* 아웃라인 버튼 스타일 수정 */
.btn-outline-primary {
    color: #86BC42;
    border-color: #86BC42;
}

.btn-outline-primary:hover {
    background-color: #86BC42;
    border-color: #86BC42;
    color: white;
}

@media (max-width: 768px) {
    .volunteer-card {
        margin-bottom: 1rem;
    }
    
    .card-info {
        padding: 1.25rem;
    }
    
    .vol-title {
        font-size: 1.1rem;
    }
    
    .vol-category {
        display: flex;
	    gap: 8px;
	    flex-wrap: wrap;
	    margin-bottom: 1rem;
    }
    
    .target-badge,
    .location-badge {
        font-size: 0.8rem;
        padding: 3px 10px;
        display: inline-flex; 
        align-items: center;
    }
    
    .date-info {
        padding: 0.875rem;
    }
    
    .date-info p {
        font-size: 0.85rem;
    }
    
    .status-badge {
        top: 0.75rem;
        right: 0.75rem;
    }
    
    .status-badge .badge {
        padding: 0.4rem 0.8rem;
        font-size: 0.8rem;
    }
    
    .btn-primary {
        padding: 0.6rem 1.25rem;
        font-size: 0.9rem;
    }
}
</style>

<%@ include file="../inc/new_header.jsp" %>

<div class="container-xxl py-5">
    <div class="container">
    	<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            <h1 class="mb-3">봉사활동 공고</h1>
            <p>유니콘과 함께하는 따뜻한 나눔의 여정을 알려드립니다</p>
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
		        <div class="row g-4" id="ongoingList">
		            <c:forEach items="${ongoingVolunteers}" var="volunteer" varStatus="status">
		                <div class="col-lg-4 col-md-6 volunteer-item ${status.index >= 6 ? 'd-none' : ''}">
		                    <div class="volunteer-card">
		                        <div class="card-info">
		                            <div class="vol-category">
		                                <div class="card-info-left">
		                                <span class="target-badge">${volunteer.voTarget}</span>
		                                <span class="location-badge">
		                                    <i class="fas fa-map-marker-alt me-1"></i>${volunteer.voLocation}
		                                </span>
		                                </div>
		                            	<span class="status-badge bg-success">모집중</span>
		                            </div>
		                            <h5 class="vol-title">${volunteer.voTitle}</h5>
		                            <div class="date-info">
		                                <p>
		                                    <i class="far fa-calendar-alt me-2"></i>모집기간: 
		                                    <fmt:formatDate value="${volunteer.voRecruitStart}" pattern="yyyy.MM.dd"/> - 
		                                    <fmt:formatDate value="${volunteer.voRecruitEnd}" pattern="yyyy.MM.dd"/>
		                                </p>
		                                <p>
		                                    <i class="far fa-clock me-2"></i>봉사기간: 
		                                    <fmt:formatDate value="${volunteer.voStartDate}" pattern="yyyy.MM.dd"/> - 
		                                    <fmt:formatDate value="${volunteer.voEndDate}" pattern="yyyy.MM.dd"/>
		                                </p>
		                            </div>
		                            <button class="btn btn-primary w-100" onclick="location.href='/volunteer/apply/${volunteer.voId}'">
		                                신청하기
		                            </button>
		                        </div>
		                    </div>
		                </div>
		            </c:forEach>
		        </div>
		        <c:if test="${fn:length(ongoingVolunteers) > 6}">
		            <div class="text-center mt-4">
		                <button class="btn btn-outline-primary" id="loadMoreOngoing">더보기</button>
		            </div>
		        </c:if>
		    </div>

            <!-- 마감된 봉사활동 -->
            <div class="tab-pane fade" id="closed">
			   <div class="row g-4" id="closedList">
			       <c:forEach items="${closedVolunteers}" var="volunteer" varStatus="status">
			           <div class="col-lg-4 col-md-6 volunteer-item ${status.index >= 6 ? 'd-none' : ''}">
			               <div class="volunteer-card">
			                   <div class="card-info">
			                       <div class="vol-category">
			                           <div class="card-info-left">
			                           <span class="target-badge">${volunteer.voTarget}</span>
			                           <span class="location-badge">
			                               <i class="fas fa-map-marker-alt me-1"></i>${volunteer.voLocation}
			                           </span>
			                           </div>
			                           <span class="status-badge bg-secondary">마감</span>
			                       </div>
			                       <h5 class="vol-title">${volunteer.voTitle}</h5>
			                       <div class="date-info">
			                           <p>
			                               <i class="far fa-calendar-alt me-2"></i>모집기간: 
			                               <fmt:formatDate value="${volunteer.voRecruitStart}" pattern="yyyy.MM.dd"/> - 
			                               <fmt:formatDate value="${volunteer.voRecruitEnd}" pattern="yyyy.MM.dd"/>
			                           </p>
			                           <p>
			                               <i class="far fa-clock me-2"></i>봉사기간: 
			                               <fmt:formatDate value="${volunteer.voStartDate}" pattern="yyyy.MM.dd"/> - 
			                               <fmt:formatDate value="${volunteer.voEndDate}" pattern="yyyy.MM.dd"/>
			                           </p>
			                       </div>
			                       <button class="btn btn-secondary w-100" disabled>모집마감</button>
			                   </div>
			               </div>
			           </div>
			       </c:forEach>
			   </div>
			   <c:if test="${fn:length(closedVolunteers) > 6}">
			       <div class="text-center mt-4">
			           <button class="btn btn-outline-primary" id="loadMoreClosed">더보기</button>
			       </div>
			   </c:if>
			</div>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
$(document).ready(function() {
	$('.navbar #news').addClass('current');
});

document.getElementById('loadMoreOngoing').addEventListener('click', function() {
    const hiddenItems = document.querySelectorAll('#ongoingList .volunteer-item.d-none');
    const itemsToShow = Array.from(hiddenItems).slice(0, 6);
    
    itemsToShow.forEach(item => item.classList.remove('d-none'));
    
    if (hiddenItems.length <= 6) {
        this.style.display = 'none';
    }
});

document.getElementById('loadMoreClosed').addEventListener('click', function() {
    const hiddenItems = document.querySelectorAll('#closedList .volunteer-item.d-none');
    const itemsToShow = Array.from(hiddenItems).slice(0, 6);
    
    itemsToShow.forEach(item => item.classList.remove('d-none'));
    
    if (hiddenItems.length <= 6) {
        this.style.display = 'none';
    }
});
</script>

<%@ include file="../inc/new_footer.jsp" %>