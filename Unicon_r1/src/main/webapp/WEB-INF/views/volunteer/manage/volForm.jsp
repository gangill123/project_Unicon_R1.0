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
	.card {
	    border: none;
	    box-shadow: 0 0 20px rgba(0, 0, 0, 0.08);
	    border-radius: 12px;
	    background: #fff;
	    margin: 20px 0;
	}
	
	.card-body {
	    padding: 2rem;
	}
	
	.form-control {
	    border: 2px solid #e9ecef;
	    border-radius: 8px;
	    padding: 0.75rem 1rem;
	    transition: all 0.3s ease;
	    font-size: 0.95rem;
	}
	
	.form-control:focus {
	    border-color: #4B49AC;
	    box-shadow: 0 0 0 0.2rem rgba(75, 73, 172, 0.15);
	}
	
	.col-form-label {
	    font-weight: 500;
	    color: #2C2C2C;
	    font-size: 0.95rem;
	}
	
	.input-group {
	    border-radius: 8px;
	    overflow: hidden;
	}
	
	.input-group .form-control {
	    border-radius: 8px;
	}
	
	.input-group-text {
	    background-color: #f8f9fa;
	    border: 2px solid #e9ecef;
	    color: #6c757d;
	}
	
	textarea.form-control {
	    min-height: 120px;
	    resize: vertical;
	}
	
	.btn {
	    padding: 0.75rem 2rem;
	    font-weight: 500;
	    border-radius: 8px;
	    transition: all 0.3s ease;
	}
	
	.btn-primary {
	    background-color: #4B49AC;
	    border-color: #4B49AC;
	}
	
	.btn-primary:hover {
	    background-color: #3f3e8e;
	    border-color: #3f3e8e;
	    transform: translateY(-1px);
	}
	
	.btn-light {
	    background-color: #f8f9fa;
	    border-color: #e9ecef;
	}
	
	.btn-light:hover {
	    background-color: #e9ecef;
	    border-color: #dde1e5;
	}
	
	.form-group {
	    margin-bottom: 1.5rem;
	}
	
	.page-title {
	    color: #2C2C2C;
	    font-weight: 600;
	    margin-bottom: 1.5rem;
	}
	
	@media (max-width: 768px) {
	    .col-form-label {
	        margin-bottom: 0.5rem;
	    }
	    
	    .form-group {
	        margin-bottom: 1rem;
	    }
	    
	    .btn {
	        width: 100%;
	        margin-bottom: 0.5rem;
	    }
	}
	
	.form-control:hover {
	    border-color: #4B49AC;
	}
	
	.form-control[required] {
	    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8' viewBox='0 0 8 8'%3E%3Ccircle cx='4' cy='4' r='3' fill='%23dc3545'/%3E%3C/svg%3E");
	    background-position: right 0.75rem center;
	    background-repeat: no-repeat;
	    background-size: 8px 8px;
	    padding-right: 2rem;
	}
	
	@keyframes fadeIn {
	    from { opacity: 0; transform: translateY(10px); }
	    to { opacity: 1; transform: translateY(0); }
	}
	
	.card {
	    animation: fadeIn 0.5s ease-out;
	}	

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
	                <h3 class="page-title">봉사활동 공고 등록</h3>
	            </div>
	
	            <div class="card">
	                <div class="card-body">
	                    <div class="row justify-content-center">
			            	<div class="col-md-8 offset-md-2">
		                    <form id="postForm" class="forms-sample">
		                        <div class="form-group row">
		                            <label class="col-sm-2 col-form-label">봉사활동명</label>
		                            <div class="col-sm-7">
		                                <input type="text" class="form-control" name="voTitle" required>
		                            </div>
		                        </div>
		                        <div class="form-group row">
								    <label class="col-sm-2 col-form-label">봉사장소</label>
								    <div class="col-sm-7">
								        <input type="text" class="form-control" name="voLocation" required>
								    </div>
								</div>
								<div class="form-group row">
								    <label class="col-sm-2 col-form-label">모집대상</label>
								    <div class="col-sm-7">
								        <input type="text" class="form-control" name="voTarget" required>
								    </div>
								</div>
								<div class="form-group row">
								    <label class="col-sm-2 col-form-label">활동내용</label>
								    <div class="col-sm-7">
								        <textarea class="form-control" name="voContent" rows="4" required></textarea>
								    </div>
								</div>
		                        <div class="form-group row">
		                            <label class="col-sm-2 col-form-label">모집인원</label>
		                            <div class="col-sm-7">
		                                <input type="number" class="form-control" name="voCapacity" required>
		                            </div>
		                        </div>
		                        <div class="form-group row">
								    <label class="col-sm-2 col-form-label">담당자</label>
								    <div class="col-sm-7">
								        <input type="text" class="form-control" name="voManager" required>
								    </div>
								</div>
								<div class="form-group row">
								    <label class="col-sm-2 col-form-label">연락처</label>
								    <div class="col-sm-7">
								        <input type="text" class="form-control" name="voContact" required>
								    </div>
								</div>
		                        <div class="form-group row">
		                            <label class="col-sm-2 col-form-label">모집기간</label>
		                            <div class="col-sm-7">
		                                <div class="input-group">
		                                    <input type="date" class="form-control" name="voRecruitStart" required>
		                                    <span class="input-group-text">~</span>
		                                    <input type="date" class="form-control" name="voRecruitEnd" required>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="form-group row">
		                            <label class="col-sm-2 col-form-label">봉사기간</label>
		                            <div class="col-sm-7">
		                                <div class="input-group">
		                                    <input type="date" class="form-control" name="voStartDate" required>
		                                    <span class="input-group-text">~</span>
		                                    <input type="date" class="form-control" name="voEndDate" required>
		                                </div>
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