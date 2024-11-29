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
	/* 카드 스타일 */
	.application-card {
	    height: 100%;
	    border: 1px solid #dee2e6;
	    border-radius: 8px;
	    transition: transform 0.2s;
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
	
	/* 상태 배지 */
	.status-badge {
	    font-size: 0.9rem;
	    padding: 0.5rem 1rem;
	    border-radius: 20px;
	}
	
	.status-pending { background-color: #ffd700; color: #000; }
	.status-approved { background-color: #28a745; color: #fff; }
	.status-rejected { background-color: #dc3545; color: #fff; }
	
	/* 그리드 레이아웃 */
	.info-grid, .detail-grid {
	    display: grid;
	    grid-template-columns: repeat(2, 1fr);
	    gap: 1rem;
	    margin-bottom: 1rem;
	}
	
	/* 공통 아이템 스타일 */
	.info-item, .detail-item {
	    display: flex;
	    align-items: start;
	    gap: 0.5rem;
	    background-color: #f8f9fa;
	    padding: 1rem;
	    border-radius: 8px;
	    transition: transform 0.2s;
	}
	
	.detail-item {
	    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
	}
	
	.detail-item:hover {
	    transform: translateY(-2px);
	}
	
	.detail-item.full-width {
	    grid-column: 1 / -1;
	}
	
	/* 텍스트 스타일 */
	.info-item div {
	    word-break: break-word;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	}
	
	.detail-item strong {
	    display: block;
	    color: #495057;
	    font-size: 0.9rem;
	    margin-bottom: 0.5rem;
	}
	
	.detail-item p {
	    color: #212529;
	    margin: 0;
	    font-size: 1rem;
	    line-height: 1.5;
	}
	
	/* 아이콘 스타일 */
	.info-icon, .detail-icon {
	    color: #0d6efd;
	    font-size: 1.2rem;
	    width: 24px;
	}
	
	/* 버튼 스타일 */
	.btn-detail, .cancel-btn {
	    border: none;
	    padding: 0.5rem 1rem;
	    border-radius: 4px;
	    transition: background-color 0.2s;
	    color: white;
	}
	
	.btn-detail {
	    background-color: #0d6efd;
	}
	
	.btn-detail:hover {
	    background-color: #0b5ed7;
	}
	
	.cancel-btn {
	    background-color: #6c757d;
	}
	
	.cancel-btn:hover {
	    background-color: #5a6268;
	}
	
	.cancel-btn:disabled {
	    background-color: #dee2e6;
	    cursor: not-allowed;
	}
	
	.btn-danger {
	    background-color: #dc3545;
	    border-color: #dc3545;
	}
	
	.btn-danger:hover {
	    background-color: #bb2d3b;
	    border-color: #b02a37;
	}
	
	/* 아코디언 스타일 */
	.accordion-button {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    width: 100%;
	    background-color: #f8f9fa;
	    border: none;
	    box-shadow: none !important;
	    padding: 1.25rem;
	}
	
	/* 기존 화살표 제거 */
	.accordion-button::after {
	    display: none;
	}
	
	/* 선택 상태 텍스트 스타일 */
	.selection-text {
	    font-size: 0.9rem;
	    color: #0d6efd;
	}
	
	.accordion-button:not(.collapsed) {
	    background-color: #e7f1ff;
	    color: #0d6efd;
	}
	
	.accordion-item {
	    border: 1px solid rgba(0,0,0,.125);
	    margin-bottom: 0.5rem;
	    border-radius: 8px !important;
	    overflow: hidden;
	}
	
	.accordion-body {
	    background-color: #fff;
	    padding: 1.5rem;
	}
	
	/* 모달 스타일 */
	.modal-content {
	    border-radius: 8px;
	    overflow: hidden;
	}
	
	.modal-header {
	    background-color: #f8f9fa;
	    border-radius: 8px 8px 0 0;
	}
	
	.form-select:focus,
	.form-control:focus {
	    border-color: #0d6efd;
	    box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.25);
	}
	
	/* 여백 및 기타 */
	.gap-2 { gap: 0.5rem; }
	.page-title {
	    margin-bottom: 2rem;
	    padding-bottom: 1rem;
	    border-bottom: 2px solid #dee2e6;
	}
	
	/* 반응형 */
	@media (max-width: 768px) {
	    .info-grid,
	    .detail-grid {
	        grid-template-columns: 1fr;
	    }
	    .col-lg-4 { width: 100%; }
	    .card-body { padding: 1rem; }
	}
</style>

<%@ include file="../inc/new_header.jsp" %>

<div class="container-xxl py-5">
    <div class="container">
        <div class="page-title">
            <h3><i class="fas fa-clipboard-list me-3"></i>나의 봉사활동 신청현황</h3>
        </div>

        <div class="application-list">
	    <div class="row g-4" id="applicationList">
	        <c:forEach items="${applications}" var="application" varStatus="status">
	            <div class="col-lg-4 col-md-6 application-item ${status.index >= 9 ? 'd-none' : ''}">
	                <div class="application-card">
	                    <div class="card-header d-flex justify-content-between align-items-center">
	                        <h5 class="mb-0 fs-6">신청일자 ${application.voRegDate}</h5>
	                        
	                        <span class="status-badge 
	                            ${application.status eq 'PENDING' ? 'status-pending' : 
	                              application.status eq 'APPROVED' ? 'status-approved' : 
	                              application.status eq 'REJECTED' ? 'status-rejected' : 
	                              'status-rejected'}">
	                            ${application.status eq 'PENDING' ? '신청대기' : 
	                              application.status eq 'APPROVED' ? '신청완료' : 
	                              application.status eq 'REJECTED' ? '신청거절' : 
	                              '취소완료'}
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
                        
                        <c:if test="${application.status eq 'PENDING'}">
						    <div class="d-flex justify-content-end gap-2 mt-3">
						        <button class="btn-detail flex-grow-1" onclick="showDetail(${application.voId})">
						            상세보기
						        </button>
						        <button class="cancel-btn flex-grow-1" 
						            onclick="cancelApplication(${application.voId})"
						            ${application.status ne 'PENDING' ? 'disabled' : ''}>
						            신청취소
						        </button>
						    </div>
						</c:if>
						<c:if test="${application.status ne 'PENDING'}">
						    <div class="d-flex justify-content-end mt-3">
						        <button class="btn-detail flex-grow-1" onclick="showDetail(${application.voId})">
								    상세보기
								</button>
						    </div>
						</c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    
	    <c:if test="${fn:length(applications) > 9}">
	        <div class="text-center mt-4">
	            <button class="btn btn-outline-primary" id="loadMore">더보기</button>
	        </div>
	    </c:if>
		</div>
	</div>
</div>

<!-- 취소 모달창 -->
<div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cancelModalLabel">봉사활동 신청 취소</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="cancelForm">
                    <input type="hidden" id="cancelVoId" name="voId">
                    <div class="mb-3">
                        <label for="cancelReason" class="form-label">취소사유</label>
                        <select class="form-select" id="cancelReason" name="cancelReason" required>
                            <option value="">선택해주세요</option>
                            <option value="단순변심">단순변심</option>
                            <option value="일정변경">일정변경</option>
                            <option value="개인정보 변경">개인정보 변경</option>
                            <option value="건강상의 이유">건강상의 이유</option>
                            <option value="기타">기타</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="cancelReasonDetail" class="form-label">취소사유 상세</label>
                        	<textarea class="form-control" id="cancelReasonDetail" name="cancelReasonDetail" rows="3" 
        						placeholder="취소사유에 대해 자세히 설명해주세요." required></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-danger" onclick="submitCancel()">취소하기</button>
            </div>
        </div>
    </div>
</div>

<!-- 상세보기 모달창 -->
<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header border-0">
                <h5 class="modal-title" id="detailModalLabel">봉사활동 상세정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="accordion" id="detailAccordion">
                    <!-- 봉사활동 정보 아코디언 아이템 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="activityInfo">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseActivity" aria-expanded="true" aria-controls="collapseActivity">
							    <span class="button-text">
							        <i class="fas fa-info-circle detail-icon me-2"></i> 봉사활동 정보
							    </span>
							    <span class="selection-text">선택됨</span>
							</button>
                        </h2>
                        <div id="collapseActivity" class="accordion-collapse collapse show" aria-labelledby="activityInfo" data-bs-parent="#detailAccordion">
                            <div class="accordion-body">
                                <div class="detail-grid">
                                    <div class="detail-item">
                                        <strong>봉사활동명</strong>
                                        <p id="detail-voTitle"></p>
                                    </div>
                                    <div class="detail-item">
                                        <strong>활동내용</strong>
                                        <p id="detail-voContent"></p>
                                    </div>
                                    <div class="detail-item">
                                        <strong>장소</strong>
                                        <p id="detail-voLocation"></p>
                                    </div>
                                    <div class="detail-item">
                                        <strong>봉사기간</strong>
                                        <p id="detail-voPeriod"></p>
                                    </div>
                                    <div class="detail-item">
                                        <strong>담당자</strong>
                                        <p id="detail-voManager"></p>
                                    </div>
                                    <div class="detail-item">
                                        <strong>연락처</strong>
                                        <p id="detail-voContact"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 신청자 정보 아코디언 아이템 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="applicantInfo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseApplicant" aria-expanded="false" aria-controls="collapseApplicant">
							    <span class="button-text">
							        <i class="fas fa-user detail-icon me-2"></i> 신청자 정보
							    </span>
							    <span class="selection-text">선택하기</span>
							</button>
                        </h2>
                        <div id="collapseApplicant" class="accordion-collapse collapse" aria-labelledby="applicantInfo" data-bs-parent="#detailAccordion">
                            <div class="accordion-body">
                                <div class="detail-grid">
                                    <div class="detail-item">
                                        <strong>이름</strong>
                                        <p id="detail-voApplicant"></p>
                                    </div>
                                    <div class="detail-item">
                                        <strong>생년월일</strong>
                                        <p id="detail-voBirth"></p>
                                    </div>
                                    <div class="detail-item">
                                        <strong>연락처</strong>
                                        <p id="detail-voTel"></p>
                                    </div>
                                    <div class="detail-item">
                                        <strong>이메일</strong>
                                        <p id="detail-voEmail"></p>
                                    </div>
                                    <div class="detail-item">
                                        <strong>반려동물 경험</strong>
                                        <p id="detail-voExperience"></p>
                                    </div>
                                    <div class="detail-item">
                                        <strong>정보수신 동의</strong>
                                        <p id="detail-voAgree"></p>
                                    </div>
                                    <div class="detail-item full-width">
                                        <strong>신청사유</strong>
                                        <p id="detail-voReason"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const detailModal = document.getElementById('detailModal');
    
    detailModal.addEventListener('show.bs.modal', function() {
        // 봉사활동 정보 아코디언
        const activityCollapse = document.getElementById('collapseActivity');
        const activityButton = document.querySelector('[data-bs-target="#collapseActivity"]');
        const activitySelectionText = activityButton.querySelector('.selection-text');
        
        // 신청자 정보 아코디언
        const applicantCollapse = document.getElementById('collapseApplicant');
        const applicantButton = document.querySelector('[data-bs-target="#collapseApplicant"]');
        const applicantSelectionText = applicantButton.querySelector('.selection-text');
        
        // 봉사활동 정보 이벤트
        activityCollapse.addEventListener('show.bs.collapse', function() {
            activitySelectionText.textContent = '선택됨';
        });
        
        activityCollapse.addEventListener('hide.bs.collapse', function() {
            activitySelectionText.textContent = '선택하기';
        });
        
        // 신청자 정보 이벤트
        applicantCollapse.addEventListener('show.bs.collapse', function() {
            applicantSelectionText.textContent = '선택됨';
        });
        
        applicantCollapse.addEventListener('hide.bs.collapse', function() {
            applicantSelectionText.textContent = '선택하기';
        });
        
        // 초기 상태 설정
        activitySelectionText.textContent = activityCollapse.classList.contains('show') ? '선택됨' : '선택하기';
        applicantSelectionText.textContent = applicantCollapse.classList.contains('show') ? '선택됨' : '선택하기';
    });
});

document.getElementById('loadMore')?.addEventListener('click', function() {
    const hiddenItems = document.querySelectorAll('#applicationList .application-item.d-none');
    const itemsToShow = Array.from(hiddenItems).slice(0, 9);
    
    itemsToShow.forEach(item => item.classList.remove('d-none'));
    
    if (hiddenItems.length <= 9) {
        this.style.display = 'none';
    }
});

let cancelVoId = null;

function cancelApplication(voId) {
    cancelVoId = voId;
    // 모달 폼 초기화
    document.getElementById('cancelForm').reset();
    document.getElementById('cancelVoId').value = voId;
    
    // 모달 표시
    const cancelModal = new bootstrap.Modal(document.getElementById('cancelModal'));
    cancelModal.show();
}

function submitCancel() {
    const reason = document.getElementById('cancelReason').value;
    const reasonDetail = document.getElementById('cancelReasonDetail').value;
    
    if (!reason) {
        alert('취소사유를 선택해주세요.');
        return;
    }
    if (!reasonDetail) {
        alert('취소사유 상세내용을 입력해주세요.');
        return;
    }
    
    $.ajax({
        url: '/volunteer/cancel/' + cancelVoId,
        type: 'POST',
        data: {
            reason: reason,             
            reasonDetail: reasonDetail
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

//applications 데이터를 JavaScript 배열로 변환
const applications = [
    <c:forEach items="${applications}" var="app" varStatus="status">
        {
            voId: ${app.voId},
            voTitle: '${app.voTitle}',
            voStartDate: '<fmt:formatDate value="${app.voStartDate}" pattern="yyyy.MM.dd"/>',
            voEndDate: '<fmt:formatDate value="${app.voEndDate}" pattern="yyyy.MM.dd"/>',
            voLocation: '${app.voLocation}',
            voContent: '${app.voContent}',
            voManager: '${app.voManager}',
            voContact: '${app.voContact}',
            voApplicant: '${app.voApplicant}',
            voBirth: '<fmt:formatDate value="${app.voBirth}" pattern="yyyy.MM.dd"/>',
            voTel: '${app.voTel}',
            voEmail: '${app.voEmail}',
            voExperience: '${app.voExperience}',
            voAgree: '${app.voAgree}',
            voReason: '${app.voReason}'
        }<c:if test="${!status.last}">,</c:if>
    </c:forEach>
];

function showDetail(voId) {
    // 해당 application 데이터 찾기
    const application = applications.find(app => app.voId === voId);
    if (!application) return;
    
    // 모달에 데이터 채우기
    document.getElementById('detail-voTitle').textContent = application.voTitle;
    document.getElementById('detail-voPeriod').textContent = application.voStartDate + ' - ' + application.voEndDate;
    document.getElementById('detail-voLocation').textContent = application.voLocation;
    document.getElementById('detail-voContent').textContent = application.voContent;
    document.getElementById('detail-voManager').textContent = application.voManager;
    document.getElementById('detail-voContact').textContent = application.voContact;
    
    // 신청자 정보
    document.getElementById('detail-voApplicant').textContent = application.voApplicant;
    document.getElementById('detail-voBirth').textContent = application.voBirth;
    document.getElementById('detail-voTel').textContent = application.voTel;
    document.getElementById('detail-voEmail').textContent = application.voEmail;
    document.getElementById('detail-voExperience').textContent = application.voExperience === 'Y' ? '있음' : '없음';
    document.getElementById('detail-voAgree').textContent = application.voAgree === 'Y' ? '동의' : '거부';
    document.getElementById('detail-voReason').textContent = application.voReason;
    
    // 모달 표시
    const detailModal = new bootstrap.Modal(document.getElementById('detailModal'));
    detailModal.show();
}

</script>

<%@ include file="../inc/new_footer.jsp" %>