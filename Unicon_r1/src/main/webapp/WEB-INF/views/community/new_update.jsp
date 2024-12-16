<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/new_topHeader.jsp"%>
<!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

<style type="text/css">
.dropdown {
	position: relative; /* 드롭다운 위치 설정 */
}

.dropdown-menu {
	display: none; /* 기본적으로 숨김 */
	position: absolute; /* 드롭다운 목록을 절대 위치로 설정 */
	z-index: 1000; /* 다른 요소 위에 표시 */
	background-color: white; /* 배경색 */
	border: 1px solid #ccc; /* 테두리 */
	width: 100%; /* 입력 필드와 같은 너비 */
	height: 50vh;
	overflow-y: auto; /* 세로 스크롤 가능 */
}

.dropdown-menu.show {
	display: block; /* show 클래스가 있을 때 표시 */
}

.dropdown-item {
	padding: 8px; /* 항목 패딩 */
	cursor: pointer; /* 포인터 커서 */
}

.dropdown-item:hover {
	background-color: #f0f0f0; /* 호버 효과 */
}
</style>

</head>
<%@ include file="../inc/new_header.jsp"%>
<!-- header -->

<!--====================================작성부=====================================-->
<c:if test="${empty userId}">
	<c:redirect url="/main"/>
</c:if>
<c:if test="${userId != postList.member_id}">
	<c:redirect url="/main"/>
</c:if>
<%-- ${postList} --%>


<section class="bg-light" style="padding: 60px;">
	<div class="container">

		<div class="line-title">
			<h4 class="mb-0">커뮤니티</h4>
		</div>

		<div class="row justify-content-center">

			<!-- start form section -->
			<div class="col-md-11 col-lg-9">

				<div class="border bg-white p-1-9 p-lg-2-3 p-xl-6 rounded">

					<div class="text-center mb-1-9">
						<h2 class="font-weight-600 mb-3">커뮤니티 게시물 수정</h2>
						<p class="mb-0">작성한 커뮤니티 게시물의 내용을 수정해주세요.</p>
					</div>

					<form id="formPost" class="quform"
						action="" method="post"
						enctype="multipart/form-data">

						<!-- 숨겨서 들고갈 값(세션) -->
						<!-- member_id -->
						<input id="member_id" name="member_id" type="text" value="${userId }">
						<!-- 숨겨서 들고갈 값(세션) -->

						<div class="quform-elements">

							<div class="row">
								
								<!-- 숨겨진 post_id 값 -->
								<input id="post_id" type="hidden" value="${postList.post_id }">
								<!-- 숨겨진 post_id 값 -->

								<!-- Begin Select element -->
								<div class="col-md-3">
									<div class="quform-element form-group">
										<label for="post_type">게시글 종류 <span
											class="quform-required">*</span></label>
										<div class="quform-input">
											<select id="post_type" class="form-control form-select"
												name="post_type">
												<option value="">게시글 종류</option>
												<option value="post01"
													<c:if test="${postList.post_type == 'post01' }">selected="selected"</c:if>>입양
													후기</option>
												<option value="post02"
													<c:if test="${postList.post_type == 'post02' }">selected="selected"</c:if>>반려
													이야기</option>
												<option value="post03"
													<c:if test="${postList.post_type == 'post03' }">selected="selected"</c:if>>실종</option>
												<option value="post04"
													<c:if test="${postList.post_type == 'post04' }">selected="selected"</c:if>>임시
													보호</option>
											</select>
										</div>
									</div>
								</div>
								<!-- End Select element -->

								<!-- Begin Select element -->
								<div class="col-md-3">
									<div class="quform-element form-group">
										<label for="petType">동물 종류 <span
											class="quform-required">*</span></label>
										<div class="quform-input">
											<select id="petType" class="form-control form-select">
												<option>동물 종류 선택</option>
											</select>
										</div>
									</div>
								</div>
								<!-- End Select element -->

								<!-- 불러온 동물코드 숨기기 -->
								<input type="hidden" id="categoryCode" value="${postList.pet_code }">
								<!-- 불러온 동물코드 숨기기 -->

								<!-- Begin Select element -->
								<div class="col-md-3">

									<div class="quform-element form-group">
										<label for="applyfor">동물 품종 <span
											class="quform-required">*</span></label>
										<div class="quform-input">
											<div class="quform-input">
												<input value="${postList.categoryDataVO.category_value }" id="searchInput" class="form-control" type="text" />
												<div id="dropdownList" class="dropdown-menu"></div>
											</div>
										</div>
									</div>

								</div>
								<!-- End Select element -->

								<!-- 숨겨서 들고갈 값 -->
								<!-- pet_code -->
								<input id="pet_code" name="pet_code" type="hidden">
								<!-- 숨겨서 들고갈 값 -->

								<!-- Begin Select element -->
								<div class="col-md-3">
									<div class="quform-element form-group">
										<label for="pet_etc_breed">기타 동물 품종</label>
										<div class="quform-input">
											<div class="quform-input">
												<input id="pet_etc_breed" class="form-control"
													value="${postList.pet_etc_breed }" type="text"
													name="pet_etc_breed" placeholder="품종이 기타인 경우" readonly />
											</div>
										</div>
									</div>

								</div>
								<!-- End Select element -->

								<!-- Begin Text input element -->
								<div class="col-md-6">
									<div class="quform-element form-group">
										<label for="post_title">글 제목</label>
										<div class="quform-input">
											<input id="post_title" class="form-control" type="text"
												value="${postList.post_title }" name="post_title"
												placeholder="입력" />
										</div>
									</div>

								</div>
								<!-- End Text input element -->

								<!-- Begin Text input element -->
								<div class="col-md-6">
									<div class="quform-element form-group">
										<label for="resion">거주 지역</label>
										<div class="quform-input">
											<select id="post_resion" class="form-control form-select" name="post_resion">
											   <option value="서울" <c:if test="${postList.post_resion == '서울' }">selected="selected"</c:if>>서울</option>
											   <option value="인천" <c:if test="${postList.post_resion == '인천' }">selected="selected"</c:if>>인천</option>
											   <option value="부산" <c:if test="${postList.post_resion == '부산' }">selected="selected"</c:if>>부산</option>
											   <option value="대구" <c:if test="${postList.post_resion == '대구' }">selected="selected"</c:if>>대구</option>
											   <option value="광주" <c:if test="${postList.post_resion == '광주' }">selected="selected"</c:if>>광주</option>
											   <option value="대전" <c:if test="${postList.post_resion == '대전' }">selected="selected"</c:if>>대전</option>
											   <option value="울산" <c:if test="${postList.post_resion == '울산' }">selected="selected"</c:if>>울산</option>
											   <option value="세종특별시" <c:if test="${postList.post_resion == '세종특별시' }">selected="selected"</c:if>>세종특별시</option>
											   <option value="경기" <c:if test="${postList.post_resion == '경기' }">selected="selected"</c:if>>경기</option>
											   <option value="강원특별자치도" <c:if test="${postList.post_resion == '강원특별자치도' }">selected="selected"</c:if>>강원특별자치도</option>
											   <option value="충북" <c:if test="${postList.post_resion == '충북' }">selected="selected"</c:if>>충북</option>
											   <option value="충남" <c:if test="${postList.post_resion == '충남' }">selected="selected"</c:if>>충남</option>
											   <option value="전북특별자치도" <c:if test="${postList.post_resion == '전북특별자치도' }">selected="selected"</c:if>>전북특별자치도</option>
											   <option value="전남" <c:if test="${postList.post_resion == '전남' }">selected="selected"</c:if>>전남</option>
											   <option value="경북" <c:if test="${postList.post_resion == '경북' }">selected="selected"</c:if>>경북</option>
											   <option value="경남" <c:if test="${postList.post_resion == '경남' }">selected="selected"</c:if>>경남</option>
											   <option value="제주특별자치도" <c:if test="${postList.post_resion == '제주특별자치도' }">selected="selected"</c:if>>제주특별자치도</option>
                                            </select>
										</div>
									</div>
								</div>
								<!-- End Text input element -->

								<!-- Begin Text input element -->
								<div class="col-md-6" id="missing-info" style="display: none;">
									<div class="quform-element form-group">
										<label for="post_pet_place">실종(발견) 장소</label>
										<div class="quform-input">
											<input id="post_pet_place"
												value="${postList.post_pet_place }" class="form-control"
												type="text" name="post_pet_place" placeholder="입력" />
										</div>
									</div>
								</div>
								<!-- End Text input element -->

								<!-- Begin Text input element -->
								<div class="col-md-6" id="date-info" style="display: none;">
									<div class="quform-element form-group">
										<label for="post_pet_date">실종(발견) 일자</label>
										<div class="quform-input">
											<input id="post_pet_date" value="${postList.post_pet_date }"
												class="form-control" type="text" name="post_pet_date"
												placeholder="입력" />
										</div>
									</div>
								</div>
								<!-- End Text input element -->



								<!-- Begin Textarea element -->
								<div class="col-md-12">
									<div class="quform-element form-group">
										<label for="post_content">글 내용</label>
										<div class="quform-input">
											<textarea id="post_content" class="form-control"
												name="post_content" rows="4"
												placeholder="실종과 임시보호 게시글은 성별, 나이, 색상, 기타 특징 등 동물 정보를 상세히 적어주세요">${postList.post_content }</textarea>
										</div>
									</div>
								</div>
								<!-- End Textarea element -->


								<!-- Begin Select element -->
								<div id="test12345" class="container">
									<div class="row">
										<!-- 첫 번째 이미지 업로드 및 미리보기 -->
										<div class="col-6 col-md-3 mb-3">
											<div class="quform-element form-group">
												<!-- Begin Upload element -->
												<div class="quform-input">
													<div class="custom-file">
														<input class="custom-file-input image-input" type="file"
															id="image-input0" name="upload_images[0]"
															accept=".jpeg, .jpg, .png, .gif" style="display: none;" />
														<label for="image-input0" style="cursor: pointer;">대표
															이미지 <span class="quform-required">*</span>
															<input type="hidden" value="${postList.post_images[0].image_src }" id="orgSrc0" name="check_images[0].orgSrc"/>
															<input type="hidden" value="${postList.post_images[0].image_src }" id="tempSrc0"/>
															<input type="hidden" id="changeCheck0" name="check_images[0].changeCheck"/>
															<input type="hidden" id="moveSrc0" name="check_images[0].moveSrc"/>
														</label>
													</div>
												</div>
												<!-- End Upload element -->
											</div>
											<!-- Begin Preview element -->
											<div class="project-grid-img" data-input-id="image-input0"
												style="width: 100%; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
												<i class="fa-solid fa-plus fa-2xl"
													style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
													<c:choose>
													<c:when test="${postList.post_images[0].image_src != '' }">
												<img id="image-preview0" alt="" src="${postList.post_images[0].image_src }"
													style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0;" />
													</c:when>
													<c:otherwise>
													<img id="image-preview0" alt="" src=""
													style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0; display: none;" />
													</c:otherwise>
													</c:choose>
											</div>
											<!-- End Preview element -->
											<button type="button" id="image-delete0" 
												class="btn btn-outline-danger btn-icon-text custom-a-btn-images image-delete"> 
												<i class="fa-solid fa-trash-can"></i>
											</button>
										</div>

										<!-- 두 번째 이미지 업로드 및 미리보기 -->
										<div class="col-6 col-md-3 mb-3">
											<div class="quform-element form-group">
												<!-- Begin Upload element -->
												<div class="quform-input">
													<div class="custom-file">
														<input class="custom-file-input image-input" type="file"
															id="image-input1" name="upload_images[1]"
															accept=".jpeg, .jpg, .png, .gif" style="display: none;" />
														<label for="image-input1" style="cursor: pointer;">이미지
															<input type="hidden" value="${postList.post_images[1].image_src }" id="orgSrc1" name="check_images[1].orgSrc"/>
															<input type="hidden" value="${postList.post_images[1].image_src }" id="tempSrc1"/>
															<input type="hidden" id="changeCheck1" name="check_images[1].changeCheck"/>
															<input type="hidden" id="moveSrc1" name="check_images[1].moveSrc"/>
														</label>
													</div>
												</div>
												<!-- End Upload element -->
											</div>
											<!-- Begin Preview element -->
											<div class="project-grid-img" data-input-id="image-input1"
												style="width: 100%; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
												<i class="fa-solid fa-plus fa-2xl"
													style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
												<c:choose>
													<c:when test="${postList.post_images[1].image_src != '' }">
												<img id="image-preview1" alt="" src="${postList.post_images[1].image_src }"
													style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0;" />
													</c:when>
													<c:otherwise>
													<img id="image-preview1" alt="" src=""
													style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0; display: none;" />
													</c:otherwise>
													</c:choose>
											</div>
											<!-- End Preview element -->
											<button type="button" id="image-delete1" 
												class="btn btn-outline-danger btn-icon-text custom-a-btn-images image-delete"> 
												<i class="fa-solid fa-trash-can"></i>
											</button>
										</div>

										<!-- 세 번째 이미지 업로드 및 미리보기 -->
										<div class="col-6 col-md-3 mb-3">
											<div class="quform-element form-group">
												<!-- Begin Upload element -->
												<div class="quform-input">
													<div class="custom-file">
														<input class="custom-file-input image-input" type="file"
															id="image-input2" name="upload_images[2]"
															accept=".jpeg, .jpg, .png, .gif" style="display: none;" />
														<label for="image-input2" style="cursor: pointer;">이미지
															<input type="hidden" value="${postList.post_images[2].image_src }" id="orgSrc2" name="check_images[2].orgSrc"/>
															<input type="hidden" value="${postList.post_images[2].image_src }" id="tempSrc2"/>
															<input type="hidden" id="changeCheck2" name="check_images[2].changeCheck"/>
															<input type="hidden" id="moveSrc2" name="check_images[2].moveSrc"/>
														</label>
													</div>
												</div>
												<!-- End Upload element -->
											</div>
											<!-- Begin Preview element -->
											<div class="project-grid-img" data-input-id="image-input2"
												style="width: 100%; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
												<i class="fa-solid fa-plus fa-2xl"
													style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
												<c:choose>
													<c:when test="${postList.post_images[2].image_src != '' }">
												<img id="image-preview2" alt="" src="${postList.post_images[2].image_src }"
													style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0;" />
													</c:when>
													<c:otherwise>
													<img id="image-preview2" alt="" src=""
													style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0; display: none;" />
													</c:otherwise>
													</c:choose>
											</div>
											<!-- End Preview element -->
											<button type="button" id="image-delete2" 
												class="btn btn-outline-danger btn-icon-text custom-a-btn-images image-delete"> 
												<i class="fa-solid fa-trash-can"></i>
											</button>
										</div>

										<!-- 네 번째 이미지 업로드 및 미리보기 -->
										<div class="col-6 col-md-3 mb-3">
											<div class="quform-element form-group">
												<!-- Begin Upload element -->
												<div class="quform-input">
													<div class="custom-file">
														<input class="custom-file-input image-input" type="file"
															id="image-input3" name="upload_images[3]"
															accept=".jpeg, .jpg, .png, .gif" style="display: none;" />
														<label for="image-input3" style="cursor: pointer;">이미지
															<input type="hidden" value="${postList.post_images[3].image_src }" id="orgSrc3" name="check_images[3].orgSrc"/>
															<input type="hidden" value="${postList.post_images[3].image_src }" id="tempSrc3"/>
															<input type="hidden" id="changeCheck3" name="check_images[3].changeCheck"/>
															<input type="hidden" id="moveSrc3" name="check_images[3].moveSrc"/>
														</label>
													</div>
												</div>
												<!-- End Upload element -->
											</div>
											<!-- Begin Preview element -->
											<div class="project-grid-img" data-input-id="image-input3"
												style="width: 100%; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
												<i class="fa-solid fa-plus fa-2xl"
													style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
												<c:choose>
													<c:when test="${postList.post_images[3].image_src != '' }">
												<img id="image-preview3" alt="" src="${postList.post_images[3].image_src }"
													style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0;" />
													</c:when>
													<c:otherwise>
													<img id="image-preview3" alt="" src=""
													style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0; display: none;" />
													</c:otherwise>
													</c:choose>
											</div>
											<!-- End Preview element -->
											<button type="button" id="image-delete3" 
												class="btn btn-outline-danger btn-icon-text custom-a-btn-images image-delete"> 
												<i class="fa-solid fa-trash-can"></i>
											</button>
										</div>
									</div>
								</div>
								<!-- End Select element -->



								<!-- Begin Submit button -->
								<div class="col-md-6 offset-md-3 mt-4">
									<div class="quform-submit-inner text-center">
										<button id="btnCreate" class="butn w-100" type="submit">
											<span>글 수정하기</span>
										</button>
									</div>
									<div class="quform-loading-wrap">
										<span class="quform-loading"></span>
									</div>
								</div>
								<!-- End Submit button -->

							</div>
							<!-- <div class="row"> -->

						</div>
						<!-- <div class="quform-elements"> -->
					</form>

				</div>
				<!-- <div class="border bg-white p-1-9 p-lg-2-3 p-xl-6 rounded"> -->

			</div>
			<!-- end form section -->

		</div>
		<!-- <div class="row justify-content-center"> -->
	</div>
	<!-- <div class="container"> -->
</section>

<script>
$(function() {
	
	// 실종(발견) 게시물 선택시 보여지는 필드
// 	$(document).ready(function() {
// 	    $('#post_type').change(function() {
// 	        var selectedValue = $(this).val();
// 	        if (selectedValue === 'post03' || selectedValue === 'post04') {
// 	            $('#missing-info').show();
// 	            $('#date-info').show();
// 	        } else {
// 	            $('#missing-info').hide();
// 	            $('#date-info').hide();
// 	        }
// 	    });
// 	});
	// 실종(발견) 게시물 선택시 보여지는 필드
	
	// 실종(발견) 게시물 선택시 보여지는 필드
    function updatePostType() {
        var selectedValue = $('#post_type').val();
        if (selectedValue === 'post03' || selectedValue === 'post04') {
            $('#missing-info').show();
            $('#date-info').show();
        } else {
            $('#missing-info').hide();
            $('#date-info').hide();
        }
    }

    // 페이지 로드 시 필드 상태 업데이트
    updatePostType();

    // 선택 값 변경 시 필드 상태 업데이트
    $('#post_type').change(function() {
    	updatePostType();
    });
	 // 실종(발견) 게시물 선택시 보여지는 필드
	    
	// 로그인한 아이디의 거주지를 자동으로 입력해서 보여주기	 (로그인 세션 수정 필요)
    // var memberId = $('#member_id').val();

//     if (memberId === "test1") {
//         $('#location').val("경주시");
//     }
	// 로그인한 아이디의 거주지를 자동으로 입력해서 보여주기	 (로그인 세션 수정 필요)
	
    // 이미지 미리보기
    // 이미지 미리보기 영역 클릭 시 파일 선택창 열기
    $('.project-grid-img').on('click', function() {
        const inputId = $(this).data('input-id'); // data-input-id에서 파일 입력 ID 가져오기
        $('#' + inputId).click(); // 해당 파일 입력 요소 클릭
    });
	
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
	// 이미지 미리보기 설정
	
	// 이미지 삭제 버튼
	$('.image-delete').on('click', function(e) {
		const targetId = e.currentTarget.id; // image-delete0, image-delete1, image-delete2, image-delete3
		console.log('targetId : '+ targetId);
		const idNumber = parseInt(targetId.charAt(targetId.length - 1), 10);
		console.log('idNumber : '+ idNumber);
		const imageInputId = '#image-input';
		$(imageInputId + idNumber).val('');
		$(imageInputId + idNumber).trigger('change');
	});
	// 이미지 삭제 버튼
    
 	// 동물 종류 리스트
	const $select = $('#petType');

	$.ajax({
		url: '/petData/petType',
		type: 'GET',
		dataType: 'json',
		success: function(data) {
			$select.empty();
			$select.append('<option value="">동물 종류 선택</option>');

			data.forEach(function(item) {
				$select.append("<option value='" + item.category_code + "'>" + item.category_type + "</option>");
			});
			
			// 동물 종류 값 넣어주기
			$select.val('${postList.categoryDataVO.category_parent}').trigger('change');
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.error('AJAX 요청 실패:', textStatus, errorThrown);
		}
	});
 	// 동물 종류 리스트
 	
 	// 동물 코드 불러오기
	var oneCategoryCode = $('#categoryCode').val();
 	console.log(oneCategoryCode);
 	 	
 	// 동물 품종 리스트
 	const $categoryCode = $('#categoryCode');
 	
 	function petTypeDetailList(petType) {
		$.ajax({
			url: '/petData/petType/' + petType,
			method: 'GET',
			success: function(data) {
				populateDropdown(data);
			},
			error: function(error) {
				console.error('데이터를 가져오는 데 실패했습니다:', error);
			}
		});
	}
	
	function populateDropdown(data) {
		const dropdownList = $('#dropdownList');
		dropdownList.empty();
	
		data.forEach(item => {
			dropdownList.append("<div class='dropdown-item' data-value='" + item.category_code + "'>" + item.category_value + "</div>");
		});
	
		if (data.length > 0) {
			// 데이터가 있을 때 드롭다운 보이기
			dropdownList.addClass('show');
		} else {
			dropdownList.removeClass('show');
		}
	}
	
	$('#petType').on('change', function() {
		const selectedType = $(this).val();
		if (selectedType) {
			petTypeDetailList(selectedType);
		} else {
			$('#dropdownList').empty().removeClass('show');
		}
	});
	
	$('#searchInput').on('focus', function() {
		const dropdownList = $('#dropdownList');
		dropdownList.addClass('show');
	});
	
	$('#searchInput').on('input', function() {
		const filter = $(this).val().toLowerCase();
		const dropdownList = $('#dropdownList');
	
		if (!filter) {
			dropdownList.removeClass('show');
		}
	
		dropdownList.addClass('show');
	
		dropdownList.children().each(function() {
			const text = $(this).text().toLowerCase();
			$(this).toggle(text.includes(filter));
		});
	});
	
// 	$(document).click(function(event) {
// 		if (!$(event.target).closest('.dropdown').length) {
// 			$('#dropdownList').removeClass('show');
// 		}
// 	});
 	// 동물 품종 클릭 이벤트 수정
	$(document).click(function(event) {
	    if (!$(event.target).closest('.dropdown').length && !$(event.target).is('#searchInput')) {
	        $('#dropdownList').removeClass('show');
	    }
	});
 	// 동물 품종 리스트
 	
 	
 	// 엔터키 제출 방지
	$('#formPost').on('keydown', function(event) {
		if (event.key === 'Enter' && event.target.tagName !== 'TEXTAREA') {
			event.preventDefault();
		}
	});
	// 엔터키 제출 방지
 	
	// 공백 값이 아닌 null d 
	
 	// 공백 값이 아닌 null d 
 	
 	// 드롭다운 클릭
 	$(document).on('click', '.dropdown-item', function() {
 		// 선택된 품종의 값 가져오기
	    var selectedValue = $(this).data("value");
	 	// 선택된 품종의 이름 가져오기
	    var selectedText = $(this).text();
	    console.log("선택된 값: " + selectedValue);
	    // 선택된 값을 임시의 히든 input에 설정 (숫자 값으로 설정)
	    $("#pet_code").val(selectedValue);
	    // 선택된 품종의 이름을 input에 보여주기
	    $("#searchInput").val(selectedText);
	    
	    // 종류가 기타인 경우에만 input 활성화
	    switch($(this).data('value')) {
			case 1002: case 2002: case 3000:
				$('#pet_etc_breed').removeAttr('readonly');
				break;
			default: {
				$('#pet_etc_breed').val('');
				$('#pet_etc_breed').attr('readonly', true);
			}
		}
	 	// 종류가 기타인 경우에만 input 활성화
	    
	});
	// 드롭다운 클릭
	
	// 글 수정
	$('#formPost').on('submit', function(event) {
		event.preventDefault();
		
		var post_id = $('#post_id').val();
		
		var formData = new FormData(this);
		
		if($('#post_type').val() == '') {
			alert('게시글 종류를 선택해주세요!');
			$('#post_type').focus();
			return;
		} else if($('#pet_code').val() == '') {
			alert('동물 품종을 선택해주세요!');
			$('#pet_code').focus();
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
			confirmButtonText: '제출',
			cancelButtonText: '닫기'
		}).then(function(result) {
			if (result.isConfirmed) {
				$.ajax({
					url: '/community/updatePost/'+post_id,
					type: 'POST',
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
	// 글 수정
	
	
// 	// 페이지 이동
//     $('#formPost').on('submit', function(event) {
//         event.preventDefault(); // 기본 폼 제출 방지

//         // AJAX 요청
//         $.ajax({
//             type: "POST",
//             url: "/community/insert",
//             data: $(this).serialize(), // URL 인코딩된 데이터 전송
//             success: function(response) {
//                 alert(response); // 성공 메시지 표시
//                 window.location.href = "/community/main"; // 페이지 이동
//             },
//             error: function(xhr) {
//                 alert(xhr.responseText); // 실패 메시지 표시
//                 console.log(xhr);
//             }
//         });
//     });
// 	// 페이지 이동
    
    
}); // 돔레디
</script>

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp"%>
<!-- footer -->