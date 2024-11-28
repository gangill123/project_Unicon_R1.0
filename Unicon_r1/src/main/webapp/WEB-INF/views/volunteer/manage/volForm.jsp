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