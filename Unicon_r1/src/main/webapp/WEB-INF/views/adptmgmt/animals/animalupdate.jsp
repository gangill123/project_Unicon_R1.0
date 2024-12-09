<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		cursor: pointer;
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 0;
	}
	
	#plusIcon0, #plusIcon1, #plusIcon2, #plusIcon3, #plusIcon4 {
		font-size: 2rem;
		color: #888;
	}
	
	#image-preview0, #image-preview1, #image-preview2, #image-preview3, #image-preview4 {
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
	#animalStatus label {
		font-size: 1.5rem;
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
		cursor: pointer; 
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
	
	#aAge {
		cursor: pointer;
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
		padding: 0.45rem;
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
	
	#a-close-btn1, #a-close-btn2, #a-close-cancel-btn1, #a-close-cancel-btn2 {
		display: none;
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
										<h4 class="card-title">입양 동물 관리 - 정보 수정 및 삭제</h4>
										
										<form id="formAdptAnimal" action="" method="post" enctype="multipart/form-data">
										
											<fieldset class="custom-a-fieldset mb-3">
												<legend class="custom-a-legend">필수 정보</legend>
												
												<div class="form-group row d-flex justify-content-center">
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
												
												<div class="form-group row d-flex justify-content-center">
													<div class="col-12 col-xl-3 col-md-5 mb-3">
														<label for="petType" class="text-dark custom-label">동물 종류</label>
														<select class="form-control custom-text" id="petType" disabled>
															<option value="">--</option>
														</select>
													</div>
													<div class="dropdown col-12 col-xl-3 col-md-7 mb-3">
														<label class="text-dark custom-label">세부 종류</label>
														<input type="hidden" id="petTypeDetailCode" name="category_code"/>
														<input type="text" id="petTypeDetail" class="form-control custom-text" placeholder="--" readonly/>
														<input type="text" id="searchInput" class="form-control custom-text"/>
														<i class="f-arrow fa-solid fa-angle-down"></i>
														<div id="dropdownList" class="dropdown-menu"></div>
													</div>
													<div class="col-12 col-xl-4 col-md-7 mb-3">
														<label for="petTypeEtc" class="text-dark custom-label">기타 종류<span class="small">(선택)</span></label>
														<input type="text" id="petTypeEtc" name="category_etc_value" class="form-control custom-text" 
															maxlength="30" placeholder="세부 종류 '기타 --'인 경우 작성가능" readonly/>
													</div>
												</div>
											
												<div class="form-group row d-flex justify-content-center">
													<div class="col-12 col-xl-3 col-lg-6 col-md-6 mb-3">
														<label for="aName" class="text-dark custom-label">동물 이름</label>
														<div class="input-group">
														<input type="text" id="aName" name="animal_name" class="form-control custom-text"
															placeholder="최대 6자" maxlength="6" required/>
														<button type="button" id="autoGenaName" 
															class="btn btn-outline-custom-a btn-icon-text custom-a-btn-name"> 
															<span class="custom-a-btn-text">
															이름짓기
															</span>
															<i class="fa-solid fa-wand-magic-sparkles"></i>
														</button>
														</div>
													</div>
													<div class="col-12 col-xl-3 col-md-6 mb-3">
														<label for="aColor" class="text-dark custom-label">색상</label>
														<input type="text" id="aColor" name="animal_color" class="form-control custom-text"
															placeholder="최대 10자" maxlength="10" required/>
													</div>
													<div class="col-12 col-xl-2 col-lg-3 col-md-3 mb-3">
														<label for="aGender" class="text-dark custom-label">성별</label>
														<select id="aGender" name="animal_gender" 
															class="form-control custom-text" required>
															<option value="">--</option>
															<option value="1">남아</option>
															<option value="2">여아</option>
														</select>
													</div>
													<div class="col-12 col-xl-2 col-lg-3 col-md-3 mb-3">
													<label for="aNeuter" class="text-dark custom-label">중성화</label>
														<select id="aNeuter" name="animal_neuter" 
															class="form-control custom-text" required>
															<option value="">--</option>
															<option value="1">&#9675;</option>
															<option value="2">&#10005;</option>
														</select>
													</div>
												</div>
												
												<div class="form-group row d-flex justify-content-center mb-5">
													<div class="col-12 col-xl-2 col-md-5 mb-3">
														<label for="aAge" class="text-dark custom-label">동물 나이</label>
														<input type="text" id="aAge" name="animal_age" class="form-control custom-text"
															placeholder="--" readonly/>
														<div class="a-year-dropdown" id="aYearDropdown"></div>
														<i class="f-arrow fa-solid fa-angle-down"></i>
													</div>
													<div class="col-12 col-xl-2 col-lg-4 col-md-4 mb-3">
														<label for="aWeight" class="text-dark custom-label">크기</label>
														<select id="aWeight" name="animal_weight" 
															class="form-control custom-text" required>
															<option value="">--</option>
															<option value="1">소형&nbsp;(~5kg)</option>
															<option value="2">중형&nbsp;(5~25kg)</option>
															<option value="3">대형&nbsp;(25kg~)</option>
														</select>
													</div>
													<div class="col-12 col-xl-3 col-lg-5 col-md-4 mb-3">
														<label for="aRegUser" class="text-dark custom-label">작성자</label>
														<input type="text" id="aRegUser" name="member_id" 
															class="form-control custom-text" readonly/>
													</div>
													<div class="col-12 col-xl-2 col-lg-5 col-md-4 mb-3">
														<label for="animal_status" class="text-dark custom-label">동물 상태</label>
														<div id="animalStatus"></div>
														<input type="hidden" id="animal_status"/>
													</div>
												</div>
												<div class="form-group row d-flex justify-content-center">
													<div class="col-10 col-xl-2 col-lg-3 col-md-3 mb-2">
														<label class="text-dark custom-label">대표 이미지</label>
													    <div class="upload-container mb-1">
															<label for="image-input0" class="upload-button label-no-margin">
																<input type="file" class="file-upload-default image-input" 
																	accept="image/*" id="image-input0" name="upload_images[0]" />
																<i id="plusIcon0" class="mdi mdi-plus a-preview-i"></i>
																<input type="hidden" id="orgSrc0" name="check_images[0].orgSrc"/>
																<input type="hidden" id="tempSrc0"/>
																<input type="hidden" id="changeCheck0" name="check_images[0].changeCheck"/>
																<input type="hidden" id="moveSrc0" name="check_images[0].moveSrc"/>
																<img id="image-preview0" class="a-preview" alt="이미지 미리보기" src=""/>
															</label>
														</div>
														<div class="row mt-2">
															<div class="col text-right">
																<input type="file" class="file-upload-default" 
																	accept="image/*" id="a-image-input-multi" multiple/>
																<button type="button" id="multiImageUpBtn" 
																	class="btn btn-outline-custom-a btn-icon-text custom-a-btn-images"> 
																	<span class="custom-a-btn-text">
																	다중업로드
																	</span>
																	<i class="fa-solid fa-images"></i>
																</button>
																<button type="button" id="image-delete0" 
																	class="btn btn-outline-danger btn-icon-text custom-a-btn-images image-delete"> 
																	<i class="fa-solid fa-trash-can"></i>
																</button>
															</div>
														</div>
													</div>
													<div class="col-10 col-xl-2 col-lg-3 col-md-3 mb-2">
														<div></div>
														<label class="text-dark custom-label">이미지<span class="small">(선택)</span></label>
													    <div class="upload-container">
															<label for="image-input1" class="upload-button label-no-margin">
																<input type="file" class="file-upload-default image-input" 
																	accept="image/*" id="image-input1" name="upload_images[1]"/>
																<i id="plusIcon1" class="mdi mdi-plus a-preview-i"></i>
																<input type="hidden" id="orgSrc1" name="check_images[1].orgSrc"/>
																<input type="hidden" id="tempSrc1"/>
																<input type="hidden" id="changeCheck1" name="check_images[1].changeCheck"/>
																<input type="hidden" id="moveSrc1" name="check_images[1].moveSrc"/>
																<img id="image-preview1" class="a-preview" alt="이미지 미리보기" src=""/>
															</label>
														</div>
														<div class="row mt-2">
															<div class="col text-right">
																<button type="button" id="image-delete1" 
																	class="btn btn-outline-danger btn-icon-text custom-a-btn-images image-delete"> 
																	<i class="fa-solid fa-trash-can"></i>
																</button>
															</div>
														</div>
													</div>
													<div class="col-10 col-xl-2 col-lg-3 col-md-3 mb-2">
														<label class="text-dark custom-label">이미지<span class="small">(선택)</span></label>
													    <div class="upload-container">
															<label for="image-input2" class="upload-button label-no-margin">
																<input type="file" class="file-upload-default image-input" 
																	accept="image/*" id="image-input2" name="upload_images[2]"/>
																<i id="plusIcon2" class="mdi mdi-plus a-preview-i"></i>
																<input type="hidden" id="orgSrc2" name="check_images[2].orgSrc"/>
																<input type="hidden" id="tempSrc2"/>
																<input type="hidden" id="changeCheck2" name="check_images[2].changeCheck"/>
																<input type="hidden" id="moveSrc2" name="check_images[2].moveSrc"/>
																<img id="image-preview2" class="a-preview" alt="이미지 미리보기" src=""/>
															</label>
														</div>
														<div class="row mt-2">
															<div class="col text-right">
																<button type="button" id="image-delete2" 
																	class="btn btn-outline-danger btn-icon-text custom-a-btn-images image-delete"> 
																	<i class="fa-solid fa-trash-can"></i>
																</button>
															</div>
														</div>
													</div>
													<div class="col-10 col-xl-2 col-lg-3 col-md-3 mb-2">
														<label class="text-dark custom-label">이미지<span class="small">(선택)</span></label>
													    <div class="upload-container">
															<label for="image-input3" class="upload-button label-no-margin">
																<input type="file" class="file-upload-default image-input" 
																	accept="image/*" id="image-input3" name="upload_images[3]"/>
																<i id="plusIcon3" class="mdi mdi-plus a-preview-i"></i>
																<input type="hidden" id="orgSrc3" name="check_images[3].orgSrc"/>
																<input type="hidden" id="tempSrc3"/>
																<input type="hidden" id="changeCheck3" name="check_images[3].changeCheck"/>
																<input type="hidden" id="moveSrc3" name="check_images[3].moveSrc"/>
																<img id="image-preview3" class="a-preview" alt="이미지 미리보기" src=""/>
															</label>
														</div>
														<div class="row mt-2">
															<div class="col text-right">
																<button type="button" id="image-delete3" 
																	class="btn btn-outline-danger btn-icon-text custom-a-btn-images image-delete"> 
																	<i class="fa-solid fa-trash-can"></i>
																</button>
															</div>
														</div>
													</div>
												</div>
												
												<div class="form-group row justify-content-center align-items-center mb-1">
													<button type="submit" 
														class="btn btn-lg btn-rounded btn-custom-a custom-text mx-2 mb-2">
														수정하기
													</button>
													<button type="button" 
														class="btn btn-lg btn-rounded btn-primary custom-text mx-2 mb-2 a-writing-btn">
														입양글 작성
													</button>
													<button type="button" 
														class="btn btn-lg btn-rounded btn-warning custom-text mx-2 mb-2" 
														onclick="location.href='/AM/animals/list';">
														목록이동
													</button>
												</div>
												<div class="form-group row d-flex justify-content-center align-items-center">
													<button type="button" id="a-delete-btn1" 
														class="btn btn-lg btn-rounded btn-danger custom-text mx-2 mb-2">
														삭제
													</button>
													<button type="button" id="a-close-btn1" 
														class="btn btn-lg btn-rounded btn-light custom-text mx-2 mb-2">
														종료
													</button>
													<button type="button" id="a-close-cancel-btn1" 
														class="btn btn-lg btn-rounded btn-light custom-text mx-2 mb-2">
														종료취소
													</button>
												</div>
											</fieldset>
											
											<div class="border-bottom my-5 custom-borderbm"></div>
											
											<fieldset class="custom-a-fieldset mb-3">
											<legend class="custom-a-legend">선택 정보</legend>
											
											<fieldset class="custom-a-fieldset col-12 col-xl-12 mb-5">
												<legend class="custom-a-sub-legend">성격</legend>
												
													<div class="form-group row d-flex justify-content-center align-items-center">
														<div class="col-12 col-xl-3 col-lg-8 col-md-6">
															<label for="aAct" class="text-dark custom-label">활동성</label>
															<div class="aAct-tooltip">
																<i class="fas fa-question-circle aAct-tooltip-icon"></i>
																<span class="aAct-hint-text">항목을 선택해주세요</span>
																<div class="aAct-tooltip-text">
																	<i class="fa-solid fa-0"></i> - 미입력<br/>
																	<div class="border-bottom my-3 custom-borderbm"></div>
																	<i class="fa-solid fa-1"></i> - 거의 움직이지 않고 놀이에 관심이 없고 자거나 쉬는 시간을 가짐<br/>
																	<div class="border-bottom my-3 custom-borderbm"></div>
																	<i class="fa-solid fa-2"></i> - 가끔 움직이며 장난감을 가지고 놀지만 오래 지속되지 않음<br/>
																	<div class="border-bottom my-3 custom-borderbm"></div>
																	<i class="fa-solid fa-3"></i> - 주기적으로 장난감을 가지고 놀거나 돌아다니면서 환경에 호기심을 가짐<br/>
																	<div class="border-bottom my-3 custom-borderbm"></div>
																	<i class="fa-solid fa-4"></i> - 자주 뛰어다니고 활발하게 다양한 놀이를 즐기며 장난감에 적극적임<br/>
																	<div class="border-bottom my-3 custom-borderbm"></div>
																	<i class="fa-solid fa-5"></i> - 매우 활동적이고 놀이를 매우 좋아하며 새로운 환경을 적극적으로 탐색함<br/>
																</div>
															</div>
															<div id="aAct-checkbox-all" class="aAct-checkbox-group">
																<label class="aAct-checkbox-box-first label-no-margin">
																<input type="checkbox" name="animal_act" value="1"/>
																	<i class="fa-solid fa-1"></i>
																</label>
																<label class="aAct-checkbox-box label-no-margin">
																<input type="checkbox" name="animal_act" value="2"/>
																	<i class="fa-solid fa-2"></i>
																</label>
																<label class="aAct-checkbox-box label-no-margin">
																<input type="checkbox" name="animal_act" value="3"/>
																	<i class="fa-solid fa-3"></i>
																</label>
																<label class="aAct-checkbox-box label-no-margin">
																<input type="checkbox" name="animal_act" value="4"/>
																	<i class="fa-solid fa-4"></i>
																</label>
																<label class="aAct-checkbox-box-end label-no-margin">
																<input type="checkbox" name="animal_act" value="5"/>
																	<i class="fa-solid fa-5"></i>
																</label>
															</div>
														</div>
														
														<div class="col-12 col-xl-2 col-lg-8 col-md-7 my-2"></div>
														
														<div class="col-12 col-xl-3 col-lg-8 col-md-6">
															<label for="aSocial" class="text-dark custom-label">사회성</label>
															<div class="aSocial-tooltip">
																<i class="fas fa-question-circle aSocial-tooltip-icon"></i>
																<span class="aSocial-hint-text">항목을 선택해주세요</span>
																<div class="aSocial-tooltip-text">
																	<i class="fa-solid fa-0"></i> - 미입력<br/>
																	<div class="border-bottom my-3 custom-borderbm"></div>
																	<i class="fa-solid fa-1"></i> - 사람과 다른 동물에 관심이 없고 상호작용 하지 않으려 함<br/>
																	<div class="border-bottom my-3 custom-borderbm"></div>
																	<i class="fa-solid fa-2"></i> - 가끔 다가와 상호작용하지만 주로 혼자 지내며 행동을 잘 배우지 않음<br/>
																	<div class="border-bottom my-3 custom-borderbm"></div>
																	<i class="fa-solid fa-3"></i> - 정기적으로 사람 및 다른 동물과의 놀이를 즐기고 일부 행동을 배우는 경향이 있음<br/>
																	<div class="border-bottom my-3 custom-borderbm"></div>
																	<i class="fa-solid fa-4"></i> - 사람 및 다양한 동물과 자주 상호작용하며 다른 동물의 행동을 잘 관찰하고 학습함<br/>
																	<div class="border-bottom my-3 custom-borderbm"></div>
																	<i class="fa-solid fa-5"></i> - 모든 동물과 적극적으로 상호작용하고 사람과의 유대감이 높으며 뛰어난 사회적 학습력을 가짐<br/>
																</div>
															</div>
															<div id="aSocial-checkbox-all" class="aSocial-checkbox-group">
																<label class="aSocial-checkbox-box-first label-no-margin">
																<input type="checkbox" name="animal_social" value="1"/>
																	<i class="fa-solid fa-1"></i>
																</label>
																<label class="aSocial-checkbox-box label-no-margin">
																<input type="checkbox" name="animal_social" value="2"/>
																	<i class="fa-solid fa-2"></i>
																</label>
																<label class="aSocial-checkbox-box label-no-margin">
																<input type="checkbox" name="animal_social" value="3"/>
																	<i class="fa-solid fa-3"></i>
																</label>
																<label class="aSocial-checkbox-box label-no-margin">
																<input type="checkbox" name="animal_social" value="4"/>
																	<i class="fa-solid fa-4"></i>
																</label>
																<label class="aSocial-checkbox-box-end label-no-margin">
																<input type="checkbox" name="animal_social" value="5"/>
																	<i class="fa-solid fa-5"></i>
																</label>
															</div>
														</div>
													</div>
												</fieldset>
												
												<fieldset class="custom-a-fieldset col-12 col-xl-12 mb-5">
												<legend class="custom-a-sub-legend">건강검진</legend>
													<div class="form-group row d-flex justify-content-center">
														<div class="col-12 col-xl-2 col-lg-8 col-md-5 mb-3">
															<label for="aHealth0" class="text-dark custom-label">사상충</label>
															<select id="aHealth0" name="animal_healths[0].health_check" 
																class="form-control custom-text">
																<option value="미입력">--</option>
																<option value="음성">음성&nbsp;(없음)</option>
																<option value="양성">양성&nbsp;(있음)</option>
															</select>
															<input type="hidden" name="animal_healths[0].health" value="사상충">
														</div>
														<div class="col-12 col-xl-2 col-lg-8 col-md-5 mb-3">
															<label for="aHealth1" class="text-dark custom-label">원충</label>
															<select id="aHealth1" name="animal_healths[1].health_check" 
																class="form-control custom-text">
																<option value="미입력">--</option>
																<option value="음성">음성&nbsp;(없음)</option>
																<option value="양성">양성&nbsp;(있음)</option>
															</select>
															<input type="hidden" name="animal_healths[1].health" value="원충">
														</div>
														<div class="col-12 col-xl-2 col-lg-8 col-md-5 mb-3">
															<label for="aHealth2" class="text-dark custom-label">코로나</label>
															<select id="aHealth2" name="animal_healths[2].health_check" 
																class="form-control custom-text">
																<option value="미입력">--</option>
																<option value="음성">음성&nbsp;(없음)</option>
																<option value="양성">양성&nbsp;(있음)</option>
															</select>
															<input type="hidden" name="animal_healths[2].health" value="코로나">
														</div>
														<div class="col-12 col-xl-2 col-lg-8 col-md-5 mb-3">
															<label for="aHealth3" class="text-dark custom-label">파보</label>
															<select id="aHealth3" name="animal_healths[3].health_check" 
																class="form-control custom-text">
																<option value="미입력">--</option>
																<option value="음성">음성&nbsp;(없음)</option>
																<option value="양성">양성&nbsp;(있음)</option>
															</select>
															<input type="hidden" name="animal_healths[3].health" value="파보">
														</div>
														<div class="col-12 col-xl-2 col-lg-8 col-md-5 mb-3">
															<label for="aHealth4" class="text-dark custom-label">홍역</label>
															<select id="aHealth4" name="animal_healths[4].health_check" 
																class="form-control custom-text">
																<option value="미입력">--</option>
																<option value="음성">음성&nbsp;(없음)</option>
																<option value="양성">양성&nbsp;(있음)</option>
															</select>
															<input type="hidden" name="animal_healths[4].health" value="홍역">
														</div>
													</div>
												</fieldset>
												
												<fieldset class="custom-a-fieldset col-12 col-xl-12 mb-5">
												<legend class="custom-a-sub-legend">예방접종</legend>
													<div id="aVaccineDiv" class="form-group row d-flex justify-content-center">
														<div class="col-12 col-xl-3 col-lg-8 col-md-5 mb-3">
															<label for="#" class="text-dark custom-label">--</label>
															<select id="#" name="#" 
																class="form-control custom-text">
																<option value="#">--</option>
															</select>
															<input type="hidden" name="#" value="--">
														</div>
														<div class="col-12 col-xl-3 col-lg-8 col-md-5 mb-3">
															<label for="#" class="text-dark custom-label">--</label>
															<select id="#" name="#" 
																class="form-control custom-text">
																<option value="#">--</option>
															</select>
															<input type="hidden" name="#" value="--">
														</div>
														<div class="col-12 col-xl-3 col-lg-8 col-md-5 mb-3">
															<label for="#" class="text-dark custom-label">--</label>
															<select id="#" name="#" 
																class="form-control custom-text">
																<option value="#">--</option>
															</select>
															<input type="hidden" name="#" value="--">
														</div>
														<div class="col-12 col-xl-3 col-lg-8 col-md-5 mb-3">
															<label for="#" class="text-dark custom-label">--</label>
															<select id="#" name="#" 
																class="form-control custom-text">
																<option value="#">--</option>
															</select>
															<input type="hidden" name="#" value="--">
														</div>
													</div>
												</fieldset>
												
												<fieldset class="custom-a-fieldset col-12 col-xl-12 mb-5">
												<legend class="custom-a-sub-legend">기타</legend>
													<div class="form-group row d-flex justify-content-center">
														<div class="col-12 col-xl-6 col-md-6 mb-3">
															<label for="aRegNum" class="text-dark custom-label">동물 등록 번호</label>
															<input type="text" id="aRegNum" name="animal_regnum" class="form-control custom-text" 
																maxlength="15" placeholder="최대 15자"/>
														</div>
														<div class="col-12 col-xl-6 col-lg-8 col-md-6">
															<label class="text-dark custom-label">비고/기타사항</label>
															<textarea rows="5" wrap="soft" id="aEtc" name="animal_etc" class="form-control custom-text" 
																placeholder="최대 200자" maxlength="200"></textarea>
														</div>
													</div>
												</fieldset>
												
												<div class="form-group row justify-content-center align-items-center mb-1">
													<button type="submit" 
														class="btn btn-lg btn-rounded btn-custom-a custom-text mx-2 mb-2">
														수정하기
													</button>
													<button type="button" 
														class="btn btn-lg btn-rounded btn-primary custom-text mx-2 mb-2 a-writing-btn">
														입양글 작성
													</button>
													<button type="button" class="btn btn-lg btn-rounded btn-warning custom-text mx-2 mb-2" 
														onclick="location.href='/AM/animals/list';">
														목록이동
													</button>
												</div>
												<div class="form-group row justify-content-center align-items-center">
													<button type="button" id="a-delete-btn2" 
														class="btn btn-lg btn-rounded btn-danger custom-text mx-2 mb-2">
														삭제
													</button>
													<button type="button" id="a-close-btn2" 
														class="btn btn-lg btn-rounded btn-light custom-text mx-2 mb-2">
														종료
													</button>
													<button type="button" id="a-close-cancel-btn2" 
														class="btn btn-lg btn-rounded btn-light custom-text mx-2 mb-2">
														종료취소
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
				var checkedMove = false;
				/*=============== 변수 설정 ===============*/
				const vaccines = {
						1000: [
							{ label: '광견병', value: '광견병' },
							{ label: '파보', value: '파보' },
							{ label: '코로나', value: '코로나' },
							{ label: '혼합예방주사(DHPPL)', value: '혼합예방주사(DHPPL)' }
						],
						2000: [
							{ label: '광견병', value: '광견병' },
							{ label: '백혈병', value: '백혈병' },
							{ label: '복막염', value: '복막염' },
							{ label: '혼합예방주사(CVRP)', value: '혼합예방주사(CVRP)' }
						],
						3000: [
							{ label: '--', value: 'etc0' },
							{ label: '--', value: 'etc1' },
							{ label: '--', value: 'etc2' },
							{ label: '--', value: 'etc3' }
						],
				};
				/*=============== 변수 설정 ===============*/
				
				
				
				/*=============== 엔터키 제출 방지 ===============*/
				$('#formAdptAnimal').on('keydown', function(event) {
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
								$('#petType').append("<option value='" + item.category_code + "'>" + item.category_type +" &nbsp;｡:˚ ૮ ˶ ˆ ᴥ ˆ ˶ ა ˚ :｡</option>");
							}
							if(item.category_code == 2000) {
								$('#petType').append("<option value='" + item.category_code + "'>" + item.category_type +" &nbsp;/ᐠ - ˕ -マ Ⳋ</option>");
							}
							if(item.category_code == 3000) {
								$('#petType').append("<option value='" + item.category_code + "'>" + item.category_type +" &nbsp;ପ૮{˶• ༝ •˶}აଓ</option>");
							}
						});
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.error('AJAX 요청 실패:', textStatus, errorThrown);
					}
				});
				/*=============== 동물 종류 리스트 가져오기 ===============*/
				
				
				
				/*=============== 검색 드롭다운 ===============*/
				$('#searchInput').hide();
				function petTypeDetailList(petType) {
					$.ajax({
						url: '/petData/petType/' + petType,
						method: 'GET',
						success: function(data) {
							addDropdown(data);
						},
						error: function(error) {
							console.error('데이터를 가져오는 데 실패했습니다:', error);
						}
					});
				}
				
				
				function addDropdown(data) {
					$('#dropdownList').empty();
				
					data.forEach(function(item) {
						$('#dropdownList')
						.append("<div class='dropdown-item' data-value='"+item.category_code+"'>" + item.category_value + "</div>");
					});
				
					if (data.length == 0) {
						$('#dropdownList').hide();
					}
				}
				
				
				$('#petType').on('change', function() {
					const selectedType = $(this).val();
					
					if (selectedType) {
						petTypeDetailList(selectedType);
						$('#petTypeDetailCode').val('');
						$('#petTypeDetail').val('');
						$('#searchInput').val('');
					} else {
						$('#dropdownList').empty().hide();
						$('#petTypeDetailCode').val('');
						$('#petTypeDetail').val('');
						$('#searchInput').val('');
					}
					
						/*=============== 백신 종류 설정 ==============*/
						$('#aVaccineDiv').empty();
					
						if (selectedType != '') {
							const selectedVaccines = vaccines[selectedType];
					
							for (let i = 0; i < selectedVaccines.length; i++) {
								const vaccine = selectedVaccines[i];
					
								const newDiv = $('<div class="col-12 col-xl-3 col-lg-8 col-md-5 mb-3"></div>');
					
								const vLabel = $('<label class="text-dark custom-label"></label>')
									.attr('for', 'aVaccine' + i)
									.text(vaccine.label);
					
								const vSelect = $('<select></select>')
									.attr('id', 'aVaccine' + i)
									.attr('name', 'animal_vaccines[' + i + '].vaccine_check')
									.addClass('form-control custom-text');
					
								const vOptions = ['미입력', '접종', '미접종'];
								if(selectedType != 3000) {
									vOptions.forEach(function(optionText) {
										if(optionText == '미입력') {
											vSelect.append($('<option></option>').text('--').val(optionText));
										} else {
											vSelect.append($('<option></option>').text(optionText).val(optionText));
										}
									});
								} else {
									vSelect.append($('<option></option>').text('--').val('미입력'));
								}
					
								const hiddenInput = $('<input type="hidden">')
									.attr('name', 'animal_vaccines[' + i + '].vaccine')
									.val(vaccine.value);
					
								newDiv.append(vLabel, vSelect, hiddenInput);
					
								$('#aVaccineDiv').append(newDiv);
							}
						}
						/*=============== 백신 종류 설정 ==============*/
					
				});
				
				
				$('#petTypeDetail').on('focus', function() {
					
					if($('#petType').val() !== '') {
						$('#dropdownList').show();
						$('#petTypeDetail').hide();
						$('#searchInput').show();
					}
					
				});
				
				$('#searchInput').on('input', function() {
					const filter = $(this).val().toLowerCase();
				
					if (!filter) {
						$('#dropdownList').hide();
					}
					
					$('#dropdownList').show();
					$('#dropdownList').children().each(function() {
						const text = $(this).text().toLowerCase();
						$(this).toggle(text.includes(filter));
					});
					
				});
				
				$(document).on('click', '.dropdown-item', function() {
					
					$('#petTypeDetailCode').val('');
					$('#searchInput').hide();
					$('#petTypeDetail').show();
					$('#petTypeDetail').val($(this).text());
					$('#petTypeDetailCode').val($(this).data('value'));
					$('#dropdownList').hide();
					
					switch($(this).data('value')) {
						case 1002: case 2002: case 3000:
							$('#petTypeEtc').removeAttr('readonly');
							break;
						default: {
							$('#petTypeEtc').val('');
							$('#petTypeEtc').attr('readonly', true);
						}
					}
					
				});
				
				$(document).click(function(event) {
					
					if (!$(event.target).closest('.dropdown').length) {
						$('#dropdownList').hide();
						$('#searchInput').hide();
						$('#petTypeDetail').show();
					}
					
				});
				/*=============== 검색 드롭다운 ===============*/
				
				
				
				/*=============== 이름 자동생성 ===============*/
				$('#autoGenaName').on('click', function() {
					const animal_act = $('[name="animal_act"]:checked').val();
					const animal_social = $('[name="animal_social"]:checked').val();
					$('#aName').val('');

					if(animal_act == undefined || animal_social == undefined) {
						if(animal_act == undefined) {
							$('#aAct-checkbox-all').addClass('a-checkbox-alert');
							$('.aAct-hint-text').show();
						}

						if(animal_social == undefined) {
							$('#aSocial-checkbox-all').addClass('a-checkbox-alert');
							$('.aSocial-hint-text').show();
						}
						
						$('[name="animal_act"]').focus();
						checkedMove = true;
						
					} else {
						$.ajax({
							url: '/adptmgmt/animals/autoname?animal_act='+animal_act+'&animal_social='+animal_social,
							type: 'GET',
							dataType: 'json',
							success: function(data) {
								$('#aName').val(data.autoName);
							},
							error: function(e) {
								console.error('Error: ' + e.responseText);
							}
						});
						
					}
					
					
				});
				/*=============== 이름 자동생성 ===============*/
				
				
				
				/*=============== 동물 나이 드롭다운 ===============*/
				var currentYear = new Date().getFullYear();
				var currentMonth = new Date().getMonth() + 1;
				var fixedYear = new Date().getFullYear();

				function addAYearDropdown() {
					$('#aYearDropdown').empty();

					for(var amonth = 1; amonth <= 12; amonth++) {
						if(currentYear == 2024 && amonth > currentMonth) {
							continue;
						}
						$('#aYearDropdown').append(
							'<div class="a-year-option" data-value="'+ currentYear +'년'+ amonth +'월생">' +
							currentYear + '-' + amonth + '</div>'
						);
					}
				}
				
				addAYearDropdown();
				
				$('#aAge').click(function() {
					$('#aYearDropdown').toggleClass('show');
				});

				$(document).on('click', '.a-year-option', function() {
					const selectedOption = $(this).data('value');
					$('#aAge').val(selectedOption);
					$('#aYearDropdown').removeClass('show');
				});

				$(document).click(function(e) {
					if (!$(e.target).closest('#aAge').length) {
						$('#aYearDropdown').removeClass('show');
					}
				});
				
				function updateAYearDropdown(aYearNum) {
					currentYear += aYearNum;
					addAYearDropdown();
				}
				
				$('#aYearDropdown').on('wheel', function(event) {
					event.preventDefault();
					if (event.originalEvent.deltaY < 0) {
						if(currentYear != fixedYear) {
							updateAYearDropdown(1);
						}
					} else {
						if(currentYear > fixedYear - 30) {
							updateAYearDropdown(-1);
						}
					}
				});
		
				let startX;	
				
				$('#aYearDropdown').on('touchstart', function(event) {
					startX = event.touches[0].clientX;
				});
				
				$('#aYearDropdown').on('touchmove', function(event) {
					event.preventDefault();
					let moveX = event.touches[0].clientX;
					let deltaX = startX - moveX;
				
					if (Math.abs(deltaX) > 60) {
						if (deltaX > 0) {
							if(currentYear != fixedYear) {
								updateAYearDropdown(1);
							}
						} else {
							if(currentYear > fixedYear - 30) {
								updateAYearDropdown(-1);
							}
						}
					}
				});
				/*=============== 동물 나이 드롭다운 ===============*/
				
				

				/*=============== 이미지 여러장 업로드 ===============*/
				$('#multiImageUpBtn').on('click', function(){
					$("#a-image-input-multi").click();
				});
				
				$('#a-image-input-multi').on('change', function(e) {
					const aImagefiles = e.target.files;
					const reader = new FileReader();
					const fileTypeFilter = /(\.jpg|\.jpeg|\.png|\.gif|\.bmp|\.tiff|\.webp|\.svg|\.heic|\.ico|\.raw)$/i;
					let validaImagefiles = true;
					
					for (let i = 0; i < aImagefiles.length; i++) {
						if (!fileTypeFilter.exec(aImagefiles[i].name)) {
							validaImagefiles = false;
							break;
						}
					}
					
					if (aImagefiles.length > 4) {
						alert('최대 4개의 파일만 선택할 수 있습니다.');
						$('#a-image-input-multi').val('');
					} else {
						if(validaImagefiles) {
				            for (let i = 0; i < aImagefiles.length; i++) {
				                    const fileInput = $('#image-input' + i)[0];
				                    const dataTransfer = new DataTransfer();
				                    
				                    dataTransfer.items.add(aImagefiles[i]);
				                    fileInput.files = dataTransfer.files;
				                    fileInput.dispatchEvent(new Event('change'));
				            }
						} else {
							alert('허용되지 않는 파일 형식이 포함되어 있습니다.');
							$('#a-image-input-multi').val('');
						}
		            }
			            
				});
				/*=============== 이미지 여러장 업로드 ===============*/		
				
				
				
				/*=============== 이미지 미리보기 && 이미지 빈칸 제어 ===============*/
				$('.image-input').on('change', function(e) {
					const file = e.target.files[0];
					const reader = new FileReader();
					const targetId = e.target.id; // image-input0, image-input1, image-input2, image-input3
					const idNumber = parseInt(targetId.charAt(targetId.length - 1), 10);
					const imageInputId = '#image-input';
					const previewId = '#image-preview';
					const plusIconId = '#plusIcon';
					const tempSrcId = '#tempSrc';
					const changeCheckId = '#changeCheck';
					const moveSrcId = '#moveSrc';
					const fileTypeFilter = /(\.jpg|\.jpeg|\.png|\.gif|\.bmp|\.tiff|\.webp|\.svg|\.heic|\.ico|\.raw)$/i;
					
					
					if (file) { // 파일이 있는 경우

						if(!fileTypeFilter.exec(file.name)) { // 파일이 있으나 유효하지 않은 파일인 경우
							alert('허용되지 않는 파일 형식이 포함되어 있습니다.');
							$(this).val('');
							return;
						}

						switch(idNumber) { // 선택한 칸의 아이디 숫자
							case 0: { // 1번째칸
							 	reader.readAsDataURL(file); // 파일을 읽어서 그 내용을 Base64 인코딩된 데이터 URL 형식으로 변환
								reader.onload = function(e) {
									$(previewId + idNumber).attr('src', e.target.result).show();
									$(plusIconId + idNumber).hide();
									$(changeCheckId + idNumber).val(1);
									$(tempSrcId + idNumber).val('');
								}
							break;
							}
							case 1: { // 2번째칸
								if($(previewId + (idNumber - 1)).attr('src') == '') {
									reader.readAsDataURL(file);
									reader.onload = function(e) {
										const aDataTransfer = new DataTransfer(); // 데이터 전송 객체
										aDataTransfer.items.add($(imageInputId + idNumber)[0].files[0]);
										$(imageInputId + (idNumber - 1))[0].files = aDataTransfer.files;
										$(previewId + (idNumber - 1)).attr('src', e.target.result).show();
										$(plusIconId + (idNumber - 1)).hide();
										$(changeCheckId + (idNumber - 1)).val(1);
										$(imageInputId + idNumber).val('');
									}
								} else {
									reader.readAsDataURL(file);
									reader.onload = function(e) {
										$(previewId + idNumber).attr('src', e.target.result).show();
										$(plusIconId + idNumber).hide();
										$(changeCheckId + idNumber).val(1);
										$(tempSrcId + idNumber).val('');
									}
								}
							break;
							}
							case 2: { // 3번째칸
								if($(previewId + (idNumber - 2)).attr('src') == '' 
									&& $(previewId + (idNumber - 1)).attr('src') == '') {
										reader.readAsDataURL(file);
										reader.onload = function(e) {
											const aDataTransfer = new DataTransfer();
											aDataTransfer.items.add($(imageInputId + idNumber)[0].files[0]);
											$(imageInputId + (idNumber - 2))[0].files = aDataTransfer.files;
											$(previewId + (idNumber - 2)).attr('src', e.target.result).show();
											$(plusIconId + (idNumber - 2)).hide();
											$(changeCheckId + (idNumber - 2)).val(1);
											$(imageInputId + idNumber).val('');
										}
								} else if($(previewId + (idNumber - 1)).attr('src') == '') {
									reader.readAsDataURL(file);
									reader.onload = function(e) {
										const aDataTransfer = new DataTransfer();
										aDataTransfer.items.add($(imageInputId + idNumber)[0].files[0]);
										$(imageInputId + (idNumber - 1))[0].files = aDataTransfer.files;
										$(previewId + (idNumber - 1)).attr('src', e.target.result).show();
										$(plusIconId + (idNumber - 1)).hide();
										$(changeCheckId + (idNumber - 1)).val(1);
										$(imageInputId + idNumber).val('');
									}
								} else {
									reader.readAsDataURL(file);
									reader.onload = function(e) {
										$(previewId + idNumber).attr('src', e.target.result).show();
										$(plusIconId + idNumber).hide();
										$(changeCheckId + idNumber).val(1);
										$(tempSrcId + idNumber).val('');
									}
								}
							break;
							}
							case 3: { // 4번째칸
								if($(previewId + (idNumber - 3)).attr('src') == '' 
									&& $(previewId + (idNumber - 2)).attr('src') == '' 
										&& $(previewId + (idNumber - 1)).attr('src') == '') {
											reader.readAsDataURL(file);
											reader.onload = function(e) {
												const aDataTransfer = new DataTransfer();
												aDataTransfer.items.add($(imageInputId + idNumber)[0].files[0]);
												$(imageInputId + (idNumber - 3))[0].files = aDataTransfer.files;
												$(previewId + (idNumber - 3)).attr('src', e.target.result).show();
												$(plusIconId + (idNumber - 3)).hide();
												$(changeCheckId + (idNumber - 3)).val(1);
												$(imageInputId + idNumber).val('');
											}
								} else if($(previewId + (idNumber - 2)).attr('src') == '' 
									&& $(previewId + (idNumber - 1)).attr('src') == '') {
										reader.readAsDataURL(file);
										reader.onload = function(e) {
											const aDataTransfer = new DataTransfer();
											aDataTransfer.items.add($(imageInputId + idNumber)[0].files[0]);
											$(imageInputId + (idNumber - 2))[0].files = aDataTransfer.files;
											$(previewId + (idNumber - 2)).attr('src', e.target.result).show();
											$(plusIconId + (idNumber - 2)).hide();
											$(changeCheckId + (idNumber - 2)).val(1);
											$(imageInputId + idNumber).val('');
										}
								} else if($(previewId + (idNumber - 1)).attr('src') == '') {
									reader.readAsDataURL(file);
									reader.onload = function(e) {
										const aDataTransfer = new DataTransfer();
										aDataTransfer.items.add($(imageInputId + idNumber)[0].files[0]);
										$(imageInputId + (idNumber - 1))[0].files = aDataTransfer.files;
										$(previewId + (idNumber - 1)).attr('src', e.target.result).show();
										$(plusIconId + (idNumber - 1)).hide();
										$(changeCheckId + (idNumber - 1)).val(1);
										$(imageInputId + idNumber).val('');
									}
								} else {
									reader.readAsDataURL(file);
									reader.onload = function(e) {
										$(previewId + idNumber).attr('src', e.target.result).show();
										$(plusIconId + idNumber).hide();
										$(changeCheckId + idNumber).val(1);
										$(tempSrcId + idNumber).val('');
									}
								}
							break;
							}
							default: {
								console.error("잘못된 번호");
							break;
							}
						} // 파일이 있는 경우

					} else { // 파일이 없는 경우(취소한 경우)
						switch(idNumber) {
							case 3: { // 4번째 칸
								$(previewId + idNumber).attr('src',''); // removeAttr은 src 속성이 제거되어 attr('src') => undefined 반환
								$(previewId + idNumber).hide();
								$(plusIconId + idNumber).show();
								$(changeCheckId + idNumber).val(1);
								$(tempSrcId + idNumber).val('');
							break;
							}
							case 2: { // 3번째 칸
								if($(previewId + (idNumber + 1)).attr('src') != '') {
									if($(imageInputId + (idNumber + 1)).val() != '') {
										const aDataTransfer = new DataTransfer();
										aDataTransfer.items.add($(imageInputId + (idNumber + 1))[0].files[0]);
										$(imageInputId + idNumber)[0].files = aDataTransfer.files;
										$(imageInputId + (idNumber + 1)).val('');
									}
									const nextSrc = $(previewId + (idNumber + 1)).attr('src');
									const nextTempSrc = $(tempSrcId + (idNumber + 1)).val();
									$(previewId + idNumber).attr('src', nextSrc);
									$(previewId + idNumber).show();
									$(moveSrcId + idNumber).val(nextTempSrc);
									$(tempSrcId + idNumber).val(nextTempSrc);
									$(changeCheckId + idNumber).val(1);
									$(previewId + (idNumber + 1)).attr('src','');
									$(previewId + (idNumber + 1)).hide();
									$(plusIconId + (idNumber + 1)).show();
									$(changeCheckId + (idNumber + 1)).val(1);
									$(tempSrcId + (idNumber + 1)).val('');
								} else {
									$(previewId + idNumber).attr('src','');
									$(previewId + idNumber).hide();
									$(plusIconId + idNumber).show();
									$(changeCheckId + idNumber).val(1);
									$(moveSrcId + idNumber).val('');
									$(tempSrcId + idNumber).val('');
								}
							break;
							}
							case 1: { // 2번째 칸
								if($(previewId + (idNumber + 1)).attr('src') != ''
									&& $(previewId + (idNumber + 2)).attr('src') != '') {
										if($(imageInputId + (idNumber + 1)).val() != '') {
											const aDataTransfer = new DataTransfer();
											aDataTransfer.items.add($(imageInputId + (idNumber + 1))[0].files[0]);
											$(imageInputId + idNumber)[0].files = aDataTransfer.files;
											$(imageInputId + (idNumber + 1)).val('');
										}
										if($(imageInputId + (idNumber + 2)).val() != '') {
											const aDataTransfer = new DataTransfer();
											aDataTransfer.items.add($(imageInputId + (idNumber + 2))[0].files[0]);
											$(imageInputId + (idNumber + 1))[0].files = aDataTransfer.files;
											$(imageInputId + (idNumber + 2)).val('');
										}
										const nextSrc = $(previewId + (idNumber + 1)).attr('src');
										const nextTempSrc = $(tempSrcId + (idNumber + 1)).val();
										const nextSrc2 = $(previewId + (idNumber + 2)).attr('src');
										const nextTempSrc2 = $(tempSrcId + (idNumber + 2)).val();
										$(previewId + idNumber).attr('src', nextSrc);
										$(previewId + idNumber).show();
										$(moveSrcId + idNumber).val(nextTempSrc);
										$(tempSrcId + idNumber).val(nextTempSrc);
										$(changeCheckId + idNumber).val(1);
										$(previewId + (idNumber + 1)).attr('src', nextSrc2);
										$(previewId + (idNumber + 1)).show();
										$(moveSrcId + (idNumber + 1)).val(nextTempSrc2);
										$(tempSrcId + (idNumber + 1)).val(nextTempSrc2);
										$(changeCheckId + (idNumber + 1)).val(1);
										$(previewId + (idNumber + 2)).attr('src', '');
										$(previewId + (idNumber + 2)).hide();
										$(plusIconId + (idNumber + 2)).show();
										$(changeCheckId + (idNumber + 2)).val(1);
										$(tempSrcId + (idNumber + 2)).val('');
								} else if($(previewId + (idNumber + 1)).attr('src') != '') {
									if($(imageInputId + (idNumber + 1)).val() != '') {
										const aDataTransfer = new DataTransfer();
										aDataTransfer.items.add($(imageInputId + (idNumber + 1))[0].files[0]);
										$(imageInputId + idNumber)[0].files = aDataTransfer.files;
										$(imageInputId + (idNumber + 1)).val('');
									}
									const nextSrc = $(previewId + (idNumber + 1)).attr('src');
									const nextTempSrc = $(tempSrcId + (idNumber + 1)).val();
									$(previewId + idNumber).attr('src', nextSrc);
									$(previewId + idNumber).show();
									$(moveSrcId + idNumber).val(nextTempSrc);
									$(tempSrcId + idNumber).val(nextTempSrc);
									$(changeCheckId + idNumber).val(1);
									$(previewId + (idNumber + 1)).attr('src', '');
									$(previewId + (idNumber + 1)).hide();
									$(plusIconId + (idNumber + 1)).show();
									$(changeCheckId + (idNumber + 1)).val(1);
									$(moveSrcId + (idNumber + 1)).val('');
									$(tempSrcId + (idNumber + 1)).val('');
								} else {
									$(previewId + idNumber).attr('src', '');
									$(previewId + idNumber).hide();
									$(plusIconId + idNumber).show();
									$(changeCheckId + idNumber).val(1);
									$(moveSrcId + idNumber).val('');
									$(tempSrcId + idNumber).val('');
								}
							break;
							}
							case 0:{ // 1번째 칸
								if($(previewId + (idNumber + 1)).attr('src') != '' 
									&& $(previewId + (idNumber + 2)).attr('src') != '' 
										&& $(previewId + (idNumber + 3)).attr('src') != '') {
										if($(imageInputId + (idNumber + 1)).val() != '') {
											const aDataTransfer = new DataTransfer();
											aDataTransfer.items.add($(imageInputId + (idNumber + 1))[0].files[0]);
											$(imageInputId + idNumber)[0].files = aDataTransfer.files;
											$(imageInputId + (idNumber + 1)).val('');
										}
										if($(imageInputId + (idNumber + 2)).val() != '') {
											const aDataTransfer = new DataTransfer();
											aDataTransfer.items.add($(imageInputId + (idNumber + 2))[0].files[0]);
											$(imageInputId + (idNumber + 1))[0].files = aDataTransfer.files;
											$(imageInputId + (idNumber + 2)).val('');
										}
										if($(imageInputId + (idNumber + 3)).val() != '') {
											const aDataTransfer = new DataTransfer();
											aDataTransfer.items.add($(imageInputId + (idNumber + 3))[0].files[0]);
											$(imageInputId + (idNumber + 2))[0].files = aDataTransfer.files;
											$(imageInputId + (idNumber + 3)).val('');
										}
										const nextSrc = $(previewId + (idNumber + 1)).attr('src');
										const nextTempSrc = $(tempSrcId + (idNumber + 1)).val();
										const nextSrc2 = $(previewId + (idNumber + 2)).attr('src');
										const nextTempSrc2 = $(tempSrcId + (idNumber + 2)).val();
										const nextSrc3 = $(previewId + (idNumber + 3)).attr('src');
										const nextTempSrc3 = $(tempSrcId + (idNumber + 3)).val();
										$(previewId + idNumber).attr('src', nextSrc);
										$(previewId + idNumber).show();
										$(moveSrcId + idNumber).val(nextTempSrc);
										$(changeCheckId + idNumber).val(1);
										$(previewId + (idNumber + 1)).attr('src', nextSrc2);
										$(previewId + (idNumber + 1)).show();
										$(moveSrcId + (idNumber + 1)).val(nextTempSrc2);
										$(tempSrcId + (idNumber + 1)).val(nextTempSrc2);
										$(changeCheckId + (idNumber + 1)).val(1);
										$(previewId + (idNumber + 2)).attr('src', nextSrc3);
										$(previewId + (idNumber + 2)).show();
										$(moveSrcId + (idNumber + 2)).val(nextTempSrc3);
										$(tempSrcId + (idNumber + 2)).val(nextTempSrc3);
										$(changeCheckId + (idNumber + 2)).val(1);
										$(previewId + (idNumber + 3)).attr('src', '');
										$(previewId + (idNumber + 3)).hide();
										$(plusIconId + (idNumber + 3)).show();
										$(changeCheckId + (idNumber + 3)).val(1);
										$(tempSrcId + (idNumber + 3)).val('');
								} else if($(previewId + (idNumber + 1)).attr('src') != '' 
									&& $(previewId + (idNumber + 2)).attr('src') != '') {
										if($(imageInputId + (idNumber + 1)).val() != '') {
											const aDataTransfer = new DataTransfer();
											aDataTransfer.items.add($(imageInputId + (idNumber + 1))[0].files[0]);
											$(imageInputId + idNumber)[0].files = aDataTransfer.files;
											$(imageInputId + (idNumber + 1)).val('');
										}
										if($(imageInputId + (idNumber + 2)).val() != '') {
											const aDataTransfer = new DataTransfer();
											aDataTransfer.items.add($(imageInputId + (idNumber + 2))[0].files[0]);
											$(imageInputId + (idNumber + 1))[0].files = aDataTransfer.files;
											$(imageInputId + (idNumber + 2)).val('');
										}
										const nextSrc = $(previewId + (idNumber + 1)).attr('src');
										const nextTempSrc = $(tempSrcId + (idNumber + 1)).val();
										const nextSrc2 = $(previewId + (idNumber + 2)).attr('src');
										const nextTempSrc2 = $(tempSrcId + (idNumber + 2)).val();
										$(previewId + idNumber).attr('src', nextSrc);
										$(previewId + idNumber).show();
										$(moveSrcId + idNumber).val(nextTempSrc);
										$(changeCheckId + idNumber).val(1);
										$(previewId + (idNumber + 1)).attr('src', nextSrc2);
										$(previewId + (idNumber + 1)).show();
										$(moveSrcId + (idNumber + 1)).val(nextTempSrc2);
										$(tempSrcId + (idNumber + 1)).val(nextTempSrc2);
										$(changeCheckId + (idNumber + 1)).val(1);
										$(previewId + (idNumber + 2)).attr('src', '');
										$(previewId + (idNumber + 2)).hide();
										$(plusIconId + (idNumber + 2)).show();
										$(changeCheckId + (idNumber + 2)).val(1);
										$(moveSrcId + (idNumber + 2)).val('');
										$(tempSrcId + (idNumber + 2)).val('');
								} else if($(previewId + (idNumber + 1)).attr('src') != '') {
									if($(imageInputId + (idNumber + 1)).val() != '') {
											const aDataTransfer = new DataTransfer();
											aDataTransfer.items.add($(imageInputId + (idNumber + 1))[0].files[0]);
											$(imageInputId + idNumber)[0].files = aDataTransfer.files;
											$(imageInputId + (idNumber + 1)).val('');
									}
									const nextSrc = $(previewId + (idNumber + 1)).attr('src');
									const nextTempSrc = $(tempSrcId + (idNumber + 1)).val();
									$(previewId + idNumber).attr('src', nextSrc);
									$(previewId + idNumber).show();
									$(moveSrcId + idNumber).val(nextTempSrc);
									$(changeCheckId + idNumber).val(1);
									$(previewId + (idNumber + 1)).attr('src', '');
									$(previewId + (idNumber + 1)).hide();
									$(plusIconId + (idNumber + 1)).show();
									$(changeCheckId + (idNumber + 1)).val(1);
									$(moveSrcId + (idNumber + 1)).val('');
									$(tempSrcId + (idNumber + 1)).val('');
								} else {
									$(previewId + idNumber).attr('src', '');
									$(previewId + idNumber).hide();
									$(plusIconId + idNumber).show();
									$(changeCheckId + idNumber).val(1);
									$(moveSrcId + idNumber).val('');
									$(tempSrcId + idNumber).val('');
								}
							break;
							}
							default:{
								console.log('잘못된 번호'+ idNumber);
							break;
							}
						}
						
					}
				});
				/*=============== 이미지 미리보기 && 이미지 빈칸 제어 ===============*/
				
				
				
				/*=============== 이미지 삭제 버튼 ===============*/
				$('.image-delete').on('click', function(e) {
					const targetId = e.currentTarget.id; // image-delete0, image-delete1, image-delete2, image-delete3
					console.log('targetId : '+ targetId);
					const idNumber = parseInt(targetId.charAt(targetId.length - 1), 10);
					console.log('idNumber : '+ idNumber);
					const imageInputId = '#image-input';
					$(imageInputId + idNumber).val('');
					$(imageInputId + idNumber).trigger('change');
				});
				/*=============== 이미지 삭제 버튼 ===============*/
				
				
				
				/*=============== 체크박스 제어 ===============*/
				$('input:checkbox[name="animal_act"], input:checkbox[name="animal_social"]').on('change', function(){
					
					if($(this).prop('name') == 'animal_act'){
						if($(this).is(':checked')) {
							$('input:checkbox[name="animal_act"]').not($(this)).prop('checked',false);
							$('.aAct-hint-text').hide();
							$('#aAct-checkbox-all').removeClass('a-checkbox-alert');
						}
					} else {
						if($(this).is(':checked')) {
							$('input:checkbox[name="animal_social"]').not($(this)).prop('checked',false);
							$('.aSocial-hint-text').hide();
							$('#aSocial-checkbox-all').removeClass('a-checkbox-alert');
						}
					}
					
					if($('input:checkbox[name="animal_act"]').is(':checked') 
							&& $('input:checkbox[name="animal_social"]').is(':checked')) {
						if(checkedMove) {
							checkedMove = false;
							setTimeout(function(){
								$('#aName').focus();
							}, 300);
						}
					}
					
				});
				/*=============== 체크박스 제어 ===============*/



				/*=============== 동물 정보 가져오기 & 입력 ===============*/
				let currentURL = window.location.pathname;
				let lastSlashIndex = currentURL.lastIndexOf('/');
				let animalId = currentURL.substring(lastSlashIndex+1);
				const regex = /^ANIM-\w{6}$/;
				
				if(regex.test(animalId)) {
					$.ajax({
						url: '/adptmgmt/animals/' + animalId,
						method: 'GET',
						type: 'json',
						success: function(data) {
							const adate = new Date(data.animal_regdate);
							const year = adate.getFullYear();
							const month = String(adate.getMonth() + 1).padStart(2, '0');
							const day = String(adate.getDay()).padStart(2, '0');
							const formattedDate = year + '-' + month + '-' + day;
							data.animal_regdate = formattedDate;
							
							$('#animal_id').val(data.animal_id);
							$('#aRegDate').val(data.animal_regdate);
							$('#petType').val(data.categoryDataVO.category_parent);
							$('#petType').trigger('change');
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
							switch(data.animal_status) {
								case 1: {
									$('#animalStatus').empty();
									$('#animalStatus').append('<label class="badge badge-warning">대기중</label>');
									$('#animal_status').val(data.animal_status);
									break;
								}
								case 2: {
									$('#animalStatus').empty();
									$('#animalStatus').append('<label class="badge badge-primary">모집중</label>');
									$('#animal_status').val(data.animal_status);
									break;
								}
								case 3: {
									$('#animalStatus').empty();
									$('#animalStatus').append('<label class="badge badge-danger">상담중</label>');
									$('#animal_status').val(data.animal_status);
									break;
								}
								case 4: {
									$('#animalStatus').empty();
									$('#animalStatus').append('<label class="badge badge-success">입양완료</label>');
									$('#animal_status').val(data.animal_status);
									break;
								}
								case 5: {
									$('#animalStatus').empty();
									$('#animalStatus').append('<label class="badge badge-secondary">종료</label>');
									$('#animal_status').val(data.animal_status);
									break;
								}
							}
							for(let i = 0; i < data.animal_images.length; i++) {
								if(data.animal_images[i].image_src != '') {
									$('#image-preview'+ i).attr('src',data.animal_images[i].image_src).show();
									$('#orgSrc'+ i).val(data.animal_images[i].image_src);
									$('#tempSrc'+ i).val(data.animal_images[i].image_src);
									$('#plusIcon'+ i).hide();
								}
							}
							$('input[name="animal_act"][value="'+ data.animal_act +'"]').prop('checked',true);
							$('input[name="animal_social"][value="'+ data.animal_social +'"]').prop('checked',true);
							for(let i = 0; i < 5; i++) {
								$('#aHealth'+ i).val(data.animal_healths[i].health_check);
							}
							for(let i = 0; i < 4; i++) {
								$('#aVaccine'+ i).val(data.animal_vaccines[i].vaccine_check);
							}
							$('#aRegNum').val(data.animal_regnum);
							$('#aEtc').val(data.animal_etc);
							
							if($('#animal_status').val() == '5') {
								$('#a-close-btn1, #a-close-btn2').hide();
								$('#a-close-cancel-btn1, #a-close-cancel-btn2').show();
							} else {
								$('#a-close-btn1, #a-close-btn2').show();
								$('#a-close-cancel-btn1, #a-close-cancel-btn2').hide();
							}
							
						},
						error: function(error) {
							console.error('데이터를 가져오는 데 실패했습니다:', error);
							window.location.href = '/AM/animals/list';
						}
					});
				} else {
					window.location.href = '/AM/animals/list';
				}
				/*=============== 동물 정보 가져오기 & 입력 ===============*/
				
								
								
				/*=============== 삭제(delete) 버튼 제어 ===============*/
				$('#a-delete-btn1, #a-delete-btn2').on('click',function(e) {
					const animal_id = $('#animal_id').val();
					const member_id = $('#aRegUser').val();
					
					Swal.fire({
						title: '삭제하시겠습니까?',
						text: '동물 정보가 삭제됩니다!',
						icon: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#fc5a5a',
						cancelButtonColor: '#aab2bd',
						confirmButtonText: '삭제',
						cancelButtonText: '닫기'
					}).then(function(result) {
						if (result.isConfirmed) {
							$.ajax({
								url: "/adptmgmt/animals/"+ animal_id +"/deletion?member_id=" + member_id,
								method: "DELETE",
								success: function() {
									Swal.fire({
										title:'삭제 되었습니다!',
										icon:'success',
										confirmButtonColor: '#006e60',
										confirmButtonText: '확인'
									}).then(function(result) {
										if(result.isConfirmed) {
											location.href="/AM/animals/list";
										}
									});
								},
								error: function(xhr, status, error) {
									console.error("AJAX 오류:", status, error);
									Swal.fire({
										title: '오류 발생',
										text: '삭제에 실패했습니다. 다시 시도해 주세요.',
										icon: 'error',
										confirmButtonColor: '#006e60',
										confirmButtonText: '확인'
									});
								}
							});
						}
					});
				});
				/*=============== 삭제(delete) 버튼 제어 ===============*/

				
				
				/*=============== 입양글(create) 버튼 제어 ===============*/
				$('.a-writing-btn').on('click', function() {
					const animal_id = $('#animal_id').val();
					
					Swal.fire({
						title: '입양글을 작성하시겠습니까?',
						text: '입양글 작성 페이지로 이동합니다',
						icon: 'info',
						showCancelButton: true,
						confirmButtonColor: '#006e60',
						cancelButtonColor: '#aab2bd',
						confirmButtonText: '작성',
						cancelButtonText: '닫기'
					}).then(function(result) {
						if (result.isConfirmed) {
							location.href='/AM/writings/add/'+ animal_id;
						}	
					});
				});
				/*=============== 입양글(create) 버튼 제어 ===============*/
				
				
				
				
				/*=============== 종료(close) 버튼 제어 ===============*/
				$('#a-close-btn1, #a-close-btn2').on('click', function() {
					const animal_id = $('#animal_id').val();
					const member_id = $('#aRegUser').val();
					
					Swal.fire({
						title: '종료로 변경하시겠습니까?',
						text: '동물 상태가 종료로 변경되고 입양글, 상담이 취소됩니다',
						icon: 'question',
						showCancelButton: true,
						confirmButtonColor: '#000711',
						cancelButtonColor: '#aab2bd',
						confirmButtonText: '변경',
						cancelButtonText: '닫기'
					}).then(function(result) {
						if (result.isConfirmed) {
							$.ajax({
								url: "/adptmgmt/animals/"+ animal_id +"/status",
								method: "PATCH",
								contentType: "application/json",
								data: JSON.stringify({ 
									"animal_id" : animal_id, 
									"member_id" : member_id, 
									"animal_status" : 5 }),
								success: function() {
									Swal.fire({
										title: '종료로 변경되었습니다',
										icon: 'success',
										confirmButtonColor: '#006e60',
										confirmButtonText: '확인',
									}).then(function(result) {
										if (result.isConfirmed) {
											location.reload();
										}
									});
								},
								error: function(xhr, status, error) {
									console.error("AJAX 오류:", status, error);
									Swal.fire({
										title: '오류 발생',
										text: '변경에 실패했습니다. 다시 시도해 주세요.',
										icon: 'error',
										confirmButtonColor: '#006e60',
										confirmButtonText: '확인'
									});
								}
							});
						}
					});
				});
				
				$('#a-close-cancel-btn1, #a-close-cancel-btn2').on('click', function() {
					const animal_id = $('#animal_id').val();
					const member_id = $('#aRegUser').val();
					
					Swal.fire({
						title: '종료를 취소하시겠습니까?',
						text: '동물 상태가 대기중으로 변경됩니다',
						icon: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#000711',
						cancelButtonColor: '#aab2bd',
						confirmButtonText: '변경',
						cancelButtonText: '닫기'
					}).then(function(result) {
						if (result.isConfirmed) {
							$.ajax({
								url: "/adptmgmt/animals/"+ animal_id +"/status",
								method: "PATCH",
								contentType: "application/json",
								data: JSON.stringify({ 
									"animal_id" : animal_id, 
									"member_id" : member_id, 
									"animal_status" : 1 }),
								success: function() {
									Swal.fire({
										title: '동물상태가 대기중으로 변경되었습니다',
										icon: 'success',
										confirmButtonColor: '#006e60',
										confirmButtonText: '확인',
									}).then(function(result) {
										if (result.isConfirmed) {
											location.reload();
										}
									});
								},
								error: function(xhr, status, error) {
									console.error("AJAX 오류:", status, error);
									Swal.fire({
										title: '오류 발생',
										text: '변경에 실패했습니다. 다시 시도해 주세요.',
										icon: 'error',
										confirmButtonColor: '#006e60',
										confirmButtonText: '확인'
									});
								}
							});
						}
					});
				});
				/*=============== 종료(close) 버튼 제어 ===============*/
				
				
				
				/*=============== 제출(submit) 버튼 제어 ===============*/
				$('#formAdptAnimal').on('submit', function(event) {
					event.preventDefault();
					var formData = new FormData(this);
					let currentURL = window.location.pathname;
					let lastSlashIndex = currentURL.lastIndexOf('/');
					let animalId = currentURL.substring(lastSlashIndex+1);
					const regex = /^ANIM-\w{6}$/;

					if(!regex.test(animalId)) {
						alert('유효하지않은 동물id 입니다');
						return;
					}

					if($('#petTypeDetailCode').val() == '') {
						alert('세부 종류를 입력해주세요!');
						$('#petTypeDetail').focus();
						return;
					} else if($('#aAge').val() == '') {
						alert('동물 나이를 입력해주세요!');
						$('#aAge').focus();
						return;
					} else if ($('#image-preview0').attr('src') == '') {
						alert('대표 이미지를 입력해주세요!');
						$('#image-input1').focus();
						return;
					}
					
					Swal.fire({
						title: '수정하시겠습니까?',
						text: '수정 내용을 확인해주세요!',
						icon: 'info',
						showCancelButton: true,
						confirmButtonColor: '#006e60',
						cancelButtonColor: '#aab2bd',
						confirmButtonText: '수정',
						cancelButtonText: '닫기'
					}).then(function(result) {
						if (result.isConfirmed) {
							$.ajax({
								url: '/adptmgmt/animals/'+ animalId +'/modification',
								method: 'POST',
								data: formData,
								contentType: false,
								processData: false,
								success: function(response) {
									Swal.fire({
									title: '수정 완료',
									text: '수정에 성공했습니다!',
									icon: 'success',
									confirmButtonColor: '#006e60',
									confirmButtonText: '확인'
									}).then(function(result){
										if(result.isConfirmed){
											location.reload();
										}
									});
								},
								error: function(jqXHR, textStatus, errorThrown) {
									console.error('수정 실패:', textStatus, errorThrown);
									Swal.fire({
										title: '오류!',
										text: '수정에 실패했습니다.',
										icon: 'error',
										confirmButtonColor: '#006e60',
										confirmButtonText: '확인'
									});
								}
							});
						}
					});
				});
				/*=============== 제출(submit) 버튼 제어 ===============*/

				
				
				
				
				
			});//DOM
			
		</script>
		<!-- End custom js for this page -->
	</body>
</html>
