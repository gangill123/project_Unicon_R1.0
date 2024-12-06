<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->
<style>



/* 제목 스타일 */
h1 {
    font-size: 2rem;
    color: #4CAF50;
    margin-bottom: 10px;
}

h1 span {
    color: #ff9800;
}

h2 {
    font-size: 1.5rem;
    margin-top: 20px;
    color: #2196F3;
}

/* 단락 스타일 */
p {
    font-size: 1rem;
    margin-bottom: 15px;
}

/* 링크 스타일 */
a {
    color: #2196F3;
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    text-decoration: underline;
}

/* 리스트 스타일 */
ul {
    margin: 15px 0;
    padding: 0;
    list-style-type: disc;
    padding-left: 20px;
}

li {
    margin-bottom: 10px;
}

/* 카드 스타일 */
.card-body {
    background: #f1f1f1;
    padding: 20px;
    border-radius: 5px;
}

/* 섹션 스타일 */
section {
    margin-bottom: 20px;
    padding: 15px;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

section h2 {
    border-bottom: 2px solid #2196F3;
    padding-bottom: 5px;
    margin-bottom: 15px;
}



section:last-of-type p {
    color: #333;
    font-weight: bold;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    h1 {
        font-size: 1.8rem;
    }
    h2 {
        font-size: 1.3rem;
    }
    p, li {
        font-size: 0.9rem;
    }
}



/* 메인 타이틀 스타일 */
.main-title {
    font-size: 2rem;
    font-weight: bold;
    margin: 60px 0 20px 200px;
    color: black;       
}

</style>

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

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
                    <li class="active"><a href="community">커뮤니티</a></li>
                </ul>
            </div>
        </div>
	
    </div>
</section>



<section>
            <div class="container">
                <div class="section-heading">
                    <h4>커뮤니티 관련 문의</h4>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div id="accordion" class="accordion-style">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                  	커뮤니티 가이드라인이란?                                 	
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#accordion" style="">
                                    <div class="card-body">
                                         <section style="margin-bottom: 20px;">
									        <h2 style="color: #2196F3;">커뮤니티 가이드라인이란 무엇인가요?</h2>
									        <p>Unicon은 사용자가 자유롭게 자신을 표현하고 영감을 얻는 동시에 안전한 공간을 유지하려고 합니다.</p>
									        <ul>
									            <li><strong>커뮤니티 가이드라인</strong>: Unicon에서 허용되는 활동과 허용되지 않는 활동에 대한 정책을 명시.</li>
									            <li><strong>이용 약관과의 차이</strong>: 이용 약관은 Unicon과 사용자 간의 계약서로, Unicon과 사용자의 의무를 설명합니다.</li>
									        </ul>
									    </section>
									
									    <section style="margin-bottom: 20px;">
									        <h2 style="color: #2196F3;">커뮤니티 가이드라인에서는 어떤 내용을 다루나요?</h2>
									        <ul>
									            <li><strong>지적 재산권</strong>: 공유하는 콘텐츠에 대한 게시 권한을 확인하세요.</li>
									            <li><strong>적절한 이미지</strong>: 나체 이미지는 허용되지 않지만, 일부 예외 사항(예: 모유 수유, 예술 작품)이 있습니다.</li>
									            <li><strong>스팸</strong>: 원치 않는 이메일, 댓글, 좋아요 등의 스팸 활동은 허용되지 않습니다.</li>
									            <li><strong>불법 콘텐츠</strong>: 테러, 조직 범죄, 혐오 단체 지지, 무기 및 약물 판매는 금지됩니다.</li>
									            <li><strong>혐오 발언, 따돌림 및 학대</strong>: 폭력 위협 및 혐오 발언 등은 삭제됩니다.</li>
									            <li><strong>자해</strong>: 자해를 미화하거나 유도하는 콘텐츠는 허용되지 않습니다.</li>
									            <li><strong>폭력적인 이미지</strong>: 과도하게 폭력적인 콘텐츠는 삭제될 수 있습니다.</li>
									        </ul>
									    </section>
									
					
									     <!-- 섹션: 가이드라인 결정 주체 -->
									    <section style="margin-bottom: 20px;">
									        <h2 style="color: #2196F3;">커뮤니티 가이드라인에서 다루는 내용을 결정하는 사람은 누구인가요?</h2>
									        <p>Unicon은 강아지를 사랑하는 다양한 사람들이 함께 만들어가는 공간으로, 다양한 관점에서 신중히 고심하여 정책을 결정합니다.</p>
									    </section>
									
									    <!-- 섹션: 가이드라인 위반 신고 -->
									    <section style="margin-bottom: 20px;">
									        <h2 style="color: #2196F3;">Unicon에서 본 콘텐츠가 가이드라인을 위반하는 것 같습니다. 어떻게 해야 하나요?</h2>
									        <ul>
									            <li>가이드라인 위반 게시물을 발견하면 제공된 <strong>신고 옵션</strong>을 사용해 신고하세요.</li>
									            <li>관리 팀에서 24시간 연중무휴로 신고된 콘텐츠를 검토하고 삭제합니다.</li>
									            <li>계정이 없는 경우에도 신고서를 통해 신고할 수 있습니다.</li>
									        </ul>
									    </section>
									
									    <!-- 섹션: 가이드라인 위반 시 조치 -->
									    <section style="margin-bottom: 20px;">
									        <h2 style="color: #2196F3;">커뮤니티 가이드라인을 위반하면 어떻게 되나요?</h2>
									        <p>Unicon은 정책을 위반한 콘텐츠를 삭제하며, 반복적으로 위반할 경우 계정이 비활성화될 수 있습니다.</p>
									        <p>필요한 경우, 공공 안전에 위협이 된다고 판단되면 사법 당국과 협력할 수 있습니다.</p>
									    </section>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                  		Unicon에서 팔로워를 늘릴 수 있는 가장 좋은 방법은 뭔가요?
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion" style="">
                                    <div class="card-body">
                                    <section>
                                     <p>Unicon에서 팔로워를 늘리는 방법은 목표가 무엇인지, 
                                     	그리고 여러분과 타겟 대상이 좋아하는 콘텐츠 유형이 무엇인지에 따라 여러 가지 방법이 있습니다. 
                                     	동영상을 선호한다면 팔로워를 늘리는 가장 효과적인 방법은 매력적인 릴스를 꾸준히 만드는 것입니다. 
                                     	릴스는 새로운 타겟 대상에 다가갈 수 있는 가장 좋은 수단이기 때문입니다. 
                                     	사진을 통해 개성을 표현하는 경우 피드 게시물이나 슬라이드를 지속적으로 공유하면 타겟 대상과 소통할 수 있어 콘텐츠의 도달 범위를 넓힐 수 있습니다.
                                     	 다양한 방법을 테스트하고 반복하여 어떤 방법이 가장 적합한지 알아내는 것이 중요합니다.
                                     </p>
                                     </section>
       								</div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingThree">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                 	유명인, 은행 및 기관을 사칭하는 메시지를 수신했어요. 어떻게 대처해야 하나요?
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion" style="">
                                    <div class="card-body">
                                     
									    <section>
									        <h2>유니콘은 이용자 보호를 위하여 사이버 금융범죄에 대해 엄중하게 대응하고 있습니다.</h2>
									        
									        <p>
									            유니콘 이용자의 프라이버시를 보호하기 위해 이용자 간 주고받는 메시지 및 콘텐츠를 열람하지 않습니다.
									            다만, 이용자가 서비스 내 '신고하기' 기능을 통해 문제가 되는 메시지, 콘텐츠 등을 신고하는 경우,
									            이를 바탕으로 법령, 약관 및 운영정책 위반 여부를 판단하고 이용 제한 조치를 취합니다.
									        </p>
									    </section>
									
									    <!-- 섹션: 수사기관 및 금융기관 사칭 사기 -->
									    <section>
									        <h2>1. 수사기관 및 금융기관 사칭 사기</h2>
									        <ul>
									            <li>
									                경찰, 검찰, 금융감독원, 우체국, 서민금융진흥원, 은행 등 기관의 정보를 프로필로 설정하거나
									                해당 기관임을 주장하는 메시지를 수신할 경우 사기/사칭을 의심하세요.
									            </li>
									            <li>
									                상대방으로부터 URL을 수신하여 출처를 알 수 없는 링크나 버튼을 누를 경우,
									                악성 앱이 설치될 위험이 있으니 주의하세요.
									            </li>
									            <li>
									                상품 가입 및 수사를 미끼로 과도한 개인정보나 금품을 요구하는 경우 즉시 대화를 중단하고
									                사기 행위를 신고하세요.
									            </li>
									        </ul>
									    </section>
									
									    <!-- 섹션: 유명인 사칭 투자 사기 -->
									    <section>
									        <h2>2. 유명인, 연예인 사칭 투자 사기</h2>
									        <ul>
									            <li>유명인의 권유, 고수익 후기 등 불법 투자 관련 홍보글에 주의하세요.</li>
									            <li>
									                투자 자문 및 투자 대행을 이유로 금전을 요구하는 경우 즉시 대화를 중단하고
									                사기 행위를 신고하세요.
									            </li>
									        </ul>
									    </section>
									
									    <!-- 섹션: 로맨스 스캠 -->
									    <section>
									        <h2>3. 로맨스 스캠</h2>
									        <ul>
									            <li>이성적인 친밀감을 형성하여 금전을 요구하는 메시지에 주의하세요.</li>
									        </ul>
									    </section>
									
									    <!-- 섹션: 아르바이트 및 부업 사기 -->
									    <section>
									        <h2>4. 아르바이트 및 부업 사기</h2>
									        <ul>
									            <li>
									                재택, 고수익, 공동구매 아르바이트를 이유로 금전을 요구하거나 물품 구매를 강요하는 경우,
									                즉시 대화를 중단하고 사기 행위를 신고하세요.
									            </li>
									            <li>
									                해당 업체가 공정거래위원회의 통신판매 사업자로 등록되었는지,
									                상호 및 사업자등록번호가 일치하는지 확인하세요.
									            </li>
									        </ul>
									    </section>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</section>


<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
