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
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
     <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    
    
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
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
    
    <script type="text/javascript">
    $(document).ready(function() {
        $('.notice-btn button').on('click', function() {
        	// 모든 언더라인에서 selected 클래스 제거
            $('.underline').removeClass('selected');
            console.log("실행");
            console.log(this);
            
            // 클릭한 버튼의 다음 언더라인에 selected 클래스 추가
            $(this).next('.underline').addClass('selected');
        });
        
        $('#create-notice').click(function() {
            window.location.href = '/create-notice'; // 예시 URL
        });

        
    });
    </script>
    
    
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
                    	<div class="">
                       <input type="text" class="form-control" id="input-title" name="anoTitle" placeholder="제목">
                    	</div>
                    </div>
					<div class="mb-3" style="display: flex; justify-content: center;">
                       <textarea id="noContent" name="noContent"></textarea>
                    </div>
                    <button type="submit" id="submit" class="btn btn-primary mr-2">저장</button>
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
                ['para', ['ul', 'ol'], // 'paragraph'를 추가하여 문단 정렬 기능 활성화
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
        	var formData = new FormData($("#myForm")[0]); // jQuery 객체에서 DOM 요소로 변환

            var htmlContent = $('#noContent').summernote('code');
            formData.append("anoContent", htmlContent); // FormData에 summernote 내용 추가
            
        	// AJAX 요청을 통해 데이터를 전송
            $.ajax({
                url: '/store/admin/notices', // 데이터를 전송할 URL
                type: 'POST',
                data: formData,
                processData: false, // jQuery가 데이터를 처리하지 않도록 설정
                contentType: false, // jQuery가 콘텐츠 유형을 설정하지 않도록 설정
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
    });
    </script>
  </body>
</html>