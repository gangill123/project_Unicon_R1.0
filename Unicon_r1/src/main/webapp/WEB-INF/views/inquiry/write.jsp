<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp"%>
<!-- topHeader / jquery 추가 -->
 <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/style.css" rel="stylesheet">

<!-- 추가 템플릿 css/js 작성란 -->
 <style>
           /* 썸네일 미리보기 스타일 */
        #thumbnailPreview {
            margin-top: 10px;
            max-width: 150px;
            max-height: 150px;
            display: none; /* 기본적으로 숨겨두기 */
        }
    </style>
</head>
<%@ include file="../inc/new_header.jsp"%>
<!-- header -->

<!--====================================작성부=====================================-->
<section class="page-title-section bg-primary">
    <div class="container">
		
        <div class="row">
            <div class="col-md-12">
                <h1>unicon 고객센터</h1>
            </div>
            <div class="col-md-12">
                <ul class="ps-0">
                    <li><a href="inquiry"><i class="ti-home"></i></a></li>
                    <li class="active"><a href="write">문의하기</a></li>
                </ul>
            </div>
        </div>
	
    </div>
</section>



<section>
            <div class="container">
                <div class="section-heading">
                    <h2>문의하기</h2>
                </div>
                <div class="row">
                    <div class="col-lg-6 mb-1-9 mb-lg-0">

                        <!-- start form here -->

       		<form id="quform" class="quform" enctype="multipart/form-data">
    <div class="quform-elements">
      <div class="row">
    <!-- 카테고리 선택 -->
    <div class="col-md-6">
        <div class="quform-element form-group">
            <div class="quform-input">
                <select id="istatus" class="form-control" name="istatus">
                    <option value="default" disabled selected>카테고리를 선택해주세요.</option>
                    <option value="입양 문의">입양 문의</option>
                    <option value="쇼핑몰 문의">쇼핑몰 문의</option>
                    <option value="커뮤니티 문의">커뮤니티 문의</option>
                    <option value="기타 문의">기타 문의</option>
                </select>
            </div>
        </div>
    </div>

    <!-- 작성자 -->
    <div class="col-md-6">
        <div class="quform-element form-group">
            <div class="quform-input">
                <input id="member_name" class="form-control" type="text" name="member_name" placeholder="작성자 이름을 입력해주세요.">
            </div>
        </div>
    </div>

    <!-- 전화번호 -->
    <div class="col-md-6">
        <div class="quform-element form-group">
            <div class="quform-input">
                <input id="phone" class="form-control" type="text" name="phone" placeholder="휴대폰 번호를 입력해주세요.">
            </div>
        </div>
    </div>

    <!-- 이메일 -->
    <div class="col-md-6">
        <div class="quform-element form-group">
            <div class="quform-input">
                <input id="email" class="form-control" type="text" name="email" placeholder="이메일을 기입해주세요.">
            </div>
        </div>
    </div>

    <!-- 제목 -->
    <div class=".col-md-11">
        <div class="quform-element form-group">
            <div class="quform-input">
                <input id="title" class="form-control" type="text" name="title" placeholder="제목을 입력해주세요.">
            </div>
        </div>
    </div>

 
	
    <!-- 문의 내용 -->
    <div class="col-md-12">
        <div class="quform-element form-group">
            <div class="quform-input">
                <textarea id="content" class="form-control" name="content" rows="3" placeholder="문의 내용을 입력해주세요."></textarea>
            </div>
        </div>
    </div>
	
	
	
   <!-- 게시글 비밀번호 -->
    <div class="col-md-6">
        <div class="quform-element form-group">
            <div class="quform-input">
                <input id="post_password" class="form-control" type="password" name="post_password" placeholder="게시글 비밀번호를 입력해주세요.">
            </div>
        </div>
    </div>	
    
		<!-- 비밀글 체크박스 -->
	<div class="col-md-6">
	    <div class="form-check">
	        <input type="checkbox" class="form-check-input" id="isPrivate" name="isPrivate">
	        <label class="form-check-label" for="isPrivate">비밀글로 설정</label>
	    </div>
	</div>
	
	
			
	  		
     <!-- 파일 업로드 -->
    <label for="file"></label>
    <input type="file" id="file" name="file" accept="image/*" onchange="previewThumbnail()"><br><br>

    <!-- 썸네일 미리보기 -->
    <img id="thumbnailPreview" src="" alt="썸네일 미리보기" style="max-width: 300px; display: none;"><br><br>

				
            <!-- reCAPTCHA -->
            <div class="quform-element">
                <div class="form-group">
                    <div class="quform-captcha">
                        <div class="g-recaptcha" data-sitekey="6LeEYooqAAAAAH2ogyEfXXzUkqvS0VH0VTwQkGjh"></div>
                    </div>														
                </div>
            </div>
            
    

            <!-- 제출 버튼 -->
            <div class="col-md-12">
                <div class="quform-submit-inner">
                    <button class="butn" type="submit"><span>문의하기</span></button>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>




                        <!-- end form here -->

                    </div>
                    <div class="col-lg-6">
                        <div id="accordion" class="accordion-style3">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                  How can i purchase this item ?
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-bs-parent="#accordion" style="">
                                    <div class="card-body bg-white">
                                        Tempora incidunt ut labore et dolore exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                                        sunt in culpa qui officia deserunt mollit anim id est laborum.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                  why unique and creative design ?
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordion" style="">
                                    <div class="card-body bg-white">
                                        Neque porro quisquam est quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                                        sunt in culpa qui officia deserunt mollit anim id est laborum.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingThree">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                  are you ready to buy this theme ?
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion" style="">
                                    <div class="card-body bg-white no-padding-bottom">
                                        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                                        sunt in culpa qui officia deserunt mollit anim id est laborum.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

<!--비밀번호 체크박스   -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const isPrivateCheckbox = document.getElementById('isPrivate');
        const passwordField = document.getElementById('passwordField');

        // 체크박스 상태에 따라 비밀번호 입력란 표시/숨기기
        isPrivateCheckbox.addEventListener('change', function() {
            if (isPrivateCheckbox.checked) {
                passwordField.style.display = 'block'; // 비밀번호 입력란 표시
            } else {
                passwordField.style.display = 'none';  // 비밀번호 입력란 숨기기
            }
        });
    });
</script>
<!-- 비밀번호 유효성 검사 -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('quform'); // 폼 ID로 변경
        form.addEventListener('submit', function(event) {
           
</script>



 <script>
        function previewThumbnail() {
            const fileInput = document.getElementById('file');
            const preview = document.getElementById('thumbnailPreview');

            // 파일 선택 여부 확인
            if (fileInput.files && fileInput.files[0]) {
                const reader = new FileReader();

                // 파일 읽기 완료 후 실행되는 콜백 함수
                reader.onload = function (e) {
                    preview.src = e.target.result; // 읽은 파일을 이미지로 설정
                    preview.style.display = 'block'; // 이미지 표시
                };

                reader.readAsDataURL(fileInput.files[0]); // 파일을 읽어 DataURL로 변환
            } else {
                preview.style.display = 'none'; // 파일 선택 취소 시 이미지 숨기기
                preview.src = ''; // 이미지 src 초기화
            }
        }
    </script>



<script>
document.getElementById("quform").addEventListener("submit", function (event) {
    event.preventDefault(); // 폼 제출 방지

    // reCAPTCHA 응답 토큰 가져오기
    const recaptchaResponse = grecaptcha.getResponse();

    // 폼 데이터 가져오기
    const member_name = document.getElementById("member_name").value.trim();
    const email = document.getElementById("email").value.trim();
    const title = document.getElementById("title").value.trim();
    const phone = document.getElementById("phone").value.trim();
    const content = document.getElementById("content").value.trim();
    const istatus = document.getElementById("istatus").value.trim();  
    const post_password = document.getElementById("post_password").value.trim();  
    const file = document.getElementById("file").files[0]; // 파일 가져오기 (예: file input id="file")
	
    // 유효성 검사
    if (!member_name) return alert("작성자 이름을 입력해주세요.");
    if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email))
        return alert("유효한 이메일을 입력해주세요.");
    if (!title) return alert("제목을 입력해주세요.");
    if (!/^[0-9]{10,11}$/.test(phone))
        return alert("휴대폰 번호는 10-11자리 숫자로 입력해주세요.");
    if (!content) return alert("문의 내용을 입력해주세요.");
    if (istatus === "default") return alert("카테고리를 선택해주세요.");
    // reCAPTCHA 응답 확인
    if (!recaptchaResponse) {
        alert("reCAPTCHA 인증을 완료해주세요."); // 사용자에게 알림
        return; // 폼 제출 중단
    }
    const isPrivateCheckbox = document.getElementById('isPrivate');
    const postPassword = document.getElementById('post_password').value;

    // 비밀글 체크박스가 선택되었고, 비밀번호가 비어있다면 유효성 검사 실패
    if (isPrivateCheckbox.checked && !postPassword) {
        event.preventDefault();  // 폼 제출 방지
        alert('비밀번호를 입력해주세요.');  // 경고 메시지
        return false;
    }

 

    // FormData 객체 생성
    const formData = new FormData();
    formData.append("member_name", member_name);
    formData.append("email", email);
    formData.append("title", title);
    formData.append("phone", phone);
    formData.append("content", content);
    formData.append("istatus", istatus);
    formData.append("post_password", post_password);
    formData.append("recaptcha", recaptchaResponse); // reCAPTCHA 응답 토큰 추가
    if (file) {
        formData.append("file", file); // 파일이 있으면 함께 추가
    }

    // JSON 데이터와 파일을 함께 전송
    fetch("/api/submit", {
        method: "POST",
        body: formData, // FormData를 직접 body로 전송
    })
    .then((response) => {
        if (!response.ok) throw new Error("서버 오류: " + response.status);
        return response.json();  // JSON 응답으로 처리
    })
    .then((result) => {
        if (result && result.success) { // 서버에서 'success'가 true인 경우 처리
            // SweetAlert2 사용 예시
            Swal.fire({
                title: '문의하기',
                text: '작성이 완료되었습니다.',
                icon: 'success',
                confirmButtonText: '확인'
            });
            grecaptcha.reset(); // reCAPTCHA 초기화
            document.getElementById("quform").reset(); // 폼 초기화
        } else {
            alert("서버에서 오류가 발생했습니다.");
        }
    })
    .catch((error) => {
    	  // SweetAlert2 사용 예시
        Swal.fire({
            title: '문의하기',
            text: '작성이 완료되었습니다.',
            icon: 'success',
            confirmButtonText: '확인'
        });
        grecaptcha.reset(); // reCAPTCHA 초기화
        document.getElementById("quform").reset(); // 폼 초기화
    });
});
</script>

<!--====================================작성부=====================================-->
<!-- SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/counterup/counterup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/parallax/parallax.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath }/resources/assets_sub/js/main.js"></script>





<%@ include file="../inc/new_footer.jsp"%>
<!-- footer -->
