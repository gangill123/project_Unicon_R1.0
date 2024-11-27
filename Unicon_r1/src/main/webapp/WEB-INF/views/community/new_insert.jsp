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

<section class="bg-light">
    <div class="container">

        <div class="row justify-content-center">

            <!-- start form section -->
            <div class="col-md-11 col-lg-9">

                <div class="border bg-white p-1-9 p-lg-2-3 p-xl-6 rounded">

                    <div class="text-center mb-1-9">
                       <h2 class="font-weight-600 mb-3">커뮤니티 게시글 등록</h2>
                       <p class="mb-0">입양 후기 / 반려 이야기 / 실종 / 임시 보호 에 대한 커뮤니티 게시글을 작성해주세요.</p>
                    </div>

                    <form class="quform" action="" method="post" enctype="multipart/form-data" onclick="">
                    	
                    	<!-- 숨겨서 들고갈 값(세션) -->
                    	<!-- member_id -->
                    	<input id="member_id" name="member_id" type="hidden" value="test1">
                    	<!-- 숨겨서 들고갈 값(세션) -->
                    	
                        <div class="quform-elements">

                            <div class="row">

                                <!-- Begin Select element -->
                                <div class="col-md-3">
                                    <div class="quform-element form-group">
                                        <label for="post_type">게시글 종류 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
                                            <select id="post_type" class="form-control form-select" name="post_type">
                                                <option>게시글 종류</option>
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
                                            <select id="petType" class="form-control form-select" name="petType">
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
                                        <label for="pet_etc_breed">기타 동물 품종 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
	                                        <div class="quform-input">
	                                            <input id="pet_etc_breed" class="form-control" type="text" name="pet_etc_breed" placeholder="개와 고양이를 제외한 동물은 품종을 적어주세요" />
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
                                        <label for="location">거주 지역 (변경을 원하시면 마이페이지로)</label>
                                        <div class="quform-input">
                                            <input id="location" class="form-control" type="text" name="location" placeholder="자동 등록 / 변경을 원하시면 마이페이지에서 변경해주세요." disabled="disabled" />
                                        </div>
                                    </div>
                                </div>
                                <!-- End Text input element -->

                                <!-- Begin Text input element -->
                                <div class="col-md-6" id="missing-info" style="display: none;">
                                    <div class="quform-element form-group">
                                        <label for="post_pet_place">실종(발견) 장소 <span class="quform-required">*</span></label>
                                        <div class="quform-input">
                                            <input id="post_pet_place" class="form-control" type="text" name="post_pet_place" placeholder="입력" />
                                        </div>
                                    </div>
                                </div>
                                <!-- End Text input element -->

                                <!-- Begin Text input element -->
                                <div class="col-md-6" id="date-info" style="display: none;">
                                    <div class="quform-element form-group">
                                        <label for="post_pet_date">실종(발견) 일자 <span class="quform-required">*</span></label>
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
								                        <input class="custom-file-input" type="file" id="image-input-1" name="image-input-1" accept=".jpeg, .jpg, .png, .gif" style="display: none;" />
								                        <label for="repImage1">대표 이미지 <span class="quform-required">*</span></label>
								                    </div>
								                </div>
								                <!-- End Upload element -->
								            </div>
								            <!-- Begin Preview element -->
								            <div class="project-grid-img" style="width: 100%; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
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
								                        <input class="custom-file-input" type="file" id="image-input-2" name="image-input-2" accept=".jpeg, .jpg, .png, .gif" style="display: none;" />
								                        <label for="Image2">이미지</label>
								                    </div>
								                </div>
								                <!-- End Upload element -->
								            </div>
								            <!-- Begin Preview element -->
								            <div class="project-grid-img" style="width: 100%; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
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
								                        <input class="custom-file-input" type="file" id="image-input-3" name="image-input-3" accept=".jpeg, .jpg, .png, .gif" style="display: none;" />
								                        <label for="Image3">이미지</label>
								                    </div>
								                </div>
								                <!-- End Upload element -->
								            </div>
								            <!-- Begin Preview element -->
								            <div class="project-grid-img" style="width: 100%; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
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
								                        <input class="custom-file-input" type="file" id="image-input-4" name="image-input-4" accept=".jpeg, .jpg, .png, .gif" style="display: none;" />
								                        <label for="Image4">이미지</label>
								                    </div>
								                </div>
								                <!-- End Upload element -->
								            </div>
								            <!-- Begin Preview element -->
								            <div class="project-grid-img" style="width: 100%; height: 200px; overflow: hidden; position: relative; cursor: pointer; border: 2px solid #ccc; border-radius: 4px;">
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
                                        <button id="btnCreate" class="butn w-100" type="button"><span>글 등록하기</span></button>
                                    </div>
                                    <div class="quform-loading-wrap"><span class="quform-loading"></span></div>
                                </div>
                                <!-- End Submit button -->

                            </div>
							
                        </div>
                    </form>

                </div>

            </div>
            <!-- end form section -->

        </div>
    </div>
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
	
	// 로그인한 아이디의 거주지를 자동으로 입력해서 보여주기	 (로그인 세션 수정 필요)
    var memberId = $('#member_id').val();

    if (memberId === "test1") {
        $('#location').val("경주시");
    }
	// 로그인한 아이디의 거주지를 자동으로 입력해서 보여주기	 (로그인 세션 수정 필요)
	
    // 이미지 미리보기
	function setupImagePreview(inputId, previewId) {
	    $('#' + inputId).change(function(e) {
	        const file = e.target.files[0];
	        const reader = new FileReader();
	
	        // 파일이 선택되었을 때
	        if (file) {
	            // MIME 타입 확인
	            const fileType = file.type;
	            const validImageTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg'];
	
	            if (validImageTypes.includes(fileType)) {
	                reader.onload = function(e) {
	                    $('#' + previewId).attr('src', e.target.result).show();
	                }
	                reader.readAsDataURL(file);
	            } else {
	                // 유효하지 않은 파일 형식일 경우 오류 메시지 표시
	                alert(' 이미지 파일만 선택할 수 있습니다. (JPEG, PNG, GIF, JPG 형식) ');
	                // 파일 입력 초기화
	                $('#' + inputId).val('');
	                // 미리보기 이미지 숨기기
	                $('#' + previewId).hide();
	            }
	        } else {
	            // 파일이 선택되지 않았을 경우 미리보기 이미지 숨기기
	            $('#' + previewId).hide();
	        }
	    });
	
	    // 미리보기 이미지 클릭 시 파일 선택
	    $('#' + previewId).parent().click(function() {
	        $('#' + inputId).click();
	    });
	    
	} // setupImagePreview()
	setupImagePreview('image-input-1', 'image-preview-1');
	setupImagePreview('image-input-2', 'image-preview-2');
	setupImagePreview('image-input-3', 'image-preview-3');
	setupImagePreview('image-input-4', 'image-preview-4');
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
	
	
	
	$(document).click(function(event) {
		if (!$(event.target).closest('.dropdown').length) {
			$('#dropdownList').removeClass('show');
		}
	});
 	// 동물 품종 리스트
 	
 	// 글 등록 수행
 	// 드롭다운 클릭
 	$(document).on('click', '.dropdown-item', function() {
	    var selectedValue = $(this).data("value");
	    var selectedText = $(this).text(); // 선택된 품종의 이름 가져오기
	    console.log("선택된 값: " + selectedValue);
	    // 선택된 값을 임시의 히든 input에 설정 (숫자 값으로 설정)
	    $("#pet_code").val(selectedValue);
	    // 선택된 품종의 이름을 input에 보여주기
	    $("#searchInput").val(selectedText);
	});
 	
 	$("#btnCreate").click(function(){
 		// 기본 폼 제출 방지
 		event.preventDefault();
		
 		var post = {
 			"member_id":$("#member_id").val(),
 			"post_title":$("#post_title").val(),
 			"post_content":$("#post_content").val(),
 			"post_type":$("#post_type").val(),
 			"pet_code":$("#pet_code").val(),
 			"pet_etc_breed":$("#pet_etc_breed").val() || null,
 			"post_pet_place":$("#post_pet_place").val() || null,
 			"post_pet_date":$("#post_pet_date").val() || null,
 			"post_file":$("#image-input-1").val()
 		}; // var post = {}
 		
 		console.log(post);
 		
 		$.ajax({
 			url : "${contextPath}/community",
			type : "POST",
			data : JSON.stringify(post),
			contentType : "application/json",
			success : function(data){
				alert(" 게시물 등록 성공! ");
			}
 		}); // $.ajax
 	});
 	// 글 등록 수행
    
    
}); // 돔레디
</script>

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->