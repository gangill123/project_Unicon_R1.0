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
	.application-form {
	    max-width: 800px;
	    margin: 0 auto;
	    padding: 2rem;
	    background: #fff;
	    border-radius: 10px;
	    box-shadow: 0 0 20px rgba(0,0,0,0.05);
	}
	
	.form-section {
	    margin-bottom: 2rem;
	    padding-bottom: 2rem;
	    border-bottom: 1px solid #dee2e6;
	}
	
	.form-section:last-child {
	    border-bottom: none;
	}
	
	.volunteer-summary {
	    background: #f8f9fa;
	    padding: 1.5rem;
	    border-radius: 8px;
	    margin-bottom: 2rem;
	}
	
	.agreement-box {
	    background: #f8f9fa;
	    padding: 1.5rem;
	    border-radius: 8px;
	    margin-bottom: 1rem;
	    height: 200px;
	    overflow-y: auto;
	}
	
	.required-mark {
	    color: #dc3545;
	    margin-left: 4px;
	}
</style>

<%@ include file="../inc/new_header.jsp" %>

<div class="container-xxl py-5">
    <div class="container">
        <div class="application-form">
            <h3 class="text-center mb-4">봉사활동 신청</h3>
            
            <!-- 봉사활동 요약 정보 -->
            <div class="volunteer-summary">
                <div class="row">
                    <h5>${volunteer.voTitle}</h5>
                   	<div class="col-md-6">
                        <p><i class="fas fa-tasks info-icon me-2"></i>활동내용: ${volunteer.voContent}</p>
                    </div> 
                    <div class="col-md-6">
                        <p><i class="fas fa-map-marker-alt me-2"></i>봉사장소: ${volunteer.voLocation}</p>
                    </div>
                    <div class="col-md-6">
                        <p class="text-muted">
                            <i class="far fa-calendar-alt me-2"></i>
                            봉사기간: <fmt:formatDate value="${volunteer.voStartDate}" pattern="yyyy.MM.dd"/> - 
                            <fmt:formatDate value="${volunteer.voEndDate}" pattern="yyyy.MM.dd"/>
                        </p>
                    </div>
                    <div class="col-md-6">    
                        <p><i class="fas fa-users me-2"></i>모집인원: ${volunteer.voCapacity}명</p>
                    </div>
                </div>
            </div>

            <form id="applicationForm" action="/volunteer/apply" method="post">
                <input type="hidden" name="volunteerId" value="${volunteer.voId}">
                
                <!-- 신청자 정보 -->
                <div class="form-section">
                    <h5>신청자 정보<span class="required-mark">*</span></h5>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">이름</label>
                            <input type="text" class="form-control" name="voApplicant" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">생년월일</label>
                            <input type="date" class="form-control" name="voBirth" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">연락처</label>
                            <input type="tel" class="form-control" name="voTel" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">이메일</label>
                            <input type="email" class="form-control" name="voEmail" required>
                        </div>
                    </div>
                </div>

                <!-- 반려동물 경험 -->
                <div class="form-section">
                    <h5>반려동물 경험</h5>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="voExperience" value="Y" required>
                        <label class="form-check-label">있음</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="voExperience" value="N">
                        <label class="form-check-label">없음</label>
                    </div>
                </div>

                <!-- 신청 사유 -->
                <div class="form-section">
                    <h5>신청 사유<span class="required-mark">*</span></h5>
                    <textarea class="form-control" name="voReason" rows="4" required
                              placeholder="봉사활동 참여 동기와 기대사항을 작성해주세요."></textarea>
                </div>

                <!-- 개인정보 수집 동의 -->
                <div class="form-section">
                    <h5>개인정보 수집 및 이용 동의<span class="required-mark">*</span></h5>
                    <div class="agreement-box mb-3">
                        개인정보 수집 및 이용에 대한 안내...
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="privacyAgreement" required>
                        <label class="form-check-label">
                            개인정보 수집 및 이용에 동의합니다.
                        </label>
                    </div>
                </div>

                <!-- 정보 수신 동의 -->
                <div class="form-section">
                    <h5>정보 수신 동의</h5>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="voAgree" value="Y">
                        <label class="form-check-label">
                            SMS/이메일 수신에 동의합니다.
                        </label>
                    </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary px-5">신청하기</button>
                    <button type="button" class="btn btn-secondary px-5 ms-2" onclick="history.back()">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
$(document).ready(function() {
    $('#applicationForm').on('submit', function(e) {
        e.preventDefault();
        
        if (!confirm('관리자 승인 이후 취소가 불가합니다. 신청하시겠습니까?')) {
            return;
        }
        
        $.ajax({
            url: '/volunteer/apply',
            type: 'POST',
            data: $(this).serialize(),
            success: function(response) {
                alert('봉사활동 신청이 완료되었습니다.');
                window.location.href = '/volunteer/mylist';
            },
            error: function(xhr) {
                alert('신청 중 오류가 발생했습니다. 다시 시도해주세요.');
            }
        });
    });
});
</script>

<%@ include file="../inc/new_footer.jsp" %>