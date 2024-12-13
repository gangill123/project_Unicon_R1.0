<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

<style>
.product-details:hover {
    opacity: 0.7; /* 투명도 설정 */
    transition: opacity 0.3s ease; /* 부드러운 애니메이션 효과 */
}

.product-img {
    width: 100%;
    aspect-ratio: 1 / 1; /* 원하는 가로:세로 비율 설정 */
    overflow: hidden;    /* 이미지가 컨테이너를 벗어나지 않도록 */
}

.product-img img {
    width: 100%;
    height: 100%;
    object-fit: fill;   /* 이미지를 컨테이너에 맞추되 비율 유지 */
    border-radius: 0.75rem; /* 기존 rounded-3 스타일 유지 */
}
.filtering span{
	margin-right: 50px;
}

.product-grid > [class*="col-"]{
	margin-top: 0;
}

.services-single-menu li a {
	font-size: 20px;
}

.services-single-menu li a:after {
	height: 2px;
}

</style>

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
	<%-- ${petAllInfo } --%>
	${memberInfo }
	<section  style="padding-top: 50px;">
            <div class="container">
            	<div class="line-title">
			        <h4 class="mb-0">마이페이지</h4>
			    </div>
                <div class="row">

                    <!-- start left side section -->
                    <div class="col-lg-3 order-2 order-lg-1">
                        <div class="pe-lg-1-9 pe-xl-2-3">
                        <!-- start services -->
                        <div class="services-single-left-box">
                            <div class="services-single-menu mb-1-9">
                                <ul class="m-0 list-unstyled">
                                    <li class="active"><a href="/mypage">프로필 관리</a></li>
                                    <li><a href="#!">커뮤니티 관리</a></li>
                                    <li><a href="/mypage/orders">주문 관리</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- end services -->
                        
                    </div>
                    </div>
                    <!-- end left side section -->

                    <!-- start right side section -->
                    <div class="col-lg-9 order-1 order-lg-2 mb-1-9 mb-lg-0">
                        <div class="services-single-right">
                        <h4>프로필 관리</h4>
                        <div class="common-block" style="padding: 30px;">
                        
                        <div class="row text-center" style="border-bottom: 1px solid #eee; padding-bottom: 20px;">
                            <div class="col-lg-3 mb-3 mb-lg-0">
                                <div class="product-img" style="padding: 10px;">
                                <img class="rounded-circle" src="${memberInfo.member_image }" alt="...">
                           		</div>
                            </div>
                            
                            <div class="col-lg-9 text-lg-start">
                            	<div class="col-lg-10">
                                <h4 style="margin-bottom: 0;">${memberInfo.member_name }</h4>
                                <c:choose>
                                	<c:when test="${memberInfo.member_rate == '특별회원' }">
                                		<span><i class="fa-solid fa-medal"></i> ${memberInfo.member_rate }</span>
                                	</c:when>
                                	<c:otherwise>
                                		<span>${memberInfo.member_rate }</span>
                                	</c:otherwise>	
                                </c:choose>
                                
                                <div class="row" style="text-align: center; margin-top: 20px;">
	                                <div class="col">
	                                	<a href="#!"><div>
		                                	<h5 style="margin-bottom: 0;">1</h5>
		                                	<span>유니콘</span>
	                                	</div></a>
	                            	</div>
	                                <div class="col">
	                                	<div>
		                                	<h5 style="margin-bottom: 0;">1</h5>
		                                	<span>게시물</span>
	                                	</div>
	                            	</div>
	                                <div class="col">
	                                	<div>
		                                	<h5 style="margin-bottom: 0;">1</h5>
		                                	<span>복지몰</span>
	                                	</div>
	                            	</div>
	                                <div class="col">
	                                	<div>
		                                	<h5 style="margin-bottom: 0;">1</h5>
		                                	<span>봉사활동</span>
	                                	</div>
	                            	</div>
                                </div>
                                </div>
                                
                            <div class="col-lg-12" style="text-align: end; margin-top: 25px;">
                            	<button type="button" class="btn btn-secondary btn-sm">내 정보 수정</button>
                            </div>
                            </div>
                        </div>
                        
                  <div class="row" style="margin-top: 30px;">
                    <!-- Start links -->
                    <div class="filtering col-sm-12 text-center">
                        <span id="myUni" class="active">나의 유니콘</span>
                        <span id="inUni" >관심 유니콘</span>
                        <span id="inItem" >관심 상품</span>
                    </div>
                    <!-- End links -->
                </div>
                        
                 <div class="row product-grid" style="min-height: 333.5px;">
                 	
                </div>
                
                <div class="row mt-1-9 mt-lg-6" style="margin-top: 0;">
	                     <div class="col-12">
	                         <div class="pagination text-small text-uppercase text-extra-dark-gray">
	                             <ul id="pagination"></ul>
	                         </div>
	                     </div>
               		</div>
                        
                        </div> <!-- common -->
                        </div>
                    </div>
                    <!-- end right side section -->

                </div>
            </div>
        </section>
	
	
	
	
	

<!--====================================작성부=====================================-->

<script>
$(document).ready(function () {
	let id = 'myUni';
	mypagePaging(id)
	
	// 탭 클릭 시 작동 로직
	$('.filtering span').on('click', function(){
		id = $(this).attr('id');
		console.log(id);
		$('.product-grid').empty();
		mypagePaging(id);
	});
	
	// 관심상품 삭제
	$('.product-grid').on('click','.delInItem',function(){
		//console.log($(this).data('id'));
		
		Swal.fire({
			  title: '정말 삭제하시겠습니까?',
			  text: "삭제 전 다시 한번 확인하시기 바랍니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#86bc42',
			  cancelButtonColor: '#aaa',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소',
			  customClass: {
			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			  }
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						url: '/mypage/delInItem/'+$(this).data('id'),
						type: 'POST',
						success: function(){
							//alert("ok");
							Swal.fire({
			  	  			  title: '삭제를 완료하였습니다!',
			  	  			  icon: 'success',
			  	  			  confirmButtonColor: '#86bc42',
			  	  			  customClass: {
			  			        popup: 'custom-swal-popup' // 사용자 정의 클래스 추가
			 			 	  }
			  				}).then(function(){
			  					mypagePaging('inItem');
			  				});
						},
						error: function(){
							alert("no");
						}
					});
				}
			});
	});
	
	
	
	
	
});//readay

</script>



<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
