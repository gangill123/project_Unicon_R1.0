<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Unicorn</title>
<!-- plugins:css -->
	<!-- Font-Awesome CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/admin/images/favicon.png" />
<style type="text/css">

	/*=============== 색상 css ===============*/
				/* #ffffff 흰색   */
				/* #006e60 청록색 */
				/* #c78aff 보라색 */
	/*=============== 색상 css ===============*/
	
	
	/*=============== 테두리 css ===============*/
	select.form-control {
		border-radius: 0.5rem;
		cursor: pointer;
		padding: 0.35rem 0.35rem;
	}
	
	input.form-control, textarea.form-control {
		border-radius: 0.5rem;
		padding: 0.35rem 0.35rem;
	}
	/*=============== 테두리 css ===============*/
	
	
	/*=============== 이미지 css ===============*/
	.upload-container {
		position: relative;
		aspect-ratio: 1 / 1;
		border: 2px dashed #ccc;
		display: flex;
		justify-content: center;
		align-items: center;
		overflow: hidden;
		background-color: #f9f9f9;
	}
	
	.upload-button {
		position: absolute;
		width: 100%;
		height: 100%;
		cursor: default;
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 0;
	}
	
	#plusIcon0, #plusIcon1, #plusIcon2, #plusIcon3 {
		font-size: 2rem;
		color: #888;
	}
	
	#image-preview0, #image-preview1, #image-preview2, #image-preview3 {
		width: 100%;
		height: 100%;
		object-fit: fill;
		display: none;
	}
	
	.label-no-margin {
		margin: 0 !important;
	}
	/*=============== 이미지 css ===============*/
	
	
	/*=============== 텍스트 css ===============*/
	.custom-label, .custom-text {
		font-size: 1.2rem !important;
		white-space: nowrap;
	}
	
	textarea.custom-text {
		white-space: normal;
	}

	@media (max-width: 1500px) {
		.custom-text {
			font-size: 1rem !important;
		}
	}
	
	@media (max-width: 600px) {
		.custom-text {
			font-size: 0.95rem !important;
		}
	}
		
	input::placeholder, textarea::placeholder {
		color: #ccc !important;
	}
	
	.aAct-hint-text, .aSocial-hint-text {
		color: #006e60;
		font-size: 0.8rem;
		display: none;
		text-shadow: 0 0 0.5rem rgba(0, 110, 96, 0.5);
	}
	/*=============== 텍스트 css ===============*/
	
	
	/*=============== 구분선 css ===============*/
	.custom-borderbm {
		border: 0.2rem;
		border-style: dashed;
		border-color: #aab2bd;
		width: 95%;
		margin: auto;
	}
	/*=============== 구분선 css ===============*/
	
	
	/*=============== 드롭다운 css ===============*/
	#petTypeDetail {
		padding: 0.8rem;
	}
	
	.dropdown .dropdown-menu {
		margin: 0 0 0 0.5rem;
	}
	
	.dropdown-menu {
		display: none;
		position: absolute;
		z-index: 1000;
		background-color: white;
		border: 1px solid #ccc;
		border-radius: 0.6rem !important;
		width: auto;
		height: 50vh;
		overflow-y: auto;
	}
	
	.dropdown-item {
		font-size: 1.2rem !important;
		padding: 8px;
		cursor: pointer;
		color: #001737;
		padding: 0.4rem 0.5rem !important;
	}
	
	@media(max-width: 600px) {
		.dropdown-item {
			font-size: 0.95rem !important;
		}
	}
	
	@media(max-width: 1500px) {
		.dropdown-item {
			font-size: 1rem !important;
		}
	}
	
	.dropdown-item:hover {
		background-color: #1967D2;
		color: white;
	}
	
	.f-arrow {
 		position: absolute;
		right: 0.6rem;
		top: 70%;
		transform: translateY(-50%);
		border: solid transparent;
		pointer-events: none;
		color: #181824;
		font-size: 0.8rem;
	}
	
	.a-year-dropdown {
		display: none;
		border: 0.1rem solid #ccc;
		position: absolute;
		background: white;
		z-index: 1000;
		height: auto;
		cursor: pointer;
		grid-template-columns: repeat(3, 1fr);
		gap: 0.3rem;
		padding: 0.3rem;
		border-radius: 0.6rem;
		width: auto;
	}
	
	@media(max-width:420px) {
		.a-year-dropdown {
			grid-template-columns: repeat(2, 1fr);
		}
	}
	
	.a-year-dropdown.show {
		display: grid;
	}
	
	.a-year-option {
		padding: 0.5rem;
		cursor: pointer;
		text-align: center;
		font-size: 1.2rem;
		border: 0.1rem solid #ccc;
		border-radius: 0.5rem;
		transition: background-color 0.3s;
		white-space: nowrap;
	}

	.a-year-option:hover {
		background-color: #006e60;
		color: white;
	}
	/*=============== 드롭다운 css ===============*/
	
	
	/*=============== 필드셋 css ===============*/
	.custom-a-fieldset {
		border: 2px solid #ccc;
		padding: 1rem;
		border-radius: 1rem;
	}
	
	.custom-a-legend {
		width: auto;
		color: #001737;
		padding: 0 0.5rem;
	}
	
	.custom-a-sub-legend {
		font-size: 1.3rem;
		width: auto;
		color: #001737;
		padding: 0 0.5rem;
	}
	/*=============== 필드셋 css ===============*/
	
	
	/*=============== 도움말 css ===============*/
	.aAct-tooltip, .aSocial-tooltip {
		position: relative;
		display: inline-block;
	}
	
	.aAct-tooltip-icon, .aSocial-tooltip-icon {
		font-size: 1.1rem;
		cursor: pointer;
		color: black;
	}
	
	.aAct-tooltip-text, .aSocial-tooltip-text {
		visibility: hidden;
		width: 25rem;
		background-color: black;
		color: #fff;
		text-align: left;
		border-radius: 0.5rem;
		padding: 1rem;
		position: absolute;
		z-index: 1;
		bottom: 125%;
		left: 50%;
		margin: 0 -9rem;
		opacity: 0;
		transition: opacity 0.3s;
		font-size: 1.1rem;
	}
	
	@media(max-width:500px) {
		.aAct-tooltip-text, .aSocial-tooltip-text {
			width: 17rem;
			margin: 0 -8rem;
			opacity: 0;
			transition: opacity 0.3s;
			font-size: 0.8rem;
		}
	}
	
	.aSocial-tooltip-text i {
		font-size: 1.2rem;
	}
	
	.aAct-tooltip:hover .aAct-tooltip-text, .aSocial-tooltip:hover .aSocial-tooltip-text {
		visibility: visible;
		opacity: 1;
	}
	/*=============== 도움말 css ===============*/
	
	
	/*=============== 체크박스 css ===============*/
	.aAct-checkbox-group, .aSocial-checkbox-group {
		display: flex;
	}
	
	.aAct-checkbox-box, .aSocial-checkbox-box {
		display: flex;
		align-items: center;
		justify-content: center;
		width: 10rem; 
		height: 3rem;
		background-color: #fdfdfd;
		border: 1px solid #ccc;
		margin-right: 0;
		cursor: pointer;
		transition: background-color 0.3s, border-color 0.3s;
		color: #bbb;
	}
	
	.aAct-checkbox-box-first, .aSocial-checkbox-box-first {
		display: flex;
		align-items: center;
		justify-content: center;
		width: 10rem; 
		height: 3rem;
		background-color: #fdfdfd;
		border: 1px solid #ccc;
		margin-right: 0;
		cursor: pointer;
		transition: background-color 0.3s, border-color 0.3s;
		border-radius: 0.7rem 0 0 0.7rem;
		color: #bbb;
	}
	
	.aAct-checkbox-box-end, .aSocial-checkbox-box-end {
		display: flex;
		align-items: center;
		justify-content: center;
		width: 10rem; 
		height: 3rem;
		background-color: #fdfdfd;
		border: 1px solid #ccc;
		margin-right: 0;
		cursor: pointer;
		transition: background-color 0.3s, border-color 0.3s;
		border-radius: 0 0.7rem 0.7rem 0;
		color: #bbb;
	}

	.aAct-checkbox-box i, .aSocial-checkbox-box i,
	.aAct-checkbox-box-first i, .aSocial-checkbox-box-first i,
	.aAct-checkbox-box-end i, .aSocial-checkbox-box-end i {
		font-size: 1.2rem;
	}
	
	.aAct-checkbox-box input, .aAct-checkbox-box-first input, .aAct-checkbox-box-end input,
	.aSocial-checkbox-box input, .aSocial-checkbox-box-first input, .aSocial-checkbox-box-end input {
		position: absolute;
		opacity: 0;
		cursor: pointer;
	}
	
	.aAct-checkbox-box:hover, .aAct-checkbox-box-first:hover, .aAct-checkbox-box-end:hover,
	.aSocial-checkbox-box:hover, .aSocial-checkbox-box-first:hover, .aSocial-checkbox-box-end:hover {
		background-color: #d0d0d0;
	}
	
	.aAct-checkbox-box:has(input[type="checkbox"]:checked), .aAct-checkbox-box-first:has(input[type="checkbox"]:checked), 
	.aAct-checkbox-box-end:has(input[type="checkbox"]:checked),
	.aSocial-checkbox-box:has(input[type="checkbox"]:checked), .aSocial-checkbox-box-first:has(input[type="checkbox"]:checked),
	.aSocial-checkbox-box-end:has(input[type="checkbox"]:checked) {
		background-color: #006e60;
		color: white;
	}
	
	.a-checkbox-alert {
		border: 0.15rem solid #006e60;
		border-radius: 0.8rem;
		box-shadow: 0 0 0.5rem #006e60;
	}
	/*=============== 체크박스 css ===============*/
	
	
	/*=============== 버튼 css ===============*/
	.custom-a-btn-name {
		font-size: 0.8rem;
		border-color: #006e60;
		border-radius: 0 0.5rem 0.5rem 0;
		padding: 0.5rem;
	}
	
	@media(max-width:500px) {
		.custom-a-btn-name {
			font-size: 0.8rem;
			border-color: #006e60;
		}
		
		.custom-a-btn-name i {
			font-size: 1.1rem;
		}
		
		.custom-a-btn-name span {
			display:none;
		}
		
		.card-body {
			padding: 1rem 1rem !important;
		}
	}
	
	.custom-a-btn-images {
		font-size: 0.75rem;
		padding: 0.5rem;
	}
	
	.btn-custom-a {
		color: #fff;
		background-color: #006e60;
		border-color: #006e60; 
	}

	.btn-custom-a:hover {
		color: #fff;
		background-color: #005247;
		border-color: #004f44; 
	}
	
	.btn-custom-a:focus, .btn-custom-a.focus {
		color: #fff;
		background-color: #005247;
		border-color: #004f44;
		-webkit-box-shadow: 0 0 0 0.2rem rgba(0, 82, 71, 0.5);
		box-shadow: 0 0 0 0.2rem rgba(0, 82, 71, 0.5);
	}
	
	.btn-custom-a.disabled, .btn-custom-a:disabled {
		color: #fff;
		background-color: #006e60;
		border-color: #006e60; 
	}
	
	.btn-custom-a:not(:disabled):not(.disabled):active, .btn-custom-a:not(:disabled):not(.disabled).active,
	.show > .btn-custom-a.dropdown-toggle {
		color: #fff;
		background-color: #005247;
		border-color: #004f44;
	}

	.btn-custom-a:not(:disabled):not(.disabled):active:focus, .btn-custom-a:not(:disabled):not(.disabled).active:focus,
	.show > .btn-custom-a.dropdown-toggle:focus {
		-webkit-box-shadow: 0 0 0 0.2rem rgba(0, 110, 96, 0.5);
		box-shadow: 0 0 0 0.2rem rgba(0, 110, 96, 0.5); 
	}

	.btn-outline-custom-a {
		color: #006e60;
		background-color: #fff;
		background-image: none;
		border-color: #006e60;
	}
	
	.btn-outline-custom-a:hover {
		color: #fff;
		background-color: #006e60;
		border-color: #006e60;
	}
	
	.btn-outline-custom-a:focus, .btn-outline-custom-a.focus {
		/* box-shadow: 0 0 0 3px rgba(0, 110, 96, 0.5); */
	}
	
	.btn-outline-custom-a.disabled, .btn-outline-custom-a:disabled {
		color: #006e60;
		background-color: transparent;
	}
	
	.btn-outline-custom-a:active, .btn-outline-custom-a.active,
	.show > .btn-outline-custom-a.dropdown-toggle {
		color: #fff;
		background-color: #006e60;
		border-color: #006e60;
	}
	/*=============== 버튼 css ===============*/

	/*=============== 바탕 css ===============*/
	.card {
		border-radius: 2rem;
	}
	/*=============== 바탕 css ===============*/
	
</style>
</head>
	<body>
		<div class="container-scroller">
			<!-- partial:navbar.jsp -->
			<%@ include file="/WEB-INF/views/inc/admin_navbar_adpt.jsp"%>
			<!-- partial -->
			<div class="container-fluid page-body-wrapper">
				<!-- partial:sidebar.jsp -->
				<%@ include file="/WEB-INF/views/inc/admin_sidebar_adpt.jsp"%>
				<!-- partial -->
				<div class="main-panel">
					<div class="content-wrapper">
						<div class="row">
							<div class="col-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title">입양 관리 - 입양 글 등록</h4>
										
										<form id="formAdptWriting" action="" method="post">
										
											<fieldset class="custom-a-fieldset mb-3">
												<legend class="custom-a-legend">글 작성</legend>
												
												<div class="form-group row justify-content-center">
													<div class="col-12 col-xl-5 col-lg-8 col-md-6">
														<label class="text-dark custom-label">동물 소개</label>
														<textarea rows="12" wrap="soft" id="adpt_intro" name="adpt_intro" class="form-control custom-text" 
															placeholder="최대 500자" maxlength="500" required></textarea>
													</div>
													<div class="col-12 col-xl-5 col-lg-8 col-md-6">
														<label class="text-dark custom-label">기타사항</label>
														<textarea rows="8" wrap="soft" id="adpt_etc" name="adpt_etc" class="form-control custom-text" 
															placeholder="최대 200자" maxlength="200"></textarea>
													</div>
												</div>
												<div class="border-bottom my-5 custom-borderbm"></div>
												
												<fieldset class="custom-a-fieldset mb-3">
													<legend class="custom-a-sub-legend">동물 정보</legend>
													<div class="form-group row justify-content-center">
														<div class="col-12 col-xl-3 col-lg-5 col-md-5 mb-3">
															<label for="animal_id" class="text-dark custom-label">동물ID</label>
															<input type="text" id="animal_id" name="animal_id" 
																class="form-control custom-text" readonly/>
														</div>
														<div class="col-12 col-xl-3 col-lg-5 col-md-5 mb-3">
															<label for="aRegDate" class="text-dark custom-label">등록일자</label>
															<input type="text" id="aRegDate" class="form-control custom-text" readonly/>
														</div>
													</div>
													<div class="form-group row justify-content-center">
														<div class="col-12 col-xl-2 col-md-3 mb-3">
															<label for="petType" class="text-dark custom-label">동물 종류</label>
															<select class="form-control custom-text" id="petType" disabled>
																<option value="">--</option>
															</select>
														</div>
														<div class="col-12 col-xl-3 col-md-6 mb-3">
															<label class="text-dark custom-label">세부 종류</label>
															<input type="text" id="petTypeDetail" class="form-control custom-text" readonly/>
														</div>
														<div class="col-12 col-xl-3 col-md-6 mb-3">
															<label for="petTypeEtc" class="text-dark custom-label">기타 종류<span class="small">(선택)</span></label>
															<input type="text" id="petTypeEtc" class="form-control custom-text" 
																maxlength="30" readonly/>
														</div>
													</div>
												
													<div class="form-group row justify-content-center">
														<div class="col-12 col-xl-3 col-lg-6 col-md-6 mb-3">
															<label for="aName" class="text-dark custom-label">동물 이름</label>
															<div class="input-group">
															<input type="text" id="aName" class="form-control custom-text"
																maxlength="6" readonly/>
															</div>
														</div>
														<div class="col-12 col-xl-3 col-md-6 mb-3">
															<label for="aColor" class="text-dark custom-label">색상</label>
															<input type="text" id="aColor" class="form-control custom-text"
																maxlength="10" readonly/>
														</div>
														<div class="col-12 col-xl-2 col-lg-3 col-md-3 mb-3">
															<label for="aGender" class="text-dark custom-label">성별</label>
															<select id="aGender"  
																class="form-control custom-text" disabled>
																<option value="">--</option>
																<option value="1">남아</option>
																<option value="2">여아</option>
															</select>
														</div>
														<div class="col-12 col-xl-2 col-lg-3 col-md-3 mb-3">
														<label for="aNeuter" class="text-dark custom-label">중성화</label>
															<select id="aNeuter" 
																class="form-control custom-text" disabled>
																<option value="">--</option>
																<option value="1">&#9675;</option>
																<option value="2">&#10005;</option>
															</select>
														</div>
													</div>
													
													<div class="form-group row d-flex justify-content-center mb-5">
														<div class="col-12 col-xl-3 col-md-6 mb-3">
															<label for="aAge" class="text-dark custom-label">동물 나이</label>
															<input type="text" id="aAge"  class="form-control custom-text"
																readonly/>
														</div>
														<div class="col-12 col-xl-2 col-lg-3 col-md-2 mb-3">
															<label for="aWeight" class="text-dark custom-label">크기</label>
															<select id="aWeight" 
																class="form-control custom-text" disabled>
																<option value="">--</option>
																<option value="1">소형&nbsp;(~5kg)</option>
																<option value="2">중형&nbsp;(5~25kg)</option>
																<option value="3">대형&nbsp;(25kg~)</option>
															</select>
														</div>
														<div class="col-12 col-xl-3 col-lg-5 col-md-5 mb-3">
															<label for="aRegUser" class="text-dark custom-label">작성자</label>
															<input type="text" id="aRegUser" name="member_id" 
																class="form-control custom-text" value="youreal00" readonly/>
														</div>
													</div>
													<div class="form-group row d-flex justify-content-center">
														<div class="col-10 col-xl-2 col-lg-3 col-md-3 mb-2">
															<label class="text-dark custom-label">대표 이미지</label>
														    <div class="upload-container mb-1">
																	<i id="plusIcon0" class="mdi mdi-plus a-preview-i"></i>
																	<img id="image-preview0" class="a-preview" alt="이미지 미리보기" />
															</div>
														</div>
														<div class="col-10 col-xl-2 col-lg-3 col-md-3 mb-2">
															<div></div>
															<label class="text-dark custom-label">이미지<span class="small">(선택)</span></label>
														    <div class="upload-container">
																	<i id="plusIcon1" class="mdi mdi-plus a-preview-i"></i>
																	<img id="image-preview1" class="a-preview" alt="이미지 미리보기" />
															</div>
														</div>
														<div class="col-10 col-xl-2 col-lg-3 col-md-3 mb-2">
															<label class="text-dark custom-label">이미지<span class="small">(선택)</span></label>
														    <div class="upload-container">
																	<i id="plusIcon2" class="mdi mdi-plus a-preview-i"></i>
																	<img id="image-preview2" class="a-preview" alt="이미지 미리보기" />
															</div>
														</div>
														<div class="col-10 col-xl-2 col-lg-3 col-md-3 mb-2">
															<label class="text-dark custom-label">이미지<span class="small">(선택)</span></label>
														    <div class="upload-container">
																	<i id="plusIcon3" class="mdi mdi-plus a-preview-i"></i>
																	<img id="image-preview3" class="a-preview" alt="이미지 미리보기" />
															</div>
														</div>
													</div>
												</fieldset>
													
													
												<div class="form-group row d-flex justify-content-center align-items-center">
													<button type="submit" id="a-submit-btn1" class="btn btn-lg btn-rounded btn-custom-a custom-text mr-2 mb-2">등록하기</button>
													<button type="button" id="a-reset-btn1" class="btn btn-lg btn-rounded btn-light custom-text mb-2">초기화</button>
													<button type="button" 
														class="btn btn-lg btn-rounded btn-warning custom-text mx-2 mb-2 a-modify-btn"> 
														동물 정보 수정
													</button>
												</div>
											</fieldset>
											
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- content-wrapper ends -->
					<!-- partial:footer.jsp -->
					<%@ include file="/WEB-INF/views/inc/admin_footer_adpt.jsp"%>
					<!-- partial -->
				</div>
				<!-- main-panel ends -->
			</div>
			<!-- page-body-wrapper ends -->
		</div>
		<!-- container-scroller -->
		<!-- plugins:js -->
			<script src="${pageContext.request.contextPath}/resources/admin/vendors/js/vendor.bundle.base.js"></script>
		<!-- endinject -->
		<!-- Plugin js for this page -->
		<!-- End plugin js for this page -->
		<!-- inject:js -->
			<!-- sweetalert2 -->
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			<script src="${pageContext.request.contextPath}/resources/admin/js/off-canvas.js"></script>
			<script src="${pageContext.request.contextPath}/resources/admin/js/hoverable-collapse.js"></script>
			<script src="${pageContext.request.contextPath}/resources/admin/js/misc.js"></script>
		<!-- endinject -->
		<!-- Custom js for this page -->
		<script>
			$(function() {
				
				/*=============== 엔터키 제출 방지 ===============*/
				$('#formAdptWriting').on('keydown', function(event) {
					if (event.key === 'Enter' && event.target.tagName !== 'TEXTAREA') {
						event.preventDefault();
					}
				});
				/*=============== 엔터키 제출 방지 ===============*/
				
				
				
				/*=============== 동물 종류 리스트 가져오기 ===============*/
				$.ajax({
					url: '/petData/petType',
					type: 'GET',
					dataType: 'json',
					success: function(data) {
						$('#petType').empty();
						$('#petType').append('<option value="">--</option>');
		
						data.forEach(function(item) {
							if(item.category_code == 1000) {
								$('#petType').append("<option value='" + item.category_code + "'>" + item.category_type +"</option>");
							}
							if(item.category_code == 2000) {
								$('#petType').append("<option value='" + item.category_code + "'>" + item.category_type +"</option>");
							}
							if(item.category_code == 3000) {
								$('#petType').append("<option value='" + item.category_code + "'>" + item.category_type +"</option>");
							}
						});
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.error('AJAX 요청 실패:', textStatus, errorThrown);
					}
				});
				/*=============== 동물 종류 리스트 가져오기 ===============*/

				
				
				/*=============== 동물 정보 가져오기 & 입력 ===============*/
				let currentURL = window.location.pathname;
				let lastSlashIndex = currentURL.lastIndexOf('/');
				const animalId = currentURL.substring(lastSlashIndex+1); // 전역 변수 animalId
				const regex = /^ANIM-\w{6}$/;
				
				if(regex.test(animalId)) {
					$.ajax({
						url: '/adptmgmt/animals/' + animalId + "/check",
						method: 'GET',
						type: 'json',
						success: function(data) {
							const adate = new Date(data.animal_regdate);
							const year = adate.getFullYear();
							const month = String(adate.getMonth() + 1).padStart(2, '0');
							const day = String(adate.getDate()).padStart(2, '0');
							const formattedDate = year + '-' + month + '-' + day;
							data.animal_regdate = formattedDate;
							
							$('#animal_id').val(data.animal_id);
							$('#aRegDate').val(data.animal_regdate);
							$('#petType').val(data.categoryDataVO.category_parent);
							$('#petTypeDetailCode').val(data.categoryDataVO.category_code);
							$('#petTypeDetail').val(data.categoryDataVO.category_value);
							if(data.category_etc_value != '') {
								$('#petTypeEtc').val(data.category_etc_value); 
							}
							$('#aName').val(data.animal_name);
							$('#aColor').val(data.animal_color);
							$('#aGender').val(data.animal_gender);
							$('#aNeuter').val(data.animal_neuter);
							$('#aAge').val(data.animal_age);
							$('#aWeight').val(data.animal_weight);
							$('#aRegUser').val(data.member_id);
							for(let i = 0; i < data.animal_images.length; i++) {
								if(data.animal_images[i].image_src != '') {
									$('#image-preview'+ i).attr('src',data.animal_images[i].image_src).show();
									$('#orgSrc'+ i).val(data.animal_images[i].image_src);
									$('#tempSrc'+ i).val(data.animal_images[i].image_src);
									$('#plusIcon'+ i).hide();
								}
							}
							
						},
						error: function(error) {
							console.error('데이터를 가져오는 데 실패했습니다:', error);
							window.location.href = '/AM/animals/list';
							alert('잘못된 접근입니다');
						}
					});
				} else {
					window.location.href = '/AM/animals/list';
					alert('잘못된 접근입니다');
				}
				/*=============== 동물 정보 가져오기 & 입력 ===============*/
				
				
				
				/*=============== 수정 이동(move) 버튼 제어 ===============*/
				$('.a-modify-btn').on('click', function() {
					location.href='/AM/animals/list/'+ animalId;
				});
				/*=============== 수정 이동(move) 버튼 제어 ===============*/
				
				
				
				/*=============== 초기화(reset) 버튼 제어 ===============*/
				$('#a-reset-btn1, #a-reset-btn2').on('click',function(e) {
					
					Swal.fire({
						title: '초기화하시겠습니까?',
						text: '동물정보를 제외한 작성글이 초기화 됩니다!',
						icon: 'warning',
						allowOutsideClick: false,
						showCancelButton: true,
						confirmButtonColor: '#006e60',
						cancelButtonColor: '#aab2bd',
						confirmButtonText: '초기화',
						cancelButtonText: '닫기'
					}).then(function(result) {
						if (result.isConfirmed) {
							$('#adpt_intro').val('');
							$('#adpt_etc').val('');
							Swal.fire({
								title:'초기화 되었습니다!',
								icon:'success',
								allowOutsideClick: false,
								confirmButtonColor: '#006e60',
								confirmButtonText: '확인'
							});
						}
					});
				});
				/*=============== 초기화(reset) 버튼 제어 ===============*/

				
				
				/*=============== 등록(submit) 버튼 제어 ===============*/
				$('#formAdptWriting').on('submit', function(event) {
					event.preventDefault();
					var formData = new FormData(this);
					formData.append('animalStatus', 2);
					
					$('#a-submit-btn1, #a-submit-btn2').prop('disabled', true);
					Swal.fire({
						title: '등록하시겠습니까?',
						text: '등록 내용을 확인해주세요!',
						icon: 'info',
						allowOutsideClick: false,
						showCancelButton: true,
						confirmButtonColor: '#006e60',
						cancelButtonColor: '#aab2bd',
						confirmButtonText: '등록',
						cancelButtonText: '닫기'
					}).then(function(result) {
						if (result.isConfirmed) {
							$.ajax({
								url: '/adptmgmt/writings/'+ animalId +'/creation',
								type: 'POST',
								data: formData,
								contentType: false,
								processData: false,
								success: function(response) {
									$('#a-submit-btn1, #a-submit-btn2').prop('disabled', false);
									Swal.fire({
									title: '등록 완료',
									text: '등록에 성공했습니다!',
									icon: 'success',
									allowOutsideClick: false,
									confirmButtonColor: '#006e60',
									confirmButtonText: '확인'
									}).then(function(result){
										if(result.isConfirmed){
											location.href='/AM/animals/list';
										}
									});
								},
								error: function(jqXHR, textStatus, errorThrown) {
									$('#a-submit-btn1, #a-submit-btn2').prop('disabled', false);
									console.error('등록 실패:', textStatus, errorThrown);
									Swal.fire({
										title: '오류!',
										text: '등록에 실패했습니다.',
										icon: 'error',
										allowOutsideClick: false,
										confirmButtonColor: '#006e60',
										confirmButtonText: '확인'
									});
								}
							});
						} else {
							$('#a-submit-btn1, #a-submit-btn2').prop('disabled', false);
						}
					});
				});
				/*=============== 등록(submit) 버튼 제어 ===============*/
				
				
				
			});//DOM
			
		</script>
		<!-- End custom js for this page -->
	</body>
</html>
