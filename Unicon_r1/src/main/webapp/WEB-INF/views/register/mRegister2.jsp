<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

		<!-- 헤더 -->
		<style>
		.header-image {
		    width: 696px; /* 가로 크기 설정 */
		    height: auto; /* 비율 유지 */
		    margin-bottom: 50px;	    
		}
		.image-container {
		    max-width: 696px; /* 이미지의 최대 너비와 동일하게 설정 */
		    width: 100%; /* 부모 요소에 맞춤 */
		    margin: 0 auto; /* 가운데 정렬 */
		    text-align: center; /* 자식 요소 가운데 정렬 */
		}
		
		.header-image {
		    width: 100%; /* 부모 요소의 너비에 맞춤 */
		    height: auto; /* 비율 유지 */
		}
		</style>
		<!-- 헤더 -->

<!--====================================작성부=====================================-->

         <!-- APPLY FORM
        ================================================== -->
        <section class="bg-light">
            <div class="container">

                <div class="row justify-content-center">
                
		            <!-- 헤더 -->
		            <div class="image-container">
		                <img src="${pageContext.request.contextPath}/resources/registerH2.png" alt="회원가입 헤더" class="header-image">
		            </div>                

                    <!-- start form section -->
                    <div class="col-md-11 col-lg-9">

                        <div class="border bg-white p-1-9 p-lg-2-3 p-xl-6 rounded">

                            <div class="text-center mb-1-9">
                                <h2 class="font-weight-600 mb-3">회원가입</h2>
                                <hr>
                                <p class="mb-0">UNICORN에 가입하고 당신만의 소중한 친구를 찾아보세요. 간단한 회원가입으로 바로 시작할 수 있습니다.</p>
                            </div>
                            
                        <p class="sub">
                            <span id="ico">*</span>
                            필수입력사항
                        </p>

						<!-- 가입폼 -->
						<form class="quform" action="join_complete.html" method="POST" onsubmit="return on_submit_check();">
						    <div class="row mb-3" id="font_size">
						        <label for="member_id" class="col-sm-2 col-form-label" id="fst" style="padding-top:29px;">아이디<span id="ico">*</span></label>
						        <div class="col-sm-6 id_bell_f" id="sst" style="padding-top: 19px;">
						            <input type="text" name="id" class="form-control inpt_id" id="member_id" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
						            <button type="button" id="idjungbok" class="btn btn-outline-primary">중복확인</button>
						            <p class="txt_guide">
						                <span class="id_txt_case1 id_bell_s">6자 이상의 영문 혹은 영문과 숫자를 조합</span>
						                <span class="id_txt_case2 id_bell_t">아이디 중복확인</span>
						            </p>
						        </div>
						    </div>
						
						    <div class="row mb-3" id="font_size">
						        <label for="member_pw" class="col-sm-2 col-form-label" id="fst">비밀번호<span id="ico">*</span></label>
						        <div class="col-sm-6 pw_bell_f" id="sst">
						            <input type="password" name="pw" class="form-control inpt_pw check_pw" id="member_pw" placeholder="비밀번호를 입력해주세요">
						            <p class="txt_guide">
						                <span class="pw_txt_case1 pw_bell_s">10자 이상 입력</span>
						                <span class="pw_txt_case2 pw_bell_t">영문/숫자/특수문자 (- 제외) 조합해주세요</span>
						            </p>
						        </div>
						    </div>
						
						    <div class="row mb-3" id="font_size">
						        <label for="member_pw2" class="col-sm-2 col-form-label" id="fst">비밀번호확인<span id="ico">*</span></label>
						        <div class="col-sm-6 pw2_bell_f" id="sst">
						            <input type="password" class="form-control inpt_pw2 check_pw" id="member_pw2" placeholder="비밀번호를 한번 더 입력해주세요">
						            <p class="txt_guide">
						                <span class="pw2_txt_case1 pw2_bell_s">동일한 비밀번호를 입력해주세요</span>
						            </p>
						        </div>
						    </div>
						
						    <div class="row mb-3" id="font_size">
						        <label for="member_name" class="col-sm-2 col-form-label" id="fst">이름<span id="ico">*</span></label>
						        <div class="col-sm-6" id="sst">
						            <input type="text" name="name" class="form-control" id="member_name" placeholder="이름을 입력해주세요">
						        </div>
						    </div>
						
						    <div class="row mb-3" id="font_size">
						        <label for="member_email" class="col-sm-2 col-form-label" id="fst">이메일<span id="ico">*</span></label>
						        <div class="col-sm-6" id="sst">
						            <input type="email" name="email" class="form-control inpt_email" id="member_email" placeholder="예:ksmfou98@inu.ac.kr">
						            <button type="button" id="emailjungbok" class="btn btn-outline-primary">중복확인</button>
						        </div>
						    </div>
						
						    <div class="row mb-3" id="font_size">
						        <label for="phone_number" class="col-sm-2 col-form-label" id="fst">휴대폰<span id="ico">*</span></label>
						        <div class="col-sm-6" id="sst">
						            <input type="text" name="phone_number" class="form-control" id="phone_number" placeholder="숫자만 입력해주세요">
						        </div>
						    </div>
						
						    <div class="row mb-3 juso_search" id="font_size" style="padding-bottom: 40px;">
						
								<input type="text" id="sample6_postcode" placeholder="우편번호">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" placeholder="주소"><br>
								<input type="text" id="sample6_detailAddress" placeholder="상세주소">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목">
								
						        <p class="standard"><span>배송지에 따라 상품 정보가 달라질 수 있습니다.</span></p>
						    </div>
						
						    <div class="row mb-3 btom_line" id="font_size">
						        <label for="birth_year" class="col-sm-2 col-form-label" id="fst">생년월일</label>
						        <div class="col-sm-6" id="sst">
						            <div class="birth_day">
						                <input type="text" name="year" id="birth_year" pattern="[0-9]*" size="4" maxlength="4" placeholder="YYYY">
						                <span class="bar"></span>
						                <input type="text" name="month" id="birth_month" pattern="[0-9]*" size="2" maxlength="2" placeholder="MM">
						                <span class="bar"></span>
						                <input type="text" name="day" id="birth_day" pattern="[0-9]*" size="2" maxlength="2" placeholder="DD">
						            </div>
						        </div>
						    </div>
						
						    <div class="boder_btom"></div>
						 <div class="col-md-12">
						    <div id="formSubmit" class="quform-submit-inner text-center">
						        <button type="submit" class="butn w-100">가입하기</button>
						        <div class="quform-loading-wrap"><span class="quform-loading"></span></div>
						    </div>
						</div>    
						</form>
						
						<!-- 가입폼 -->


                        </div>
                    </div>
                    <!-- end form section -->
                </div>
            </div>
        </section>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

				

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
