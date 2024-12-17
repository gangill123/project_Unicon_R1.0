<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->
<style>

/* 메인 타이틀 스타일 */
.main-title {
    font-size: 2rem;
    font-weight: bold;
    margin: 60px 0 20px 200px;
    color: black;       
}



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
<section class="page-title-section bg-primary">
    <div class="container">
		
        <div class="row">
            <div class="col-md-12">
                <h1>Unicorn 고객센터</h1>
            </div>
            <div class="col-md-12">
                <ul class="ps-0">
                    <li><a href="inquiry"><i class="ti-home"></i></a></li>
                    <li class="active"><a href="etc">기타 문의</a></li>
                </ul>
            </div>
        </div>	
    </div>
</section>

<section>
            <div class="container">
                <div class="section-heading">
                    <h4>기타 관련 문의</h4>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div id="accordion" class="accordion-style">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                  	나를 사칭한 사람이 채팅에서 가족, 지인에게 메시지를 보내서 금전요구를 했어요. 어떻게 신고하나요?                         	
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#accordion" style="">
                                    <div class="card-body">
						                <section>
						                    <h2>유니콘 고객센터 안내</h2>
  
									    <p>
									        유니콘 고객센터가 신속히 도움을 드리도록 하겠습니다.
									    </p>
									
									    <p>
									        유니콘 커뮤니티 내 채팅으로 사칭 및 악용하여 피싱을 시도하는 사례가 있습니다.
									    </p>
									
									    <p>
									        메시지 신고만으로 피싱을 의심하여 제한 조치 후 유지하기는 어려우나, 
									        다른 누군가가 나를 사칭하고 있음을 스크린샷으로 증빙할 경우 지체 없이 제한 조치를 취하고 있습니다.
									    </p>
									
									    <p>
									        ‘<strong>신고/문의</strong>’ 기능을 통한 메시지 신고가 진행되어야 피싱 행위 당사자를 카카오에서 찾을 수 있으며, 
									        카카오는 '권리침해를 근거'로 문제의 이용자를 제한하기 위해서는 본인 요청 증빙이 필요합니다.
									    </p>
									
									    <h3>문의 방법</h3>
									    <p>
									       카테고리를 기타 문의로 하여 스크린샷과 함께 첨부해주시면 검토후 조치 하겠습니다, 
									        <a href="write">문의하러 가기</a> 링크로 접수해 주세요.
									    </p>
										</section>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                  		고객센터 상담 시간이 궁금해요!
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion" style="">
                                    <div class="card-body">
                                    <section>
									    <h2>유니콘 고객센터 근무시간 안내</h2>
									    
									    <p>
									        네이버페이 고객센터 전화 상담(1588-1234)은 <strong>월~금요일</strong>, 
									        오전 상담 <strong>9시~12시</strong> / 오후 상담 <strong>13시~18시</strong>
									        (<em>점심시간 12시~13시</em>)입니다.
									    </p>
									
									    <p>
									        점심시간 12시~13시에는 <strong>긴급성 상담만 가능</strong>하고, 일반 상담은 중단되므로 
									        온라인 고객센터를 통해 도움말을 확인하시거나 메일 문의 접수를 부탁드립니다.
									    </p>
									
									    <p>
									        <strong>긴급 상담</strong>: 서비스 및 결제 등 장애, 불법(음란) 게시물 신고, 결제/계정 도용 등
									    </p>
									
									    <p>
									        다소 불편한 점이 있으시더라도 따뜻한 마음으로 이해 부탁드립니다.
									    </p>
									
									    <p>
									        통화가 어려우실 경우 유니콘 고객센터 > <a href="https://example.com/contact">문의하기</a>를 통해 문의해 주시면 신속하게 답변드릴 수 있도록 노력하겠습니다.
									    </p>
									
									    <p>
									        ▶ <a href="inquiry">유니콘 고객센터 바로가기</a>
									    </p>
							    	</section>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingThree">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                 	 대량 구매 및 제휴를 원해요!
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion" style="">
                                    <div class="card-body">
                                    <section>
                                       <p> 대량 구매 및 제휴를 원하실 경우 </p>
                                       <p> rkddlf3157@naver.com로 필요 수량 및 연락처 등 기재하여  문의 주시면 회신드리겠습니다.</p>
                                    </section>
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


<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
