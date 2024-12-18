<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>유니콘</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- plugins:css -->
<!-- dataTables.css -->
<!-- Font-Awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="/resources/admin/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="/resources/admin/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
<style type="text/css">
/*=============== badge css ===============*/
/* <label class="badge badge-warning">대기중</label> */
/* <label class="badge badge-primary">모집중</label> */
/* <label class="badge badge-danger">상담중</label> */
/* <label class="badge badge-success">입양완료</label> */
/* <label class="badge badge-secondary">종료</label> */
/*=============== badge css ===============*/

/*=============== 테이블 css ===============*/

/*=============== 바탕 css ===============*/
.card {
	border-radius: 2rem;
}

.card-body {
	min-height: 80vh;
	height: auto;
	color: #555;
}

/*=============== 바탕 css ===============*/

/*=============== search-box css ===============*/
.box {
	background: #f1f1f1;
	margin-bottom: 1rem;
	flex-direction: column;
}

.search-box {
	align-items: center;
	display: flex;
	width: 100%;
}

.search-box>div:first-child {
	width: 13%;
}

.search-select-box {
	display: flex;
	margin-bottom: 0.4rem;
	gap: 6rem;
}

.search-select-box>div:first-child {
	width: 30%;
}

.search-select-box select {
	width: 10rem;
	padding: 0.25rem;
	border: 1px solid #dbdde2;
	font-size: 13px;
}

.order-btn {
	border: 1px solid #dbdde2;
	background-color: white;
	padding: 0 0.6rem;
	font-size: 12px;
}

.display-flex {
	display: flex;
}

.btn-box {
	display: flex;
	margin-right: 3.4rem;
	height: 2.3rem;
}

.date-input input {
	border: 1px solid #dbdde2;
	padding: 4px 8px 4px 8px;
	font-size: 14px;
	transition: border 0.1s;
}
/* 고객 리스트 컨테이너 */
.customer-list-container {
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* 테이블 셀 스타일 */
.customer-table-header .table-cell, .customer-list .table-row div {
	box-sizing: border-box;
	border-right: 1px solid #ddd;
}

.customer-table-header .table-cell:last-child, .customer-list .table-row div:last-child
	{
	border-right: none;
}

/* 리스트 영역 */
.customer-list {
	max-height: 300px;
	overflow-y: auto;
}

/* 스크롤바 스타일 */
.customer-list::-webkit-scrollbar {
	width: 10px;
}

.customer-list::-webkit-scrollbar-thumb {
	background-color: #bbb;
	border-radius: 4px;
}

.customer-list::-webkit-scrollbar-track {
	background: #f9f9f9;
}
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 첫 번째 텍스트 영역
						$('#textarea1').on('input', function() {
							let currentLength = $(this).val().length;
							$('#counter1').text(currentLength + '/3000');
						});

						// 두 번째 텍스트 영역
						$('#textarea2').on('input', function() {
							let currentLength = $(this).val().length;
							$('#counter2').text(currentLength + '/30');
						});

						$('#submitBtn')
								.on(
										'click',
										function(e) {
											e.preventDefault(); // 기본 동작 방지

											// textarea1 검사
											if ($('#textarea1').val().trim() === '') {
												alert('구매자ID를 입력해 주세요.');
												return;
											}

											// textarea2 검사
											if ($('#textarea2').val().trim() === '') {
												alert('제한사유를 입력해 주세요.');
												return;
											}

											// 라디오 버튼 검사
											if ($('input[name="report"]:checked').length === 0) {
												alert('라디오 버튼을 선택해 주세요.');
												return;
											}

											// 조건 모두 통과 시 AJAX 요청
											const data = {
												member_id : $('#textarea1')
														.val(),
												comment : $('#textarea2').val(),
												reason : $(
														'input[name="report"]:checked')
														.val()
											};

											$
													.ajax({
														url : '/store/blackConsumer', // 서버의 URL 입력
														type : 'POST',
														data : JSON
																.stringify(data),
														contentType : 'application/json',
														success : function(
																response) {
															alert('성공적으로 등록되었습니다.');
															// 텍스트 영역 및 라디오 버튼 초기화
															$('#textarea1')
																	.val('');
															$('#textarea2')
																	.val('');
															$(
																	'input[name="report"]')
																	.prop(
																			'checked',
																			false);
														},
														error : function() {
															alert('데이터 전송에 실패했습니다. 다시 시도해 주세요.');
														}
													});

										});
						// 조회 버튼 클릭 이벤트
						$('#fetchCustomerList')
								.on(
										'click',
										function() {
											$
													.ajax({
														url : '/store/blackConsumers', // 서버의 API URL
														type : 'GET', // HTTP 메서드 (GET 요청)
														dataType : 'json', // 반환 데이터 타입
														success : function(data) {
															const $listContainer = $('.customer-list'); // 데이터가 추가될 리스트 컨테이너
															$listContainer
																	.empty(); // 기존 데이터 제거

															// 총 건수 업데이트
															$('.customer-count')
																	.text(
																			'[총 '
																					+ data.length
																					+ ' 건]');

															// 데이터 동적 추가
															data
																	.forEach(function(
																			item) {
																		var row = '<div class="table-row" style="display: flex; border-bottom: 1px solid #ddd; text-align: center;">'
																				+ '<div style="width: 10%; padding: 0.5rem;"><input type="checkbox" class="row-checkbox"></div>'
																				+ '<div style="width: 30%; padding: 0.5rem;">'
																				+ item.member_id
																				+ '</div>'
																				+ '<div style="width: 30%; padding: 0.5rem;">'
																				+ item.reason
																				+ '</div>'
																				+ '<div style="width: 30%; padding: 0.5rem;">'
																				+ item.comment
																				+ '</div>'
																				+ '</div>';
																		$listContainer
																				.append(row);
																	});
														},
														error : function() {
															alert('데이터를 불러오는 데 실패했습니다. 다시 시도해 주세요.');
														}
													});
										});

						// 체크박스 이벤트: 체크 시 해당 줄 삭제
						$(document)
								.on(
										'change',
										'.row-checkbox',
										function() {
											if ($(this).is(':checked')) {
												$(this).closest('.table-row')
														.remove();

												// 남은 건수 업데이트
												var remainingCount = $('.customer-list .table-row').length;
												$('.customer-count').text(
														'[총 ' + remainingCount
																+ ' 건]');
											}
										});
					});
</script>
</head>
<body>
	<div class="container-scroller">
		<!-- partial:navbar.jsp -->
		<%@ include file="/WEB-INF/views/inc/admin_navbar_store.jsp"%>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:sidebar.jsp -->
			<%@ include file="/WEB-INF/views/inc/admin_sidebar_store.jsp"%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">판매방해 고객관리</h4>
									<div class="dropdown-divider"
										style="width: 100%; margin: 1.5rem 0;"></div>
									<ul>
										<li>판매방해 고객이란, 판매자님 상품을 구매 의사없이 반복구매 후 취소하는 등 판매활동을 방해하는
											고객을 의미합니다.</li>
										<li>판매방해 고객의 구매를 제한하기 위해서는 해당 고객ID를 판매방해 고객으로 등록하시면 판매자님의
											모든 채널에서 상품 구매가 제한됩니다.</li>
										<li>판매방해 고객 ID는 최대 1,000개 (1회 등록 시 최대 100개)까지 등록하실 수 있으며,
											해제를 원하는 경우 ‘해제하기’를 통해 리스트에서 삭제하실 수 있습니다.</li>
									</ul>
									<div
										style="width: 100%; text-align: start; border-left: 2px solid; padding-left: 6px;">
										<h5>등록하기</h5>
									</div>
									<div class="display-flex box" style="font-size: 13px">
										<div>
											<div class="display-flex"
												style="justify-content: space-around; height: 11.3rem;">
												<!-- 첫 번째 섹션 -->
												<div
													style="min-width: 10%; border: 1px solid #ebebeb; border-right: none; background: #fcfcfc;">
													<h5 style="margin-top: 0.7em; margin-left: 1rem;">등록</h5>
												</div>
												<div
													style="min-width: 40%; border: 1px solid #ebebeb; border-right: none; background: #ffffff">
													<div class="display-flex" style="flex-direction: column;">
														<select
															style="width: 11rem; margin-left: 1.3rem; margin-bottom: 0.9em; margin-top: 0.7em;">
															<option value="member_id">구매자ID</option>
														</select>
														<textarea id="textarea1" maxlength="3000"
															style="width: 34rem; margin-left: 1.3rem; height: 6.3rem; margin-bottom: 0.9em;"></textarea>
														<div class="display-flex"
															style="justify-content: space-between; margin-left: 1.3rem;">
															<span>복수 등록(, 로 구분)</span> <span id="counter1"
																style="margin-right: 1.6rem">0/3000</span>
														</div>
													</div>
												</div>
												<!-- 두 번째 섹션 -->
												<div
													style="min-width: 10%; border: 1px solid #ebebeb; border-right: none; background: #fcfcfc;">
													<h5 style="margin-top: 0.7em; margin-left: 1rem;">제한사유</h5>
												</div>
												<div
													style="min-width: 40%; border: 1px solid #ebebeb; background: #ffffff">
													<div class="display-flex" style="flex-direction: column;">
														<div
															style="margin-left: 1.1rem; margin-bottom: 0.3em; margin-top: 0.7em;">
															<label> <input type="radio" name="report"
																value="구매의사 없는 반복구매"> 구매의사 없는 반복구매
															</label> <label> <input type="radio" name="report"
																value="언어폭력"> 언어폭력
															</label> <label> <input type="radio" name="report"
																value="영업방해"> 영업방해
															</label> <label> <input type="radio" name="report"
																value="기타"> 기타
															</label>
														</div>
														<textarea id="textarea2" maxlength="30"
															style="width: 34rem; margin-left: 1.1rem; height: 6.3rem; margin-bottom: 0.9em;"></textarea>
														<div class="display-flex"
															style="justify-content: space-between; margin-left: 1.1rem;">
															<span>복수 등록(, 로 구분)</span> <span id="counter2"
																style="margin-right: 1.6rem">0/30</span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div style="text-align: center; background: #fff;">
											<button id="submitBtn"
												style="margin: 1.6rem 0; border: 1px solid #b7b2b2; background: transparent; padding: 0.3em .9em;">
												등록</button>
										</div>

										<!-- 고객 리스트 영역 -->
										<div class="customer-list-container"
											style="background: #fff; padding: 0 0 16px;">
											<div class="list-header"
												style="display: flex; justify-content: space-between; align-items: center; padding: 0.5rem 0;">
												<h5 style="margin: 0;">판매방해 고객 리스트</h5>
												<span class="customer-count" style="margin-right: 10px;">[총
													0 건]</span>
												<button id="fetchCustomerList"
													style="background: #007bff; color: white; border: none; padding: 0.3rem 0.8rem; cursor: pointer;">조회하기</button>
											</div>

											<!-- 테이블 헤더 -->
											<div class="customer-table-header"
												style="display: flex; background-color: #f1f1f1; border: 1px solid #ddd;">
												<div class="table-cell"
													style="width: 10%; padding: 0.5rem; text-align: center;">
													<input type="checkbox" disabled>
												</div>
												<div class="table-cell"
													style="width: 30%; padding: 0.5rem; text-align: center;">구매자
													ID</div>
												<div class="table-cell"
													style="width: 30%; padding: 0.5rem; text-align: center;">등록사유</div>
												<div class="table-cell"
													style="width: 30%; padding: 0.5rem; text-align: center;">사유
													내용</div>
											</div>

											<!-- 스크롤 가능한 데이터 리스트 -->
											<div class="customer-list"
												style="max-height: 300px; overflow-y: auto; border: 1px solid #ddd;">
												<!-- 데이터가 여기에 동적으로 추가됩니다 -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>





				<!-- content-wrapper ends -->
				<!-- partial:/WEB-INF/views/inc/admin_footer.jsp -->
				<%@ include file="/WEB-INF/views/inc/admin_footer.jsp"%>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<!-- dataTables.js -->
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<script src="/resources/admin/js/off-canvas.js"></script>
	<script src="/resources/admin/js/hoverable-collapse.js"></script>
	<script src="/resources/admin/js/misc.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->

	<!-- End custom js for this page -->
</body>
</html>