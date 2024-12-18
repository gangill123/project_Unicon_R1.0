<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 추가 템플릿 css/js 작성란 -->
<style>
.product-details:hover img {
    opacity: 0.7; /* 투명도 설정 */
    transition: opacity 0.3s ease; /* 부드러운 애니메이션 효과 */
}

.product-img {
    width: 100%;
    aspect-ratio: 1 / 1; /* 원하는 가로:세로 비율 설정 */
    overflow: hidden;    /* 이미지가 컨테이너를 벗어나지 않도록 */
}

.product-img img {
    width: 100%;
    height: 100%;
    object-fit: fill;   /* 이미지를 컨테이너에 맞추되 비율 유지 */
    border-radius: 0.75rem; /* 기존 rounded-3 스타일 유지 */
}

.product-grid .product-info{
	padding: 5px;
}

.label-offer2 {
  position: absolute;
  right: 0;
  top: 0;
  height: 25px;
  line-height: 25px;
  display: inline-block;
  padding: 0px 12px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 600;
  font-size: 12px;
  z-index: 1; 
  }
	/* 메인 슬라이드 이미지  */
	.slider {
	    position: relative;
    	width: 100%;         /* 너비를 100%로 설정하여 반응형 유지 */
	    margin: auto;
	    overflow: hidden;
	}
	
	.slides {
	    display: flex;
	    transition: transform 0.5s ease;
	}
	
	.slides img {
	    max-height: 400px;
	    width: 100%;
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
	/* 메인 슬라이드 이미지  */
</style>



</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<!-- 아래는 예시 -->
<!-- PAGE TITLE
        ================================================== -->
        <%-- ${productAllInfo} --%>
        
        <!-- 복지몰 메인 이미지 슬라이드  -->
        <div class="slider">
           <div class="slides">
               <c:forEach var="image" items="${adminStoreImg}">
               		<img src="${image.image_src}" alt="storeMainImages" />
        	   </c:forEach>
           </div>
           <button class="c-button prev">❮</button>
		   <button class="c-button next">❯</button>
        </div>
        <!-- 복지몰 메인 이미지 슬라이드  -->

        <!-- PRODUCT GRID
        ================================================== -->
        <section>
            <div class="container">
                <div class="row">

                    <!-- start product grid left panel -->
                    <div class="col-lg-3">
                        <div class="side-bar">
                            <div class="widget">
                                <div id="accordion" class="accordion-style2">
                                    <div class="card">
                                        <div class="card-header" id="headingOne">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne" 
                                                aria-expanded="true" aria-controls="collapseOne">강아지 사료</button>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled" data-type="5003">
                                                    <li><a class="choice" href="#!">건식사료</a></li>
                                                    <li><a class="choice" href="#!">동결건조 사료</a></li>
                                                    <li><a class="choice" href="#!">분유/우유</a></li>
                                                    <li><a class="choice" href="#!">소프트사료</a></li>
                                                    <li><a class="choice" href="#!">습식사료</a></li>
                                                    <li><a class="choice" href="#!">처방식/기능식사료</a></li>
                                                    <li><a class="choice" href="#!">화식/생식사료</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingTwo">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse"
                                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                  강아지 간식
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled" data-type="5000">
                                                    <li><a class="choice" href="#!">개껌</a></li>
                                                    <li><a class="choice" href="#!">동결건조 간식</a></li>
                                                    <li><a class="choice" href="#!">비스킷/스낵</a></li>
                                                    <li><a class="choice" href="#!">빵/케이크</a></li>
                                                    <li><a class="choice" href="#!">수제간식</a></li>
                                                    <li><a class="choice" href="#!">육포/건조간식</a></li>
                                                    <li><a class="choice" href="#!">음료</a></li>
                                                    <li><a class="choice" href="#!">캔/파우치</a></li>
                                                    <li><a class="choice" href="#!">통살/소시지</a></li>
                                                    <li><a class="choice" href="#!">트릿/스틱</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="card">
                                        <div class="card-header" id="headingThree">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse"
                                                data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                  강아지 건강/관리용품
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled" data-type="5001">
                                                    <li><a class="choice" href="#!">강아지 유산균</a></li>
                                                    <li><a class="choice" href="#!">구강청결제</a></li>
                                                    <li><a class="choice" href="#!">구강티슈</a></li>
                                                    <li><a class="choice" href="#!">눈/귀 관리용품</a></li>
                                                    <li><a class="choice" href="#!">영양제</a></li>
                                                    <li><a class="choice" href="#!">치약</a></li>
                                                    <li><a class="choice" href="#!">칫솔</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    
                                    <div class="card">
                                        <div class="card-header" id="headingFour">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" 
                                                data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                  강아지 배변용품
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled" data-type="5002">
                                                    <li><a class="choice" href="#!">기저귀/팬티</a></li>
                                                    <li><a class="choice" href="#!">배변봉투/집게</a></li>
                                                    <li><a class="choice" href="#!">배변유도제</a></li>
                                                    <li><a class="choice" href="#!">배변판</a></li>
                                                    <li><a class="choice" href="#!">배변패드</a></li>
                                                    <li><a class="choice" href="#!">탈취제/소독제</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="card">
                                        <div class="card-header" id="headingFive">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" 
                                                data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                  강아지 장난감/훈련
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled" data-type="5004">
                                                    <li><a class="choice" href="#!">노즈워크</a></li>
                                                    <li><a class="choice" href="#!">자동장난감</a></li>
                                                    <li><a class="choice" href="#!">장난감/토이</a></li>
                                                    <li><a class="choice" href="#!">훈련용품</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="card">
                                        <div class="card-header" id="headingSix">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" 
                                                data-bs-target="#collapseSix" aria-expanded="false" 
                                                aria-controls="collapseSix">
                                  고양이 간식
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled" data-type="5005">
                                                    <li><a class="choice" href="#!">동결건조 간식</a></li>
                                                    <li><a class="choice" href="#!">비스킷/스낵</a></li>
                                                    <li><a class="choice" href="#!">빵/케이크</a></li>
                                                    <li><a class="choice" href="#!">수제간식</a></li>
                                                    <li><a class="choice" href="#!">육포/건조간식</a></li>
                                                    <li><a class="choice" href="#!">음료</a></li>
                                                    <li><a class="choice" href="#!">캔/파우치</a></li>
                                                    <li><a class="choice" href="#!">캣닢/캣그라스</a></li>
                                                    <li><a class="choice" href="#!">통살/소시지</a></li>
                                                    <li><a class="choice" href="#!">트릿/스틱</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="card">
                                        <div class="card-header" id="headingSeven">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" 
                                                data-bs-target="#collapseSeven" aria-expanded="false" 
                                                aria-controls="collapseSeven">
                                 고양이 건강/관리용품
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled" data-type="5006">
                                                    <li><a class="choice" href="#!">고양이 유산균</a></li>
                                                    <li><a class="choice" href="#!">구강관리용품</a></li>
                                                    <li><a class="choice" href="#!">눈/귀 관리용품</a></li>
                                                    <li><a class="choice" href="#!">영양제</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="card">
                                        <div class="card-header" id="headingEight">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" 
                                                data-bs-target="#collapseEight" aria-expanded="false" 
                                                aria-controls="collapseEight">
                                 고양이 배변용품
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseEight" class="collapse" aria-labelledby="headingEight" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled" data-type="5007">
                                                    <li><a class="choice" href="#!">거름망형화장실</a></li>
                                                    <li><a class="choice" href="#!">매트/발판</a></li>
                                                    <li><a class="choice" href="#!">배변패드</a></li>
                                                    <li><a class="choice" href="#!">분변통/모래삽</a></li>
                                                    <li><a class="choice" href="#!">응고형모래</a></li>
                                                    <li><a class="choice" href="#!">자동화장실</a></li>
                                                    <li><a class="choice" href="#!">탈취제/소독제</a></li>
                                                    <li><a class="choice" href="#!">평판형화장실</a></li>
                                                    <li><a class="choice" href="#!">후드형화장실</a></li>
                                                    <li><a class="choice" href="#!">흡수형모래</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- end product grid left panel -->

                    <!-- start right panel section -->
                    <div class="col-lg-9 ps-lg-1-9">
                        <div class="row">
                              <div class="col-lg-12 col-md-auto">
                                  <div class="row">
                                      <div class="col-auto my-2 my-md-0">
                                      	<select id="categoryTypeSelector" class="form-control form-select" name="news_resion">
                                              <option selected value="0">카테고리 선택</option>
                                              <option value="5003">강아지 사료</option>
                                              <option value="5000">강아지 간식</option>
                                              <option value="5001">강아지 건강/관리용품</option>
                                              <option value="5002">강아지 배변용품</option>
                                              <option value="5004">강아지 장난감/훈련</option>
                                              <option value="5005">고양이 간식</option>
                                              <option value="5006">고양이 건강/관리용품</option>
                                              <option value="5007">고양이 배변용품</option>
                                           </select>
                                      </div>
                                      <div class="col-auto my-2 my-md-0" style="padding-left: 0;">
                                      	<select id="categoryValueSelector" class="form-control form-select">
                                              <option selected value="세부선택없음">카테고리를 먼저 선택해주세요</option>
                                           </select>
                                      </div>
                                  </div>
                              </div>
                          </div>

                        <div class="row product-grid" id="data-grid">
                    	</div>
                    
                    <div class="row mt-2-9 mt-lg-13">
	                     <div class="col-12">
	                         <div class="pagination text-small text-uppercase text-extra-dark-gray">
                                    <ul id="pagination">
                                        <li><a href="#!"><i class="fas fa-long-arrow-alt-left me-1 d-none d-sm-inline-block"></i> Prev</a></li>
                                        <li class="active"><a href="#!">1</a></li>
                                        <li><a href="#!">2</a></li>
                                        <li><a href="#!">3</a></li>
                                        <li><a href="#!">Next <i class="fas fa-long-arrow-alt-right ms-1 d-none d-sm-inline-block"></i></a></li>
                                    </ul>
                                </div>
	                     </div>
               		</div>
                    <!-- end right panel section -->

                </div>
            </div>
            </div>
        </section>

        <!-- CLIENTS
        ================================================== -->
        <div class="section-clients bg-light-gray">
            <div class="container">
                <div class="owl-carousel owl-theme clients" id="clients">
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-01.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-02.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-03.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-04.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-05.png"></div>
                    <div class="item"><img alt="..." src="${pageContext.request.contextPath }/resources/new_assets/img/partners/client-06.png"></div>
                </div>
            </div>
        </div>




<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->

<script>
	$(document).ready(function () {
		$('.navbar #shop').addClass('current');
		
		let checkCnt = 1;
		
		// 카테고리 대분류 선택 시 소분류 데이터 가져오기
		$('#categoryTypeSelector').on('change',function(){
			checkCnt -= 1;
			makeCategoryValue($(this).val(),'${param.categoryValue}', checkCnt);
		});
		
		let categoryType = $('#categoryTypeSelector').val();
		let categoryValue = $('#categoryValueSelector').val();
		let currentPage = 1;
		
		if('${param.categoryType}' != ''){
			categoryType = '${param.categoryType}';
			$('#categoryTypeSelector').val('${param.categoryType}').trigger('change');
			categoryValue = '${param.categoryValue}';
			currentPage = parseInt('${param.currentPage}', 10);
		}
		
		productPaging(categoryType, categoryValue, currentPage);
		
		//console.log('${productAllInfo}');
		
		// 상품페이지 페이징 처리
		$('#categoryValueSelector').on('change', function(){
			categoryType = $('#categoryTypeSelector').val();
			categoryValue = $('#categoryValueSelector').val();
			console.log(categoryValue);
			currentPage = 1;
			productPaging(categoryType, categoryValue, currentPage);
		});
		
		
		// 사이드바 메뉴 선택 시 화면 페이징
		$('.choice').on('click',function(){
			//alert("ok");
			
			let choiceType = $(this).closest('ul').data('type');
			let choiceValue = $(this).text();
			console.log(choiceType);
			console.log(choiceValue);
			currentPage = 1;
			productPaging(choiceType, choiceValue, currentPage);
			
		});
		
		//F5 클릭 시 최초 페이지로 이동
		$(document).on('keydown', function (e) {
	        // F5 키(새로고침) 감지
	        if (e.which === 116) {
	            e.preventDefault(); // 기본 새로고침 방지

	            // 특정 로직 처리
	            if (window.location.pathname === '/shop') {
	                // 원하는 작업 실행
	                location.href="/shop";
	            } else {
	                console.log('F5 detected on a different page.');
	            }
	        }
	    });
		
		
		// 하트 눌렀을때 관심상품으로 등록하기
		$('#data-grid').on('click', '.interest', function(){
			//console.log($(this).data('id'));
			
			$.ajax({
				url: '/shop/addInterest/'+$(this).data('id'),
				type: 'POST',
				success: function(response){
					//console.log(response);
					
					if(response == 0){
						Swal.fire({
			    			  title: '관심상품 등록완료!',
			    			  text: "마이페이지 관심상품에서 확인 가능합니다.",
			    			  icon: 'success',
			    			  confirmButtonColor: '#86bc42',
			    			  customClass: {
			    			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			    			  }
			   			});
					} else {
						Swal.fire({
			    			  title: '이미 등록된 관심상품',
			    			  text: "마이페이지 관심상품에서 확인 가능합니다.",
			    			  icon: 'warning',
			    			  confirmButtonColor: '#86bc42',
			    			  customClass: {
			    			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			    			  }
			   			});
					}
					
				},
				error: function(){
					alert("no");
				}
			});
		});
		
		
		
		
		
	});

</script>


<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
