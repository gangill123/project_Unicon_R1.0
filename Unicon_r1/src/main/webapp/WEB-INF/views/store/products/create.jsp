<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="kr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>유니콘 스토어</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
	
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/create.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/create.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/admin/images/favicon.png" />
    <style type="text/css">
    
    </style>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:/WEB-INF/views/inc/admin_navbar.jsp -->
      <%@ include file="/WEB-INF/views/inc/admin_navbar_store.jsp"%>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:/WEB-INF/views/inc/admin_sidebar.jsp" -->
		<%@ include file="/WEB-INF/views/inc/admin_sidebar_store.jsp"%>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="row">
              <div class="col-md-12">
                <div class="tab-content tab-transparent-content">
                  <div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">
                    <div class="row">
                      <div class="col-12 grid-margin">
                        <!-- 카테고리 시작 -->
                        <div class="card">
                          <div class="card-body" style="padding: 1.5rem 2.5rem;" >
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div style="width:100%;">
				                  <div style="padding : padding: 1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">카테고리 </h4>
						                    <i class="icon-must" aria-label="필수항목"></i>
				                  		</div>
					                    <button onclick="closeBox('category')"><i class="mdi mdi-chevron-right"></i></button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-category">
				                      <div class="category-box">
				                      <div class="category">
				                      	<c:forEach items="${CategoryDataList}" var="c">
										    <button onclick="category('${c.category_code}', '${c.category_type}')">
										        <span id="category${c.category_code}">${c.category_type}</span>
										        <i class="mdi mdi-chevron-right"></i>
										    </button>
										</c:forEach>
										</div>
				                      <div class="category-detail">
				                      </div>
				                      </div>
					                  <div id="selected-category" class="selected-category-text">선택한 카테고리 : </div>
				                    </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 카테고리 끝 -->
                        <!-- 상품명 시작 -->
                        <div class="card">
                          <div class="card-body" style="padding: 1.5rem 2.5rem;" >
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div style="width:100%;">
				                  <div style="padding : padding: 1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">상품명 </h4>
						                    <i class="icon-must" aria-label="필수항목"></i>
				                  		</div>
					                    <button onclick="closeBox('productName')"><i class="mdi mdi-chevron-right"></i></button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-productName">
				                    	<div class="input-container">
				                    		 <input type="text" id="textInput" maxlength="100" name="productName" >
				                    		 <span id="charCount"><span id="currentCount">0</span>/100</span>
				                    	</div>
				                    	<p id="error-message" ><i class="mdi mdi-block-helper" style="margin-right:5px "></i>필수 입력 정보입니다.</p>
				                    	<span style="color: #000000; font-size: 13px">
				                    		상품명을 맞게 입력하면 검색 노출에 도움이 될 수 있습니다.
				                    	</span>
				                    <div class="dropdown-divider"></div>
				                    <div style="color : #2ecc71; font-size: 12px">
				                    	*가이드에 맞지 않는 상품명 입력 시 별도 고지 없이 제재될 수 있습니다.<br>
										· 기존 상품을 다른 상품으로 변경하는 상품 ID 재사용 정책 위반(기존 상품명의 띄어쓰기, 설명 등 단순 변경은 허용)<br>
										· 상품과 직접 관련이 없는 다른 상품명, 스팸성, 유명 상품을 도용한 ~스타일, ~st 키워드 사용
				                    </div>
				                    </div>

				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 상품명 끝 -->
                        <!-- 판매가 시작 -->
                        <div class="card">
                          <div class="card-body" style="padding: 1.5rem 2.5rem;" >
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div style="width:100%;">
				                  <div style="padding : padding: 1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">판매가 </h4>
						                    <i class="icon-must" aria-label="필수항목"></i>
				                  		</div>
					                    <button onclick="closeBox('priceBlock')"><i class="mdi mdi-chevron-right"></i></button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-priceBlock">
				                    	<div style="display: flex;">
								            <label for="price">판매가<i class="icon-must" aria-label="필수항목"></i></label>
								            <div>
								            	<div class="store-input-container">
											        <input style="border: 1px solid #dbdde2;" type="tel" id="price" name="price" placeholder="판매가를 입력하세요">
											        <span style="padding: 4px 10px; line-height: 24px; color: #4d5159; background-color: #f8f9fd; border: 1px solid #dbdde2; border-radius: 0; border-left: none;">원</span>
											    </div>
											    <p class="price-error-messag">10원 단위로 입력해주세요.</p>
											    <p class="error-message price-error">올바른 판매가를 입력하세요.</p>
								            </div>
				                    	</div>
					                    <div class="dropdown-divider"></div>
					                    
										<div style="display: flex; align-items: center;">
										    <label for="sale-period">판매기간</label>
										    <div>
										        <div class="store-input-container">
										            <button id="set-on" class="btn-setting-on setting-inactive">설정함</button>
										            <button id="set-off" class="btn-setting-off setting-active">설정안함</button>
										        </div>
										    </div>
										</div>
										<div class="sales-period">
										    <label for="sale-period">기간 설정<i class="icon-must" aria-label="필수항목"></i></label>
										    <div style="margin-right: 15px;">
										        <div class="store-input-container">
												    <button class="store-btn" id="today">오늘</button>
												    <button class="store-btn" id="sevenDays">7일</button>
												    <button class="store-btn" id="thirtyDays">30일</button>
												    <button class="store-btn" id="sixtyDays">60일</button>
												    <button class="store-btn" id="oneHundredTwentyDays">120일</button>
												</div>
										    </div>
										    <div class="date-selection">
										    	<div style="display: flex" class="date-picker">
													<input type="text"  class="date-input"  readonly>
													<button  class="date-picker-btn"><i class="mdi mdi-calendar-check"></i></button>
										    	</div>
											</div>
										</div>
							            
					                    <div class="dropdown-divider"></div>
					                    <div class="discount">
								            <label for="discount">할인율 (%)</label>
										    <div>
										        <div class="store-input-container">
										            <button id="discount-set-on" class="btn-setting-on setting-inactive">설정함</button>
										            <button id="discount-set-off" class="btn-setting-off setting-active">설정안함</button>
										        </div>
										        <div class="discount-box">
										            <input style="border: 1px solid #dbdde2;" type="tel" id="discount" name="discount" placeholder="할인율을 입력하세요">
													<span style="padding: 4px 10px; line-height: 24px; color: #4d5159; background-color: #f8f9fd; border: 1px solid #dbdde2; border-radius: 0; border-left: none;">%</span>
													<i class="icon-must" aria-label="필수항목"></i>
										    	</div>
										    	<div class="price-discount">
											    	<p class="error-message price-error">올바른 할인율을 입력하세요.</p>
										    	</div>
												<div class="price-discount">
													<span style="color: #00c73c;">할인가 <span class="discount-price">0</span>원 (<span class="discount-amount"></span>원 할인)</span>
												</div>											    	
										    </div>
					                    </div>
						                <div class="custom-dropdown-divider"></div>
				                    </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 판매가 끝 -->
                        
                        <!-- 재고수량 시작 -->
                        <div class="card">
                          <div class="card-body" style="padding: 1.5rem 2.5rem;" >
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div style="width:100%;">
				                  <div style="padding : padding: 1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">재고수량 </h4>
						                    <i class="icon-must" aria-label="필수항목"></i>
				                  		</div>
					                    <button onclick="closeBox('stock')"><i class="mdi mdi-chevron-right"></i></button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-stock">
				                    	<div class="store-input-container">
				                    		<input placeholder="숫자만 입력하세요." class="input-stock"name="stock">
				                    		<span style="padding: 4px 10px; line-height: 24px; color: #4d5159; background-color: #f8f9fd; border: 1px solid #dbdde2; border-radius: 0; border-left: none;">개</span>
					                    </div>
				                    </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 재고수량 끝 -->
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
    <script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
    <script src="/resources/admin/vendors/chart.js/Chart.min.js"></script>
    <script src="/resources/admin/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
    <script src="/resources/admin/js/off-canvas.js"></script>
    <script src="/resources/admin/js/hoverable-collapse.js"></script>
    <script src="/resources/admin/js/misc.js"></script>
    <script src="/resources/admin/js/dashboard.js"></script>
  </body>
</html>