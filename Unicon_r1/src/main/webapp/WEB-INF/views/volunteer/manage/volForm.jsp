<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>유니콘 - 봉사활동 공고${volunteer.voId == null ? '등록' : '수정'}</title>
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
	body,
	.container-scroller {
	    background: #f8f9fa !important;
	}

	.sidebar {
	    width: 250px !important;
	    position: fixed !important;
	    left: 0 !important;
	    height: 100vh !important;
	    background: #ffffff !important;
	    transition: all 0.3s ease !important;
	    z-index: 1000 !important;
	}
	
	.main-panel {
	    display: flex !important;
	    flex-direction: column !important;
	    min-height: 100vh !important;
	    background: #f8f9fa !important;
	    margin-left: 250px !important;
	    width: calc(100% - 250px) !important;
	}
	
	.content-wrapper {
	    flex: 1 !important;
	    padding: 2rem !important;
	    background: #f8f9fa !important;
	    width: 100% !important;
	}
	
	.footer {
	    background: #f8f9fa !important;
	    padding: 1.5rem !important;
	}
	
	/* 카드 스타일 통합 */
	.card {
	    background: #ffffff !important;
	    border: none !important;
	    box-shadow: 0 2px 4px rgba(0,0,0,0.1) !important;
	    border-radius: 1rem !important;
	    margin-bottom: 20px !important;
	    overflow: hidden !important;
	}
		
	.card-body {
	    padding: 2rem !important;
	}	
	
	/* 헤더와 바디 통합 스타일 */
	.page-header {
	    background: #006e60 !important;
	    padding: 0.8rem 1.5rem !important;
	    border-radius: 8px 8px 0 0 !important;
	    margin: 0 !important;
	}
	
	.page-title {
	    margin: 0 !important;
	    font-size: 1.2rem !important;
	    font-weight: 500 !important;
	    color: #ffffff !important;
	    line-height: 1.2 !important;
	}
	
	.card-body {
	    padding: 2rem;
	}
	
	/* 폼 스타일 */
	.form-group {
	    margin-bottom: 1.5rem;
	}
	
	.form-group.row {
	    display: flex;
	    flex-direction: row;
	    margin-bottom: 1.5rem;
	    gap: 2rem;
	}
	
	.form-item {
    flex: 1;
    min-width: 0;
	}
	
	.col-form-label {
		display: block;
	    width: 100%;
	    margin-bottom: 0.5rem;
	    padding: 0;
	    font-weight: 500;
	    color: #333;
	    font-size: 0.95rem;
	}
	
	.col-sm-7 {
	    width: 100%;
	    padding: 0;
	}
	
	.form-control-wrapper {
	    width: 100%;
	}
	
	.form-control {
	    width: 100%;
	    border: 1px solid #e0e0e0;
	    border-radius: 4px;
	    padding: 0.625rem 0.75rem;
	    font-size: 0.9rem;
	}
	
	.form-control:focus {
	    border-color: #4B49AC;
	    box-shadow: 0 0 0 0.2rem rgba(75, 73, 172, 0.1);
	}
	
	/* 필수 입력 표시 제거 */
	.form-control[required] {
	    background-image: none;
	}
	
	/* 날짜 입력 그룹 스타일 조정 */
	.date-group .form-group.row {
	    gap: 1rem;
	}
	
	.date-group .form-item {
	    flex: 1;
	}
	
	/* 입력 그룹 스타일 */
	.input-group {
	    width: 100%;
	}
	
	.input-group .form-control {
	    border: 1px solid #e0e0e0;
	}
	
	.input-group-text {
	    background-color: #f8f9fa;
	    border: 1px solid #e0e0e0;
	    color: #6c757d;
	}
	
	textarea.form-control {
	    min-height: 120px;
	    resize: vertical;
	}
	
	/* 버튼 스타일 */
	.btn {
	    padding: 0.625rem 1.5rem;
	    font-weight: 500;
	    border-radius: 4px;
	    min-width: 120px;
	    margin: 0 0.25rem;
	}
	
	.btn-primary {
	    background: #006e60 !important;
        border-color: #006e60 !important;
	}
	
	.btn-primary:hover {
	    background: #005a4e !important;
        border-color: #005a4e !important;
	}
	
	.btn-light {
	    background: #424242 !important;
        border-color: #424242 !important;
        color: #ffffff !important;
	}
	
	.btn-light:hover {
        background: #383838 !important;
        border-color: #383838 !important;
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

/* 모바일 반응형 */
@media (max-width: 768px) {
	.sidebar {
        width: 0 !important;
        overflow: hidden !important;
    }
    
    .main-panel {
        margin-left: 0 !important;
        width: 100% !important;
    } 

    .content-wrapper {
        padding: 1rem !important;
    }
    
    .card-body {
        padding: 1.5rem !important;
    }
    
    .page-header {
        padding: 1.25rem 1.5rem;
    }
    
    .btn {
        width: 100%;
        margin: 0.25rem 0;
    }
    
    .form-group.row {
        flex-direction: column;
        gap: 1rem;
    }

    .form-item {
        width: 100%;
    }
}
</style>
</head>
<body>
<!-- ======================================================================= -->

<div class="container-scroller">
    <%@ include file="/WEB-INF/views/inc/admin_navbar_adpt.jsp"%>
    <div class="container-fluid page-body-wrapper">
        <%@ include file="/WEB-INF/views/inc/admin_sidebar_adpt.jsp"%>
    
	    <div class="main-panel">
	        <div class="content-wrapper">
			    <div class="card">
			        <div class="page-header">
			            <h3 class="page-title">봉사활동 공고${volunteer.voId == null ? '등록' : '수정'}</h3>
			        </div>
			        <div class="card-body">
			            <form id="volunteerForm" method="post" action="/volunteer/manage/submit">
						    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						    <input type="hidden" name="voId" value="${volunteer.voId}" />
						    
						    <div class="form-group row">
						        <div class="form-item">
						            <label class="col-form-label">봉사활동명</label>
						            <div class="form-control-wrapper">
						                <input type="text" class="form-control" name="voTitle" value="${volunteer.voTitle}" required>
						            </div>
						        </div>
						        <div class="form-item">
						            <label class="col-form-label">봉사장소</label>
						            <div class="form-control-wrapper">
						                <input type="text" class="form-control" name="voLocation" value="${volunteer.voLocation}" required>
						            </div>
						        </div>
						    </div>
						    
						    <div class="form-group row">
						        <div class="form-item">
						            <label class="col-form-label">모집대상</label>
						            <div class="form-control-wrapper">
						                <input type="text" class="form-control" name="voTarget" value="${volunteer.voTarget}" required>
						            </div>
						        </div>
						        <div class="form-item">
						            <label class="col-form-label">모집인원</label>
						            <div class="form-control-wrapper">
						                <input type="number" class="form-control" name="voCapacity" value="${volunteer.voCapacity}" required>
						            </div>
						        </div>
						    </div>
						
						    <div class="form-group row">
						        <div class="form-item">
						            <label class="col-form-label">담당자</label>
						            <div class="form-control-wrapper">
						                <input type="text" class="form-control" name="voManager" value="${volunteer.voManager}" required>
						            </div>
						        </div>
						        
						        <div class="form-item">
						            <label class="col-form-label">연락처</label>
						            <div class="form-control-wrapper">
						                <input type="text" class="form-control" name="voContact" value="${volunteer.voContact}" required>
						            </div>
						        </div>
						    </div>
						
						    <div class="form-group row">
						        <div class="form-item">
						            <label class="col-form-label">모집기간</label>
						            <div class="form-control-wrapper">
						                <div class="input-group">
						                    <input type="date" class="form-control" name="voRecruitStart" 
						                           value="<fmt:formatDate value='${volunteer.voRecruitStart}' pattern='yyyy-MM-dd'/>" required>
						                    <span class="input-group-text">~</span>
						                    <input type="date" class="form-control" name="voRecruitEnd" 
						                           value="<fmt:formatDate value='${volunteer.voRecruitEnd}' pattern='yyyy-MM-dd'/>" required>
						                </div>
						            </div>
						        </div>
						        <div class="form-item">
						            <label class="col-form-label">봉사기간</label>
						            <div class="form-control-wrapper">
						                <div class="input-group">
						                    <input type="date" class="form-control" name="voStartDate" 
						                           value="<fmt:formatDate value='${volunteer.voStartDate}' pattern='yyyy-MM-dd'/>" required>
						                    <span class="input-group-text">~</span>
						                    <input type="date" class="form-control" name="voEndDate" 
						                           value="<fmt:formatDate value='${volunteer.voEndDate}' pattern='yyyy-MM-dd'/>" required>
						                </div>
						            </div>
						        </div>
						    </div>
						    
						    <div class="form-item">
						        <label class="col-form-label">활동내용</label>
						        <div class="form-control-wrapper">
						            <textarea class="form-control" name="voContent" rows="8" required>${volunteer.voContent}</textarea>
						        </div>
						    </div>
						</form>
						</div>
					</div>
				<div class="row">
			        <div class="col-12 text-center mt-4">
			            <button type="submit" class="btn btn-primary px-5" form="volunteerForm">
						    ${volunteer.voId == null ? '등록' : '수정'}
						</button>
			            <button type="button" class="btn btn-light px-5" onclick="history.back()">취소</button>
			        </div>
				</div>
			</div>
	        <%@ include file="/WEB-INF/views/inc/admin_footer_adpt.jsp"%>
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
    var csrfToken = $("meta[name='_csrf']").attr("content");
    var csrfHeader = $("meta[name='_csrf_header']").attr("content");

    // CSRF 토큰이 존재할 때만 ajaxSetup 설정
    if (csrfToken && csrfHeader) {
        $.ajaxSetup({
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeader, csrfToken);
            }
        });
    }
    
    $(document).ready(function() {
        // 폼 유효성 검사 함수
        function validateForm() {
            if (!$('input[name="voTitle"]').val().trim()) {
                Swal.fire({
                    title: '입력 확인',
                    text: '봉사활동명을 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }
            if (!$('input[name="voLocation"]').val().trim()) {
                Swal.fire({
                    title: '입력 확인',
                    text: '봉사장소를 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }
            if (!$('input[name="voTarget"]').val().trim()) {
                Swal.fire({
                    title: '입력 확인',
                    text: '모집대상을 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }
            if (!$('input[name="voCapacity"]').val()) {
                Swal.fire({
                    title: '입력 확인',
                    text: '모집인원을 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }
            if (!$('input[name="voManager"]').val().trim()) {
                Swal.fire({
                    title: '입력 확인',
                    text: '담당자를 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }
            if (!$('input[name="voContact"]').val().trim()) {
                Swal.fire({
                    title: '입력 확인',
                    text: '연락처를 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }

            // 날짜 값 가져오기
            const recruitStart = new Date($('input[name="voRecruitStart"]').val());
            const recruitEnd = new Date($('input[name="voRecruitEnd"]').val());
            const volStart = new Date($('input[name="voStartDate"]').val());
            const volEnd = new Date($('input[name="voEndDate"]').val());

            // 필수 입력 체크
            if (!$('input[name="voRecruitStart"]').val()) {
                Swal.fire({
                    title: '입력 확인',
                    text: '모집 시작일을 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }
            if (!$('input[name="voRecruitEnd"]').val()) {
                Swal.fire({
                    title: '입력 확인',
                    text: '모집 종료일을 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }
            if (!$('input[name="voStartDate"]').val()) {
                Swal.fire({
                    title: '입력 확인',
                    text: '봉사 시작일을 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }
            if (!$('input[name="voEndDate"]').val()) {
                Swal.fire({
                    title: '입력 확인',
                    text: '봉사 종료일을 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }

            // 날짜 유효성 검사
            if (recruitEnd < recruitStart) {
                Swal.fire({
                    title: '날짜 확인',
                    text: '모집 종료일은 모집 시작일보다 이후여야 합니다.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }
            if (volEnd < volStart) {
                Swal.fire({
                    title: '날짜 확인',
                    text: '봉사 종료일은 봉사 시작일보다 이후여야 합니다.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }
            if (volStart < recruitStart) {
                Swal.fire({
                    title: '날짜 확인',
                    text: '봉사 시작일은 모집 시작일 이후여야 합니다.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }

            if (!$('textarea[name="voContent"]').val().trim()) {
                Swal.fire({
                    title: '입력 확인',
                    text: '활동내용을 입력해주세요.',
                    icon: 'warning',
                    confirmButtonText: '확인'
                });
                return false;
            }
            return true;
        }

        // 폼 제출 처리
        $('#volunteerForm').on('submit', function(e) {
            e.preventDefault();

            if (!validateForm()) {
                return false;
            }

            // FormData 객체 생성
            var formData = new FormData(this);
            formData.set('status', 'active');
            
            const isEdit = formData.get('voId'); // 수정 여부 확인

            // 폼 제출
            $.ajax({
                url: this.action,
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    Swal.fire({
                        title: isEdit ? '수정 완료' : '등록 완료',
                        text: isEdit ? '봉사활동이 수정되었습니다.' : '봉사활동이 등록되었습니다.',
                        icon: 'success',
                        confirmButtonText: '확인'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = '/volunteer/manage/voList';
                        }
                    });
                },
                error: function(xhr, status, error) {
                    console.error('저장 실패:', error);
                    Swal.fire({
                        title: '저장 실패',
                        text: '저장 중 오류가 발생했습니다.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            });
        });
    });
</script>
    
</body>
</html>