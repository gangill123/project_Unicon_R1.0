<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- Customized Bootstrap Stylesheet -->
<%-- <link href="${pageContext.request.contextPath }/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet"> --%>

<!-- Template Stylesheet -->
<%-- <link href="${pageContext.request.contextPath }/resources/assets_sub/css/style.css" rel="stylesheet"> --%>


<!-- 추가 템플릿 css/js 작성란 -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
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
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<section class="page-title-section bg-primary">
    <div class="container">
		
        <div class="row">
            <div class="col-md-12">
                <h1>Unicorn 고객센터</h1>
            </div>
            <div class="col-md-12">
                <ul class="ps-0">
                    <li><a href="inquiry"><i class="ti-home"></i></a></li>
                    <li class="active"><a href="question">이메일로 문의하기</a></li>
                </ul>
            </div>
        </div>	
    </div>
</section>




<section>
            <div class="container">
                <div class="section-heading">
                    <h2>이메일로 문의하기</h2>
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
                <textarea id="content" class="form-control" name="content" rows="8" placeholder="문의 내용을 입력해주세요."></textarea>
            </div>
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
</div>




                        <!-- end form here -->


                    <div class="col-lg-6">
                        <div id="accordion" class="accordion-style3">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                  		개인정보 수집 및 이용 동의(필수)
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-bs-parent="#accordion" style="">
                                    <div class="card-body bg-white">
                                        <p style="font-size: 14px; line-height: 1.6;">
                                        <strong>이용자 문의를 처리하기 위해 다음과 같이 개인정보를 수집 및 이용하며, 이용자의 개인정보를 안전하게 취급하는데 최선을 다하고 있습니다.</strong>
										    <br>
										    <br>
										    <strong>개인정보 수집 및 이용 동의</strong><br><br>
										    <strong>수집하는 자:</strong> (주)유니콘<br>
										    <strong>개인정보 수집 및 이용 목적:</strong>문의・요청・불편사항 확인 및 처리결과 회신<br>
										    <strong>수집하는 개인정보 항목:</strong> 이름, 연락처, 이메일<br>
										    <strong>개인정보 보유 및 이용 기간:</strong> 수집 일로부터 300일<br><br>
										
										    ※ 위 동의를 거부할 권리가 있으며, 동의를 거부하실 경우 문의 처리 및 결과 회신이 제한됩니다. 요구하지 않은 개인정보는 입력하지 않도록 주의해 주세요.<br><br>
										
										    개인정보 수집과 이용에 동의하시나요?<br><br>
                            				<label><input type="checkbox" id="agree-checkbox" name="agree" value="yes"> 예, 개인정보 수집 및 이용에 동의합니다.</label>
										</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                  	개인 정보 수집 관련 
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordion" style="">
                                    <div class="card-body bg-white">
										 <p>서비스 제공을 위한 필요 최소한의 개인정보를 수집합니다.</p>
										<p>회원 가입 시 또는 서비스 이용 과정에서 홈페이지 또는 개별 어플리케이션이나 프로그램 등을 통해 서비스 제공을 위해 필요 최소한의 개인정보를 수집하고 있습니다.</p>
										
										<p>서비스 제공을 위해 반드시 필요한 최소한의 정보를 필수항목으로, 그 외 특화된 서비스를 제공하기 위해 추가 수집하는 정보는 선택항목으로 동의를 받고 있으며, 선택항목에 동의하지 않은 경우에도 서비스 이용 제한은 없습니다.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingThree">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                  		개인정보 이용
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion" style="">
                                    <div class="card-body bg-white no-padding-bottom">
                                               <!-- 회원 관리 및 서비스 제공·개선 -->
									        <fieldset>
									            <legend><strong>1. 회원 관리 및 서비스 제공·개선</strong></legend>
									            <ul>
									                <li>회원 식별 및 가입 의사 확인</li>
									                <li>본인 및 연령 확인 (특히, 14세 미만 아동의 개인정보 수집 시 법정 대리인의 동의 여부 확인)</li>
									                <li>이용자간 메시지 전송, 친구 등록 및 친구 추천 기능 제공</li>
									                <li>친구에게 활동 내역을 알리거나, 이용자 검색 및 등록 기능 제공</li>
									            </ul>
									        </fieldset>
									
									        <!-- 문의사항 및 불만 처리 -->
									        <fieldset>
									            <legend><strong>2. 문의사항 및 불만 처리</strong></legend>
									            <ul>
									                <li>문의사항 또는 불만 처리</li>
									                <li>공지사항 전달</li>
									            </ul>
									        </fieldset>
									
									        <!-- 유료 서비스 제공 -->
									        <fieldset>
									            <legend><strong>3. 유료 서비스 제공</strong></legend>
									            <ul>
									                <li>유료 서비스 이용 시 콘텐츠 전송, 배송 및 요금 정산</li>
									            </ul>
									        </fieldset>
									
									        <!-- 서비스 운영에 관한 관리 -->
									        <fieldset>
									            <legend><strong>4. 서비스 운영에 관한 관리</strong></legend>
									            <ul>
									                <li>계정 도용 및 부정 이용 행위 방지 및 제재</li>
									                <li>서비스의 원활한 운영을 위한 기능 제공</li>
									            </ul>
									        </fieldset>
									
									        <!-- 개인화된 서비스 제공 -->
									        <fieldset>
									            <legend><strong>5. 개인화된 서비스 제공</strong></legend>
									            <ul>
									                <li>맞춤형 콘텐츠 추천, 이벤트, 광고 마케팅 활용</li>
									                <li>이용자의 인구통계학적 특성과 관심사, 기호, 성향 추정</li>
									            </ul>
									        </fieldset>
									
									
									        <!-- 개인정보의 추가적인 이용 및 제공 -->
									        <fieldset>
									            <legend><strong>6. 개인정보의 추가적인 이용·제공</strong></legend>
									            <p>수집 목적과 합리적으로 관련된 범위에서는 법령에 따라 이용자의 동의 없이 개인정보를 이용하거나 제3자에게 제공할 수 있습니다.</p>
									            <ul>
									                <li>당초 수집 목적과 관련성이 있는지, 수집한 정황 또는 처리 관행에 비추어 볼 때 개인정보의 추가적인 이용 또는 제공에 대한 예측 가능성</li>
									                <li>이용자의 이익을 부당하게 침해하지 않도록 가명처리 및 암호화 등의 안전성 확보</li>
									            </ul>
									        </fieldset>
									
									        <!-- 가명정보 처리 -->
									        <fieldset>
									            <legend><strong>7. 가명정보 처리</strong></legend>
									            <p>카카오는 수집한 개인정보를 가명처리하여 통계작성, 과학적 연구, 공익적 기록보존 등을 위해 처리할 수 있습니다.</p>
									            <ul>
									                <li>가명정보는 재식별되지 않도록 추가정보와 분리하여 별도 저장 및 관리</li>
									                <li>가명정보 보호를 위해 보안 시스템 운영 및 정기적인 내부 감사</li>
									                <li>직원들에게 정기적인 교육을 실시</li>
									            </ul>
									        </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


<script>
$(document).ready(function () {
	$('.navbar #inquiry').addClass('current');
});
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
    const file = document.getElementById("file").files[0]; // 파일 가져오기 (예: file input id="file")

    var agreeCheckbox = document.getElementById("agree-checkbox");
    
    
    // 체크박스가 선택되지 않았다면 폼 제출을 막고 경고 메시지를 띄움
    if (!agreeCheckbox.checked) {
        event.preventDefault();  // 폼 제출을 막음
        alert("개인정보 수집 및 이용에 동의하셔야 합니다.");
        return; // 유효성 검사 실패 시 제출을 중단
    }
    
    // 유효성 검사
    if (!member_name) return alert("작성자 이름을 입력해주세요.");
    if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(email))
        return alert("유효한 이메일을 입력해주세요.");
    if (!title) return alert("제목을 입력해주세요.");
    if (!/^[0-9]{10,11}$/.test(phone))
        return alert("휴대폰 번호는 10-11자리 숫자로 입력해주세요.");
    if (!content) return alert("문의 내용을 입력해주세요.");
    if (istatus === "default") return alert("카테고리를 선택해주세요.");
    if (!recaptchaResponse) return alert("reCAPTCHA 인증을 완료해주세요.");




    // FormData 객체 생성
    const formData = new FormData();
    formData.append("member_name", member_name);
    formData.append("email", email);
    formData.append("title", title);
    formData.append("phone", phone);
    formData.append("content", content);
    formData.append("istatus", istatus);
    formData.append("recaptcha", recaptchaResponse); // reCAPTCHA 응답 토큰 추가
    if (file) {
        formData.append("file", file); // 파일이 있으면 함께 추가
    }

    // 서버로 데이터 전송
    fetch("/contact/submit", {
        method: "POST",
        body: formData,
    })
    .then(response => response.json())
    .then(result => {
        if (result.success) {
            Swal.fire('성공', '문의가 접수되었습니다.', 'success');
            grecaptcha.reset();
            document.getElementById("quform").reset();
        } else {
            Swal.fire('실패', '서버에서 오류가 발생했습니다.', 'error');
        }
    })
    .catch(error => {
        Swal.fire('실패', '서버와의 통신에 실패했습니다.', 'error');
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





<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
