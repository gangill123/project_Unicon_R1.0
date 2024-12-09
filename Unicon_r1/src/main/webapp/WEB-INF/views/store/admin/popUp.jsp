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
    <link rel="stylesheet" href="/resources/admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<style type="text/css">
	.store-notice {
		color: black;
		line-height: 42px;
	}
	
	.store-notice-left{
		font-size: 32px;
	}
	
	.store-notice-right {
		font-size: 32px;
	}
	
	.store-flex, .store-card-flex {
		display: flex;
    	justify-content: space-between;
	}
	.store-flex h5,h6 , .store-card-title h5 {
		margin: 0;
		line-height: 26px;
	}
	.store-card-title {
		display: flex;
	}
	.store-card-title i{
		margin-left : 0.5rem;
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
		color : gray;
	}
	
	.slider {
	    position: relative;
        max-width: 800px;  /* 최대 너비를 1200px로 설정 */
    	width: 100%;         /* 너비를 100%로 설정하여 반응형 유지 */
	    margin: auto;
	    overflow: hidden;
	}
	
	.slides {
	    display: flex;
	    transition: transform 0.5s ease;
	}
	
	.slides img {
    max-width: 800px;
    max-height: 400px;
    width: 100%;
    /* height: 400px; */
    object-fit: fill;
    display: block;
}
	
	.c-button {
	    position: absolute;
	    top: 50%;
	    transform: translateY(-50%);
	    background-color: rgba(255, 255, 255, 0.5);
	    border: none;
	    cursor: pointer;
	    padding: 10px;
	    font-size: 18px;
	}
	
	.prev {
	    left: 10px;
	}
	
	.next {
	    right: 10px;
	}
	/* 모달 스타일 */
.modal {
    display: none; /* 기본적으로 숨김 */
    position: fixed;
    z-index: 11;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4); /* 반투명 배경 */
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px 20px 50px;
    border: 1px solid #888;
    width:56%; /* 모달 너비 */
}

.c-close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
	
	
	/* img upload css */
	.upload-container {
		position: relative;
		aspect-ratio: 1 / 1;
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
	
	#image-preview1, #image-preview2, #image-preview3, #image-preview4, #image-preview5 {
		width: 100%;
		height: 100%;
		object-fit: fill;
		display: none;
	}
	
	
	#main-slide-update {
		float: right;
	}
	
	/* img upload css */
	
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
          <div style="padding: .8rem 2.875rem 0 2.875rem;" class="content-wrapper">
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
                <div class="card">
                </div>
                <div class="tab-content tab-transparent-content">
                  <div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">
                    <div class="row">
                      <div class="col-xl-4 col-lg-4 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body ">
                            <h5 class="mb-4 text-dark font-weight-bold">상품</h5>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">신규 상품 등록</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">전체 상품 목록</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
<!--                             <div class="dropdown-divider"></div> -->
<!--                             <div class="store-flex"> -->
<!-- 	                            <h5 class="text-dark font-weight-normal">배송 준비</h5> -->
<!-- 	                            <span> -->
<!-- 	                            	<a href="/#">0</a> 건 -->
<!-- 	                            </span> -->
<!--                             </div> -->
                            <div class="dropdown-divider"></div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-4 col-lg-4 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body ">
                            <h5 class="mb-4 text-dark font-weight-bold">회원 승인</h5>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">판매자 회원 목록</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">회원 가입신청 목록</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                          </div>
                        </div>
                      </div>
                      <div class="col-xl-4 col-lg-4 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body ">
                          	<h5 class="mb-4 text-dark font-weight-bold">공지사항</h5>
                            <div class="dropdown-divider"></div>
                           	<div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">공지사항</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="store-flex">
	                            <h5 class="text-dark font-weight-normal">팝업 관리</h5>
	                            <span>
	                            	<a href="/#">0</a> 건
	                            </span>
                            </div>
                            <div class="dropdown-divider"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-sm-8  grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body">
                            <div class="d-xl-flex justify-content-between" style="flex-direction: column;">
                              <div class="d-xl-flex justify-content-between align-items-center" style="margin-bottom: 1.2rem">
	                              <h4 class="card-title" style="margin-bottom: 0">복지몰 메인 슬라이드 이미지</h4>
	                              <button style="background: transparent;border: none;font-size: 24px;" id="image-change"><i class="mdi mdi-settings"></i></button>
                              </div> 
                              <div class="slider">
                              	<div class="slides">
                              		<c:forEach var="image" items="${adminStoreImg}">
					                    <img src="${image.image_src}" alt="storeMainImages" />
						            </c:forEach>
                              	</div>
                              	    <button class="c-button prev">❮</button>
       								<button class="c-button next">❯</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-4  grid-margin stretch-card">
                      	<div class="card">
                          <div class="card-body">
                            <div class="d-xl-flex  " style="flex-direction: column;">
                              <h4 class="card-title" >지</h4>
                              
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div id="myModal" class="modal">
                    	<div class="modal-content">
					        <div>
						        <span class="c-close">&times;</span>
								<button id="main-slide-update" class="btn btn-primary mr-4">수정</button>					        
					        </div>
					        <div class="d-xl-flex justify-content-center" style="gap: 5rem;">
					        	<div class="upload-container">
					        		<label for="image-input1" class="upload-button"></label>
							        <input type="file" accept="image/*" id="image-input1" class="image-input" name="upload_images[0]" style="width: 0;" required/>
									<i id="plusIcon1" class="mdi mdi-plus"></i>
									<img id="image-preview1" alt="이미지 미리보기" />
					        	</div>
					        	<div class="upload-container">
					        		<label for="image-input2" class="upload-button"></label>
							        <input type="file" accept="image/*" id="image-input2" class="image-input" name="upload_images[1]" style="width: 0;" required/>
									<i id="plusIcon2" class="mdi mdi-plus"></i>
									<img id="image-preview2" alt="이미지 미리보기" />
					        	</div>
					        	<div class="upload-container">
					        		<label for="image-input3" class="upload-button"></label>
							        <input type="file" accept="image/*" id="image-input3" class="image-input" name="upload_images[2]" style="width: 0;" required/>
									<i id="plusIcon3" class="mdi mdi-plus"></i>
									<img id="image-preview3" alt="이미지 미리보기" />
					        	</div>
					        	<div class="upload-container">
					        		<label for="image-input4" class="upload-button"></label>
							        <input type="file" accept="image/*" id="image-input4" class="image-input" name="upload_images[3]" style="width: 0;" required/>
									<i id="plusIcon4" class="mdi mdi-plus"></i>
									<img id="image-preview4" alt="이미지 미리보기" />
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
    
    
   <script type="text/javascript">
	$(document).ready(function() {
	    let currentIndex = 0;
	    const slides = $('.slides img');
	    const totalSlides = slides.length;

	    function showSlide(index) {
	        const offset = -index * 100; // 슬라이드 이동 비율
	        $('.slides').css('transform', 'translateX(' + offset + '%)');
	    }

	    $('.next').click(function() {
	        currentIndex = (currentIndex + 1) % totalSlides; // 다음 슬라이드로 이동
	        showSlide(currentIndex);
	    });

	    $('.prev').click(function() {
	        currentIndex = (currentIndex - 1 + totalSlides) % totalSlides; // 이전 슬라이드로 이동
	        showSlide(currentIndex);
	    });

	    // 자동 슬라이드 기능 (원하는 경우 주석 해제)
	    /*
	    setInterval(function() {
	        currentIndex = (currentIndex + 1) % totalSlides;
	        showSlide(currentIndex);
	    }, 3000); // 3초마다 슬라이드 이동
	    */
	    
	    
	    const modal = $('#myModal');
	    const btn = $('#image-change');
	    const span = $('.c-close');

	    // 버튼 클릭 시 모달 열기
	    btn.click(function() {
	        modal.show(); // 모달 표시
	    });

	    // X 버튼 클릭 시 모달 닫기
	    span.click(function() {
	        modal.hide(); // 모달 숨기기
	    });

	    // 모달 외부 클릭 시 모달 닫기
	    $(window).click(function(event) {
	        if ($(event.target).is(modal)) {
	            modal.hide(); // 모달 숨기기
	        }
	    });
	    
	    
	    
	    
	    $('.image-input').on('change', function(e) {
			const file = e.target.files[0];
			const reader = new FileReader();
			const inputId = e.target.id;
			const idNoNum = inputId.replace(/\d+/g, '');
			const idNum = inputId.charAt(inputId.length - 1);
			const previewId = '#image-preview' + idNum;
			const plusIconId = '#plusIcon' + idNum;
			const fileTypeFilter = /(\.jpg|\.jpeg|\.png|\.gif|\.bmp|\.tiff|\.webp|\.svg|\.heic|\.ico|\.raw)$/i;
			
			if (file) {
				 if(fileTypeFilter.exec(file.name)) {
					 switch(idNum) {
					 	case '1': {
					 		reader.readAsDataURL(file);
							reader.onload = function(e) {
								$(previewId).attr('src', e.target.result).show();
								$(plusIconId).hide();
							}
							break;
					 	}
						case '2': {
							if($('#' + idNoNum + (idNum - 1)).val() == '') {
								// 객체에 파일을 저장함. 데이터를 옮기기 위해서
								adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
								
								// image-input2 value 값을 지움.
								$('#' + idNoNum + idNum).val('');
								
								// image-preview src 지우는 동작
								$('#image-preview' + idNum).removeAttr('src');
								
								// 옮길 데이터를 image-input1 value에 files에 데이터 옮김.					
								$('#' + idNoNum + (idNum - 1))[0].files = adataTransfer.files;
								
								// image-input1 이벤트를 수동으로 동작시킴(반복)
								$('#' + idNoNum + (idNum - 1))[0].dispatchEvent(new Event('change'));
							} else {
								// 이전의 값이 비어있지 않으면 그대로 미리보기 됨.
								reader.readAsDataURL(file);
								reader.onload = function(e) {
									$(previewId).attr('src', e.target.result).show();
									$(plusIconId).hide();
								}
							}
							break;
						}
						case '3': {
							if($('#' + idNoNum + (idNum - 2)).val() == '' 
									&& $('#' + idNoNum + (idNum - 1)).val() == '') {
								const adataTransfer = new DataTransfer();
								adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
								$('#' + idNoNum + idNum).val('');
								$('#image-preview' + idNum).removeAttr('src');
								$('#' + idNoNum + (idNum - 2))[0].files = adataTransfer.files;
								$('#' + idNoNum + (idNum - 2))[0].dispatchEvent(new Event('change'));
							} else if($('#' + idNoNum + (idNum - 1)).val() == '') {
								const adataTransfer = new DataTransfer();
								adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
								$('#' + idNoNum + idNum).val('');
								$('#image-preview' + idNum).removeAttr('src');
								$('#' + idNoNum + (idNum - 1))[0].files = adataTransfer.files;
								$('#' + idNoNum + (idNum - 1))[0].dispatchEvent(new Event('change'));
							} else {
								reader.readAsDataURL(file);
								reader.onload = function(e) {
									$(previewId).attr('src', e.target.result).show();
									$(plusIconId).hide();
								}
							}
							break;
						}
						case '4': {
							if($('#' + idNoNum + (idNum - 3)).val() == '' 
									&& $('#' + idNoNum + (idNum - 2)).val() == '' 
										&& $('#' + idNoNum + (idNum - 1)).val() == '') {
								const adataTransfer = new DataTransfer();
								adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
								$('#' + idNoNum + idNum).val('');
								$('#image-preview' + idNum).removeAttr('src');
								$('#' + idNoNum + (idNum - 3))[0].files = adataTransfer.files;
								$('#' + idNoNum + (idNum - 3))[0].dispatchEvent(new Event('change'));
							} else if($('#' + idNoNum + (idNum - 2)).val() == '' 
									&& $('#' + idNoNum + (idNum - 1)).val() == '') {
								const adataTransfer = new DataTransfer();
								adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
								$('#' + idNoNum + idNum).val('');
								$('#image-preview' + idNum).removeAttr('src');
								$('#' + idNoNum + (idNum - 2))[0].files = adataTransfer.files;
								$('#' + idNoNum + (idNum - 2))[0].dispatchEvent(new Event('change'));
							} else if($('#' + idNoNum + (idNum - 1)).val() == '') {
								const adataTransfer = new DataTransfer();
								adataTransfer.items.add($('#' + idNoNum + idNum)[0].files[0]);
								$('#' + idNoNum + idNum).val('');
								$('#image-preview' + idNum).removeAttr('src');
								$('#' + idNoNum + (idNum - 1))[0].files = adataTransfer.files;
								$('#' + idNoNum + (idNum - 1))[0].dispatchEvent(new Event('change'));
							} else {
								reader.readAsDataURL(file);
								reader.onload = function(e) {
									$(previewId).attr('src', e.target.result).show();
									$(plusIconId).hide();
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
				if(idNum < 4) {
					$(previewId).hide();
					$(plusIconId).show();
					for(let i = parseInt(idNum, 10); i <= 4; i++) {
						if(i == idNum) {
							continue;
						} else if($('#' + idNoNum + i).val() != '') {
							const adataTransfer = new DataTransfer();
							adataTransfer.items.add($('#' + idNoNum + i)[0].files[0]);
							$('#' + idNoNum + i).val('');
							$('#image-preview'+i).hide();
							$('#image-preview'+i).removeAttr('src');
							$('#plusIcon'+i).show();
							$('#' + idNoNum + (i - 1))[0].files = adataTransfer.files;
							$('#' + idNoNum + (i - 1))[0].dispatchEvent(new Event('change'));
						}
					}
				} else {
					$(previewId).hide();
					$(previewId).removeAttr('src');
					$(plusIconId).show();
				}
			}
		});
	    
	    // 이미지 수정.
	    $('#main-slide-update').click(function(){
	    	// 사용자에게 확인 요청
	        const isConfirmed = confirm('이미지를 수정하시겠습니까?');

	        if (isConfirmed) {
	            const formData = new FormData();

	            // 이미지 파일 추가 (jQuery 사용)
	            $('.image-input').each(function(index, input) {
	                if (input.files.length > 0) {
	                    formData.append('upload_images[' + index + ']', input.files[0]); // FormData에 파일 추가
	                } else {
	                    console.log('파일 [' + index + ']는 선택되지 않았습니다.'); // 파일이 선택되지 않은 경우
	                }
	            });

	            // AJAX 요청
	            $.ajax({
	                url: '/admin/store/updateImg', // 서버의 URL
	                type: 'POST',
	                data: formData,
	                processData: false, // jQuery가 데이터를 처리하지 않도록 설정
	                contentType: false, // jQuery가 Content-Type을 설정하지 않도록 설정
	                success: function(response) {
	                    console.log('업로드 성공:', response);
	                    // 성공 시 처리할 코드
	                    alert('이미지가 성공적으로 수정되었습니다.');
	                },
	                error: function(xhr, status, error) {
	                    console.error('업로드 실패:', error);
	                    // 실패 시 처리할 코드
	                    alert('이미지 수정에 실패했습니다.');
	                }
	            });
	        } else {
	            console.log('수정이 취소되었습니다.');
	        }
	    	
	    });
	});
    
    </script>
  </body>
</html>