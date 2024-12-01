<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>판매자</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/admin/vendors/mdi/css/materialdesignicons.min.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/admin/vendors/css/vendor.bundle.base.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/admin/vendors/font-awesome/css/font-awesome.min.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/style.css" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/admin/images/favicon.png" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style type="text/css">
      .btns-flex {
        display: flex;
      }
      .store-search input {
      	width: 150px;
      }
      /* .store-search {
      	display: flex;
      	justify-content: space-between;
      	align-items: center;
      } */
      .store-search label {
    	margin: 0 0.4rem;
    	font-size: 13px;
      }
      .store-search-btn {
   	    display: inline-block;
	    height: 0;
	    padding: 0;
	    font-size: 28px;
	    margin: 0 10px;
	    line-height: 0;
      }
      input {
        border: 1px solid #dbdde2;
	    padding: 4px 8px 4px 8px;
	    font-size: 14px;
	    transition: border 0.1s;
      }

      input:focus {
        border: 1px solid #bf94e4; /* 포커스 시 보더 색상 변경 */
        outline: none; /* 기본 아웃라인 제거 */
      }
      input[type="checkbox"] {
        transform: scale(1.5);
        margin: 0 0.2rem 0 0.8rem;
        cursor: pointer;
      }
      .store-btn {
      	border : 1px solid #dbdde2;
      	background-color: white;
      	padding: 0 0.6rem;
      	font-size: 12px;
      }
      .search-btn {
      	display: flex;
      	justify-content: center;
      	gap: 1rem;
      }
      
      .search-btn button {
	    border: 1px solid #dbdde2;
	    background-color: white;	
	    cursor: pointer; /* 마우스 포인터 변경 */
	    width: 120px;
	    height: 40px;
	  }
	  .search-btn .search {
	  	background-color: #bf94e4;
    	border: 1px solid #bf94e4;
	  }
	  .search-btn .search:hover {
	  	background-color: #b783e3;
    	border: 1px solid #b783e3;
	  }
	  .search-btn .reset:hover {
	  	border: 1px solid #bf94e4;
	  }
	  
		.btns-flex {
			gap: 1rem;
			margin-bottom: 0.8rem;
		}
		
		

	  	
  </style>
  
  <script>
    $(document).ready(function() {
        let selectedValues = [];

        // 전체 체크박스 클릭 이벤트
        $('#selectAll').change(function() {
            const isChecked = $(this).is(':checked');
            $('.status-checkbox').prop('checked', isChecked).prop('disabled', isChecked);

            // 전체 체크박스가 체크되면 모든 값 추가, 아니면 비우기
            if (isChecked) {
                selectedValues = $('.status-checkbox').map(function() {
                    return this.value;
                }).get();
            } else {
                selectedValues = [];
            }

            console.log(selectedValues); // 배열 출력
        });

        // 각 체크박스 클릭 이벤트
        $('.status-checkbox').change(function() {
            const value = $(this).val();
            if ($(this).is(':checked')) {
                // 체크된 경우 배열에 추가
                selectedValues.push(value);
            } else {
                // 체크 해제된 경우 배열에서 제거
                selectedValues = selectedValues.filter(v => v !== value);
            }

            // 전체 체크박스 상태 업데이트
            $('#selectAll').prop('checked', $('.status-checkbox:checked').length === $('.status-checkbox').length);
            
            console.log(selectedValues); // 배열 출력
        });
        
     // 오늘 날짜와 1년 전 날짜 초기화
        const today = new Date();
        const formattedToday = today.toISOString().split('T')[0];
        const oneYearAgo = new Date(today);
        oneYearAgo.setDate(today.getDate() - 365);
        const formattedOneYearAgo = oneYearAgo.toISOString().split('T')[0];

        // 시작일과 종료일 필드 설정
        $('#startDate').val(formattedOneYearAgo).attr('max', formattedToday);
        $('#endDate').val(formattedToday).attr('max', formattedToday);

        // 날짜 포맷을 YYYY-MM-DD로 변환
        const formatDate = (date) => {
            if (!(date instanceof Date) || isNaN(date)) {
                console.error("Invalid date:", date);
                return ""; // 유효하지 않은 경우 빈 문자열 반환
            }
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, '0');
            const day = String(date.getDate()).padStart(2, '0');
            return (year+"-"+month+"-"+day);
        };

        function setDate(days) {
            const startDate = new Date(today);
            const endDate = new Date(today);
            startDate.setDate(today.getDate() - days);
            endDate.setDate(today.getDate());

            $('#startDate').val(formatDate(startDate));
            $('#endDate').val(formatDate(endDate));
        }

        // 버튼 클릭 이벤트
        $('#selete-today').click(function() {
            setDate(0); // 오늘
        });

        $('#oneWeek').click(function() {
            setDate(7); // 1주일 전
        });

        $('#oneMonth').click(function() {
            setDate(30); // 1개월 전 (대략)
        });

        $('#threeMonths').click(function() {
            setDate(90); // 3개월 전 (대략)
        });

        $('#sixMonths').click(function() {
            setDate(180); // 6개월 전 (대략)
        });

        $('#oneYear').click(function() {
            setDate(365); // 1년 전
        });

        $('#all').click(function() {
            $('#startDate').val(''); // 전체 선택 시 빈 값으로 설정
            $('#endDate').val('');
            $('#startDate').attr('readonly', true); // 리드온리 설정
            $('#endDate').attr('readonly', true); // 리드온리 설정
        });
        
        $('#selete-today, #oneWeek, #oneMonth, #threeMonths, #sixMonths, #oneYear').click(function() {
            $('#startDate').attr('readonly', false); // 리드온리 해제
            $('#endDate').attr('readonly', false); // 리드온리 해제
        });
        
    });
</script>
  </head>
  <body>
    <div class="container-scroller">
      <%@ include file="/WEB-INF/views/inc/admin_navbar_store.jsp"%>
      <div class="container-fluid page-body-wrapper">
        <%@ include file="/WEB-INF/views/inc/admin_sidebar_store.jsp"%>
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="d-xl-flex justify-content-between align-items-start">
              <h2 class="text-dark font-weight-bold mb-2">상품 조회/수정</h2>
              <div
                class="d-sm-flex justify-content-xl-between align-items-center mb-2"
              ></div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="tab-content tab-transparent-content">
                  <div
                    class="tab-pane fade show active"
                    id="business-1"
                    role="tabpanel"
                    aria-labelledby="business-tab"
                  >
                    <div class="row" style="color :#4d5159;">
                      <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                          <div style="background-color: #f8f9fd" class="card-body">
                            <div  class="col-lg-12 store-search" style="display: flex;">
                            	<div style="width: 180px">
    	                       		<h4>검색어</h4>
                            	</div>
                            	<div style="display: flex; align-items: center;">
                            		<div>
		                            	<label for="productName">상품명</label>
										<input type="text" id="productName" name="productName">
										<label for="manufacturerName">제조사명</label>
										<input type="text" id="manufacturerName" name="manufacturerName">
                            		</div>
                            		<div>
										<label for="brandName">브랜드명</label>
										<input type="text" id="brandName" name="brandName">
										<label for="category">카테고리</label>
										<input type="text" id="category" name="category">
                            		</div>
                            	</div>
                            </div>
                            <div class="dropdown-divider"></div>
                            <div class="col-lg-12" style="display: flex;padding: 0.5em 0 0 0; ">
                           		<!-- <h4 style="margin-right: 170px">판매 선택</h4> -->
                           		<div style="width: 180px ">
    	                       		<h4 style="padding-left: 9px;">판매 선택</h4>
                            	</div>
							    <div style="display: flex;   ">
							        <label style="margin-left: 0.6rem;">
								        <input type="checkbox" id="selectAll"> 전체
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="판매대기" class="status-checkbox"> 판매대기
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="판매중" class="status-checkbox"  checked> 판매중
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="품절" class="status-checkbox"> 품절
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="승인대기" class="status-checkbox"> 승인대기
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="판매중지" class="status-checkbox"> 판매중지
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="판매종료" class="status-checkbox"> 판매종료
								    </label>
								    <label>
								        <input type="checkbox" name="status" value="판매금지" class="status-checkbox"> 판매금지
								    </label>
							    </div>
                            </div>
                            <div class="dropdown-divider"></div>
                            
                            <div class="col-lg-12" style="display: flex;padding: 0.5em 0;">
                           		<div style="width: 180px">
    	                       		<h4 style="padding-left: 9px;padding-top: 9px">기간</h4>
                            	</div>
							    <div style="display: flex; margin-right: 0.5rem">
							        <button class="store-btn" id="selete-today">오늘</button>
								    <button class="store-btn" id="oneWeek">1주일</button>
								    <button class="store-btn" id="oneMonth">1개월</button>
								    <button class="store-btn" id="threeMonths">3개월</button>
								    <button class="store-btn" id="sixMonths">6개월</button>
								    <button class="store-btn" id="oneYear">1년</button>
								    <button class="store-btn" id="all">전체</button>
							    </div>
							    <input type="date" id="startDate">
							    <span style="line-height: 36px; margin: 0 0.5em	">~</span>
							     <input type="date" id="endDate" max="">
                            </div>
                            <div class="dropdown-divider"></div>
                            	<div class="search-btn" style=" padding-top: 1em; ">
	                            	<button class="search" >검색</button>
	                            	<button class="reset" >초기화</button>
                            	</div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="tab-content tab-transparent-content">
                  <div
                    class="tab-pane fade show active"
                    id="business-1"
                    role="tabpanel"
                    aria-labelledby="business-tab"
                  >
                    <div class="row">
                      <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                          <div class="card-body">
                            <h4 class="card-title">
                              	상품 목록 (총 <span>0</span> 개)
                            </h4>
                            <div style="display: flex; justify-content: space-between;">
	                            <div class="btns-flex">
	                              <button class="store-btn" style="padding: 8px">선택 삭제</button>
	                              <spna style="line-height: 32px;">|</spna>
	                              <select style="font-size: 12px">
	                                <option selected>판매변경</option>
	                                <option>판매중</option>
	                                <option>판매중지</option>
	                              </select>
	                              <spna style="line-height: 32px;">|</spna>
	                              <button class="store-btn">판매가 변경</button>
	                              <button class="store-btn">판매기간 변경</button>
	                            </div>
	                           	<div>
	                           		<button class="store-btn" style="padding: 8px">수정 변경</button>
	                           	</div>
                            </div>
                            <div style="width: 100%; overflow-x: auto; border: 1px solid #ccc; padding: 0;">
							    <div style="width: 2000px;">
							        <table border="1" style="width: 100%; table-layout: auto;">
							            <thead>
							                <tr style="font-size : 13px" >
							                    <th style="width: 30px; padding:7px 0px 0px;background:#f8f9fd"><input type="checkbox"></th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">상품번호</th>
							                    <th style="width: 300px;padding-left: 8px;background:#f8f9fd">상품명</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">판매상태</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">재고수량</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">판매가</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">할인가</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">판매자 할인</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">기본 배송비</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">제조사명</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">브랜드 명</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">판매 시작일</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">상품등록일</th>
							                    <th style="width: 100px;padding-left: 8px;background:#f8f9fd">최종수정일</th>
							                </tr>
							            </thead>
							        </table>
							        <div style="max-height: 400px; overflow-y: auto; height: 400px;">
							            <table border="1" style="width: 100%; table-layout: fixed;">
							                <tr style="height: 36px;">
							                    <td style="width: 30px; padding:0px;"><input type="checkbox"></td>
							                    <td style="width: 100px;">001</td>
							                    <td style="width: 300px;">상품 AASASDASDASDASDASDAS</td>
							                    <td style="width: 100px;">판매중</td>
							                    <td style="width: 100px;">100</td>
							                    <td style="width: 100px;">10,000원</td>
							                    <td style="width: 100px;">9,000원</td>
							                    <td style="width: 100px;">10%</td>
							                    <td style="width: 100px;">3,000원</td>
							                    <td style="width: 100px;">제조사 A</td>
							                    <td style="width: 100px;">브랜드 A</td>
							                    <td style="width: 100px;">2024-01-01</td>
							                    <td style="width: 100px;">2023-12-01</td>
							                    <td style="width: 100px;">2023-12-15</td>
							                </tr>
							                <tr style="height: 36px;">
							                    <td style="width: 30px; padding:0px;"><input type="checkbox"></td>
							                    <td style="width: 100px;">002</td>
							                    <td style="width: 300px;">상품 B</td>
							                    <td style="width: 100px;">판매중</td>
							                    <td style="width: 100px;">200</td>
							                    <td style="width: 100px;">20,000원</td>
							                    <td style="width: 100px;">18,000원</td>
							                    <td style="width: 100px;">10%</td>
							                    <td style="width: 100px;">3,000원</td>
							                    <td style="width: 100px;">제조사 B</td>
							                    <td style="width: 100px;">브랜드 B</td>
							                    <td style="width: 100px;">2024-02-01</td>
							                    <td style="width: 100px;">2023-12-02</td>
							                    <td style="width: 100px;">2023-12-16</td>
							                </tr>
							                <!-- 추가 행을 여기에 추가할 수 있습니다 -->
							            </table>
							        </div>
							    </div>
							</div>


                          </div>
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
    <script src="${pageContext.request.contextPath}/resources/admin/vendors/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/hoverable-collapse.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/dashboard.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>
