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
                <h1>unicon 고객센터</h1>
            </div>
            <div class="col-md-12">
                <ul class="ps-0">
                    <li><a href="inquiry"><i class="ti-home"></i></a></li>
                    <li class="active"><a href="shop">쇼핑</a></li>
                </ul>
            </div>
        </div>	
    </div>
</section>




<section>
            <div class="container">
                <div class="section-heading">
                    <h4>쇼핑 관련 문의</h4>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div id="accordion" class="accordion-style">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                  	상품 반품 방법은 어떻게되나요?                               	
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#accordion" style="">
                                    <div class="card-body">
                                          <!-- 반품 요청 가능 기간 -->
									    <section>
									        <h2>전자상거래 소비자보호에 관한 법률에 따른 반품 요청</h2>
									        <p>반품 기간 이내에는 반품을 요청하실 수 있습니다.</p>
									        <p>※ 반품 배송비는 원인을 제공한 자가 부담하는 것을 원칙으로 합니다.</p>
									    </section>
									
									    <!-- 반품 절차 -->
									    <section>
									        <h2>반품을 원하시는 경우</h2>
									        <p>판매자(가맹점)에게 직접 연락하여 반품 사유, 배송 방법, 운송비를 협의해 주세요.</p>
									    </section>
									
									    <!-- 반품 접수 방법 -->
									    <section>
									        <h2>반품 접수 방법</h2>
									        <ol>
									            <li>
									                <strong> 결제내역 > 반품하려는 상품의 반품요청 버튼 클릭</strong>
									            </li>
									            <li>
									                <strong>반품신청 사유 선택 및 상세사유 입력</strong>
									                <ul>
									                    <li>사진 첨부를 원하는 경우 최대 3장까지 첨부 가능합니다.</li>
									                    <li>가로+세로+높이 = 120cm, 10kg 규격 초과 시 현장 수거 불가할 수 있습니다.</li>
									                    <li>강제 수거요청 시 판매자가 추가 비용을 별도로 청구할 수 있습니다.</li>
									                </ul>
									            </li>
									            <li>
									                <strong>상품 반송 신청하기</strong>
									                <ul>
									                    <li>
									                        <strong>발송하지 않은 경우</strong> 
									                        <p>'네, 수거해주세요.' 선택</p>
									                        <p>※ 자동 수거 예약이 불가한 경우, 판매자와 수거 협의를 직접 진행해 주세요.</p>
									                    </li>
									                    <li>
									                        <strong>이미 발송한 경우</strong>
									                        <p>'아니오, 나중에 직접 발송할게요.' 선택</p>
									                    </li>
									                </ul>
									            </li>
									            <li>
									                <strong>반품배송비 결제하기(구매자 귀책사유인 경우)</strong>
									                <ul>
									                    <li>
									                        
									                        <ul>
									                            <li>지금 결제(추가결제), 환불금 차감, 송금/동봉 중 선택 가능합니다.</li>
									                            <li>추가결제 시 포인트·머니, 신용카드, 휴대폰 결제가 가능합니다.</li>
									                            <li>
									                               	 송금/동봉 시 판매자 계좌를 확인하거나 상품 반송 시 택배 상자에 반품 비용을 동봉하세요.
									                            </li>
									                        </ul>
									                    </li>
									                    <li>
									                        
									                        <ul>
									                            <li>상품이 반송 완료되면 반품승인 처리 후 반품비용을 확인할 수 있습니다.</li>
									                            <li>판매자가 청구한 반품비용 결제 시 자동으로 차감되어 환불 처리됩니다.</li>
									                        </ul>
									                    </li>
									                </ul>
									            </li>
									        </ol>
									    </section>
									
									    <!-- 추가 정보 -->
									    <section>
									        <h2>추가 정보</h2>
									        <p>
									            ※ 동일 상품을 여러 개 구매한 경우, 네이버 장보기 서비스 중 특정 주문('초록마을', '올가')에 한해
									            일부 수량만 부분 반품 요청할 수 있습니다. 수량 단위로 취소/반품/교환이 가능한 대상은 순차적으로 확대 예정입니다.
									        </p>
									    </section>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                  		상품 취소/반품 환불 소요 기간은 어떻게 되나요?
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#accordion" style="">
                                    <div class="card-body">
                                       <h2>상품 취소/반품 환불 소요 기간 안내</h2>
									    <p>네이버페이 결제 상품을 취소 혹은 반품하신 경우, 결제수단에 따른 환불 방법 및 소요 기간은 아래와 같습니다.</p>
									
									    <!-- 환불 소요 기간 테이블 -->
									    <table border="1" cellspacing="0" cellpadding="8" style="width: 100%; border-collapse: collapse; text-align: left;">
									        <thead>
									            <tr>
									                <th>결제수단</th>
									                <th>환불 방법 및 소요 기간</th>
									            </tr>
									        </thead>
									        <tbody>
									            <tr>
									                <td>신용카드</td>
									                <td>취소 완료일부터 3~5영업일 이내 카드 결제 취소</td>
									            </tr>
									            <tr>
									                <td>체크카드</td>
									                <td>취소 완료일부터 3~5영업일 이내 카드 결제 취소</td>
									            </tr>
									            <tr>
									                <td>계좌 간편결제</td>
									                <td>취소 완료 즉시 환불<br>(회원탈퇴, 계좌삭제, 금융사 점검 및 장애 등 사유로 계좌입금 불가 시 환불정산액으로 적립)</td>
									            </tr>
									            <tr>
									                <td>무통장입금</td>
									                <td>
									                    - 본인계좌환불: 취소 완료일부터 1영업일 후 환불계좌로 입금<br>
									                    - 환불정산액 적립: 취소 완료 즉시 환불정산액으로 적립
									                </td>
									            </tr>
									            <tr>
									                <td>휴대폰 소액결제</td>
									                <td>
									                    - 결제 당월: 다음 달 휴대폰 요금에 청구되지 않도록 승인 취소<br>
									                    - 결제 익월: 즉시 환불정산액으로 적립
									                </td>
									            </tr>
									            <tr>
									                <td>포인트</td>
									                <td>즉시 재충전<br><a href="#">포인트 인출하기</a></td>
									            </tr>
									            <tr>
									                <td>포인트</td>
									                <td>즉시 재적립</td>
									            </tr>
									        </tbody>
									    </table>
									
									    <!-- 환불정산액 안내 -->
									    <h3>환불정산액으로 환불되는 경우</h3>
									    <ul>
									        <li>포인트 전환: 즉시 전환</li>
									        <li>계좌로 출금: 1영업일 후 등록한 본인명의 계좌로 입금</li>
									    </ul>
									    <p><a href="#">환불정산액 바로가기</a></p>
									
									    <!-- 추가 정보 -->
									    <p>
									        ※ 신용카드, 체크카드 환불 소요일 이후에도 환불되지 않을 경우, 카드사로 문의 부탁드립니다.<br>
									        ※ 영업일이란 주말/공휴일을 제외한 날을 뜻합니다.
									    </p>
       								</div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingThree">
                                    <h5 class="mb-0">
                                        <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                 	 애견 상품을 주문/결제 하고싶어요.
                                </button>
                                    </h5>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion" style="">
                                    <div class="card-body">
                                         <h2>유니콘 주문/결제 안내</h2>

									    <!-- 주문 가능 페이지 안내 -->
									    <p>
									         쇼핑몰의 상품 상세 페이지 또는 애견 상품 상세 페이지에서 옵션 및 기타 선택사항을 선택한 후 
									        <strong>구매하기</strong> 버튼(혹은 <strong>포인트 구매</strong> 버튼)을 클릭해 주세요.<br>
									        또는 상품을 장바구니에 담은 후 <strong>주문하기</strong> 버튼(혹은 <strong>구매하기</strong> 버튼)을 클릭하면 네이버페이 주문/결제 페이지로 연결됩니다.
									    </p>
									
									    <!-- 주문서 작성 방법 -->
									    <h3>주문서 작성 방법</h3>
									    <ol>
									        <li>
									            <strong>유니콘 회원이라면 로그인</strong>을 해주세요. 유니콘 회원이 아니라면 먼저 유니콘 약관 동의를 해주세요.		            
									        </li>
									        <li>
									                               주문할 상품(<strong>상품수량, 옵션, 금액, 할인금액, 배송비</strong> 등)을 확인해 주세요.
									        </li>
									        <li>
									            <strong>쿠폰 선택</strong> 및 <strong>포인트</strong>를 적용한 후, 최종 결제 금액을 확인해 주세요.
									            <small>(상품종류에 따라 쿠폰/포인트 사용이 불가할 수 있습니다.)</small>
									        </li>
									        <li>
									            <strong>배송지 정보</strong>(연락처, 주소, 배송메모 등) 및 주문자 정보를 확인해 주세요.
									        </li>
									        <li>
									            <strong>결제수단</strong>을 선택해 주세요.
									            <ul>
									                <li>계좌 간편결제</li>
									                <li>무통장입금</li>
									                <li>실시간계좌이체</li>
									                <li>네이버페이 포인트</li>
									                <li>네이버페이 머니</li>
									            </ul>
									            <small>현금영수증 신청정보도 입력해주세요. 단, 포인트 사용에 대한 현금영수증 발행은 현금영수증 대상 포인트만 해당합니다.</small>
									        </li>
									        <li>주문자 동의 항목에 동의해 주세요.</li>
									        <li>
									            <strong>결제하기</strong> 버튼을 클릭하면 결제화면이 노출되고 결제가 진행됩니다.
									            <small>(이용하시는 결제수단에 따라 노출되는 결제화면이 상이할 수 있습니다.)</small>
									        </li>
									        <li>
									                                결제가 정상적으로 이루어지면 <strong>주문완료</strong> 페이지로 이동합니다.<br>
									            <small>'주문완료' 페이지에서는 결제정보 및 그 외 입력한 정보들을 확인할 수 있습니다.</small>
									        </li>
									    </ol>
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
