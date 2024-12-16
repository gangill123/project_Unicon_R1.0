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
    
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
     <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    
    
    
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
				                  <div style="padding : 1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">카테고리 </h4>
						                    <i class="icon-must" aria-label="필수항목"></i>
				                  		</div>
					                    <button onclick="closeBox(this,'category')" style="border: none;background: transparent;font-size: 2.1rem;">
				                    		<i class="mdi mdi-chevron-down"></i>
					                    	<i class="mdi mdi-chevron-up" style="display: none"></i>
					                    </button>
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
				                  <div style="padding: 1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">상품명 </h4>
						                    <i class="icon-must" aria-label="필수항목"></i>
				                  		</div>
					                    <button onclick="closeBox(this,'productName')" style="border: none;background: transparent;font-size: 2.1rem;">
					                    <i class="mdi mdi-chevron-down"></i>
				                    	<i class="mdi mdi-chevron-up" style="display: none"></i>
					                    </button>
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
				                    
				                    <div class="dropdown-divider"></div>
				                    <div style="margin-top: 20px;">
				                    	<div style="display: flex;margin-bottom: 12px; align-items: center;">
											<h4 class="card-title" style="margin-bottom: 0">상품 키워드 </h4>
											<i class="icon-must" aria-label="필수항목"></i>
				                    	</div>
				                    	<div class="store-input-container" style="flex-direction: column; align-items: flex-start;" class="product_keyword">
				                    		<input style="width: 20%;border: 1px solid #ccc;border-radius: 4px;margin-bottom: 10px;" type="text" name="product_keyword1" placeholder="키워드를 입력하세요.">
				                    		<input style="width: 20%;border: 1px solid #ccc;border-radius: 4px;margin-bottom: 10px;" type="text" name="product_keyword2" placeholder="키워드를 입력하세요.">
				                    		<input style="width: 20%;border: 1px solid #ccc;border-radius: 4px;margin-bottom: 10px;" type="text" name="product_keyword3" placeholder="키워드를 입력하세요.">
				                    		<p style="color :#a6a7ad; margin: 0 0 4px 0;font-size: 12px;">예시: 애견사료, 강아지 사료 (","로 구분)</p>
				                    		<p style="color :#a6a7ad; margin: 0;font-size: 12px;">각 입력창의 최대 글자는 10자까지만 가능합니다.</p>
				                    	</div>
									</div>
				                    <div class="dropdown-divider"></div>
				                    

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
				                  <div style="padding : 1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">판매가 </h4>
						                    <i class="icon-must" aria-label="필수항목"></i>
				                  		</div>
					                    <button onclick="closeBox(this,'price')" style="border: none;background: transparent;font-size: 2.1rem;">
					                    <i class="mdi mdi-chevron-down"></i>
				                    	<i class="mdi mdi-chevron-up" style="display: none"></i>
					                    </button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-price">
				                    	<div style="display: flex;">
								            <label for="price">판매가<i class="icon-must" aria-label="필수항목"></i></label>
								            <div>
								            	<div class="store-input-container">
											        <input style="border: 1px solid #dbdde2;" type="tel" id="price" name="price" placeholder="판매가를 입력하세요">
											        <span style="padding: 4px 10px; line-height: 24px; color: #4d5159; background-color: #f8f9fd; border: 1px solid #dbdde2; border-radius: 0; border-left: none;">원</span>
											    </div>
											    <p class="price-error-messag">10원 단위로 입력해주세요.</p>
											    <p class="error-message price-error" style="color : #a6a7ad;">올바른 판매가를 입력하세요.</p>
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
												    <button class="store-btn btn-active" id="today ">오늘</button>
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
				                  <div style="padding : 1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">재고수량 </h4>
						                    <i class="icon-must" aria-label="필수항목"></i>
				                  		</div>
					                    <button onclick="closeBox(this,'stock')" style="border: none;background: transparent;font-size: 2.1rem;">
					                    <i class="mdi mdi-chevron-down"></i>
				                    	<i class="mdi mdi-chevron-up" style="display: none"></i>
					                    </button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-stock">
				                    	<div class="store-input-container">
				                    		<input placeholder="숫자만 입력하세요." class="input-stock" name="stock">
				                    		<span style="padding: 4.5px 10px; line-height: 24px; color: #4d5159; background-color: #f8f9fd; border: 1px solid #dbdde2; border-radius: 0; border-left: none;">개</span>
				                    		<span class="input-message">옵션 재고수량을 사용하면, 옵션의 재고수량으로 적용되어 자동으로 입력됩니다.</span>
					                    </div>
				                    </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 재고수량 끝 -->
                        
                        <!-- 옵션 시작 -->
                        <div class="card">
                          <div class="card-body" style="padding: 1.5rem 2.5rem;" >
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div style="width:100%;">
				                  <div style="padding : 1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">옵션 
						                     <i class="icon-must" aria-label="필수항목"></i></h4>
				                  		</div>
					                    <button onclick="closeBox(this,'option')" style="border: none;background: transparent;font-size: 2.1rem;">
					                    	<i class="mdi mdi-chevron-down"></i>
					                    	<i class="mdi mdi-chevron-up" style="display: none"></i>
				                    	</button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-option">
				                    	<div style="display: flex; align-items: center;">
										    <label >선택형</label>
										    <div>
										        <div class="store-input-container">
										            <button id="option-set-on" class="btn-setting-on setting-active">설정함</button>
										        </div>
										    </div>
										</div>
				                    	<div class="option-box">
				                    		<div class="display-f">
				                    			<div style="width: 180px; font-size: 14px; color: rgb(0, 0, 0); margin-bottom: 0rem !important;">
												    옵션 구성타입
												    <i class="icon-must" aria-label="필수항목"></i>
												    <i class="mdi mdi-information-outline i-tooltip" style="cursor: pointer;"></i>
												    <div class="c-tooltip" id="tooltip-info">
												    	<div style="margin-bottom: 0.6rem;">
													        <p class="tooltiptext"><i class="icon-must" aria-label="필수항목"></i> 단독형이란?</p>
													        <span>
															        옵션별로 추가 옵션가와 재고수량이 동일한 경우를 말합니다. 옵션가/재고수량을 별도로 설정할 수 없습니다.
													        </span>
												    	</div>
												    	<div>
													        <p class="tooltiptext"><i class="icon-must" aria-label="필수항목"></i> 조합형이란?</p>
													        <span>
															        옵션별로 옵션가가 다르거나 재고수량이 다른 경우를 말합니다.
													        </span>
												    	</div>
												    </div>
												</div>
											    <div class="display-f" style="margin: 0">
											        <div class="store-input-container">
											            <input type="radio" id="single" name="optionType" value="단독형" checked>
											            <label for="single">단독형</label>
											        </div>
											        <div class="store-input-container">
											            <input type="radio" id="combo" name="optionType" value="조합형">
											            <label for="combo">조합형</label>
											        </div>
											    </div>
											</div>
											<div class="dropdown-divider"></div>
				                    		<div class="display-f">
											    <label>옵션명 개수</label>
											    <div>
											        <div class="store-input-container">
											        	<select class="select-option">
											        		<option selected="selected" value="1">1개</option>
											        		<option value="2">2개</option>
											        	</select>
											        </div>
											    </div>
				                    		</div>
				                    		<div class="dropdown-divider"></div>
				                    		<div class="display-f"  style="align-items: unset;">
											    <label>옵션입력</label>
											    <div>
											    <div id="options-container">
											      <div class="display-f" id="option-count" style="align-items: unset; margin: 0 0 1.7rem 0">
											        <div class="store-input-container start" style="flex-direction: column; gap: 1rem">
											          <label for="option-name-1">옵션명</label>
											          <div id="option-name-wrapper" class="option-wrapper">
											            <input
											              style="width: 15rem"
											              id="option-name-1"
											              class="option-input"
											              type="text"
											              placeholder="예시:컬러"
											              name="option-productNames"
											            />
											          </div>
											        </div>
											        <div
											          class="store-input-container start"
											          style="flex-direction: column; gap: 1rem"
											        >
											          <label for="option-value-1">옵션값</label>
											          <div id="option-value-wrapper" class="option-wrapper">
											            <input
											              style="width: 15rem"
											              id="option-value-1"
											              class="option-input"
											              type="text"
											              placeholder="예시: 빨강,노랑 (,로 구분)"
											              name="option-productNames"
											            />
											          </div>
											        </div>
											        <div class="store-input-container start">
											          <div>
											            <button style="position: relative; top: 1.8rem" class="option-add">
											              <i class="mdi mdi-plus-box"></i>
											            </button>
											          </div>
											        </div>
											      </div>
											    </div>
												<button class="option-list-apply" disabled>옵션 목록 적용</button>
												</div>
				                    		</div>
											<div style="width: 100%; overflow-x: auto; border: 1px solid #ccc; padding: 0;">
											   <div style="width: 100%;text-align: center;display: flex;align-items: center;border-bottom: 1px solid;justify-content: center;height: 86px;" class="option-list-header">
											    	<div style="width: 4%;padding: 0.7em 0 0.7em;"><input type="checkbox"></div>
											    	<div style="border-right: 1px solid; border-left: 1px solid;width: 30%;display: flex;flex-direction: column;">
												    	<div style="border-bottom: 1px solid;position: relative;top: 0px;padding: 10px 0; ">
												    		<span style="color:#000000">옵션명</span>
												    	</div>
												    	<div style="padding: 10px 0;color:#000000;height: 44px; display: flex;justify-content: center;gap: 5rem;">
												    		 <div></div>
														     <div style="border-right: 1px solid;height: 46px;position: relative;top: -11px;color: #a7afb7;"></div>
												    		 <div></div>
												    	</div>
											    	</div>
											    	<div style="width: 30%;padding: 0.7em 0 0.7em;display: flex;align-items: center;justify-content: center;color:#000000;">옵션가</div>
											    	<div style="border-right: 1px solid;height: 86px;"></div>
											    	<div style="width: 30%;padding: 0.7em 0 0.7em;display: flex;align-items: center;justify-content: center;color:#000000;">재고수량</div>
											    	<div style="border-right: 1px solid;height: 86px;"></div>
											    	<div style="width: 5%;padding: 0.7em 0 0.7em;display: flex;align-items: center;justify-content: center;color:#000000;">삭제</div>
											    </div>
											    
											    <div class="option-list-body"  style="position: relative;left: 1px;">
											    </div>
											</div>
										</div>
				                      <div class="dropdown-divider"></div>
				                    </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 옵션 끝 -->
                        <!-- 이미지 시작 -->
                        <div class="card">
                          <div class="card-body" style="padding: 1.5rem 2.5rem;" >
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div style="width:100%;">
				                  <div style="padding :  1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">상품이미지</h4>
				                  		</div>
					                    <button onclick="closeBox(this,'img')" style="border: none;background: transparent;font-size: 2.1rem;">
					                    	<i class="mdi mdi-chevron-down"></i>
					                    	<i class="mdi mdi-chevron-up" style="display: none"></i>
					                    </button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-img">
				                    	<form id="form-img">
										<div style="display: flex; align-items: center;">
										    <label >대표 이미지</label>
										    <div class="form-group" style="margin: 0">
										        <div class="store-input-container">
										        	<div class="upload-container" style="margin-left: 8px;">
										        		<label for="image-input1" class="upload-button">
																<input type="file" class="file-upload-default image-input" 
																	accept="image/*" id="image-input1" name="upload_images[0]" required/>
																<i id="plusIcon1" class="mdi mdi-plus"></i>
																<img id="image-preview1" alt="이미지 미리보기" />
														</label>
										        	</div>
										        </div>
										    </div>
										</div>    
										<div class="dropdown-divider"></div>
										<div style="display: flex; align-items: center;">
										    <label >추가 이미지</label>
										    <div class="form-group row d-flex" style="gap:1rem; margin: 0">
											<div class="col-10 col-xl-2 col-lg-3 col-md-3 mb-2">
												<label class="text-dark custom-label">이미지<span class="small">(선택)</span></label>
											    <div class="upload-container">
													<label for="image-input2" class="upload-button">
														<input type="file" class="file-upload-default image-input" 
															accept="image/*" id="image-input2" name="upload_images[1]"/>
														<i id="plusIcon2" class="mdi mdi-plus"></i>
														<img id="image-preview2" alt="이미지 미리보기" />
													</label>
												</div>
											</div>
											<div class="col-10 col-xl-2 col-lg-3 col-md-3 mb-2">
												<label class="text-dark custom-label">이미지<span class="small">(선택)</span></label>
											    <div class="upload-container">
													<label for="image-input3" class="upload-button">
														<input type="file" class="file-upload-default image-input" 
															accept="image/*" id="image-input3" name="upload_images[2]"/>
														<i id="plusIcon3" class="mdi mdi-plus"></i>
														<img id="image-preview3" alt="이미지 미리보기" />
													</label>
												</div>
											</div>
											<div class="col-10 col-xl-2 col-lg-3 col-md-3 mb-2">
												<label class="text-dark custom-label">이미지<span class="small">(선택)</span></label>
											    <div class="upload-container">
													<label for="image-input4" class="upload-button">
														<input type="file" class="file-upload-default image-input" 
															accept="image/*" id="image-input4" name="upload_images[3]"/>
														<i id="plusIcon4" class="mdi mdi-plus"></i>
														<img id="image-preview4" alt="이미지 미리보기" />
													</label>
												</div>
											</div>
										</div>
										</div>
										<div class="dropdown-divider"></div>
										</form>         
				                    </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 이미지 끝 -->
                        
                        <!-- 상품 본문 시작 -->
                        <div class="card">
                          <div class="card-body" style="padding: 1.5rem 2.5rem;" >
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div style="width:100%;">
				                  <div style="padding :  1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">본문내용</h4>
						                    <i class="icon-must" aria-label="필수항목" style="margin-right: 3px" ></i>
						                    <i class="mdi mdi-information-outline img-tooltip" style="cursor: pointer; "></i>
										    <div class="img-tooltip-box" id="img-tooltip-info">
										    	<div style="margin-bottom: 0.6rem;">
											        <p class="tooltiptext">
											        	본문내용이란?
											        </p>
											        <span>
													       상품의 종류, 기능, 이미지 등이 자세히 안내될 수 있도록 구성하는 기능입니다. 
											        </span>
										    	</div>
										    </div>
				                  		</div>
					                    <button onclick="closeBox(this,'content')" style="border: none;background: transparent;font-size: 2.1rem;">
					                    	<i class="mdi mdi-chevron-down"></i>
					                    	<i class="mdi mdi-chevron-up" style="display: none"></i>
				                    	</button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-content">
				                    	<form  id="myForm">
											<div class="mb-3" style="display: flex; justify-content: center;">
						                        <textarea id="noContent" name="noContent"></textarea>
						                    </div>
				                    	</form>
				                    </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 상품 본문 끝 -->
                        
                        <!-- 상품 주요정보 시작 -->
                        <div class="card">
                          <div class="card-body" style="padding: 1.5rem 2.5rem;" >
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div style="width:100%;">
				                  <div style="padding :  1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">상품 주요정보</h4>
						                    <i class="icon-must" aria-label="필수항목" style="margin-right: 3px" ></i>

				                  		</div>
					                    <button onclick="closeBox(this,'detail')" 
					                    	style="border: none;background: transparent;font-size: 2.1rem;">
					                    	<i class="mdi mdi-chevron-down"></i>
					                    	<i class="mdi mdi-chevron-up" style="display: none"></i>
					                    </button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-detail">
				                    	
					                    <div class="display-f">
										    <label>브랜드<i class="icon-must" aria-label="필수항목" style="margin-right: 3px" ></i></label>
										    <div>
									        	<div class="store-input-container">
						                    		<input class="input-brand" type="text" id="brand"  name="brand" >
					                    		</div>
										    </div>
			                    		</div>
					                    <div class="dropdown-divider"></div>
					                    <div class="display-f">
										    <label>제조사<i class="icon-must" aria-label="필수항목" style="margin-right: 3px" ></i></label>
										    <div>
									        	<div class="store-input-container">
						                    		<input class="manufacturer" type="text" id="manufacturer"  name="manufacturer" >
					                    		</div>
										    </div>
			                    		</div>
					                    <div class="dropdown-divider"></div>
					                    <div class="display-f">
										    <label>원산지<i class="icon-must" aria-label="필수항목" style="margin-right: 3px" ></i></label>
										    <div>
									        	<div class="store-input-container">
						                    		<input class="product_origin" type="text" id="product_origin"  name="product_origin" >
					                    		</div>
										    </div>
			                    		</div>
					                    <div class="dropdown-divider"></div>
					                    <div class="display-f">
										    <label>유효일자,유통기한<i class="icon-must" aria-label="필수항목" style="margin-right: 3px" ></i></label>
										    <div>
									        	<div class="store-input-container">
						                    		<input class="product_expiry" type="text" id="product_expiry"  name="product_expiry" placeholder="예시 : 2025-06-10 이거나 그 이후인 상품" >
						                    		<span class="product-expiry-text">입력 예시 : 2025-06-10 이거나 그 이후</span>
					                    		</div>
										    </div>
			                    		</div>
					                    <div class="dropdown-divider"></div>
				                    </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 상품 주요정보 끝 -->
                        
                        <!-- 배송 시작 -->
                        <div class="card">
                          <div class="card-body" style="padding: 1.5rem 2.5rem;" >
                            <div class="row">
                              <div class="col-12 grid-margin stretch-card">
				                <div style="width:100%;">
				                  <div style="padding :  1.0rem 2.0rem;">
				                  	<div style="display: flex; justify-content: space-between;">
				                  		<div style="display: flex;align-items: center;">
						                    <h4 class="card-title" style="margin-bottom: 0">배송</h4>
						                    <i class="icon-must" aria-label="필수항목" style="margin-right: 3px" ></i>
				                  		</div>
					                    <button onclick="closeBox(this,'delivery')" 
					                    	style="border: none;background: transparent;font-size: 2.1rem;">
					                    	<i class="mdi mdi-chevron-down"></i>
					                    	<i class="mdi mdi-chevron-up" style="display: none"></i>
					                    </button>
				                  	</div>
				                    <div class="dropdown-divider"></div>
				                    <div class="closeBox-delivery">
					                    <div class="display-f">
										    <label>택배사</label>
										    <div>
									        	<div class="store-input-container">
<!-- 						                    		<input class="" type="text" id=""  name="delivery_company" > -->
						                    		<select class="select-delivery-company" >
										        		<option value="select">선택</option>
										        		<option value="CJ대한통운">CJ대한통운</option>
										        		<option value="롯데택배">롯데택배</option>
										        		<option value="한진택배">한진택배</option>
										        		<option value="로젠택배">로젠택배</option>
										        		<option value="우체국">우체국</option>
										        	</select>
					                    		</div>
										    </div>
			                    		</div>
					                    <div class="dropdown-divider"></div>
					                    <div class="display-f">
										    <label>택배비</label>
										    <div>
									        	<div class="store-input-container">
						                    		<input type="text" id="delivery_price"  name="delivery_price" >
						                    		<span style="padding: 4px 10px; line-height: 24px; color: #4d5159; background-color: #f8f9fd; border: 1px solid #dbdde2; border-radius: 0; border-left: none;">원</span>
					                    		</div>
										    </div>
			                    		</div>
					                    <div class="dropdown-divider"></div>
				                    </div>
				                  </div>
				                </div>
				              </div>
                            </div>
                          </div>
                        </div>
                        <!-- 배송 끝 -->
                        <div style="text-align: center;">
                        	<button style="width: 160px;height: 48px;border: 1px solid #dbdde2;background-color: #fff;margin-right: 24px;">취소</button>
                        	<button style="width: 160px;height: 48px;background-color: #2ecc71;border: 1px solid #2ecc71;color: #fff;" id="submit">저장하기</button>
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
    <script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
    <script src="/resources/admin/vendors/chart.js/Chart.min.js"></script>
    <script src="/resources/admin/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
    <script src="/resources/admin/js/off-canvas.js"></script>
    <script src="/resources/admin/js/hoverable-collapse.js"></script>
    <script src="/resources/admin/js/misc.js"></script>
    <script src="/resources/admin/js/dashboard.js"></script>
    
    
    <!-- Summernote JS -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
    <script type="text/javascript">
    
    $(document).ready(function() {
    	
        $('#noContent').summernote({
        	height: 300,
        	width: 900,   // 에디터 너비 (이 속성은 일부 버전에서 지원되지 않을 수 있습니다)
            lang: 'ko-KR',
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ],
            callbacks: {
                onImageUpload: function (files) {
                  for (let file of files) {
                    uploadSummernoteImage(file, this);
                  }
                },
              },
        });
        
        function uploadSummernoteImage(file, editor) {
    	    var formData = new FormData();
    	    formData.append("file", file);

    	    $.ajax({
    	        url: '/store/api/upload',
    	        type: 'POST',
    	        data: formData,
    	        processData: false,
    	        contentType: false,
    	        success: function(imageUrl) {
    	            console.log('이미지 업로드 성공:', imageUrl);
    	            $(editor).summernote('insertImage', imageUrl);
    	        },
    	        error: function(xhr, status, error) {
    	            console.error('이미지 업로드 실패:', error);
    	            console.error('상태 코드:', xhr.status);
    	            console.error('응답 텍스트:', xhr.responseText);
    	            alert('이미지 업로드에 실패했습니다.');
    	        }
    	    });
    	}
    });
    </script>
  </body>
</html>