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
	
	#plusIcon1, #plusIcon2, #plusIcon3, #plusIcon4, #plusIcon5 {
		font-size: 2rem;
		color: #888;
	}
	
	#image-preview1, #image-preview2, #image-preview3, #image-preview4, #image-preview5 {
		width: 100%;
		height: 100%;
		object-fit: fill;
		display: none;
	}
	
	.form-group input {
		display: flex;
		flex: 1;
	}
	
	input::placeholder {
		color: #ccc !important;
	}
	
	.custom-label {
		font-size: 1.2rem !important;
	}
	
	.custom-text {
		font-size: 1.2rem;
	}
	
	.custom-borderbm {
		border: 0.2rem;
		border-style: dashed;
		border-color: #aab2bd;
		width: 95%;
		margin: auto;
	}
	
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
	
	.custom-a-fieldset {
		border: 2px solid #ccc;
		padding: 2.5rem;
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
	
	select.form-control {
		border-radius: 0.5rem;
		cursor: pointer;
	}
	
	input.form-control {
		border-radius: 0.5rem;
	}

	
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
										<h4 class="card-title">입양 동물 관리</h4>
										<p class="card-description"> 입양 동물 등록 </p>
										
										<form id="formAdptAnimal" action="" method="post">
										
											<fieldset class="custom-a-fieldset mb-3">
												<legend class="custom-a-legend">필수 정보</legend>
												<div class="form-group row">
													<div class="col-12 col-xl-2 col-md-5 mb-3">
														<label for="petType" class="text-dark custom-label">동물 종류</label>
														<select class="form-control custom-text" id="petType" required>
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
															maxlength="30" readonly/>
													</div>
													<div class="col-12 col-md-3 mb-3"></div>
												</div>
											
												<div class="form-group row">
													<div class="col-12 col-xl-3 col-md-6 mb-3">
														<label for="aName" class="text-dark custom-label">동물 이름</label>
														<input type="text" id="aName" name="animal_name" class="form-control custom-text"
															placeholder="최대 10자" maxlength="10" required/>
													</div>
													<div class="col-12 col-xl-3 col-md-6 mb-3">
														<label for="aColor" class="text-dark custom-label">색상</label>
														<input type="text" id="aColor" name="animal_color" class="form-control custom-text"
															placeholder="최대 10자" maxlength="10" required/>
													</div>
													<div class="col-12 col-xl-2 col-md-2 mb-3">
														<label for="aGender" class="text-dark custom-label">성별</label>
														<select id="aGender" name="animal_gender" 
															class="form-control custom-text" required>
															<option value="">--</option>
															<option value="1">남아</option>
															<option value="2">여아</option>
														</select>
													</div>
													<div class="col-12 col-xl-2 col-md-2 mb-3">
													<label for="aNeuter" class="text-dark custom-label">중성화</label>
														<select id="aNeuter" name="animal_neuter" 
															class="form-control custom-text" required>
															<option value="">--</option>
															<option value="1">&#9675;</option>
															<option value="2">&#10005;</option>
														</select>
													</div>
												</div>
												
												<div class="form-group row mb-5">
													<div class="col-12 col-xl-3 col-md-6 mb-3">
														<label for="aAge" class="text-dark custom-label">동물 나이</label>
														<input type="text" id="aAge" name="animal_age" class="form-control custom-text"
															placeholder="최대 10자" maxlength="10" required/>
													</div>
													<div class="col-12 col-xl-2 col-md-2 mb-3">
														<label for="aWeight" class="text-dark custom-label">크기</label>
														<select id="aWeight" name="animal_weight" 
															class="form-control custom-text" required>
															<option value="">--</option>
															<option value="1">소형&nbsp;(~5kg)</option>
															<option value="2">중형&nbsp;(5~25kg)</option>
															<option value="3">대형&nbsp;(25kg~)</option>
														</select>
													</div>
													<div class="col-12 col-xl-3 col-lg-5 col-md-5 mb-3">
														<label for="aRegUser" class="text-dark custom-label">작성자</label>
														<input type="text" id="aRegUser" name="member_id" 
															class="form-control custom-text" value="dummyID" readonly/>
													</div>
												</div>
												
												<div class="form-group row">
													<div class="col-10 col-xl-2 col-lg-3 col-md-3 mr-3 mb-2">
														<label class="text-dark custom-label">대표 이미지</label>
													    <div class="upload-container">
															<label for="image-input1" class="upload-button">
																<input type="file" class="file-upload-default image-input" 
																	accept="image/*" id="image-input1" required/>
																<i id="plusIcon1" class="mdi mdi-plus"></i>
																<img id="image-preview1" alt="이미지 미리보기" />
															</label>
														</div>
													</div>
													<div class="col-10 col-xl-2 col-lg-3 col-md-3 mr-3 mb-2">
														<label class="text-dark custom-label">이미지</label>
													    <div class="upload-container">
															<label for="image-input2" class="upload-button">
																<input type="file" class="file-upload-default image-input" 
																	accept="image/*" id="image-input2" />
																<i id="plusIcon2" class="mdi mdi-plus"></i>
																<img id="image-preview2" alt="이미지 미리보기" />
															</label>
														</div>
													</div>
													<div class="col-10 col-xl-2 col-lg-3 col-md-3 mr-3 mb-2">
														<label class="text-dark custom-label">이미지</label>
													    <div class="upload-container">
															<label for="image-input3" class="upload-button">
																<input type="file" class="file-upload-default image-input" 
																	accept="image/*" id="image-input3" />
																<i id="plusIcon3" class="mdi mdi-plus"></i>
																<img id="image-preview3" alt="이미지 미리보기" />
															</label>
														</div>
													</div>
													<div class="col-10 col-xl-2 col-lg-3 col-md-3 mr-3 mb-2">
														<label class="text-dark custom-label">이미지</label>
													    <div class="upload-container">
															<label for="image-input4" class="upload-button">
																<input type="file" class="file-upload-default image-input" 
																	accept="image/*" id="image-input4" />
																<i id="plusIcon4" class="mdi mdi-plus"></i>
																<img id="image-preview4" alt="이미지 미리보기" />
															</label>
														</div>
													</div>
												</div>
											</fieldset>
											
											<div class="border-bottom my-5 custom-borderbm"></div>
											
											<fieldset class="custom-a-fieldset mb-3">
											<legend class="custom-a-legend">선택 정보</legend>
											
												<div class="form-group row">
													<div class="col-12 col-xl-4 col-md-6 mb-3">
														<label for="aRegNum" class="text-dark custom-label">동물 등록 번호</label>
														<input type="text" id="aRegNum" name="animal_regnum" class="form-control custom-text" 
															maxlength="15" placeholder="최대 15자"/>
													</div>
												</div>
												
												<fieldset class="custom-a-fieldset col-12 col-xl-12 mb-5">
												<legend class="custom-a-sub-legend">건강검진 정보</legend>
													<div class="row">
														<div class="col-12 col-xl-2 col-lg-8 col-md-5 mr-3 mb-3">
															<label for="aHealth0" class="text-dark custom-label">사상충</label>
															<select id="aHealth0" name="animal_healths[0].health_check" 
																class="form-control custom-text">
																<option value="미입력">--</option>
																<option value="음성">음성&nbsp;(없음)</option>
																<option value="양성">양성&nbsp;(있음)</option>
															</select>
															<input type="hidden" name="animal_healths[0].health" value="사상충">
														</div>
														<div class="col-12 col-xl-2 col-lg-8 col-md-5 mr-3 mb-3">
															<label for="aHealth1" class="text-dark custom-label">원충</label>
															<select id="aHealth1" name="animal_healths[1].health_check" 
																class="form-control custom-text">
																<option value="미입력">--</option>
																<option value="음성">음성&nbsp;(없음)</option>
																<option value="양성">양성&nbsp;(있음)</option>
															</select>
															<input type="hidden" name="animal_healths[1].health" value="원충">
														</div>
														<div class="col-12 col-xl-2 col-lg-8 col-md-5 mr-3 mb-3">
															<label for="aHealth2" class="text-dark custom-label">코로나</label>
															<select id="aHealth2" name="animal_healths[2].health_check" 
																class="form-control custom-text">
																<option value="미입력">--</option>
																<option value="음성">음성&nbsp;(없음)</option>
																<option value="양성">양성&nbsp;(있음)</option>
															</select>
															<input type="hidden" name="animal_healths[2].health" value="코로나">
														</div>
														<div class="col-12 col-xl-2 col-lg-8 col-md-5 mr-3 mb-3">
															<label for="aHealth3" class="text-dark custom-label">파보</label>
															<select id="aHealth3" name="animal_healths[3].health_check" 
																class="form-control custom-text">
																<option value="미입력">--</option>
																<option value="음성">음성&nbsp;(없음)</option>
																<option value="양성">양성&nbsp;(있음)</option>
															</select>
															<input type="hidden" name="animal_healths[3].health" value="파보">
														</div>
														<div class="col-12 col-xl-2 col-lg-8 col-md-5 mr-3 mb-3">
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
												<legend class="custom-a-sub-legend">예방접종 정보</legend>
													<div id="aVaccineDiv" class="row">
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
												<legend class="custom-a-sub-legend">활동성 및 사회성</legend>
													<div class="row">
														<div class="col-12 col-xl-6 col-lg-8 col-md-5 mb-3">
															<label for="aAct" class="text-dark custom-label">활동성</label>
															<input type="range" id="aAct" name="animal_act" min="1" max="5"
																step="1" class="form-control"/>
														</div>
														<div class="col-12 col-xl-6 col-lg-8 col-md-5 mb-3">
															<label for="aSocial" class="text-dark custom-label">사회성</label>
															<input type="range" id="aSocial" name="animal_social" min="1" max="5"
																step="1" class="form-control"/>
														</div>
													</div>
												</fieldset>
												
												<button type="submit" class="btn btn-primary mr-2">Submit</button>
												<button class="btn btn-light">Cancel</button>
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
		<script src="${pageContext.request.contextPath}/resources/admin/js/off-canvas.js"></script>
		<script src="${pageContext.request.contextPath}/resources/admin/js/hoverable-collapse.js"></script>
		<script src="${pageContext.request.contextPath}/resources/admin/js/misc.js"></script>
		<!-- endinject -->
		<!-- Custom js for this page -->
		<script>
			$(function() {
				
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
							{ label: '--', value: 'etc' },
							{ label: '--', value: 'etc' },
							{ label: '--', value: 'etc' },
							{ label: '--', value: 'etc' }
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
				
				
				/*=============== 이미지 미리보기 ===============*/
				$('.image-input').on('change', function(e) {
					const file = e.target.files[0];
					const reader = new FileReader();
					
					const inputId = e.target.id;
					const previewId = '#image-preview' + inputId.charAt(inputId.length - 1);
					const plusIconId = '#plusIcon' + inputId.charAt(inputId.length - 1);
				
					if (file) {
						reader.onload = function(e) {
							$(previewId).attr('src', e.target.result).show();
							$(plusIconId).hide();
						}
						reader.readAsDataURL(file);
					} else {
						$(previewId).hide();
						$(plusIconId).show();
					}
				});
				/*=============== 이미지 미리보기 ===============*/
				
				
				/*=============== 동물 종류 리스트 가져오기 ===============*/
				$('#petType').on('click', function() {
					
					if ($('#petType').find('option').length === 1) {
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
						$('#dropdownList').append("<div class='dropdown-item' data-value='"+item.category_code+"'>" + item.category_value + "</div>");
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
									.attr('for', 'vaccine' + i)
									.text(vaccine.label);
					
								const vSelect = $('<select></select>')
									.attr('id', 'vaccine' + i)
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
				
				
			});//DOM
			
		</script>
		<!-- End custom js for this page -->
	</body>
</html>
