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
								<p class="mb-0">UNICORN에 가입하고 당신만의 소중한 친구를 찾아보세요. 간단한 회원가입으로 바로 시작할 수 있습니다.</p>                                
                                <hr>
	                         <p class="sub">
	                            <span id="ico">*</span>
	                            필수입력사항
	                        </p>                               
                            </div>

<!--  -->
        <div id="main" >
            <div id="content" >
                <div class="main_page_aticle">
                    <div class="form">

                        <form action="join_complete.html" method="POST" onsubmit="return on_submit_check();">
                            <div class="row mb-3" id="font_size">
                              <label for="loginId" class="col-sm-2 col-form-label" id="fst" style="padding-top:29px; ">아이디<span id=ico>*</span></label>
                              <div class="col-sm-6 id_bell_f" id="sst" style="padding-top: 19px;">
                                <input type="text" name="id" class="form-control inpt_id" id="submit_check_id" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
                                <button type="button" id="idjungbok" class="btn btn-outline-primary">중복확인</button>
                                <p class="txt_guide">
                                  <span class="id_txt_case1 id_bell_s ">6자 이상의 영문 혹은 영문과 숫자를 조합</span>
                                  <span class="id_txt_case2 id_bell_t ">아이디 중복확인</span>
                                </p>
                              </div>
                            </div>



                            <div class="row mb-3" id="font_size">
                              <label for="userpw" class="col-sm-2 col-form-label" id="fst">비밀번호<span id=ico>*</span></label>
                              <div class="col-sm-6 pw_bell_f" id="sst">
                                <input type="password" name="pw" class="form-control inpt_pw check_pw"  id="submit_check_pw"  placeholder="비밀번호를 입력해주세요">
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
                                <label for="name" class="col-sm-2 col-form-label" id="fst">이름<span id=ico>*</span></label>
                                <div class="col-sm-6" id="sst">
                                  <input type="text" name="name" class="form-control"  id="submit_check_name" placeholder="이름을 입력해주세요">
                                </div>
                              </div>


                              <div class="row mb-3" id="font_size">
                                <label for="useremail" class="col-sm-2 col-form-label" id="fst">이메일<span id=ico>*</span></label>
                                <div class="col-sm-6" id="sst">
                                  <input type="email" name="email" class="form-control inpt_email"  id="submit_check_email" placeholder="예:ksmfou98@inu.ac.kr">
                                  <button type="button" id="emailjungbok"class="btn btn-outline-primary">중복확인</button>
                                </div>
                              </div>


                              <div class="row mb-3" id="font_size">
                                <label for="phonenumber" class="col-sm-2 col-form-label" id="fst">휴대폰<span id=ico>*</span></label>
                                <div class="col-sm-6" id="sst">
                                  <input type="text" name="phone_number" class="form-control"  id="submit_check_phone" placeholder="숫자만 입력해주세요">
                                </div>
                              </div>


                              <div class="row mb-3 juso_search" id="font_size" style="padding-bottom: 40px;">  
                                <label for="phonenumber" class="col-sm-2 col-form-label" id="fst">주소<span id=ico></span></label>
                                <button type="button"  id="juso" class="btn btn-outline-primary"  ><span id="adressNo">주소 검색</span>
                                </button>
                                <input type="text" id="user_address" name="user_address" placeholder="주소">
                                <input type="text" id="user_detail_address" name="user_detail_address"  placeholder="상세주소">
                                <p class="standard"><span>배송지에 따라 상품 정보가 달라질 수 있습니다.</span> </p>
                              </div>

                              
                              <div class="row mb-3  btom_line" id="font_size">
                                <label for="phonenumber" class="col-sm-2 col-form-label" id="fst">생년월일</label>
                                <div class="col-sm-6 " id="sst">
                                  <div class="birth_day">
                                    <input type="text" name="year" id="birth_year" pattern="[0-9]*" value="" label="생년월일" size="4" maxlength="4" placeholder="YYYY">
                                    <span class="bar"></span>
                                    <input type="text" name="month" id="birth_month" pattern="[0-9]*" value="" label="생년월일" size="2" maxlength="2" placeholder="MM">
                                    <span class="bar"></span>
                                    <input type="text" name="day" id="birth_day" pattern="[0-9]*" value="" label="생년월일" size="2" maxlength="2" placeholder="DD">
                                  </div>
                                
                                </div>
                         
                              </div>

                              <div class="boder_btom">
                                
                              </div>                           
                          </form>
                    </div> 
                </div>
            </div>
        </div>
<!--  -->

                        </div>
                    </div>
                    <!-- end form section -->
                                  
                              <div id="formSubmit" class="form_footer">
                                <button type="submit" class="btn active btn_join">가입하기</button>
                              </div>
                </div>
            </div>
        </section>


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

        $('.inpt_id').change(function () {
            $(".id_bell_t").css('color', '#b3130b');
            
            // $('.inpt_id').attr("check_result", "fail");
        })
    
    
        if ($('.inpt_id').val() == '') {
          alert('아이디를 입력해주세요');
          return;
        }
    
        id_overlap_input = document.querySelector('input[name="id"]');
    
        $.ajax({
          type: "GET",
          url: "./id_check?id="+id_overlap_input,    //해당 url로 데이터를 넘김
          data: {
            'username': $('.inpt_id').val()
          },
          datatype: 'json',
          success: function (data) {
            console.log(data['overlap']);
            if (data['overlap'] == "fail") {
              alert("이미 존재하는 아이디 입니다.");
              id_overlap_input.focus();
              return;
            } else {
              alert("사용가능한 아이디 입니다.");
              $(".id_bell_t").css('color', '#0f851a');
              return;
            }
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


				

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
