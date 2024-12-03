<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>유니콘 - 봉사활동 공고등록</title>
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/resources/admin/css/style.css">
   	<link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    
<style>
	.sidebar { 
	   width: 250px; 
	   position: fixed; 
	   left: 0; 
	   height: 100vh; 
	   background: #f8f9fa;
	   transition: all 0.3s ease;
	}
	
	.main-panel {
		margin-left: 250px;
		padding: 20px;
		width: calc(100% - 250px);
		min-height: calc(100vh - 70px);
	    background: #ffffff;
	}
	
	.content-wrapper {
	    background: #ffffff;
	    padding: 2rem;
	}
	
	/* 카드 스타일 통합 */
	.card {
	    background: #ffffff;
	    border: none;
	    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
	    border-radius: 8px;
	    margin-bottom: 20px;
	}
	
	/* 헤더와 바디 통합 스타일 */
	.page-header {
	    background: #f5f5f5;
	    padding: 0.8rem 1.5rem;
	    border-bottom: 1px solid #e0e0e0;
	    border-radius: 8px 8px 0 0;
	    margin: 0;
	}
	
	.page-title {
	    margin: 0;
	    font-size: 1.2rem;
	    font-weight: 500;
	    color: #333;
	    line-height: 1.2;
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
	    background: #4B49AC;
	    border-color: #4B49AC;
	}
	
	.btn-primary:hover {
	    background: #3f3e8e;
	    border-color: #3f3e8e;
	}
	
	.btn-light {
	    background: #ffffff;
	    border: 1px solid #e0e0e0;
	    color: #333;
	}

/* 모바일 반응형 */
@media (max-width: 768px) {
	.sidebar {
       width: 0;
       overflow: hidden;
    }
    
    .main-panel {
    	margin-left: 0;
	    width: 100%;
	    padding: 15px;
	}  

    .content-wrapper {
        padding: 1rem;
    }
    
    .card-body {
        padding: 1.5rem;
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
			            <h3 class="page-title">봉사활동 공고 등록</h3>
			        </div>
			        <div class="card-body">
			            <form id="postForm" class="forms-sample">
						    
						    <div class="form-group row">
						        <div class="form-item">
						            <label class="col-form-label">봉사활동명</label>
						            <div class="form-control-wrapper">
						                <input type="text" class="form-control" name="voTitle" required>
						            </div>
						        </div>
						        <div class="form-item">
						            <label class="col-form-label">봉사장소</label>
						            <div class="form-control-wrapper">
						                <input type="text" class="form-control" name="voLocation" required>
						            </div>
						        </div>
						    </div>
						    
						    <div class="form-group row">
						        <div class="form-item">
						            <label class="col-form-label">모집대상</label>
						            <div class="form-control-wrapper">
						                <input type="text" class="form-control" name="voTarget" required>
						            </div>
						        </div>
						        <div class="form-item">
						            <label class="col-form-label">모집인원</label>
						            <div class="form-control-wrapper">
						                <input type="number" class="form-control" name="voCapacity" required>
						            </div>
						        </div>
						    </div>
						
						    <div class="form-group row">
						        <div class="form-item">
						            <label class="col-form-label">담당자</label>
						            <div class="form-control-wrapper">
						                <input type="text" class="form-control" name="voManager" required>
						            </div>
						        </div>
							    
							    <div class="form-item">
							        <label class="col-form-label">연락처</label>
							        <div class="form-control-wrapper">
							            <input type="text" class="form-control" name="voContact" required>
							        </div>
							    </div>
							</div>
						
						    <div class="form-group row">
						        <div class="form-item">
						            <label class="col-form-label">모집기간</label>
						            <div class="form-control-wrapper">
						                <div class="input-group">
						                    <input type="date" class="form-control" name="voRecruitStart" required>
						                    <span class="input-group-text">~</span>
						                    <input type="date" class="form-control" name="voRecruitEnd" required>
						                </div>
						            </div>
						        </div>
						        <div class="form-item">
						            <label class="col-form-label">봉사기간</label>
						            <div class="form-control-wrapper">
						                <div class="input-group">
						                    <input type="date" class="form-control" name="voStartDate" required>
						                    <span class="input-group-text">~</span>
						                    <input type="date" class="form-control" name="voEndDate" required>
						                </div>
						            </div>
						        </div>
						    </div>
						    
						    <div class="form-item">
						        <label class="col-form-label">활동내용</label>
						        <div class="form-control-wrapper">
						            <textarea class="form-control" name="voContent" rows="8" required></textarea>
						        </div>
						    </div>
						    
							</form>
						</div>
					</div>
				<div class="row">
			        <div class="col-12 text-center mt-4">
			            <button type="submit" class="btn btn-primary px-5" form="postForm">등록</button>
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
    $(document).ready(function() {
        $('#postForm').on('submit', function(e) {
            e.preventDefault();
            
            var formData = {
                voTitle: $('input[name="voTitle"]').val(),
                voLocation: $('input[name="voLocation"]').val(),
                voTarget: $('input[name="voTarget"]').val(),
                voContent: $('textarea[name="voContent"]').val(),
                voCapacity: $('input[name="voCapacity"]').val(),
                voManager: $('input[name="voManager"]').val(),
                voContact: $('input[name="voContact"]').val(),
                voStartDate: $('input[name="voStartDate"]').val(),
                voEndDate: $('input[name="voEndDate"]').val(),
                voRecruitStart: $('input[name="voRecruitStart"]').val(),
                voRecruitEnd: $('input[name="voRecruitEnd"]').val(),
                status: 'active'
            };
            
            $.ajax({
                url: '/volunteer/manage/submit',
                type: 'POST',
                data: formData,
                success: function(response) {
                    alert('봉사활동이 등록되었습니다.');
                    window.location.href = '/volunteer/manage';
                },
                error: function(xhr) {
                    alert('등록 중 오류가 발생했습니다: ' + xhr.responseText);
                }
            });
        });
    });
    </script>
    
</body>
</html>