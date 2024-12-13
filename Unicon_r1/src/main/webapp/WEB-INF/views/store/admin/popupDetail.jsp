<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>유니콘</title>
<link rel="stylesheet"
	href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="/resources/admin/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet"
	href="/resources/admin/vendors/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="/resources/admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
<link rel="stylesheet" href="/resources/admin/css/style.css">
<link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
<style type="text/css">
.store-notice {
	color: black;
	line-height: 42px;
}

.store-notice-left {
	font-size: 32px;
}

.store-notice-right {
	font-size: 32px;
}

.store-flex, .store-card-flex {
	display: flex;
	justify-content: space-between;
}

.store-flex h5, h6, .store-card-title h5 {
	margin: 0;
	line-height: 26px;
}

.store-card-title {
	display: flex;
}

.store-card-title i {
	margin-left: 0.5rem;
	font-size: 20px;
}

.store-card-flex a {
	color: #8e94a9;
	transition: color 0.3s;
}
/* 호버 시 색상 */
.store-card-flex a:hover {
	color: #bf94e4;
}

.store-flex span a {
	color: gray;
}

.prev {
	left: 10px;
}

.next {
	right: 10px;
}

/* img upload css */
.upload-container {
	position: relative;
	aspect-ratio: 1/1;
	border: 2px dashed #ccc;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
	background-color: #f9f9f9;
	width: 110px;
}

.upload-button {
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0;
	height: 100px;
	width: 100px;
	position: absolute;
}

#plusIcon1, #plusIcon2, #plusIcon3, #plusIcon4, #plusIcon5 {
	font-size: 2rem;
	color: #888;
}

#image-preview1, #image-preview2, #image-preview3, #image-preview4,
	#image-preview5 {
	width: 100%;
	height: 100%;
	object-fit: fill;
	display: none;
}

#main-slide-update {
	float: right;
}

.date-input {
	height: 2rem;
	width: 20rem;
	border: 1px solid #ccc;
	font-size: 13px;
	padding-left: 1.3rem;
}
/* img upload css */
.date-input:focus {
	border: 1px solid #ccc;
}

.date-picker-btn {
	border: 1px solid #ccc;
	border-left: none;
}
.upload {
    display: flex;
}

#image-input1 {
	width: 20rem;
    height: 2.4em;
    border: 1px solid #3333;
    border-right: none;
}

.form-group  input {
	width: 20rem;

}
</style>



</head>
<body>
	<div class="container-scroller">
		<!-- partial:/WEB-INF/views/inc/admin_navbar.jsp -->
		<%@ include file="/WEB-INF/views/inc/admin_store_navbar.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:/WEB-INF/views/inc/admin_sidebar.jsp" -->
			<%@ include file="/WEB-INF/views/inc/admin_store_sidebar.jsp"%>
			<!-- partial -->
			<div class="main-panel">
				<div style="padding: .8rem 2.875rem 0 2.875rem;"
					class="content-wrapper">
					<!--             <div class="row" id="proBanner">
              <div class="col-12">
				<span class="d-flex align-items-center purchase-popup">
                  <p>Like what you see? Check out our premium version for more.</p>
                  <a href="https://github.com/BootstrapDash/ConnectPlusAdmin-Free-Bootstrap-Admin-Template" target="_blank" class="btn ml-auto download-button">Download Free Version</a>
                  <a href="http://www.bootstrapdash.com/demo/connect-plus/jquery/template/" target="_blank" class="btn purchase-button">Upgrade To Pro</a>
                  <i class="mdi mdi-close" id="bannerClose"></i>
                </span>
              </div>
            </div> -->
					<div class="d-xl-flex justify-content-between align-items-start">
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card"></div>
							<div class="tab-content tab-transparent-content">
								<div class="tab-pane fade show active" id="business-1"
									role="tabpanel" aria-labelledby="business-tab">
									<div class="row">
										<div class="col-12 grid-margin stretch-card">
											<div class="card">
												<div class="card-body">
													<h4 class="card-title">팝업</h4>
													<form class="forms-sample">
														<div class="form-group">
															<label for="exampleInputTitle">제목</label> <input
																type="text" class="form-control" style="width: 20rem" id="exampleInputTitle"
																placeholder="제목을 입력하세요." value="${list.anoTitle}" name="title">
														</div>
														<div class="form-group">
													        <label for="popupWidth">팝업 너비 (px)</label>
													        <input type="number" class="form-control" value="${list.popupWidth}" id="popupWidth" placeholder="너비를 입력하세요." name="popupWidth" min="100" />
													    </div>
													    <div class="form-group">
													        <label for="popupHeight">팝업 높이 (px)</label>
													        <input type="number" class="form-control" value="${list.popupHeight}" id="popupHeight" placeholder="높이를 입력하세요." name="popupHeight" min="100" />
													    </div>
														<div class="form-group">
															<label for="exampleInputPassword4">게시 기간</label>
															<div class="date-selection">
																<div style="display: flex" class="date-picker">
																	<input type="text" class="date-input" readonly>
																	<button class="date-picker-btn">
																		<i class="mdi mdi-calendar-check"></i>
																	</button>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label>이미지 업로드</label> 
															<div class="upload">
														    <input type="file" accept="image/*" id="image-input1" name="upload_images[0]" style="display: none" />
														    <input type="text" id="file-name" class="form-control" style="width: 20rem; display: none" disabled placeholder="Upload Image" />
														    <img id="image-preview" style="width: 300px; height: 300px;" src="${list.image_src}">
														    <button class="file-upload-browse btn btn-primary" id="uploadButton">upload</button>
														</div>
														</div>
														<button type="submit" class="btn btn-primary mr-2">수정</button>
														<button class="btn btn-light">초기화</button>
													</form>
												</div>
											</div>
										</div>
									</div>
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
	<script
		src="/resources/admin/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="/resources/admin/js/off-canvas.js"></script>
	<script src="/resources/admin/js/hoverable-collapse.js"></script>
	<script src="/resources/admin/js/misc.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script src="/resources/admin/js/dashboard.js"></script>
	<!-- End custom js for this page -->


	<script type="text/javascript">
	var modelStartDate = "${list.start_date}";
	var modelEndDate = "${list.end_date}";
	let ano_id = "${list.anoId}";
	let start_date = modelStartDate;
	let end_date = modelEndDate;
		$(document).ready(function() {
				$(".date-input").val(modelStartDate + (modelEndDate ? " - " + modelEndDate : ""));
					// 오늘 날짜 설정
					const today = new Date();

					// 날짜를 YYYY-MM-DD 형식으로 변환하는 함수
					function formatDate(date) {
						return date.toISOString().split('T')[0];
					}

					// Flatpickr 인스턴스 생성
					const picker = flatpickr(".date-picker-btn", {
						mode : "range", // 범위 선택 모드
						dateFormat : "Y-m-d",
						locale : "ko",
						minDate : today,
						position : 'below', // 달력을 입력 박스 아래에 표시
						onChange : onDateChange
					// onChange 핸들러를 별도로 정의
					});
					function onDateChange(selectedDates) {
						// 선택된 날짜 범위를 입력 필드에 넣기
						const startDate = selectedDates[0] ? flatpickr
								.formatDate(selectedDates[0], "Y-m-d") : "";
						const endDate = selectedDates[1] ? flatpickr
								.formatDate(selectedDates[1], "Y-m-d") : "";

						// 시작일과 종료일을 입력 필드에 표시
						$(".date-input").val(
								startDate + (endDate ? " - " + endDate : ""));

						start_date = startDate + " 00:00:00";
						end_date = endDate + " 23:59:59";

						console.log(start_date);
						console.log(end_date);
					}

					// 폼 제출 시 새로고침 방지
					$(".forms-sample").on("submit", function(event) {
						 event.preventDefault(); // 기본 동작 방지

					    // 유효성 검사
					    let isValid = true; // 유효성 플래그
					    const anoTitle = $('#exampleInputTitle').val().trim();
					    const dateInput = $('.date-input').val().trim();
					    const fileName = $('#file-name').val().trim();
					    const popupWidth = $('#popupWidth').val().trim(); // jQuery 사용
					    const popupHeight = $('#popupHeight').val().trim(); // jQuery 사용

					    // 제목 유효성 검사
					    if (anoTitle === "") {
					        alert("제목을 입력하세요."); // 경고 메시지
					        isValid = false;
					    }

					    // 게시 기간 유효성 검사
					    if (dateInput === "") {
					        alert("게시 기간을 선택하세요."); // 경고 메시지
					        isValid = false;
					    } else {
					    	 // 선택된 날짜가 유효한지 추가 검사
					        if (start_date === "" || end_date === "") {
					            alert("시작일과 종료일을 모두 선택하세요."); // 경고 메시지
					            isValid = false;
					        }
					    	
					    }

					 	// 이미지 업로드 유효성 검사
					    const imagePreviewVisible = $('#image-preview').css('display') !== 'none'; // 이미지 미리보기 보이는지 확인
					    if (!imagePreviewVisible && fileName === "") {
					        alert("이미지를 업로드하세요."); // 경고 메시지
					        isValid = false;
					    }
					    
					 	// 팝업 너비 유효성 검사
				        if (popupWidth === "" || popupHeight === "") {
				            alert("팝업 너비와 높이를 입력하세요."); // 경고 메시지
				            isValid = false;
				        } else {
				            if (parseInt(popupWidth) < 100 || parseInt(popupHeight) < 100) {
				                alert("팝업 너비와 높이는 100 이상이어야 합니다."); // 경고 메시지
				                isValid = false;
				            }
				        }

					    // 모든 유효성 검사가 통과한 경우
					    if (isValid) {
					    	// FormData 객체 생성
					        const formData = new FormData();
					        formData.append("anoId", ano_id);
					        formData.append("anoTitle", anoTitle);
					        formData.append("dateInput", dateInput);
					        formData.append("start_date", start_date);
					        formData.append("end_date", end_date);
					        formData.append("fileName", fileName);
					        formData.append("popupWidth", popupWidth);
					        formData.append("popupHeight", popupHeight);
					        
					        // 이미지 파일 추가 (파일 입력 필드에서)
					        const fileInput = document.getElementById('image-input1');
					        if (fileInput.files.length > 0) {
					            formData.append("upload_images", fileInput.files[0]); // 파일 추가
					        }
					        
					        $.ajax({
					            url: '/store/admin/popup/update', // 서버 URL
					            method: 'POST',
					            data: formData,
					            processData: false, // jQuery가 데이터를 처리하지 않도록 설정
					            contentType: false, // jQuery가 Content-Type을 설정하지 않도록 설정
					            success: function(response) {
				                    window.location.href = '/store/admin/popup'; // 예시 URL
					            },
					            error: function(xhr, status, error) {
					                // 오류 처리
					                console.error(error);
					            }
					        });
					    
					    }
					});

					$('#uploadButton').on('click', function() {
			            event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)\
			            // 파일 입력 요소 클릭
			            $('#image-input1').click();
			         	// 두 번째 input 필드의 display를 block으로 변경
			            $('#file-name').css('display', 'block');
			            $('#image-input1').on('change', function(e) {
						    const file = e.target.files[0];
						    const fileTypeFilter = /(\.jpg|\.jpeg|\.png|\.gif|\.bmp|\.tiff|\.webp|\.svg|\.heic|\.ico|\.raw)$/i;

						    // 파일이 선택되었는지 확인
						    if (file) {
						        // 파일 이름과 확장자 확인
						        const fileName = file.name;
						        if (!fileTypeFilter.test(fileName)) {
						            alert("유효하지 않은 파일 형식입니다. 이미지 파일만 업로드할 수 있습니다."); // 경고 메시지
						            $(this).val(''); // 파일 입력 초기화
						            $('#file-name').css('display', 'none'); // 파일 이름 필드 숨김
						            return; // 함수 종료
						        }

						        // 유효한 파일의 경우, 파일 이름을 텍스트 입력 필드에 설정
						        $('#file-name').val(fileName); // 파일 이름을 텍스트 입력 필드에 설정
						        $('#file-name').css('display', 'block'); // 파일 이름 필드 표시
						    } else {
						        // 파일이 선택되지 않은 경우, 이전 이미지를 보여줌
						        // 이전 이미지가 있는 경우를 가정하고 처리
						        const previousImageSrc = "${list.image_src}"; // 서버에서 이전 이미지의 경로를 가져온다고 가정
						        if (previousImageSrc) {
						            $('#image-preview').attr('src', previousImageSrc); // 이전 이미지 설정
						            $('#image-preview').css('display', 'block'); // 이미지 보이기
						        } else {
						            // 이전 이미지가 없을 경우
						            $('#image-preview').css('display', 'none'); // 이미지 숨김
						        }
						    }
						});
			            // 이미지 미리보기 img 태그의 display를 none으로 변경
			            $('#image-preview').css('display', 'none');
			            
			           
			        });
					
					
					$(".date-picker-btn").on("click", function(event) {
				        event.preventDefault(); // 기본 동작 방지
				    });
					
					
					
					
					
					 // 초기화 버튼 클릭 시 모든 입력 필드 초기화
				    $(".btn-light").on("click", function(event) {
				        event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)
				        
				        // 모든 입력 필드 초기화
				        $(".forms-sample")[0].reset(); // 폼 초기화
				        
				        // 파일 이름 필드 초기화
				        $('#file-name').val(''); // 파일 이름 필드 초기화
				        
				        // 파일 입력 초기화
				        $('#image-input1').val(''); // 파일 선택 초기화
				    });
					
					
					
				});
	</script>
</body>
</html>