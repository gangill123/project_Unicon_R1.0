<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ include file="../inc/new_topHeader.jsp" %>

<!-- CSS 파일 -->
<link href="${pageContext.request.contextPath}/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets_sub/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- SweetAlert2 CSS -->
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>

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
	    padding: 2rem;
	    border-radius: 12px;
	    margin-bottom: 2rem;
	    padding-bottom: 2rem;
	}
	
	.info-container {
	    display: flex;
	    flex-direction: column;
	    gap: 1.5rem;
	}
	
	.info-row {
	    display: flex;
	    align-items: flex-start;
	    gap: 1.2rem;
	    padding: 1rem;
	    background: white;
	    border-radius: 8px;
	    box-shadow: 0 1px 3px rgba(0,0,0,0.05);
	}
	
	.icon-wrapper {
	    font-size: 1.5rem;
	    color: #348E38;
	    min-width: 40px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.btn-primary {
	    background-color: #86BC42;
	    border-color: #86BC42;
	}

	.btn-primary:hover {
		color: white;
	    background-color: #348E38;
	    border-color: #348E38;
	    box-shadow: 0 4px 12px rgba(134, 188, 66, 0.15);
	}
	
	.info-content {
	    flex: 1;
	    display: flex;
	    flex-direction: column;
	    gap: 0.5rem;
	}
	
	.info-content strong {
	    font-size: 1rem;
	    color: #495057;
	    display: block;
	}
	
	.info-text {
	    font-size: 1rem;
	    color: #212529;
	    line-height: 1.5;
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
	
	#birthYear {
	    flex: 2;  	
	}
	
	#birthMonth, #birthDay {
	    flex: 1;  	
	    width: auto;  	
	    min-width: 80px;  	
	}
	
	.error-message {
        display: none;
        color: #dc3545;
        font-size: 0.875rem;
        margin-top: 0.25rem;
    }
    
    .form-control.is-invalid {
        border-color: #dc3545;
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
	
@media (max-width: 768px) {
    .volunteer-summary {
        padding: 1rem;
    }

    .info-row {
        padding: 0.8rem;
        gap: 1rem;
    }

    .icon-wrapper {
        font-size: 1.5rem;
        min-width: 32px;
    }

    .info-content strong {
        font-size: 1rem;
    }

    .info-text {
        font-size: 1.1rem;
    }
}
	
</style>

<%@ include file="../inc/new_header.jsp" %>

<div class="container-xxl py-5">
    <div class="container">
        <div class="application-form">
            <h3 class="text-center mb-4">봉사활동 신청</h3>
            
            <!-- 봉사활동 요약 정보 -->
            <div class="volunteer-summary">
			    <div class="info-container">
			        <div class="info-row">
			            <span class="icon-wrapper">
			                <i class="far fa-calendar-alt"></i>
			            </span>
			            <span class="info-content">
			                <strong>모집명</strong>
			                <span class="info-text">${volunteer.voTitle}</span>
			            </span>
			        </div>
			        <div class="info-row">
			            <span class="icon-wrapper">
			                <i class="fas fa-tasks"></i>
			            </span>
			            <span class="info-content">
			                <strong>활동내용</strong>
			                <span class="info-text">${volunteer.voContent}</span>
			            </span>
			        </div>
			        <div class="info-row">
			            <span class="icon-wrapper">
			                <i class="fas fa-map-marker-alt"></i>
			            </span>
			            <span class="info-content">
			                <strong>봉사장소</strong>
			                <span class="info-text">${volunteer.voLocation}</span>
			            </span>
			        </div>
			        <div class="info-row">
			            <span class="icon-wrapper">
			                <i class="far fa-clock"></i>
			            </span>
			            <span class="info-content">
			                <strong>봉사기간</strong>
			                <span class="info-text">
			                    <fmt:formatDate value="${volunteer.voStartDate}" pattern="yyyy.MM.dd"/> - 
			                    <fmt:formatDate value="${volunteer.voEndDate}" pattern="yyyy.MM.dd"/>
			                </span>
			            </span>
			        </div>
			        <div class="info-row">
			            <span class="icon-wrapper">
			                <i class="fas fa-user-friends"></i>
			            </span>
			            <span class="info-content">
			                <strong>모집대상</strong>
			                <span class="info-text">${volunteer.voTarget}</span>
			            </span>
			        </div>
			        <div class="info-row">
			            <span class="icon-wrapper">
			                <i class="fas fa-users"></i>
			            </span>
			            <span class="info-content">
			                <strong>모집인원</strong>
			                <span class="info-text">${volunteer.voCapacity}명</span>
			            </span>
			        </div>
			        <div class="info-row">
			            <span class="icon-wrapper">
			                <i class="fas fa-user-tie"></i>
			            </span>
			            <span class="info-content">
			                <strong>담당자</strong>
			                <span class="info-text">${volunteer.voManager}</span>
			            </span>
			        </div>
			        <div class="info-row">
			            <span class="icon-wrapper">
			                <i class="fas fa-phone"></i>
			            </span>
			            <span class="info-content">
			                <strong>연락처</strong>
			                <span class="info-text">${volunteer.voContact}</span>
			            </span>
			        </div>
			    </div>
			</div>

            <form id="applicationForm" action="/volunteer/apply" method="post">
                <input type="hidden" name="memberId" value="${member.member_id}">
                
                <!-- 신청자 정보 -->
                <div class="form-section">
                    <h5>신청자 정보<span class="required-mark">*</span></h5>
                    <div class="row g-3">
                        <div class="col-md-6">
						    <label class="form-label">이름</label>
						    <input type="text" class="form-control" name="voApplicant" id="voApplicant" required>
						    <div class="error-message" id="voApplicant-error">이름을 2자 이상 입력해주세요.</div>
						</div>
                        <!-- 생년월일 입력  -->
                        <div class="col-md-6">
						    <label class="form-label">생년월일</label>
						    <div class="d-flex gap-2">
						        <input type="text" class="form-control" name="birthYear" id="birthYear" placeholder="연도 4자리" maxlength="4" required>
						        <select class="form-select" name="birthMonth" id="birthMonth" required>
						            <option value="">월</option>
						            <c:forEach begin="1" end="12" var="month">
						                <option value="${month}">${month}월</option>
						            </c:forEach>
						        </select>
						        <select class="form-select" name="birthDay" id="birthDay" required>
						            <option value="">일</option>
						            <c:forEach begin="1" end="31" var="day">
						                <option value="${day}">${day}일</option>
						            </c:forEach>
						        </select>
						    </div>
						    <div class="invalid-feedback" id="birthError"></div>
						</div>

                        
                        <div class="col-md-6">
						    <label class="form-label">연락처</label>
						    <input type="tel" class="form-control" name="voTel" id="voTel" required>
						    <div class="error-message" id="voTel-error">올바른 전화번호 형식이 아닙니다.</div>
						</div>
                        <div class="col-md-6">
						    <label class="form-label">이메일</label>
						    <input type="email" class="form-control" name="voEmail" id="voEmail" required>
						    <div class="error-message" id="voEmail-error">올바른 이메일 형식이 아닙니다.</div>
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
				    <textarea class="form-control" name="voReason" id="voReason" rows="4" required
				              placeholder="봉사활동 참여 동기와 기대사항을 작성해주세요."></textarea>
				    <div class="error-message" id="voReason-error">신청 사유를 입력해주세요.</div>
				</div>

                <!-- 개인정보 수집 동의 -->
                <div class="form-section">
                    <h5>개인정보 수집 및 이용 동의<span class="required-mark">*</span></h5>
                    <div class="agreement-box mb-3">
                        [개인정보 수집 및 이용 동의 안내]<br>
                        봉사활동 참여자 대상 개인정보 수집과 이용에 관한 동의를 받고자 하오니<br>
                        내용을 확인하신 후 동의 여부를 선택해 주세요.<br>
						•수집하는 자: 유니콘<br>
						•개인정보 수집 및 이용 목적: 봉사활동 참여자 관리<br>
						•수집하는 개인정보 항목: 이름, 생년월일, 연락처, 이메일<br>
						•개인정보 보유 및 이용 기간: 탈퇴시 까지<br>
						※ 귀하께서는 동의하지 않을 권리가 있습니다. <br>
						동의하지 않을 경우 봉사활동 참여에서 제외됨을 알려드립니다.<br>
						위 내용을 확인하시고 개인정보 수집 및 이용에 동의하시겠습니까?
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="privacyAgreement" required>
                        <label class="form-check-label">
                            [필수] 개인정보 수집 및 이용에 동의합니다.
                        </label>
                    </div>
                </div>

                <!-- 정보 수신 동의 -->
                <div class="form-section">
                    <h5>정보 수신 동의</h5>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="voAgree" value="Y">
                        <label class="form-check-label">
                            [선택] 진행 상태 변경 시 이메일 알림을 받습니다.
                        </label>
                    </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary px-5">신청하기</button>
                    <button type="button" class="btn btn-secondary px-5 ms-2" onclick="history.back()">취소하기</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script>

$(document).ready(function() {
    // 연도 입력 숫자만 허용
    $('#birthYear').on('input', function() {
        this.value = this.value.replace(/[^0-9]/g, '');
    });

    // 전화번호 형식화 및 유효성 검사
    $('#voTel').on('input', function() {
        let value = this.value.replace(/[^0-9]/g, '');
        if (value.length > 3 && value.length <= 7) {
            value = value.slice(0,3) + "-" + value.slice(3);
        } else if (value.length > 7) {
            value = value.slice(0,3) + "-" + value.slice(3,7) + "-" + value.slice(7,11);
        }
        this.value = value;
        
        // 전화번호 유효성 검사
        const phoneRegex = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        const isValid = phoneRegex.test(value);
        
        if (!isValid && value.length > 0) {
            $(this).addClass('is-invalid');
            $('#voTel-error').show();
        } else {
            $(this).removeClass('is-invalid');
            $('#voTel-error').hide();
        }
    });

    // 이메일 유효성 검사
    $('#voEmail').on('input', function() {
        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        const isValid = emailRegex.test(this.value);
        
        if (!isValid && this.value.length > 0) {
            $(this).addClass('is-invalid');
            $('#voEmail-error').show();
        } else {
            $(this).removeClass('is-invalid');
            $('#voEmail-error').hide();
        }
    });

    // 이름 유효성 검사
    $('#voApplicant').on('input', function() {
        if (this.value.length < 2 && this.value.length > 0) {
            $(this).addClass('is-invalid');
            $('#voApplicant-error').show();
        } else {
            $(this).removeClass('is-invalid');
            $('#voApplicant-error').hide();
        }
    });

    // 날짜 유효성 검사
    function isValidDate(year, month, day) {
        const date = new Date(year, month - 1, day);
        return date.getFullYear() == year && date.getMonth() == month - 1 && date.getDate() == day;
    }

    // 나이 계산 함수
    function calculateAge(birthYear, birthMonth, birthDay) {
        const today = new Date();
        const birthDate = new Date(birthYear, birthMonth - 1, birthDay);
        let age = today.getFullYear() - birthDate.getFullYear();
        const monthDiff = today.getMonth() - birthDate.getMonth();
        
        if (monthDiff < 0 || (monthDiff == 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }
        return age;
    }

    // 대상 연령 확인 함수
    function isEligibleAge(age, target) {
        if (target.includes('성인')) {
            return age >= 19;
        } else if (target.includes('청소년')) {
            return age >= 14 && age < 19;
        }
        return true;
    }

    // 폼 제출 시 유효성 검사
    $('#applicationForm').on('submit', function(e) {
        e.preventDefault();
        let isValid = true;

        // 이름 검사
        if ($('#voApplicant').val().length < 2) {
            $('#voApplicant').addClass('is-invalid');
            $('#voApplicant-error').show();
            $('#voApplicant')[0].scrollIntoView({ behavior: 'smooth' });
            isValid = false;
        }

        // 생년월일 검사
        const year = $('#birthYear').val();
        const month = $('#birthMonth').val();
        const day = $('#birthDay').val();

        if (!isValidDate(year, month, day)) {
            $('#birthYear').addClass('is-invalid');
            $('#birthError').show();
            $('#birthYear')[0].scrollIntoView({ behavior: 'smooth' });
            isValid = false;
        }

        // 전화번호 검사
        const phoneRegex = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        if (!phoneRegex.test($('#voTel').val())) {
            $('#voTel').addClass('is-invalid');
            $('#voTel-error').show();
            $('#voTel')[0].scrollIntoView({ behavior: 'smooth' });
            isValid = false;
        }

        // 이메일 검사
        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!emailRegex.test($('#voEmail').val())) {
            $('#voEmail').addClass('is-invalid');
            $('#voEmail-error').show();
            $('#voEmail')[0].scrollIntoView({ behavior: 'smooth' });
            isValid = false;
        }

        // 개인정보 수집동의 체크박스 검사
        if (!$('input[name="privacyAgreement"]').is(':checked')) {
		    Swal.fire({
		        title: '동의 필요',
		        text: '개인정보 수집 및 이용에 동의해주세요.',
		        icon: 'warning',
		        confirmButtonText: '확인'
		    });
		    $('input[name="privacyAgreement"]')[0].scrollIntoView({ behavior: 'smooth' });
		    isValid = false;
		}
        
        if (!isValid) {
            return false;
        }

        // 연령 제한 검사
        const age = calculateAge(year, month, day);
    	const target = '${volunteer.voTarget}';
    	
        if (!isEligibleAge(age, target)) {
            Swal.fire({
                title: '신청 불가',
                text: target.includes('성인') ? '해당 공고는 성인만 신청 가능합니다.' : '해당 공고는 청소년만 신청 가능합니다.',
                icon: 'error',
                confirmButtonText: '확인'
            });
            return false;
        }

        // 최종 제출 확인
        Swal.fire({
		    title: '신청 확인',
		    text: '관리자 승인 이후 취소가 불가합니다. 신청하시겠습니까?',
		    icon: 'warning',
		    showCancelButton: true,
		    confirmButtonText: '신청하기',
		    cancelButtonText: '취소',
		    reverseButtons: false
		}).then((result) => {
		    if (result.isConfirmed) {
		    	submitForm(year, month, day);
	        }
	    });
	});
		    	
		 	// 폼 제출 함수
		    function submitForm(year, month, day) {	    	
		        // 생년월일 hidden input 추가
		        const birthDate = new Date(year, month - 1, day);
			    const formattedDate = birthDate.toISOString().split('T')[0];
			    $('#applicationForm').append('<input type="hidden" name="voBirth" value="' + formattedDate + '">');
		
		        // Ajax 제출
			    $.ajax({
			        url: '/volunteer/apply',
			        type: 'POST',
			        data: $('#applicationForm').serialize(),
			        success: function(response) {
			            Swal.fire({
			                title: '신청 완료',
			                text: '봉사활동 신청이 완료되었습니다.',
			                icon: 'success',
			                confirmButtonText: '확인'
			            }).then(() => {
			                window.location.href = '/volunteer/mylist';
			            });
			        },
			        error: function(xhr) {
			            if (xhr.responseText) {
			                Swal.fire({
			                    title: '신청 실패',
			                    text: xhr.responseText,
			                    icon: 'error',
			                    confirmButtonText: '확인'
			                });
			            } else {
			                Swal.fire({
			                    title: '신청 실패',
			                    text: '신청 중 오류가 발생했습니다. 다시 시도해주세요.',
			                    icon: 'error',
			                    confirmButtonText: '확인'
			                });
			            }
			        }
			    });
			}
		});

</script>

<%@ include file="../inc/new_footer.jsp" %>