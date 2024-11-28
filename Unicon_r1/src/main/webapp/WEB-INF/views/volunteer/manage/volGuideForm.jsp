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
    <%@ include file="/WEB-INF/views/inc/admin_navbar.jsp" %>
    <div class="container-fluid page-body-wrapper">
        <%@ include file="/WEB-INF/views/inc/admin_sidebar.jsp" %>

        <div class="main-panel">
           <div class="content-wrapper">
               <div class="page-header">
                   <h3 class="page-title">봉사활동 안내문 수정</h3>
               </div>
               <div class="card">
			    <div class="card-body">
			        <div class="row justify-content-center">
			            <div class="col-md-8 offset-md-2">
			                <form id="guideForm" class="forms-sample">
			                    <div class="form-group row">
			                        <label class="col-sm-2 col-form-label">봉사장소</label>
			                        <div class="col-sm-7">
			                            <input type="text" class="form-control" name="voLocation" value="${guide.voLocation}" required>
			                        </div>
			                    </div>
			                    <div class="form-group row">
			                        <label class="col-sm-2 col-form-label">모집대상</label>
			                        <div class="col-sm-7">
			                            <input type="text" class="form-control" name="voTarget" value="${guide.voTarget}" required>
			                        </div>
			                    </div>
			                    <div class="form-group row">
			                        <label class="col-sm-2 col-form-label">활동내용</label>
			                        <div class="col-sm-7">
			                            <textarea class="form-control" name="voContent" rows="3" required>${guide.voContent}</textarea>
			                        </div>
			                    </div>
			                    <div class="form-group row">
			                        <label class="col-sm-2 col-form-label">모집인원</label>
			                        <div class="col-sm-7">
			                            <input type="number" class="form-control" name="voCapacity" value="${guide.voCapacity}"required>
			                        </div>
			                    </div>
			                    <div class="form-group row">
			                        <label class="col-sm-2 col-form-label">담당자</label>
			                        <div class="col-sm-7">
			                            <input type="text" class="form-control" name="voManager" value="${guide.voManager}" required>
			                        </div>
			                    </div>
			                    <div class="form-group row">    
			                        <label class="col-sm-2 col-form-label">연락처</label>
			                        <div class="col-sm-7">
			                            <input type="text" class="form-control" name="voContact" value="${guide.voContact}" required>
			                        </div>
			                    </div>
			                </form>
			            </div>
			        </div>
			        <div class="mt-4 text-center">
			            <button type="submit" class="btn btn-primary px-5" form="guideForm">저장</button>
			            <button type="button" class="btn btn-light px-5" onclick="history.back()">취소</button>
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
 	// CSRF 토큰 설정
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
       $('#guideForm').on('submit', function(e) {
           e.preventDefault();
           
           var formData = {
               voLocation: $('input[name="voLocation"]').val(),
               voTarget: $('input[name="voTarget"]').val(),
               voContent: $('textarea[name="voContent"]').val(),
               voCapacity: $('input[name="voCapacity"]').val(),
               voManager: $('input[name="voManager"]').val(),
               voContact: $('input[name="voContact"]').val()
           };
           
           $.ajax({
               url: '/volunteer/manage/updateGuide',
               type: 'POST',
               contentType: 'application/json; charset=utf-8',
               data: JSON.stringify(formData),
               success: function(response) {
                   if(response === "success") {
                       alert("안내문이 성공적으로 수정되었습니다.");
                       window.location.href = '/volunteer/manage';
                   }
               },
               error: function(xhr) {
                   alert("안내문 수정에 실패했습니다. 다시 시도해주세요.");
                   console.error(xhr);
               }
           });
       });
    });
    </script>
    
</body>
</html>