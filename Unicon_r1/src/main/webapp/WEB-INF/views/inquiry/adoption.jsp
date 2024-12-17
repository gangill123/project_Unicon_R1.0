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
</style>


</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<!-- start page title section -->
<section class="page-title-section bg-primary">
    <div class="container">
		
        <div class="row">
            <div class="col-md-12">
                <h1>Unicorn 고객센터</h1>
            </div>
            <div class="col-md-12">
                <ul class="ps-0">
                   <li><a href="inquiry"><i class="ti-home"></i></a></li>
                    <li class="active"><a href="adoption">입양</a></li>
                </ul>
            </div>
        </div>
	
    </div>
</section>
 <!-- end page title section -->  


<section>
            <div class="container">
                <div class="section-heading">
                    <h4>입양 관련 문의</h4>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div id="accordion" class="accordion-style">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                  	강아지입양은 어디서,어떻게 받아야하나요?                                 	
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#accordion" style="">
                                    <div class="card-body">
                                         <h1>안녕하세요. 동물이 행복한 세상 <span>Unicon</span>입니다.</h1>
        								<p>강아지분양을 받기 위해선 먼저 어떤 강아지를 선택할 것인지를 정해야 해요! 외모도 각기 다르지만 강아지 종류는 흔히 크기에 따라  소형견, 중형견, 대형견으로 나뉘는데요.</p>
                                    
                                       <section>
									        <h2>소형견</h2>
									        <p>소형견 종류로는 포메라니안, 비숑프리제, 말티즈, 푸들, 치와와, 시츄, 요크셔테리어, 닥스훈트, 말티푸, 몰키, 폼스키, 이탈리안그레이하운드, 퍼그 등이 있어요. 작고 귀여운 크기와 외형이 특징인 소형견 아이들은 공간의 제한이 적고 일반적으로 가장 흔히 강아지분양 시 선택되는 아이들입니다. 걷는 모습만 봐도 심장이 아플만큼 사랑스러운 천사들이죠.</p>
									        <a href="#">소형견 더 알아보기 ></a>
									    </section>
									
									    <section>
									        <h2>중형견</h2>
									        <p>다음은 중형견 종류인데요. 대표적으로 스피츠, 시바견(시바이누), 웰시코기, 프렌치불독, 비글, 코카스페니얼 등이 있습니다. 중형견은 너무 크지도 작지도 않은 적당한 체구와 귀여우면서도 늠름한 외형을 가지고 있어 다양한 곳에서 캐릭터로도 자주 쓰일만큼 많은 사랑을 받고 있어요. 대형견의 크기는 부담스럽지만 소형견은 너무 작다고 느껴지신다면 중형견이 딱 좋은 크기로 느껴지실 거예요.</p>
									        <a href="#">중형견 더 알아보기 ></a>
									    </section>
									
									    <section>
									        <h2>대형견</h2>
									        <p>마지막으로 대형견 종류를 알려드릴게요. 대형견은 래브라도리트리버, 골든리트리버, 허스키, 보더콜리, 사모예드, 버니즈마운틴, 잉글리쉬불독, 알레스카 말라뮤트, 도베르만 등이 있는데요. 존재만으로도 듬직하지만 큰 체구와 다르게 귀여움과 사랑스러움이 가득한 아이들이죠. 활동량이 많고 식사량도 많지만 대형견만의 치명적인 매력이 엄청나답니다.</p>
									        <a href="#">대형견 더 알아보기 ></a>
									    </section>
									
									    <section>
									        <h2>그렇다면, 강아지분양은 어디서 어떻게 받는 것이 좋을까요?</h2>
									        <ul>
									            <li>1. 정식 허가된 업체를 통해 알아보셔야 합니다. 간혹 허가받지 않은 곳을 통해 분양받을 경우 품종이나 건강에 대해 보장받지 못하고 이에 대해 제대로된 보상을 받지 못할 수 있기 때문입니다.</li>
									            <li>2. 규모가 크고 관리가 잘 되는 곳으로 알아보셔야 합니다. 보통 작은 규모에서 관리가 잘 되지 않는 곳은 아이들이 제대로 케어받지 못한 경우가 많고 다양한 아이들을 만나보기 어렵습니다.</li>
									            <li>3. 전문적인 곳을 이용하세요. 자체 또는 연계 병원이 존재하는지, 아이들을 어떻게 케어하는지, 사후관리가 가능한지, 교육이 가능한지 등 반려동물에 대하여 다양한 관리 및 서비스가 운영되고 있는지 비교해보시는 것이 좋습니다.</li>
									            <li>4. 다양한 혜택이 있는지 확인해보세요. 같은 값을 주고도 단순히 강아지분양만으로 끝나는 경우가 있는 반면, 같은 값으로도 다양한 혜택을 제공받아 반려생활에 큰 도움이 될 수 있는 부분을 인지하고 여러 혜택들을 함께 받아보는 것이 좋습니다.</li>
									        </ul>
									    </section>
									
									    <section>
									        <h2>유니콘 소개</h2>
									        <p>저희 유니콘은 정식 허가된 반려동물 전문 업체로 전국 31곳의 지점과 홈서비스를 운영하며 최대 60일간의 건강 보장을 제공합니다.</p>
									        <ul>
									            <li>분양 시 기초건강검진 및 훈련권 제공</li>
									            <li>상시 수의사 6명 이상 근무</li>
									            <li>전문 훈련사와 관리사들이 직접 케어</li>
									            <li>분양 후 의료비 할인 및 다양한 혜택</li>
									        </ul>
									        <p>사랑스러운 아이들을 만나보고 행복한 반려생활을 시작해보세요!</p>
									    </section>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                  		분양 후 건강보장 기간은 어떻게 되나요?
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion" style="">
                                    <div class="card-body">
                                        <section>
                                        <p>A. 유니콘의 건강보장 기간은 최대 150일입니다.
										   <br>
										       통상 15일간 건강이 보장되는 타사와 달리, 약 10배의 기간을 더 보장해 드리고 있습니다.
										   <br>
										       강아지분양 ! 더욱 안전하고 믿을 수 있는 유니콘에서 시작해보세요.
										   <br>
										   * 건강보장 기간은 기본 15일이 제공되며, 특약가입 시 최대 150일까지 보장, 연장됩니다.
										   </p>
										 </section>  
       								</div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingThree">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                 	 예약 후 방문할 수 있나요?
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion" style="">
                                    <div class="card-body">
                                       <section>
                                       <p> A. 유니콘에서는 편리하고 쾌적한 이용 서비스를 제공하기 위해
                                       		<br>
									       '방문예약' 서비스를 진행하고 있습니다.
									       	<br>									
									       	방문예약은 아래 링크를 통해 쉽고 빠른 신청이 가능하며,
									       	<br>
									    	사전 방문예약자에 한하여
									    	<br>									
									      	'FOR DOG' 1. 퍼피클래스 + 멤버십카드 + 펫플칩 / 2. 퍼피클래스 + 딜리버리  혜택
									      	<br>
									      	'FOR CAT' 1.세정제 3종 세트 + 멤버십카드 + 펫플칩 / 2, 세정제 3종 세트 + 딜리버리와 같은
									      	<br>									
									      	혜택을 제공해드립니다.
									      	<br>
									      * 딜리버리는 이송 또는 홈서비스 이용 시 제공해 드립니다.
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
