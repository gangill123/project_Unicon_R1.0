<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

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
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<c:if test="${empty userId}">
	<c:redirect url="/main"/>
</c:if>
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
                       <h2 class="font-weight-600 mb-3">커뮤니티 게시물 등록</h2>
                       <p class="mb-0">입양 후기 / 반려 이야기 / 실종 / 임시 보호 에 대한 커뮤니티 게시물을 작성해주세요.</p>
                    </div>

                    <form id="formPost" class="quform" action="${contextPath }/community/insert" method="post" enctype="multipart/form-data" onclick="">
                    	
                    	<!-- 숨겨서 들고갈 값(세션) -->
                    	<!-- member_id -->
                    	<input id="member_id" name="member_id" type="hidden" value="${userId }">
                    	<!-- 숨겨서 들고갈 값(세션) -->
                    	
                        <div class="quform-elements">

                            <div class="row">

                                <!-- Begin Select element -->
                                <div class="col-md-3">
                                    <div class="quform-element form-group">
                                        <label for="post_type">게시글 종류 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
                                            <select id="post_type" class="form-control form-select" name="post_type">
                                                <option value="">게시글 종류</option>
                                                <option value="post01">입양 후기</option>
                                                <option value="post02">반려 이야기</option>
                                                <option value="post03">실종</option>
                                                <option value="post04">임시 보호</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Select element -->
                                
                                <!-- Begin Select element -->
                                <div class="col-md-3">
                                    <div class="quform-element form-group">
                                        <label for="petType">동물 종류 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
                                            <select id="petType" class="form-control form-select">
                                                <option>동물 종류 선택</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Select element -->
                                
                                <!-- Begin Select element -->
                                <div class="col-md-3">
                                
                                    <div class="quform-element form-group">
                                        <label for="applyfor">동물 품종 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
	                                        <div class="quform-input">
	                                            <input id="searchInput" class="form-control" type="text" />
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
	                                            <input id="pet_etc_breed" class="form-control" type="text" name="pet_etc_breed" placeholder="품종이 기타인 경우" readonly />
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
                                            <input id="post_title" class="form-control" type="text" name="post_title" placeholder="입력" />
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
                                               <option value="">거주지역을 선택해주세요.</option>
											   <option value="서울">서울</option>
											   <option value="인천">인천</option>
											   <option value="부산">부산</option>
											   <option value="대구">대구</option>
											   <option value="광주">광주</option>
											   <option value="대전">대전</option>
											   <option value="울산">울산</option>
											   <option value="세종특별시">세종특별시</option>
											   <option value="경기">경기</option>
											   <option value="강원특별자치도">강원특별자치도</option>
											   <option value="충북">충북</option>
											   <option value="충남">충남</option>
											   <option value="전북특별자치도">전북특별자치도</option>
											   <option value="전남">전남</option>
											   <option value="경북">경북</option>
											   <option value="경남">경남</option>
											   <option value="제주특별자치도">제주특별자치도</option>
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
                                            <input id="post_pet_place" class="form-control" type="text" name="post_pet_place" placeholder="입력" />
                                        </div>
                                    </div>
                                </div>
                                <!-- End Text input element -->

                                <!-- Begin Text input element -->
                                <div class="col-md-6" id="date-info" style="display: none;">
                                    <div class="quform-element form-group">
                                        <label for="post_pet_date">실종(발견) 일자</label>
                                        <div class="quform-input">
                                            <input id="post_pet_date" class="form-control" type="text" name="post_pet_date" placeholder="입력" />
                                        </div>
                                    </div>
                                </div>
                                <!-- End Text input element -->

                                <!-- Begin Textarea element -->
                                <div class="col-md-12">
                                    <div class="quform-element form-group">
                                        <label for="post_content">글 내용</label>
                                        <div class="quform-input">
                                            <textarea id="post_content" class="form-control" name="post_content" rows="4" placeholder="실종과 임시보호 게시글은 성별, 나이, 색상, 기타 특징 등 동물 정보를 상세히 적어주세요"></textarea>
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
								                        <input class="custom-file-input" type="file" id="image-input-1" name="upload_images[0]" accept=".jpeg, .jpg, .png, .gif" style="display: none;" />
								                        <label for="image-input-1" style="cursor: pointer;">대표 이미지 <span class="quform-required">*</span></label>
								                    </div>
								                </div>
								                <!-- End Upload element -->
								            </div>
								            <!-- Begin Preview element -->
								            <div class="project-grid-img" data-input-id="image-input-1" style="width: 100%; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
								                <i class="fa-solid fa-plus fa-2xl" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
								                <img id="image-preview-1" alt="" style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0; display: none;" />
								            </div>
								            <!-- End Preview element -->
								        </div>
								
								        <!-- 두 번째 이미지 업로드 및 미리보기 -->
								        <div class="col-6 col-md-3 mb-3">
								            <div class="quform-element form-group">
								                <!-- Begin Upload element -->
								                <div class="quform-input">
								                    <div class="custom-file">
								                        <input class="custom-file-input" type="file" id="image-input-2" name="upload_images[1]" accept=".jpeg, .jpg, .png, .gif" style="display: none;" />
								                        <label for="image-input-2" style="cursor: pointer;">이미지</label>
								                    </div>
								                </div>
								                <!-- End Upload element -->
								            </div>
								            <!-- Begin Preview element -->
								            <div class="project-grid-img" data-input-id="image-input-2" style="width: 100%; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
								                <i class="fa-solid fa-plus fa-2xl" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
								                <img id="image-preview-2" alt="" style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0; display: none;" />
								            </div>
								            <!-- End Preview element -->
								        </div>
								
								        <!-- 세 번째 이미지 업로드 및 미리보기 -->
								        <div class="col-6 col-md-3 mb-3">
								            <div class="quform-element form-group">
								                <!-- Begin Upload element -->
								                <div class="quform-input">
								                    <div class="custom-file">
								                        <input class="custom-file-input" type="file" id="image-input-3" name="upload_images[2]" accept=".jpeg, .jpg, .png, .gif" style="display: none;" />
								                        <label for="image-input-3" style="cursor: pointer;">이미지</label>
								                    </div>
								                </div>
								                <!-- End Upload element -->
								            </div>
								            <!-- Begin Preview element -->
								            <div class="project-grid-img" data-input-id="image-input-3" style="width: 100%; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
								                <i class="fa-solid fa-plus fa-2xl" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
								                <img id="image-preview-3" alt="" style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0; display: none;" />
								            </div>
								            <!-- End Preview element -->
								        </div>
								
								        <!-- 네 번째 이미지 업로드 및 미리보기 -->
								        <div class="col-6 col-md-3 mb-3">
								            <div class="quform-element form-group">
								                <!-- Begin Upload element -->
								                <div class="quform-input">
								                    <div class="custom-file">
								                        <input class="custom-file-input" type="file" id="image-input-4" name="upload_images[3]" accept=".jpeg, .jpg, .png, .gif" style="display: none;" />
								                        <label for="image-input-4" style="cursor: pointer;">이미지</label>
								                    </div>
								                </div>
								                <!-- End Upload element -->
								            </div>
								            <!-- Begin Preview element -->
								            <div class="project-grid-img" data-input-id="image-input-4" style="width: 100%; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
								                <i class="fa-solid fa-plus fa-2xl" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i>
								                <img id="image-preview-4" alt="" style="width: 100%; height: 100%; object-fit: fill; position: absolute; top: 0; left: 0; display: none;" />
								            </div>
								            <!-- End Preview element -->
								        </div>
								    </div>
								</div>
								<!-- End Select element -->

                                <!-- Begin Submit button -->
                                <div class="col-md-6 offset-md-3 mt-4">
                                    <div class="quform-submit-inner text-center">
                                        <button id="btnCreate" class="butn w-100" type="submit"><span>글 등록하기</span></button>
                                    </div>
                                    <div class="quform-loading-wrap"><span class="quform-loading"></span></div>
                                </div>
                                <!-- End Submit button -->

                            </div> <!-- <div class="row"> -->
							
                        </div> <!-- <div class="quform-elements"> -->
                    </form>

                </div> <!-- <div class="border bg-white p-1-9 p-lg-2-3 p-xl-6 rounded"> -->

            </div>
            <!-- end form section -->

        </div> <!-- <div class="row justify-content-center"> -->
    </div> <!-- <div class="container"> -->
</section>

<script>
$(function() {
	
	// 실종(발견) 게시물 선택시 보여지는 필드
	$(document).ready(function() {
	    $('#post_type').change(function() {
	        var selectedValue = $(this).val();
	        if (selectedValue === 'post03' || selectedValue === 'post04') {
	            $('#missing-info').show();
	            $('#date-info').show();
	        } else {
	            $('#missing-info').hide();
	            $('#date-info').hide();
	        }
	    });
	});
	// 실종(발견) 게시물 선택시 보여지는 필드
	
    // 이미지 미리보기
	// 이미지 미리보기 영역 클릭 시 파일 선택창 열기
    $('.project-grid-img').on('click', function() {
        const inputId = $(this).data('input-id'); // data-input-id에서 파일 입력 ID 가져오기
        $('#' + inputId).click(); // 해당 파일 입력 요소 클릭
    });

    // 기존의 파일 입력 요소의 change 이벤트 처리
    $('.custom-file-input').on('change', function(e) {
        const file = e.target.files[0];
        const reader = new FileReader();
        const inputId = e.target.id;
        const idNoNum = inputId.replace(/\d+/g, '');
        const idNum = inputId.charAt(inputId.length - 1);
        const previewId = '#image-preview-' + idNum;
        const fileTypeFilter = /(\.jpg|\.jpeg|\.png|\.gif|\.bmp|\.tiff|\.webp|\.svg|\.heic|\.ico|\.raw)$/i;

        if (file) {
            if (fileTypeFilter.exec(file.name)) {
                switch (idNum) {
                    case '1': {
                        reader.readAsDataURL(file);
                        reader.onload = function(e) {
                            $(previewId).attr('src', e.target.result).show();
                        }
                        break;
                    }
                    case '2': {
                        if ($('#' + idNoNum + (idNum - 1)).val() == '') {
                            const adataTransfer = new DataTransfer();
                            adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
                            $('#' + idNoNum + idNum).val('');
                            $('#image-preview-' + idNum).removeAttr('src');
                            $('#' + idNoNum + (idNum - 1))[0].files = adataTransfer.files;
                            $('#' + idNoNum + (idNum - 1))[0].dispatchEvent(new Event('change'));
                        } else {
                            reader.readAsDataURL(file);
                            reader.onload = function(e) {
                                $(previewId).attr('src', e.target.result).show();
                            }
                        }
                        break;
                    }
                    case '3': {
                        if ($('#' + idNoNum + (idNum - 2)).val() == '' && $('#' + idNoNum + (idNum - 1)).val() == '') {
                            const adataTransfer = new DataTransfer();
                            adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
                            $('#' + idNoNum + idNum).val('');
                            $('#image-preview-' + idNum).removeAttr('src');
                            $('#' + idNoNum + (idNum - 2))[0].files = adataTransfer.files;
                            $('#' + idNoNum + (idNum - 2))[0].dispatchEvent(new Event('change'));
                        } else if ($('#' + idNoNum + (idNum - 1)).val() == '') {
                            const adataTransfer = new DataTransfer();
                            adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
                            $('#' + idNoNum + idNum).val('');
                            $('#image-preview-' + idNum).removeAttr('src');
                            $('#' + idNoNum + (idNum - 1))[0].files = adataTransfer.files;
                            $('#' + idNoNum + (idNum - 1))[0].dispatchEvent(new Event('change'));
                        } else {
                            reader.readAsDataURL(file);
                            reader.onload = function(e) {
                                $(previewId).attr('src', e.target.result).show();
                            }
                        }
                        break;
                    }
                    case '4': {
                        if ($('#' + idNoNum + (idNum - 3)).val() == '' && $('#' + idNoNum + (idNum - 2)).val() == '' && $('#' + idNoNum + (idNum - 1)).val() == '') {
                            const adataTransfer = new DataTransfer();
                            adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
                            $('#' + idNoNum + idNum).val('');
                            $('#image-preview-' + idNum).removeAttr('src');
                            $('#' + idNoNum + (idNum - 3))[0].files = adataTransfer.files;
                            $('#' + idNoNum + (idNum - 3))[0].dispatchEvent(new Event('change'));
                        } else if ($('#' + idNoNum + (idNum - 2)).val() == '' && $('#' + idNoNum + (idNum - 1)).val() == '') {
                            const adataTransfer = new DataTransfer();
                            adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
                            $('#' + idNoNum + idNum).val('');
                            $('#image-preview-' + idNum).removeAttr('src');
                            $('#' + idNoNum + (idNum - 2))[0].files = adataTransfer.files;
                            $('#' + idNoNum + (idNum - 2))[0].dispatchEvent(new Event('change'));
                        } else if ($('#' + idNoNum + (idNum - 1)).val() == '') {
                            const adataTransfer = new DataTransfer();
                            adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
                            $('#' + idNoNum + idNum).val('');
                            $('#image-preview-' + idNum).removeAttr('src');
                            $('#' + idNoNum + (idNum - 1))[0].files = adataTransfer.files;
                            $('#' + idNoNum + (idNum - 1))[0].dispatchEvent(new Event('change'));
                        } else {
                            reader.readAsDataURL(file);
                            reader.onload = function(e) {
                                $(previewId).attr('src', e.target.result).show();
                            }
                        }
                        break;
                    }
                    default: {
                        console.error("잘못된 번호");
                        break;
                    }
                }
            } else {
                alert('허용되지 않는 파일 형식이 포함되어 있습니다.');
                $(this).val('');
            }
        } else {
            if (idNum < 4) {
                $(previewId).hide();
                for (let i = parseInt(idNum, 10); i <= 4; i++) {
                    if (i == idNum) {
                        continue;
                    } else if ($('#' + idNoNum + i).val() != '') {
                        const adataTransfer = new DataTransfer();
                        adataTransfer.items.add($('#' + idNoNum + i)[0].files[0]);
                        $('#' + idNoNum + i).val('');
                        $('#image-preview-' + i).hide();
                        $('#image-preview-' + i).removeAttr('src');
                        $('#' + idNoNum + (i - 1))[0].files = adataTransfer.files;
                        $('#' + idNoNum + (i - 1))[0].dispatchEvent(new Event('change'));
                    }
                }
            } else {
                $(previewId).hide();
                $(previewId).removeAttr('src');
            }
        }
    });
	// 이미지 미리보기 설정
    
 	// 동물 종류 리스트
 	$('#petType').on('click', function() {
		const $select = $('#petType');
	
		if ($select.find('option').length === 1) {
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
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.error('AJAX 요청 실패:', textStatus, errorThrown);
				}
			});
		}
	});
 	// 동물 종류 리스트
 	
 	// 동물 품종 리스트
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
	    // console.log("선택된 값: " + selectedValue);
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
	
	// 글 등록
	$('#formPost').on('submit', function(event) {
		event.preventDefault();
		var formData = new FormData(this);
		
		if($('#post_type').val() == '') {
			alert('게시글 종류를 선택해주세요!');
			$('#post_type').focus();
			return;
		} else if($('#pet_code').val() == '') {
			alert('동물 품종을 선택해주세요!');
			$('#pet_code').focus();
			return;
		} else if($('#post_resion').val() == '') {
			alert('거주 지역을 선택해주세요!');
			$('#post_resion').focus();
			return;
		} else if ($('#image-input-1').val() == '') {
			alert('대표 이미지를 입력해주세요!');
			$('#image-input-1').focus();
			return;
		}
		
		Swal.fire({
			title: '제출하시겠습니까?',
			text: '제출 내용을 확인해주세요!',
			icon: 'info',
			showCancelButton: true,
			confirmButtonColor: '#006e60',
			cancelButtonColor: '#aab2bd',
			confirmButtonText: '제출',
			cancelButtonText: '닫기'
		}).then(function(result) {
			if (result.isConfirmed) {
				$.ajax({
					url: '/community/insert',
					type: 'POST',
					data: formData,
					contentType: false,
					processData: false,
					success: function(response) {
						Swal.fire({
						title: '제출 완료',
						text: '제출에 성공했습니다!',
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
						console.error('제출 실패:', textStatus, errorThrown);
						Swal.fire({
							title: '오류!',
							text: '제출에 실패했습니다.',
							icon: 'error',
							confirmButtonColor: '#006e60',
							confirmButtonText: '확인'
						});
					}
				});
			}
		});
	});
	// 글 등록
    
}); // 돔레디
</script>

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->