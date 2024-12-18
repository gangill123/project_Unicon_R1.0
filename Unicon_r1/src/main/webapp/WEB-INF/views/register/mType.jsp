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
		
		<!-- 일반,쇼핑몰,센터 -->
	    <style>
	    .header-1 {
	            display: flex;
	            justify-content: center; /* 중앙 정렬 */
	            align-items: center;
	            margin-top : 30px;
	            margin-bottom: 30px;
	        }
	        
        .tab-1 {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 5px;
            border-radius: 4px;
            background-color: #ffffff; /* 기본 배경색을 하얀색으로 변경 */
            color: #555;
            cursor: pointer;
            border: 1px solid #d0d0d0; /* 얇은 회색 테두리 추가 */
        }
	        
	        .tab-1.active {
	            background-color: #4CAF50;
	            color: white;
	        }
	    </style>
		<!-- 일반,쇼핑몰,센터 -->
		
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
	    </style>
	    <!-- info1 -->
	       	    
	    
	    
		
<!--====================================작성부=====================================-->






		<!-- APPLY FORM ================================================== -->
		<section class="bg-light">
		    <div class="container">
		        <div class="row justify-content-center">
		            <!-- 헤더 -->
		            <div class="image-container">
		                <img src="${pageContext.request.contextPath}/resources/registerH.png" alt="회원가입 헤더" class="header-image">
		            </div>
		
		            <!-- start form section -->
		            <div class="col-md-11 col-lg-9">
		                <div class="border bg-white p-1-9 p-lg-2-3 p-xl-6 rounded">
		                    <div class="text-center mb-1-9">
		                        <div class="member-container">
		                            <img src="${pageContext.request.contextPath}/resources/mType.png" alt="회원유형" class="member-type">
		                            <h2 class="font-weight-600 mb-3">회원가입</h2>
		                        </div>
		                        <p class="mb-0">가입하려는 회원의 유형을 <strong>선택</strong>해주세요.</p>
		                    </div>
		
		                    <hr>
		
		                    <form class="quform" action="quform/apply-job.php" method="post" enctype="multipart/form-data">
		                        <div class="quform-elements">
		                            <div class="row">
		                                <div class="header-1">
		                                    <div>
		                                        <div class="tab-1 active" data-type="general">일반 회원</div>
		                                        <div class="tab-1" data-type="shops">쇼핑몰 관리자</div>
		                                        <div class="tab-1" data-type="inst">보호 센터</div>
		                                    </div>
		                                </div>
		                                <script>
		                                    document.addEventListener('DOMContentLoaded', () => {
		                                        // 탭 요소 선택
		                                        const tabs = document.querySelectorAll('.tab-1');
		                                        const nextButton = document.querySelector('.next-button'); // 버튼 선택
		
		                                        // 각 탭에 클릭 이벤트 추가
		                                        tabs.forEach(tab => {
		                                            tab.addEventListener('click', () => {
		                                                // 모든 탭에서 active 클래스 제거
		                                                tabs.forEach(t => t.classList.remove('active'));
		                                                // 클릭한 탭에 active 클래스 추가
		                                                tab.classList.add('active');
		                                            });
		                                        });
		
		                                        // 다음 버튼 클릭 이벤트
		                                        nextButton.addEventListener('click', () => {
		                                            const activeTab = document.querySelector('.tab-1.active');
		                                            const userType = activeTab.getAttribute('data-type');
		
		                                            // 사용자 유형에 따라 페이지 이동
		                                            switch (userType) {
		                                                case 'general':
		                                                    window.location.href = '/register/mRegister4'; // 일반회원 페이지
		                                                    break;
		                                                case 'shops':
		                                                    window.location.href = '/register/sRegister'; // 쇼핑몰 관리자 페이지
		                                                    break;
		                                                case 'inst':
		                                                    window.location.href = '/register/iRegister'; // 보호센터 페이지
		                                                    break;
		                                                default:
		                                                    alert('회원 유형을 선택해주세요.');
		                                            }
		                                        });
		                                    });
		                                </script>
		
		                                <div class="info-tip">
		                                    <p><strong>사업자/센터 가입 Tip</strong></p>
		                                    <div class="if_first">사업자로 온라인 판매가 처음이라면></div>
		                                </div>
		                                <div class="info-section">
		                                    <ul>
		                                        <li>사업자등록을 하신 경우, <strong>사업자등록번호 입력을 통해</strong> 쇼핑몰관리자로 가입이 가능합니다.</li>
		                                        <li>쇼핑몰 관리자/보호센터로 가입할 경우, 가입 심사를 위한 <strong>필수 서류를 제출하셔야 가입이 됩니다.</strong></li>
		                                        <li>사업자로 유니콘을 이용하기 위해서는 통신판매업 신고가 필수입니다. 아직 신고하지 못하신 분은 위 '사업자로 온라인 판매가 처음이라면' 도움말을 꼭 확인해 주세요.</li>
		                                    </ul>
		                                </div>
		                            </div>
		                        </div>
		                    </form>
		                </div>
		            </div>
		            <!-- end form section -->
		            <div class="text-center mt-3">
		                <button type="button" class="next-button">다음 ></button> <!-- 버튼을 form 외부에 위치 -->
		            </div>
		        </div>
		    </div>
		</section>






				

<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
