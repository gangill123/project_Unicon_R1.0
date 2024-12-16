<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->
<link rel="stylesheet" href="/resources/css/join.css">

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
		
		<!-- 멤버유형 아이콘 -->
		<style>
		.text-center {
		    display: flex; /* Flexbox 사용 */
		    flex-direction: column; /* 세로 방향으로 정렬 */
		    align-items: center; /* 수평 가운데 정렬 */
		}
		
		.member-container {
		    display: flex; /* Flexbox 사용 */
		    align-items: center; /* 수직 가운데 정렬 */
		}
		
		.member-type {
		    width: 30px; /* 가로 크기 설정 */
		    height: auto; /* 비율 유지 */			
		    margin-right: 10px; /* 텍스트와의 간격 조정 */
		    margin-bottom: 20px;
		}
		
		.mb-1-9 {
		    margin-bottom: 1.9rem; /* 적절한 하단 여백 설정 */
		}
		
		hr {
		    margin-top: 0px; /* 원하는 만큼의 위쪽 여백으로 조정 (예: 5px) */
		    margin-bottom: 10px; /* 아래쪽 여백도 필요에 따라 조정 */
		}
			
		</style>
		<!-- 멤버유형 아이콘 -->	
		
		<!--  -->	
		<style>
		.main_page_aticle {     /* main 부분에서 내용이 들어갈 부분 가로크기지정후 가운데 정렬 */
		    width: 1050px;
		    margin: 0 -80px;    /*가운데 정렬 */
		}		
		
		#idjungbok{ /* 아이디 중복 확인 */
		    position: absolute;
		    color: #4CAF50;
		    left: 504px;
		    width: 120px;
		    height: 44px;
		    font-size:14px
		}	
		
		#emailjungbok{ /* 이메일 중복 확인 */
		  position: absolute;
		  color: #4CAF50;
		  left: 504px;
		  width: 120px;
		  height: 44px;
		  font-size:14px
		}	
		
		#formSubmit .active{  /*가입하기 버튼 */
		  border: 1px solid #4CAF50;
		  background-color: #4CAF50;
		  color: #fff;
		    }			

		#formSubmit .active{  /*가입하기 버튼 */
		  border: 1px solid #4CAF50;
		  background-color: #4CAF50;
		  color: #fff;
		}			
		
		#formSubmit .active {
		  border: 1px solid #4CAF50;
		  background-color: #4CAF50;
		  color: #fff;
		}	

		.btn-outline-primary {
		    border-color: #4CAF50; /* 테두리 색상 */
		}
		
		.btn-outline-primary:hover {
		    background-color: #D3D3D3; /* 호버 시 배경색 */
		    border-color: #D3D3D3; /* 테두리 색상 */
		    color: white; /* 호버 시 텍스트 색상 */
		}
		</style>
		<!--  -->

	    <!-- info1 -->
	    <style>		
		.if_first {
		    display: inline-block; /* 텍스트 크기에 맞춰 박스 크기 자동 조정 */
		    padding-left: 3px;
		    padding-right: 3px;
		    background-color: #4CAF50; /* 배경색 */
		    color: white; /* 글자색 */
		    border: none; /* 테두리 제거 */
		    cursor: pointer; /* 커서 포인터로 변경 */
		    font-size: 12px; /* 폰트 크기 */
		    margin-left: 10px; /* Tip과의 간격 조정 */
		    margin-bottom: 20px;
		}
		.info-tip {
		    display: flex; /* Flexbox 사용 */
		    align-items: center; /* 수직 가운데 정렬 */
		    margin-top: 20px;
		    margin-bottom: 0;
		}
		.info-section {
		    background-color: #FFFEF2; /* 연한 노란색 */
		    border: 1px solid #d0d0d0; /* 테두리 */
		    border-radius: 4px; /* 모서리 둥글게 */
		    padding: 15px; /* 패딩 */
		    margin-top: 0; /* 위쪽 여백 */
			font-size: 14px; /* 글씨 크기를 작게 설정 (기본값보다 조금 작게) */
			}		    
		    
		}
		
		.info-section h3 {
		    color: #333; /* 제목 색상 */
		} 
		.info-section strong {
		    color: black; /* 검정색 */
		}
		.info-section ul {
		    line-height: 1.2; /* 자간 줄이기 */
		    padding-top : 15px;
		    padding-left: 30px; /* 왼쪽 여백 */		    
		}
		.info-section li {
		    margin-bottom: 6px; /* 항목 간 간격 */
		}	
		

		.underline {
		    border-bottom: 0.5px solid #000; /* 원하는 밑줄 두께와 색상을 지정 */
		    padding-bottom: 0.5px; /* 밑줄과 텍스트 간의 간격 조정 */
		 }
				
	    </style>
	    <!-- info1 -->		

<!--====================================작성부=====================================-->

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
		                        <div class="member-container">
		                            <img src="${pageContext.request.contextPath}/resources/mType.png" alt="회원유형" class="member-type">
		                            <h2 class="font-weight-600 mb-3">회원가입</h2>
		                            <hr> 
		                        </div>
						  
		                                <div class="info-section">
		                                    <ul>	                                 
		                                        <li><span class="underline">사설 보호센터</span>는 <strong>사업자등록번호</strong>, <strong>사업자 등록증</strong>을 첨부해주셔야합니다.</li>
		                                        <li><span class="underline">지자체 보호센터</span>로 가입할 경우, <strong>지자체명</strong>, <strong>위탁여부,</strong> <strong>위탁 계약서</strong>를 첨부해주셔야합니다.</li>
		                                        <li><span class="underline">비영리 단체 보호센터</span>로 유니콘을 이용하기 위해서는 <strong>비영리단체 등록번호</strong>, <strong>인증서</strong> 파일을 함께 첨부해주셔야합니다.</li>
		                                    </ul>
		                                </div>
						
						                                                    
                    </div>

<hr>
<!-- 가입폼  -->
	        <div id="main">
	            <div id="content">
	                <div class="main_page_aticle">
	                    <div class="form">
                        <form action="${pageContext.request.contextPath}/register/iRegister" method="POST" onsubmit="return on_submit_check();">
                        

                                        <!-- Begin Select element -->
                                        <div class="row mb-3" id="font_size">
                                            <div class="quform-element form-group">
                                                <label for="instType" class="col-sm-2 col-form-label" id="fst" style="padding-top:29px; "></label>
                                                <div class="quform-input">
                                                    <select id="instType" class="form-control form-select" name="inst_type" onchange="showFieldsBasedOnSelection()">
                                                        <option value="">-- 센터 유형을 선택해주세요 --</option>
                                                        <option value="mingan">민간(사설) 보호센터</option>
                                                        <option value="local">지자체 보호센터</option>
                                                        <option value="npo">비영리 보호센터</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Select element -->                        
                        
                        
 							<!-- 민간 공통!!! -->    
 							<div id="privateFields" style="display: none;">
 							
                            <!-- 사업자 등록증 첨부 -->
							<div class="row mb-3" id="font_size">
							  <label for="coverletter" class="col-sm-2 col-form-label" id="fst">사업자 등록증<span id="ico">*</span></label>
							  <div class="col-sm-6" id="sst">
							    <div class="custom-file">
							      <input class="custom-file-input" type="file" id="coverletter1" name="inst_image" />
							      <label class="custom-file-label" for="coverletter" data-browse="Browse">파일을 선택해주세요.</label>
							    </div>
							  </div>
							</div>
                            <!-- 사업자 등록증 첨부 -->                          
							<!-- 사업자 번호 -->
                            <div class="row mb-3" id="font_size">
                              <label for="inst_number" class="col-sm-2 col-form-label" id="fst">사업자 번호<span id=ico>*</span></label>
                              <div class="col-sm-6" id="sst">
                                <input type="text" name="inst_number" class="form-control"  id="submit_check_instnumber2" placeholder="사업자 등록번호를 입력해주세요.">
                              </div>
                            </div>   
  							<!-- 사업자 번호 -->   
  							
  							</div> <!-- 민강 공통!!! -->
  							
                        
 
 							<!-- 지자체 공통!!!!!! -->
							<div id="municipalFields" style="display: none;">							
 							
                             <div class="row mb-3" id="font_size">
                              <label for="local_name" class="col-sm-2 col-form-label" id="fst">지자체명<span id=ico>*</span></label>
                              <div class="col-sm-6" id="sst">
                                <input type="text" name="local_name" class="form-control"  id="submit_check_localname" placeholder="지자체명을 입력해주세요.">
                              </div>
                            </div>   
 
   							
                            <!-- 위탁 계약서 첨부 -->
							<div class="row mb-3" id="font_size">
							  <label for="coverletter" class="col-sm-2 col-form-label" id="fst">위탁 계약서<span id="ico">*</span></label>
							  <div class="col-sm-6" id="sst">
							    <div class="custom-file">
							      <input class="custom-file-input" type="file" id="coverletter2" name="inst_image" />
							      <label class="custom-file-label" for="coverletter" data-browse="Browse">파일을 선택해주세요.</label>
							    </div>
							  </div>
							</div>
                            <!-- 위탁 계약서 첨부 -->  
                            
							<!-- 위탁 여부 -->
							  <div class="row mb-3" id="font_size">
							      <label for="consignment" class="col-sm-2 col-form-label" id="fst">위탁 여부<span id="ico">*</span></label>
							      <div class="col-sm-6" id="sst">
							          <div class="form-check form-check-inline">
							              <input class="form-check-input" type="radio" name="mail_subscription" id="consignYes" value="yes" required>
							              <label class="form-check-label" for="consignYes">예</label>
							          </div>
							          <div class="form-check form-check-inline">
							              <input class="form-check-input" type="radio" name="mail_subscription" id="consignNo" value="no" required>
							              <label class="form-check-label" for="consignNo">아니오</label>
							          </div>
							      </div>
							  </div>  
							<!-- 위탁 여부 -->                            
                            
                            </div> <!-- 지자체 공통!!! -->
                            
                            
                                  
                           <!-- 비영리 공통!!!!!! --> 
                           <div id="nonprofitFields" style="display: none;">
                           
                            <!-- 비영리단체 인증서 첨부 -->
							<div class="row mb-3" id="font_size">
								<label for="coverletter" class="col-sm-2 col-form-label" id="fst">비영리 단체 인증서<span id="ico">*</span></label>
								  <div class="col-sm-6" id="sst">
								    <div class="custom-file">
								      <input class="custom-file-input" type="file" id="coverletter3" name="inst_image" />
								      <label class="custom-file-label" for="coverletter" data-browse="Browse">파일을 선택해주세요.</label>
								    </div>
								  </div>
							</div>
                            <!-- 비영리단체 인증서 첨부 -->   
                            
                            
                            <!-- 비영리 단체 등록번호 -->
                             <div class="row mb-3" id="font_size">
                              <label for="inst_number" class="col-sm-2 col-form-label" id="fst">비영리 단체 번호<span id=ico>*</span></label>
                              <div class="col-sm-6" id="sst">
                                <input type="text" name="inst_number" class="form-control"  id="submit_check_instnumber1" placeholder="단체 등록번호를 입력해주세요.">
                              </div>
                            </div>                                                    
                        	<!-- 비영리 단체 등록번호 -->                           
                            
                            </div> <!-- 비영리 공통!!!!!!! -->

							
							<!--  공통항목!!!!!! -->
							<div id="commonFields">
							
                        
                            <div class="row mb-3" id="font_size">
                              <label for="memberId" class="col-sm-2 col-form-label" id="fst" style="padding-top:29px; ">아이디<span id=ico>*</span></label>
                              <div class="col-sm-6 id_bell_f" id="sst" style="padding-top: 19px;">
                                <input type="text" name="member_id" class="form-control inpt_id" id="submit_check_id" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
                                <button type="button" id="idjungbok" class="btn btn-outline-primary">중복확인</button>
                                <p class="txt_guide">
                                  <span class="id_txt_case1 id_bell_s ">6자 이상의 영문 혹은 영문과 숫자를 조합</span>
                                  <span class="id_txt_case2 id_bell_t ">아이디 중복확인</span>
                                </p>
                              </div>
                            </div>

                            <div class="row mb-3" id="font_size">
                              <label for="memberpw" class="col-sm-2 col-form-label" id="fst">비밀번호<span id=ico>*</span></label>
                              <div class="col-sm-6 pw_bell_f" id="sst">
                                <input type="password" name="member_pw" class="form-control inpt_pw check_pw"  id="submit_check_pw"  placeholder="비밀번호를 입력해주세요">
                                <p class="txt_guide">
                                  <span class="pw_txt_case1 pw_bell_s ">10자 이상 입력</span>
                                  <span class="pw_txt_case2 pw_bell_t ">영문/숫자/특수문자 (- 제외) 조합해주세요</span>
                                  <!-- <span class="pw_txt_case3 pw_bell_u ">동일한 숫자 3개 이상 연속 사용 불가</span> -->
                                </p>
                              </div>
                            </div>

                            <div class="row mb-3" id="font_size">
                                <label for="userpw2" class="col-sm-2 col-form-label" id="fst">비밀번호확인<span id=ico>*</span></label>
                                <div class="col-sm-6 pw2_bell_f" id="sst">
                                  <input type="password" class="form-control inpt_pw2 check_pw"  id="submit_check_pw2" placeholder="비밀번호를 한번 더 입력해주세요">
                                  <p class="txt_guide">
                                    <span class="pw2_txt_case1  pw2_bell_s">동일한 비밀번호를 입력해주세요</span>
                                  </p>
                                </div>
                              </div>

                              <div class="row mb-3" id="font_size">
                                <label for="member_name" class="col-sm-2 col-form-label" id="fst">센터명<span id=ico>*</span></label>
                                <div class="col-sm-6" id="sst">
                                  <input type="text" name="member_name" class="form-control"  id="submit_check_name" placeholder="센터명을 입력해주세요">
                                </div>
                              </div>                                             

                                <div class="row mb-3" id="font_size">
                                  <label for="memberemail" class="col-sm-2 col-form-label" id="fst">이메일<span id=ico>*</span></label>
                                  <div class="col-sm-6" id="sst">
                                    <input type="email" name="member_email" class="form-control inpt_email"  id="submit_check_email" placeholder="예:ksmfou98@inu.ac.kr">
                                    <button type="button" id="emailjungbok"class="btn btn-outline-primary">중복확인</button>
                                  </div>
                                </div>

                                <div class="row mb-3" id="font_size">
                                 <label for="phonenumber" class="col-sm-2 col-form-label" id="fst">휴대폰<span id=ico>*</span></label>
                                  <div class="col-sm-6" id="sst">
                                   <input type="text" name="member_tel" class="form-control"  id="submit_check_phone" placeholder="숫자만 입력해주세요">
                                  </div>
                                </div>

							    <!-- 주소 입력 -->
							    <div class="row mb-3" id="font_size">
							        <label for="memberaddress" class="col-sm-2 col-form-label" id="fst">소재지<span id="ico">*</span></label>
							        <div class="col-sm-6 juso_search" id="sst">
							            <input type="text" class="form-control" name="postal_code" id="postal_code" placeholder="우편번호" style="margin-bottom: 5px; width: 200px; margin-right: 10px;">
							            <input type="button" class="form-control" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin-bottom: 5px; width: 120px;">
							            <input type="text" class="form-control" name="road_address" id="road_address" placeholder="주소" style="margin-bottom: 5px;">
							            <input type="text" class="form-control" name="detail_address" id="detail_address" placeholder="상세주소" style="margin-bottom: 5px;">
							            <input type="text" class="form-control" name="extra_address" id="extra_address" placeholder="참고항목" style="margin-bottom: 5px;">
							        </div>
							    </div>     							                            
                                                           
							  <!-- 메일 수신 여부 -->
							  <div class="row mb-3" id="font_size">
							      <label for="emailReceive" class="col-sm-2 col-form-label" id="fst">메일 수신 여부<span id="ico">*</span></label>
							      <div class="col-sm-6" id="sst">
							          <div class="form-check form-check-inline">
							              <input class="form-check-input" type="radio" name="mail_subscription" id="receiveYes" value="yes" required>
							              <label class="form-check-label" for="receiveYes">예</label>
							          </div>
							          <div class="form-check form-check-inline">
							              <input class="form-check-input" type="radio" name="mail_subscription" id="receiveNo" value="no" required>
							              <label class="form-check-label" for="receiveNo">아니오</label>
							          </div>
							      </div>
							  </div>  
							  </div><!-- 공통항목!!!! -->
							                              

                              <hr>

                                    
                                  
                              <div id="formSubmit" class="form_footer">
                                <button type="submit" class="btn active btn_join">가입하기</button>
                              </div>
                            
                          </form>
	                    </div> 
	                </div>
	            </div>
	        </div>
      
<!-- 가입폼  -->
                </div>
            </div>
            <!-- end form section -->                      
        </div>
    </div>
</section>






<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
function showFieldsBasedOnSelection() {
    var selectedType = document.getElementById("instType").value;
    console.log("선택된 센터 유형: " + selectedType);  // 콘솔 로그로 선택된 값을 확인

    // 모든 특수 항목들 숨기기
    document.getElementById("privateFields").style.display = "none";
    document.getElementById("municipalFields").style.display = "none";
    document.getElementById("nonprofitFields").style.display = "none";

    // 선택된 센터 유형에 맞춰 해당 항목만 보이기
    if (selectedType == "mingan") {
        document.getElementById("privateFields").style.display = "block";
    } else if (selectedType == "local") {
        document.getElementById("municipalFields").style.display = "block";
    } else if (selectedType == "npo") {
        document.getElementById("nonprofitFields").style.display = "block";
    }
}

// 페이지가 로드될 때에도 선택된 값에 따라 필드가 보이도록 실행
window.onload = function() {
    showFieldsBasedOnSelection(); // 페이지 로드 시 자동 실행
};

</script>
<script>
window.addEventListener('DOMContentLoaded',function(){     //시작


    // 변수 생성 
    const id_bell_f = document.querySelector('.id_bell_f');
    const id_bell_s = document.querySelector('.id_bell_s');
    const id_bell_t = document.querySelector('.id_bell_t');
    

    const pw_bell_f = document.querySelector('.pw_bell_f');
    const pw_bell_s = document.querySelector('.pw_bell_s');
    const pw_bell_t = document.querySelector('.pw_bell_t');
    // const pw_bell_u = document.querySelector('.pw_bell_u');  사용하려다가 그냥 안하는게 낫겠음 나중에 필요하면 주석해제 ( 동일한 숫자 3개 이상 연속 사용 불가 )
    

    const pw2_bell_f = document.querySelector('.pw2_bell_f');
    const pw2_bell_s = document.querySelector('.pw2_bell_s');


    // 비밀번호 일치 불일치 확인하기

    $('.check_pw').focusout(function () {          //비밀번호 확인 칸에서 벗어났을 때 실행.
        var pwd1 = $(".inpt_pw").val();            //변수 생성후 값 대입
        var pwd2 = $(".inpt_pw2").val();           //변수 생성후 값 대입
 
        if ( pwd1 != '' && pwd2 == '' ) {          //둘다 빈칸일 경우 아무것도 하지 않음
            null;
        } else if (pwd1 != "" || pwd2 != "") {     // 빈칸이 아닐 경우
            if (pwd1 == pwd2) {                    // 비교해서 같으면
                $(".pw2_bell_s").css('color', '#0f851a');                 
                $(".pw2_bell_s").text("비밀번호가 동일합니다.");
            
                
            } else {        // 비교해서 같지 않으면
                $(".pw2_bell_s").css('color', '#b3130b');
                $(".pw2_bell_s").text("비밀번호가 일치하지 않습니다.");
                
                
            }
        }

        
    });


    




    //아이디 조건 만족 불만족 함수 생성
    function id_check(){
        var id = $(".inpt_id").val();             // 변수 id에  id값 대입

        // var num = /[0-9]/;
        // var eng = /[a-zA-Z]/;
        var spe = /[~!@#$%^&*()_+|<>?:{}]/;         
    


        if(id.length < 6){                     //만약에 id의 길이가 6보다 작으면
            $(".id_bell_s").css('color', '#b3130b');   //글자색 변경
            // $(".id_bell_s").text("6자 이상의 영문 혹은 영문과 숫자를 조합");
            return false;
        }else if(spe.test(id) == 1){    //spe.test(id) --> id안에 특수문자가 있으면 true반환 없으면 false반환
            $(".id_bell_s").css('color', '#b3130b');   //글자색 변경
            // $(".id_bell_s").text("6자 이상의 영문 혹은 영문과 숫자를 조합");
            return false;

        }else{          // 모든 조건이 일치하지 않다면  

            $(".id_bell_s").css('color', '#0f851a');  //글자색 초록색으로 변경
            return true;  //true값 반환
        }
       
    }


    //비밀번호 조건 만족 불만족 함수 생성
    function pw_check(){
        var pw = $(".inpt_pw").val();                   // 변수 pw에 pw값 대입

        var num = /[0-9]/;
        var eng = /[a-zA-Z]/;
        var spe = /[~!@#$%^&*()_+|<>?:{}]/;
    


        if(pw.length < 10){                                  //pw의 길이가 10 이하일 때
            $(".pw_bell_s").css('color', '#b3130b');
            // $(".pw_bell_s").text("10자 이상 입력해주세요.");
            return false;
        }

        if(pw.length >= 10){                                  //pw의 길이가 10 이상일 때
            $(".pw_bell_s").css('color', '#0f851a');
            // $(".pw_bell_s").text("성공!");
            
        }

        if(num.test(pw) == 0 || eng.test(pw) == 0 || spe.test(pw) == 0){    // pw의 숫자가 없거나 , 영어가 없거나, 특수문자가 없을경우 실패
            $(".pw_bell_t").css('color', '#b3130b');
            // $(".pw_bell_t").text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
            return false;
        }

        if(num.test(pw) == 1 && eng.test(pw) == 1 && spe.test(pw) == 1){ // pw의 숫자,영어,특수문자가 1개이상씩 있을경우 성공
            $(".pw_bell_t").css('color', '#0f851a');
            // $(".pw_bell_t").text("성공!");
            
        }
        // if(/(\w)\1\1/.test(pw)){
        //     $(".pw_bell_u").css('color', '#b3130b'); 
        //     $(".pw_bell_u").text("동일한 숫자 3개 이상 연속 사용 불가");
        //     return false;
        // }
        // if(!/(\w)\1\1/.test(pw)){
        //     $(".pw_bell_u").css('color', '#0f851a');
        //     $(".pw_bell_u").text("성공!");
            
        // }

        return true;
        }



    //아이디 조건 만족 불만족 확인하기
    var text1 = $('.inpt_id');
    text1.focus(function(){               //포커스 되면
        id_bell_f.classList.add('on');
        id_bell_s.classList.add('on');
        id_bell_t.classList.add('on');
      });
      text1.blur(function(){              //포커스에서 벗어나면
        
        id_check();              //id_check() 함수 실행
        
      });




    //비밀번호 조건 만족 불만족 확인하기
    var text2 = $('.inpt_pw');
    text2.focus(function(){                   //포커스 되면
        pw_bell_f.classList.add('on');
        pw_bell_s.classList.add('on');
        pw_bell_t.classList.add('on');
        // pw_bell_u.classList.add('on');  동일한 숫자 3개 이상 연속 사용불가 제외시켜버렸음
      });
      text2.blur(function(){              //포커스에서 벗어나면
        
        pw_check();                      //pw_check() 함수 실행
       
        
      });

    //비밀번호 확인 조건 만족 불만족
    var text3 = $('.inpt_pw2');
    text3.focus(function(){
        pw2_bell_f.classList.add('on');
        pw2_bell_s.classList.add('on');
      });
      text3.blur(function(){           // 여기 작성 할껄 위에 focusout 함수에 작성했음 
        
      });

    



    //아이디 중복체크
      const idjungbok = document.querySelector('#idjungbok');
      idjungbok.addEventListener('click', id_overlap_check);

      function id_overlap_check() {
          // 아이디 입력이 변경되면 색상 변경
          $('.inpt_id').change(function () {
              $(".id_bell_t").css('color', '#b3130b');
          });

          // 아이디를 입력하지 않은 경우 경고
          if ($('.inpt_id').val() == '') {
              alert('아이디를 입력해주세요');
              return;
          }

          id_overlap_input = document.querySelector('input[name="id"]');

          // Ajax 호출
          $.ajax({
              type: "GET",
              url: "./checkIdOverlap",  // 아이디 중복 확인을 위한 API 경로
              data: {
                  'memberId': $('.inpt_id').val()  // 서버로 아이디 값 전달
              },
              datatype: 'json',  // 응답 데이터 형식
              success: function (data) {
                  // 서버에서 'fail' 또는 'success' 응답을 받음
                  if (data === "fail") {
                      alert("이미 존재하는 아이디 입니다.");
                      id_overlap_input.focus();
                      return;
                  } else {
                      alert("사용가능한 아이디 입니다.");
                      $(".id_bell_t").css('color', '#0f851a');
                      return;
                  }
              },
              error: function () {
                  alert('아이디 중복 확인에 실패했습니다. 다시 시도해 주세요.');
              }
          });
      }




    //이메일 중복체크
    const emailjungbok = document.querySelector('#emailjungbok');
    emailjungbok.addEventListener('click', email_overlap_check);

    function email_overlap_check() {

        // $('.inpt_email').change(function () {
            
        // })
    
    
        if ($('.inpt_email').val() == '') {
          alert('이메일을 입력해주세요');
          return;
        }
    
        email_overlap_input = document.querySelector('input[name="email"]');
    
        $.ajax({
          type: "GET",
          url: "./email_check?id="+email_overlap_input,    //해당 url로 데이터를 넘김
          data: {
            'email': $('.inpt_email').val()
          },
          datatype: 'json',
          success: function (data) {
            console.log(data['overlap']);
            if (data['overlap'] == "fail") {
              alert("이미 존재하는 이메일 입니다.");
              email_overlap_input.focus();
              return;
            } else {
              alert("사용가능한 이메일 입니다.");
              return;
            }
          }
        });
    }

});


</script>


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

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extra_address").value = extraAddr;
                } else {
                    document.getElementById("extra_address").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postal_code').value = data.zonecode;
                document.getElementById("road_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detail_address").focus();
            }
        }).open();
    }
</script>

<!-- <script>
document.querySelector('form').addEventListener('submit', function(event) {
    // year, month, day 값을 가져와서 하나의 형식으로 합치기
    var year = document.getElementById('birth_year').value;
    var month = document.getElementById('birth_month').value;
    var day = document.getElementById('birth_day').value;

    // 값이 모두 입력되었는지 확인
    if (year && month && day) {
        // 'YYYY-MM-DD' 형식으로 결합
        var formattedDate = year + '-' + month + '-' + day;
        
        console.log('Formatted Date: ', formattedDate); // 여기서 값을 확인

        // hidden_birth 필드에 결합된 값을 넣기
        document.getElementById('hidden_birth').value = formattedDate;
    } else {
        alert('생일을 모두 입력해주세요.');
        event.preventDefault(); // 폼 제출을 막음
        return; // 더 이상 진행하지 않음
    }

    // hidden_birth 필드에 값이 들어갔는지 확인
    var hiddenBirth = document.getElementById('hidden_birth').value;
    if (!hiddenBirth) {
        alert('생일 값이 잘못되었습니다. 다시 확인해주세요.');
        event.preventDefault(); // 폼 제출을 막음
    }
});

</script> -->


				

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
