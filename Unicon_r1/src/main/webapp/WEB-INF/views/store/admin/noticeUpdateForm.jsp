<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>유니콘</title>
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/resources/admin/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
     <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    
    
	
	<style type="text/css">
	.notice-btn {
		padding: 1rem 1rem 1rem 0;
		display: flex;
		align-items: center;	
	
	}
	
	.notice-btn button {
	    padding-bottom: 1rem;
	    color: #333;
	    background: #fff;
	    border: 0;
	    width: 300px;
	}
	
	.underline {
	    height: 2px; /* 언더라인의 높이 */
	    background: #ccc; /* 기본 언더라인 색상 */
	    transition: background 0.3s ease; /* 트랜지션 추가 */
	}
	
	.selected {
	    background: #333; /* 선택된 상태의 언더라인 색상 */
	}
	</style>    
    
    
    
  </head>
  <body>
    <div class="container-scroller">
      <%@ include file="/WEB-INF/views/inc/admin_store_navbar.jsp"%>
      <div class="container-fluid page-body-wrapper">
		<%@ include file="/WEB-INF/views/inc/admin_store_sidebar.jsp"%>
        <div class="main-panel">
          <div style="padding: .8rem 2.875rem 0 2.875rem;" class="content-wrapper">
            <div class="d-xl-flex justify-content-between align-items-start">
            </div>
            <div class="row">
              <div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">공지사항 글쓰기</h4>
                    <form id="myForm">
                    <div class="form-check form-check-flat form-check-primary" style="line-height: 17px;margin-right: 14px;">
                        <label class="form-check-label">
                        	<input type="checkbox" name="importantCh" class="form-check-input">
                        </label>
                        <span style="margin-left: 8px;">중요 공지</span>
                    </div>
                    <div class="form-group">
                    	<div >
                       <input type="text" class="form-control" id="input-title" name="anoTitle" placeholder="제목" value="${list.anoTitle}" required="required">
                    	</div>
                    </div>
					<div class="mb-3" style="display: flex; justify-content: center;">
                       <textarea id="noContent" name="noContent"></textarea>
                    </div>
                    <button type="submit" id="submit" class="btn btn-primary mr-2">수정</button>
                    <button class="btn btn-light">취소</button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:/WEB-INF/views/inc/admin_footer.jsp -->
		  <%@ include file="/WEB-INF/views/inc/admin_footer.jsp"%>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="/resources/admin/vendors/chart.js/Chart.min.js"></script>
    <script src="/resources/admin/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="/resources/admin/js/off-canvas.js"></script>
    <script src="/resources/admin/js/hoverable-collapse.js"></script>
    <script src="/resources/admin/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="/resources/admin/js/dashboard.js"></script>
    <!-- End custom js for this page -->
    <!-- Summernote JS -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
    <script type="text/javascript">
    
    $(document).ready(function() {
    	
        $('#noContent').summernote({
        	height: 500,
        	width:  '100%',   // 에디터 너비 (이 속성은 일부 버전에서 지원되지 않을 수 있습니다)
            lang: 'ko-KR',
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['ul', 'ol','paragraph']], // 'paragraph'를 추가하여 문단 정렬 기능 활성화
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ],
            callbacks: {
                onImageUpload: function (files) {
                  for (let file of files) {
                    uploadSummernoteImage(file, this);
                  }
                },
              },
        });
        
        function uploadSummernoteImage(file, editor) {
    	    var formData = new FormData();
    	    formData.append("file", file);

    	    $.ajax({
    	        url: '/store/api/upload',
    	        type: 'POST',
    	        data: formData,
    	        processData: false,
    	        contentType: false,
    	        success: function(imageUrl) {
    	            console.log('이미지 업로드 성공:', imageUrl);
    	            $(editor).summernote('insertImage', imageUrl);	
    	        },
    	        error: function(xhr, status, error) {
    	            console.error('이미지 업로드 실패:', error);
    	            console.error('상태 코드:', xhr.status);
    	            console.error('응답 텍스트:', xhr.responseText);
    	            alert('이미지 업로드에 실패했습니다.');
    	        }
    	    });
    	}
        
        $('#submit').click(function () {
        	event.preventDefault(); // 기본 폼 제출 방지
        	
        	 // 제목 값 가져오기
            var title = $('#input-title').val().trim();
            // 썸머노트 내용 가져오기
            var content = $('#noContent').summernote('code').trim();
	         // 중요 공지 체크 여부 가져오기
            var important = $('input[name="importantCh"]').is(':checked'); // 체크박스의 상태
        	 // 유효성 검사
            if (title === '') {
                alert('제목을 입력해 주세요.');
                $('#input-title').focus();
                return false;
            }

         	// 내용 유효성 검사: <p> 태그 안에 값이 있는지 확인
            var hasContent = $('<div>').html(content).find('p').text().trim().length > 0;

            if (!hasContent) {
                alert('내용을 입력해 주세요.');
                $('#noContent').summernote('focus'); // 썸머노트에 포커스 주기
                return false;
            }
            
            var htmlContent = $('#noContent').summernote('code');
            
        	// AJAX 요청을 통해 데이터를 전송
            $.ajax({
                url: '/store/admin/notices', // 데이터를 전송할 URL
                type: 'PATCH',
                data: JSON.stringify({
                    anoId: anoId, // VO의 필드
                    anoTitle: title,
                    anoContent: htmlContent,
                    importantCh: important
                }),
                contentType: 'application/json', // JSON 형식으로 전송
                success: function(response) {
                    // 성공 시 처리
                    console.log('성공:', response);
                    window.location.href = "/store/admin/notice"; // 원하는 URL로 변경
                },
                error: function(xhr, status, error) {
                    // 오류 시 처리
                    console.error('오류:', error);
                }
            });
            
        });
     	// 서버에서 가져온 내용을 썸머노트에 설정
     	var savedContent = '${list.anoContent.replace("'", "\\'").replace('"', '\\"')}';
        $('#noContent').summernote('code', savedContent);
        
        
     	var anoId = '${list.anoId}';
     	var importantValue = '${list.important}';
     	var importantNum = Number(importantValue);
     	console.log(importantNum);
     	if(importantNum) {
     		 $('input[name="importantCh"]').prop('checked', true); // 체크박스 체크
     	}
     	
     	
        $('.btn-light').click(function () {
	        window.history.back();
        });
        
    });
    </script>
  </body>
</html>