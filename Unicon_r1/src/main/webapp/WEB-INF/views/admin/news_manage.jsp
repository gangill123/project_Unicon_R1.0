<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

<style>
.product-details:hover .image {
    opacity: 0.7; /* 투명도 설정 */
    transition: opacity 0.3s ease; /* 부드러운 애니메이션 효과 */
}

.product-img {
    width: 100%;
    aspect-ratio: 3 / 4; /* 원하는 가로:세로 비율 설정 */
    overflow: hidden;    /* 이미지가 컨테이너를 벗어나지 않도록 */
}

.product-img img {
    width: 100%;
    height: 100%;
    object-fit: fill;   /* 이미지를 컨테이너에 맞추되 비율 유지 */
    border-radius: 0.75rem; /* 기존 rounded-3 스타일 유지 */
}

</style>

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
	
	<section style="padding-top: 50px;">
            <div class="container">
	            <div class="line-title">
			        <h4 class="mb-0">소식 관리</h4>
			    </div>
                <div class="row">

                    <!-- start product grid left panel -->
                    <div class="col-lg-3">
                        <div class="side-bar">
                            <div class="widget">
                                <div id="accordion" class="accordion-style2">
                                    <div class="card">
                                        <div class="card-header" id="headingOne">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne"> 슬라이드 관리</button>
                                            </h5>
                                        </div>
                                        <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="/admin/slide_create">슬라이드 등록</a></li>
                                                    <li><a href="/admin/slide_manage">슬라이드 등록내역</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingTwo">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link" data-bs-toggle="collapse" 
                                                data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                  소식 관리
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="/admin/news_create">소식 등록</a></li>
                                                    <li><a href="/admin/news_manage">소식 등록내역</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingThree">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                Accessories
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">Drives &amp; Storage</a></li>
                                                    <li><a href="#!">Networking Devices</a></li>
                                                    <li><a href="#!">Software</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingFour">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                  Clothes
                                </button>
                                            </h5>
                                            <!-- 버튼 -->
                                        </div>
                                        <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">T-Shirt</a></li>
                                                    <li><a href="#!">Pants</a></li>
                                                    <li><a href="#!">Saree</a></li>
                                                    <li><a href="#!">Joggers</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header" id="headingFive">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                  Mobile
                                </button>
                                            </h5>
                                        </div>
                                        <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-bs-parent="#accordion">
                                            <div class="card-body">
                                                <ul class="mb-0 list-unstyled">
                                                    <li><a href="#!">Intex</a></li>
                                                    <li><a href="#!">Google</a></li>
                                                    <li><a href="#!">Samsung</a></li>
                                                    <li><a href="#!">Apple</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                    <!-- end product grid left panel -->

                    <!-- start right panel section -->
                    <div class="col-lg-9 ps-lg-1-9">
						<div class="line-title" style="margin-bottom: 15px;">
							<div style="display: flex; justify-content:space-between;">
						        <h5 class="mb-0" style="display: inline-block;">소식 등록내역</h5>
						        <button type="button" class="btn btn-secondary" onclick="location.href='/admin/news_create';"
						        ><span class="small">등록하기</span></button>
							</div>
					    </div>
					    
                        <div class="row">
                            <div class="col-12">
                            <div class="row g-0 align-items-center bg-light rounded p-3">
                                    <div class="col-12 col-md-auto">
                                        <div class="row justify-content-center">
                                            <div class="col-auto my-2 my-md-0">
                                            	<select id="resionSelector" class="form-control form-select" name="news_resion">
                                                    <option value="전국" ${param.resion == '전국' ? 'selected' : ''}>지역선택</option>
												    <option value="서울" ${param.resion == '서울' ? 'selected' : ''}>서울특별시</option>
												    <option value="부산" ${param.resion == '부산' ? 'selected' : ''}>부산광역시</option>
												    <option value="대구" ${param.resion == '대구' ? 'selected' : ''}>대구광역시</option>
												    <option value="인천" ${param.resion == '인천' ? 'selected' : ''}>인천광역시</option>
												    <option value="광주" ${param.resion == '광주' ? 'selected' : ''}>광주광역시</option>
												    <option value="대전" ${param.resion == '대전' ? 'selected' : ''}>대전광역시</option>
												    <option value="울산" ${param.resion == '울산' ? 'selected' : ''}>울산광역시</option>
												    <option value="세종특별자치시" ${param.resion == '세종특별자치시' ? 'selected' : ''}>세종특별자치시</option>
												    <option value="경기" ${param.resion == '경기' ? 'selected' : ''}>경기도</option>
												    <option value="강원특별자치도" ${param.resion == '강원특별자치도' ? 'selected' : ''}>강원특별자치도</option>
												    <option value="충북" ${param.resion == '충북' ? 'selected' : ''}>충청북도</option>
												    <option value="충남" ${param.resion == '충남' ? 'selected' : ''}>충청남도</option>
												    <option value="전북특별자치도" ${param.resion == '전북특별자치도' ? 'selected' : ''}>전북특별자치도</option>
												    <option value="전남" ${param.resion == '전남' ? 'selected' : ''}>전라남도</option>
												    <option value="경북" ${param.resion == '경북' ? 'selected' : ''}>경상북도</option>
												    <option value="경남" ${param.resion == '경남' ? 'selected' : ''}>경상남도</option>
												    <option value="제주특별자치도" ${param.resion == '제주특별자치도' ? 'selected' : ''}>제주특별자치도</option>
                                                 </select>
                                            </div>
                                            <div class="col-auto my-2 my-md-0" style="padding-left: 0;">
                                            	<select id="filterSelector" class="form-control form-select">
                                                    <option value="0" ${param.filter == '0' ? 'selected' : ''}>정렬</option>
                                                    <option value="1" ${param.filter == '1' ? 'selected' : ''}>개시중</option>
                                                    <option value="2" ${param.filter == '2' ? 'selected' : ''}>개시종료</option>
                                                 </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                  <div class="row product-grid" id="data-grid"></div>
                    <!-- end right panel section -->
					<div class="row mt-1-9 mt-lg-6">
	                     <div class="col-12">
	                         <div class="pagination text-small text-uppercase text-extra-dark-gray">
	                             <ul id="pagination"></ul>
	                         </div>
	                     </div>
               		</div>
                </div>
            </div>
            </div>
            
        </section>
        

<!--====================================작성부=====================================-->

<script>
$(document).ready(function () {
	
	let resion = $('#resionSelector').val();
	let filter = $('#filterSelector').val();
	let currentPage = 1;
	
	//console.log(filter);
	
	if(!'${param.currentPage}' == ''){
		currentPage = parseInt('${param.currentPage}', 10);
		console.log(currentPage);
	}
	
	//페이징 처리 호출
	newsPaging(resion, currentPage, filter);
	
	// 필터 설정 시 페이징 처리
	$('#resionSelector, #filterSelector').on('change', function(){
		resion = $('#resionSelector').val();
		filter = $('#filterSelector').val();
		currentPage = 1;
		newsPaging(resion, currentPage, filter);
	});
	
	//F5 클릭 시 최초 페이지로 이동
	$(document).on('keydown', function (e) {
        // F5 키(새로고침) 감지
        if (e.which === 116) {
            e.preventDefault(); // 기본 새로고침 방지

            // 특정 로직 처리
            if (window.location.pathname === '/admin/news_manage') {
                console.log('F5 detected on the specific page.');
                // 원하는 작업 실행
                location.href="/admin/news_manage";
            } else {
                console.log('F5 detected on a different page.');
            }
        }
    });
	
	
	
	
	
	
	
	
});//readay

</script>



<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
