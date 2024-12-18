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

	    <!-- 다음 버튼 -->
	    <style>
		.next-button {
		    padding: 10px 20px;
		    background-color: #4CAF50; /* 버튼 배경색 */
		    color: white; /* 글자색 */
		    border: none; /* 테두리 제거 */
		    border-radius: 4px; /* 모서리 둥글게 */
		    cursor: pointer; /* 커서 포인터로 변경 */
		    font-size: 16px; /* 폰트 크기 */
		    transition: background-color 0.3s; /* 배경색 전환 효과 */
		}
		
		.next-button:hover {
		    background-color: #45a049; /* 호버 시 배경색 변화 */
		}	    	    
	    </style>
	    <!-- 다음 버튼 -->
	    


   
	       	       
		
<!--====================================작성부=====================================-->






		<!-- APPLY FORM ================================================== -->
		<section class="bg-light">
		    <div class="container">
		        <div class="row justify-content-center">
		            <!-- 헤더 -->
		            <div class="image-container">
		                <img src="${pageContext.request.contextPath}/resources/registerH3.png" alt="회원가입 헤더" class="header-image">
		            </div>
		
		            <!-- start form section -->
		            <div class="col-md-11 col-lg-9">
		                <div class="border bg-white p-1-9 p-lg-2-3 p-xl-6 rounded">
		                    <div class="text-center mb-1-9">
		                        <div class="member-container">
		                            <img src="${pageContext.request.contextPath}/resources/mType.png" alt="회원유형" class="member-type">
		                            <h2 class="font-weight-600 mb-3">회원가입</h2>
		                        </div>
		                        <p class="mb-0">회원가입이 완료되었습니다.</p>
		                    </div>
		
		                    <hr>
		
		             
					            <div class="text-center mt-3">
					                <button type="button" class="next-button" onclick="redirectToLogin()">로그인 페이지로 이동 ></button> <!-- 버튼을 form 외부에 위치 -->
					            </div>		    
								    <script>
								    function redirectToLogin() {
								        window.location.href = '/login/customLogin'; // 실제 로그인 페이지의 URL로 변경
								    }
								    </script>				                                
		                </div>
		            </div>
		            <!-- end form section -->
		        </div>
		    </div>
		</section>






				

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
