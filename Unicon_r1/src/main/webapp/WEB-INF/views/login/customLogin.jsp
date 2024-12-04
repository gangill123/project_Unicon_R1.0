<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->


<style>
    #kakao-login-btn {
        border: none; /* 버튼 테두리 제거 */
        outline: none; /* 버튼 클릭 시 외곽선 제거 */
        padding: 0; /* 패딩 0으로 설정 */
        background: none; /* 배경 없애기 */
    }

    #kakao-login-btn img {
        border: none; /* 이미지 테두리 제거 */
        display: block; /* 공백 제거 */
        width: 50%; /* 이미지 크기 조정 */
        height: auto; /* 이미지 크기 조정 */
        margin: 0 auto; /* 수평 중앙 정렬 */
    }
    #naver-login-btn {
        border: none; /* 버튼 테두리 제거 */
        outline: none; /* 버튼 클릭 시 외곽선 제거 */
        padding: 0; /* 패딩 0으로 설정 */
        background: none; /* 배경 없애기 */
        
    }

    #naver-login-btn img {
        border: none; /* 이미지 테두리 제거 */
        display: block; /* 공백 제거 */
        width: 50%; /* 이미지 크기 조정 */
        height: auto; /* 이미지 크기 조정 */
        margin: 0 auto; /* 수평 중앙 정렬 */
    }    
    
</style>

<!--====================================작성부=====================================-->


		<!-- LOGIN ================================================== -->
		<section>
		  <div class="container">
		    <div class="row justify-content-center">
		      <div class="col-md-10 col-lg-7 col-xl-6">
		        <div class="common-block">
		          <div class="line-title">
		            <h2>로그인</h2>
		          </div>
		          <form method="post">
		            <div class="row">
		              <div class="col-sm-12">
		                <div class="form-group">
		                  <label>아이디</label>
		                  <input type="text" class="form-control" name="name" placeholder="Your id here">
		                </div>
		              </div>
		              <div class="col-sm-12">
		                <div class="form-group">
		                  <label>비밀번호 </label>
		                  <input type="password" class="form-control" name="password" placeholder="Your password here">
		                </div>
		              </div>
		            </div>
		            <div class="row">
		              <div class="col-sm-6 mb-2">
		                <div class="custom-control custom-checkbox">
		                  <input type="checkbox" class="custom-control-input" id="login-remember">
		                  <label class="custom-control-label" for="login-remember">로그인 상태 유지</label>
		                </div>
		              </div>
		              <div class="col-sm-6 text-start text-sm-end">
		                <a href="forgot-password.html" class="m-link-muted">비밀번호 찾기</a>
		              </div>
		            </div>
		            <button type="button" class="butn primary w-100 mt-4"><span>로그인</span></button>
		            <div class="text-center text-small mt-4">
		            </div>
					<button id="kakao-login-btn">
					<img src="${pageContext.request.contextPath}/resources/kakao_laogin_large_wide.png" alt="Kakao 로그인">
					</button>
					<button id="naver-login-btn">
					    <img src="${pageContext.request.contextPath}/resources/naver_login.png" alt="네이버 로그인">
					</button>					
		            <div class="text-center text-small mt-4">
		              <span>아직 유니콘의 회원이 아니신가요? <a href="http://localhost:8088/register/mType">회원가입</a></span>
		            </div>
		          </form>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>

		<!-- 카카오 SDK 추가 -->
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script>
		  // 페이지 로드 완료 후 실행될 코드
		  document.addEventListener('DOMContentLoaded', function () {
		    // Kakao SDK 초기화
		    Kakao.init('30eeb4d6b6befce07764dbaa51d4599b'); // 카카오에서 발급받은 JavaScript 키 입력
		    console.log('Kakao SDK Initialized:', Kakao.isInitialized());
		
		    // 로그인 버튼 클릭 이벤트
		    document.getElementById('kakao-login-btn').addEventListener('click', function () {
		      Kakao.Auth.login({
		        success: function (authObj) {
		          console.log('Access Token:', authObj.access_token);
		
		          // 인증 코드 받아오기 (인가 코드)
		          var code = authObj.code;
		
		          // 서버로 인증 코드 전달
		          fetch('/api/kakao/login', {
		            method: 'POST',
		            headers: { 'Content-Type': 'application/json' },
		            body: JSON.stringify({ code: code }), // 인가 코드를 서버로 전달
		          })
		          .then((response) => response.json())
		          .then((data) => {
		            if (data.success) {
		              alert('로그인 성공!');
		              window.location.href = '/dashboard'; // 성공 시 대시보드로 이동
		            } else {
		              alert('로그인 실패');
		            }
		          })
		          .catch((error) => console.error('Error:', error));
		        },
		        fail: function (err) {
		          console.error('카카오 로그인 실패:', err);
		          alert('로그인 실패');
		        },
		      });
		    });
		  });
		</script>
		
		<!-- 네이버 로그인 -->
		<script>
		document.addEventListener("DOMContentLoaded", function () {
		    document.getElementById("naver-login-btn").addEventListener("click", function () {
		        const clientId = "fgGRzC0jJbhNFcOJszh2"; // 발급받은 Client ID
		        const redirectUri = "http://localhost:8088/main/template"; // 네이버 로그인 후 돌아올 URL
		        const state = Math.random().toString(36).substring(7); // CSRF 방지를 위한 상태 값

		        // state 값을 서버로 저장
		        fetch("/save-state", {
		            method: "POST",
		            headers: { "Content-Type": "application/json" },
		            body: JSON.stringify({ state: state }),
		        })
		        .then(response => {
		            if (!response.ok) {
		                throw new Error("Failed to save state");
		            }
		            // 네이버 로그인 URL 생성 및 리다이렉트
		            const encodedRedirectUri = encodeURIComponent(redirectUri);
		            const naverLoginUrl = `https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=${clientId}&redirect_uri=${encodedRedirectUri}&state=${state}`;
		            window.location.href = naverLoginUrl;
		        })
		        .catch(error => {
		            console.error("Error saving state:", error);
		            alert("로그인 요청 중 문제가 발생했습니다.");
		        });
		    });
		});
		</script>

		

				

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
