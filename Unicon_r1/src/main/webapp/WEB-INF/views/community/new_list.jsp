<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->
<style>
.xzoom-source{
z-index: 2000;
}

#xzoom_magnific{
	aspect-ratio: 1/1;
	width: 100%;
	height: 100%;
}

.project-grid-img {
    width: 100%;
    aspect-ratio: 1 / 1; /* 원하는 가로:세로 비율 설정 */
    overflow: hidden;    /* 이미지가 컨테이너를 벗어나지 않도록 */
}
</style>
</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<section>
   <div class="container">
       <div class="section-heading">
           <h2>유니콘 커뮤니티</h2>
           <p style="font-size: 24px;" class="w-md-75 w-lg-55">새로운 유니콘들과의 이야기 공간 입니다 ~~ !!</p>
       </div>
   </div>
   
   <!-- 로그인된 아이디 -->
   <input type="hidden" id="loginMemberId" value="${userId }">
   
   <!-- <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#jjjModal">Launch modal</button> -->

   <div class="container">
       <div class="row">

           <!-- Start links -->
           <div class="filtering col-sm-12 text-center">
               <span data-type='post01' data-filter='*' class="active">입양 후기</span>
               <span data-type='post02' data-filter='.business'>반려 이야기</span>
               <span data-type='post03' data-filter='.finance'>실종</span>
               <span data-type='post04' data-filter='.consulting'>임시 보호</span>
           </div>
           <!-- End links -->
           
           <select id="resionFilter" name="" class="form-control form-select" style="margin-top: 5px; margin-bottom: 5px; margin-right: 10px; width: 125px;">
			   <option value="모든 지역">모든 지역</option>
			   <option value="서울">서울</option>
			   <option value="인천">인천</option>
			   <option value="부산">부산</option>
			   <option value="대구">대구</option>
			   <option value="광주">광주</option>
			   <option value="대전">대전</option>
			   <option value="울산">울산</option>
			   <option value="세종특별시">세종특별시</option>
			   <option value="경기">경기</option>
			   <option value="강원특별자치도">강원특별자치도</option>
			   <option value="충북">충북</option>
			   <option value="충남">충남</option>
			   <option value="전북특별자치도">전북특별자치도</option>
			   <option value="전남">전남</option>
			   <option value="경북">경북</option>
			   <option value="경남">경남</option>
			   <option value="제주특별자치도">제주특별자치도</option>
			</select>
		   
		   <select id="animalFilter" name="" class="form-control form-select" style="margin-top: 5px; margin-bottom: 5px; margin-right: 10px; width: 125px;">
		       <option value="0">모든 동물</option>
		       <option value=1000>개</option>
		       <option value=2000>고양이</option>
		       <option value=3000>기타</option>
		   </select>
		   
<!-- 		   <select id="sortFilter" name="" class="form-control form-select" style="margin-top: 5px; margin-bottom: 5px; margin-right: 10px; width: 125px;"> -->
<!-- 		       <option value="최신순">최신순</option> -->
<!-- 		       <option value="좋아요순">좋아요순</option> -->
<!-- 		   </select> -->
		   
           <button class="btn btn-outline-success" id="search" style="margin-top: 5px; margin-bottom: 5px; margin-right: 10px; width: 75px;">검색</button>
       </div>
       
       <!-- start portfolio gallery -->
       <div class="text-center row communityType" id="postListList">

		   <c:forEach var="p" items="${postList}" varStatus="status">
			    <div class="col-lg-3 col-md-6 items finance mt-3 post-item ${status.index >= 8 ? 'd-none' : ''}" data-src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-2.jpg" data-sub-html="<h4 class='text-white'>Investment Project #01</h4><p>Finance Plan</p>">
			        <div class="project-grid" style="display: flex; flex-wrap: wrap;">
			            <div class="project-grid-img">
			                <c:choose>
			                    <c:when test="${not empty p.post_images}">
			                        <c:forEach var="img" items="${p.post_images}">
			                            <c:if test="${img.image_sequence == 0}">
			                                <img style="width: 100%; height: 100%; object-fit: fill;" alt="..." src="${img.image_src}">
			                            </c:if>
			                        </c:forEach>
			                    </c:when>
			                    <c:otherwise>
			                        <img style="width: 100%; height: 100%; object-fit: fill;" alt="..." src="${pageContext.request.contextPath}/resources/new_assets/img/projects/pro-2.jpg">
			                    </c:otherwise>
			                </c:choose>
			            </div>
			            <div class="project-grid-overlay">
			                <div class="w-100 px-3">
			                    <h4><a href="#!" class="open-modal" data-post-id="${p.post_id}" data-bs-toggle="modal" data-bs-target="#jjjModal">게시물 보기</a></h4>
			                    <p>${p.memberVO.member_nickname}</p>
			                </div>
			            </div>
			        </div>
			    </div>
			</c:forEach>
			
			<c:if test="${fn:length(postList) > 8}">
	            <div class="text-center mt-4">
	                <button class="btn btn-outline-success" id="loadMoreOngoing">더보기</button>
	            </div>
	        </c:if>
       </div> <!-- <div class="portfolio-gallery-isotope text-center row"> -->
       <!-- end portfolio gallery -->

    </div>
</section>

<!-- 모달2 -->
<div class="modal fade" id="jjjModal" tabindex="-1" 
	aria-labelledby="exampleModalLabel" aria-hidden="true" style="top: 50px;">
    <div class="modal-dialog" style="max-width: 1200px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                해당 커뮤니티 종류 / 
                개 / 
                기타견종 / 
                시고르자브종
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-6 mb-sm-7 mb-md-8 mb-lg-9" style="margin-bottom: 28px;">
                   <div class="col-lg-5 text-center text-lg-start mb-1-9 mb-lg-0">

                       <!-- product left start -->
                       <div class="xzoom-container">
                           <img class="xzoom5 mb-1-9" id="xzoom_magnific" src="${pageContext.request.contextPath }/resources/new_assets/img/shop/original/01_product.jpg" xoriginal="${pageContext.request.contextPath }/resources/new_assets/img/shop/original/01_product.jpg" alt="..." style="min-width:472px; width: 472px; height: 472px; object-fit: fill;">
                           <div class="xzoom-thumbs m-0">
                               <a id="aImg1" href="${pageContext.request.contextPath }/resources/new_assets/img/shop/original/01_product.jpg"><img id="imgImg1" class="xzoom-gallery5 xactive" style="height: 80px; width: 80px;" src="${pageContext.request.contextPath }/resources/new_assets/img/shop/thumbs/01_product.jpg" xpreview="${pageContext.request.contextPath }/resources/new_assets/img/shop/preview/01_product.jpg" alt="..." title="The description goes here"></a>
                               <a id="aImg2" href="${pageContext.request.contextPath }/resources/new_assets/img/shop/original/02_product.jpg"><img id="imgImg2" class="xzoom-gallery5" style="height: 80px; width: 80px;" src="${pageContext.request.contextPath }/resources/new_assets/img/shop/preview/02_product.jpg" alt="..."  title="The description goes here"></a>
                               <a id="aImg3" href="${pageContext.request.contextPath }/resources/new_assets/img/shop/original/03_product.jpg"><img id="imgImg3" class="xzoom-gallery5" style="height: 80px; width: 80px;" src="${pageContext.request.contextPath }/resources/new_assets/img/shop/preview/03_product.jpg" alt="..." title="The description goes here"></a>
                               <a id="aImg4" href="${pageContext.request.contextPath }/resources/new_assets/img/shop/original/04_product.jpg"><img id="imgImg4" class="xzoom-gallery5" style="height: 80px; width: 80px;" src="${pageContext.request.contextPath }/resources/new_assets/img/shop/preview/04_product.jpg" alt="..." title="The description goes here"></a>
                           </div>
                       </div>
                       <!-- product left end -->

                   </div>
                   
                   <div id="postButton" class="col-lg-7 ps-lg-2-3">
                       <div class="product-detail" style="overflow-y: auto; max-height: 470px;">
                           <div class="media">
                                
                                <a id="postMemberLink" data-member-id="" href="">
                                <img id="postMemberImg" src="${pageContext.request.contextPath }/resources/assets/images/avatar-01.jpg" class="me-3" style="border-radius: 50%; width: 60px; height: 60px;" alt="...">
                                </a>
                                
                                <div class="media-body">
                                    <h4 id="postMemberNick" class="mt-0 mb-2 h4">징젱종잉123</h4>
                                    <!-- <h6 class="mt-0 mb-2 h6">1998-07-11 00:00 좋아요 711개 <i class="fa-regular fa-heart"></i></h6> -->
                                    <p id="postTitle">동물병원 다녀왔어요 ㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ</p>
                                </div>
                            </div>
                           <div class="bg-primary separator-line-horrizontal-full mb-4"></div>
                           <p id="postPetDate">실종(발견) 일자 : 2024-08-24</p>
                           <p id="postPetPlace">실종(발견) 장소 : 부산광역시 부산진구 부전1동 일대</p>
                           <p id="postContent">Lorem ipsum dolor ut sit ame dolore adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.</p>
                           <div class="bg-primary separator-line-horrizontal-full mb-4"></div>
                           
<!--                            <div style="margin-bottom: 20px;"> -->
<!--                        			<select id="" name="" class="form-control form-select" style="width: 120px; height: 28px;"> -->
<!--                        				<option value="">최신순</option> -->
<!--                        				<option value="">좋아요순</option> -->
<!--                        			</select> -->
<!--                        		</div> -->
                           
                           <div class="contentRecycle">
                           	   
                            </div> <!-- <div class="contentRecycle"> -->
                           
                       </div> <!-- <div class="product-detail"> -->
                       
                       <div style="width: 100%; height: 36px; margin-top: 10px;">
                       		<span id="postDate" style="margin-right: 5%;">1998-07-11 00:00</span><span id="postLikeCount" style="margin-right: 5%;">좋아요 711개</span><span style="margin-right: 5%;"><i id="postLikeCheck" class="fa-regular fa-heart"></i><%-- <c:if test="${isPostLike }"><i class="fa-solid fa-heart"></i></c:if><c:if test="${!isPostLike }"><i class="fa-regular fa-heart"></i></c:if> --%></span>
                       </div>
                       <input type="hidden" id="selectPost"/>
                       <input id="commentContent" type="text" style="width: 84%; height: 36px; margin-bottom: 10px;" placeholder="댓글 달기...">
                       <button id="commentContentBtn" type="button" class="btn btn-outline-success" style="width: 15%;"><!-- 댓글 --><i class="fas fa-paper-plane"></i></button>
                       
                       <button id="updatePost" type="button" class="btn btn-outline-primary">수정</button>
                       <!-- <button type="button" class="btn btn-outline-danger">신고</button> -->
                       <button id="deletePost" type="button" class="btn btn-outline-danger">삭제</button>
                       
                   </div> <!-- <div class="col-lg-7 ps-lg-2-3"> -->
                       
               </div> <!-- <div class="row mb-6 mb-sm-7 mb-md-8 mb-lg-9"> -->
            </div> <!-- <div class="modal-body"> -->
            
        </div> <!-- <div class="modal-content"> -->
    </div> <!-- <div class="modal-dialog" style="max-width: 1200px;"> -->
</div>


<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->
<script>
$(document).ready(function(){
	
	// 헤더 메뉴바 선택된 채로 보여줌
	$('.navbar #community').addClass('current');
	
	// 기본 이미지 URL을 변수에 저장
	var defaultImage1 = '${pageContext.request.contextPath }/resources/new_assets/img/shop/original/01_product.jpg';
	var defaultImage2 = '${pageContext.request.contextPath }/resources/new_assets/img/shop/original/02_product.jpg';
	var defaultImage3 = '${pageContext.request.contextPath }/resources/new_assets/img/shop/original/03_product.jpg';
	var defaultImage4 = '${pageContext.request.contextPath }/resources/new_assets/img/shop/original/04_product.jpg';
	
	$('#search').on('click',function(){
		let resionFilter = $('#resionFilter').val();
		let animalFilter = $('#animalFilter').val();
// 		let sortFilter = $('#sortFilter').val();
		let postType = $('.filtering .active').data('type');
		// console.log(resionFilter);
		// console.log(animalFilter);
// 		console.log(sortFilter);
		// console.log(postType);
		
		readPostType02(postType, resionFilter, animalFilter);
	});
	
	// 모달 열때마다 게시물id 초기화
	var post_id = null;
	
	// 더보기 버튼 제어
	$('#loadMoreOngoing').on('click', function() {
	    const hiddenItems = $('#postListList .post-item.d-none');
	    const itemsToShow = hiddenItems.slice(0, 8);
	    
	    itemsToShow.removeClass('d-none');
	    
	    if (hiddenItems.length <= 8) {
	        $(this).hide();
	    }
	});
	// 더보기 버튼 제어
	
	// 게시물 종류 클릭
	$('.filtering span').on('click', function(){
		
		let postType = $(this).data('type');
		// console.log(postType);
		
		readPostType(postType);
		
		// 필터 초기화
		$('#resionFilter').val('모든 지역');
		$('#animalFilter').val(0);
// 		$('#sortFilter').val('최신순');
	});
	// 게시물 종류 클릭
	
	// 모달 여는 글자 클릭
	$('.communityType').on('click','.open-modal', function() {
		
		// 모달 열기 전에 댓글 초기화 시키기
		$('.contentRecycle').empty();
		
        // 클릭한 요소의 data-post-id 속성에서 게시물ID 가져오기
        post_id = $(this).data('post-id');
        // console.log(post_id);
        
        // 클릭한 요소의 게시물ID를 댓글 히든에 저장하기
        $('#selectPost').val(post_id);
        
        $.ajax({
        	url : '${pageContext.request.contextPath }/community/getAll/' + post_id,
        	method : 'GET',
        	dataType : 'json',
        	success : function(data){
        		
        		// 게시물 주인 프로필 이미지 눌렀을때 이동하기
        		let memberId = data.postList.member_id;
        		// console.log(memberId);
                $('#postMemberLink').data('member-id', memberId);  // data-member-id를 업데이트
            	$('#postMemberLink').attr('href', '/community/profile/' + memberId);  // 링크의 href 업데이트
            	
             	// 댓글 주인 프로필 이미지 눌렀을때 이동하기
            	// 맨 아래에 있음
            	
            	// 게시물 수정, 삭제 버튼 제어
        		var loginId = $('#loginMemberId').val();
        		if(memberId != loginId){
        			$('#updatePost').attr('style', 'display:none;');
        			$('#deletePost').attr('style', 'display:none;');
        		}else{
        			$('#updatePost').attr('style', '');
        			$('#deletePost').attr('style', '');
        		}
        		
        		// 기본 이미지로 초기화
        		$('#xzoom_magnific').attr('src', defaultImage1);
                $('#xzoom_magnific').attr('xoriginal', defaultImage1);
                $('#aImg1').attr('href', defaultImage1);
                $('#imgImg1').attr('src', defaultImage1);
                $('#imgImg1').attr('xpreview', defaultImage1);
                $('#aImg2').attr('href', defaultImage2);
                $('#imgImg2').attr('src', defaultImage2);
                $('#aImg3').attr('href', defaultImage3);
                $('#imgImg3').attr('src', defaultImage3);
                $('#aImg4').attr('href', defaultImage4);
                $('#imgImg4').attr('src', defaultImage4);
        		
        		// 확인용 콘솔 로그
        		// console.log('AJAX 호출 성공');
                // console.log(data);
        		// console.log(data.commentList);
        		
        		var exampleModalLabel = data.postList.post_resion+' / '+data.postList.categoryDataVO.category_value+' / '+data.postList.pet_etc_breed;
        		$('#exampleModalLabel').html(exampleModalLabel);
        		// 모달 게시물 작성자 프로필 이미지 부분
         		var postMemberImg = data.postList.memberVO.member_image;
         		$('#postMemberImg').attr('src', postMemberImg);
        		// 모달 게시물 작성자 닉네임 부분
        		var postMemberNick = data.postList.memberVO.member_nickname;
        		$('#postMemberNick').html(postMemberNick);
        		// 모달 게시물 제목 부분
        		var postTitle = data.postList.post_title;
        		$('#postTitle').html(postTitle);
        		// 모달 게시물 내용 부분
        		var postContent = data.postList.post_content;
        		$('#postContent').html(postContent);
        		// 모달 게시물 실종(발견) 장소, 일자 부분
        		if(data.postList.post_type == 'post03' || data.postList.post_type == 'post04'){
	        		var postPetDate = '실종(발견) 일자 : '+data.postList.post_pet_date;
	        		$('#postPetDate').html(postPetDate);
	        		var postPetPlace = '실종(발견) 장소 : '+data.postList.post_pet_place;
	        		$('#postPetPlace').html(postPetPlace);
        		} else {
        			var postPetDate = data.postList.post_pet_date;
	        		$('#postPetDate').html(postPetDate);
	        		var postPetPlace = data.postList.post_pet_place;
	        		$('#postPetPlace').html(postPetPlace);
        		}
        		// 모달 게시물 생성 날짜 부분
        		var postDate = data.postList.post_date;
        		$('#postDate').html(postDate);
        		// 모달 게시물 좋아요 개수 부분
        		var postLikeCount = data.postList.post_likes[0].post_like_count+'개';
        		$('#postLikeCount').html(postLikeCount);
        		// 모달 게시물 이미지 관련 부분
        		if(data.postList.post_images[0] != null){
	        		var xzoom_magnific = data.postList.post_images[0].image_src;
	        		$('#xzoom_magnific').attr('src', xzoom_magnific);
	        		$('#xzoom_magnific').attr('xoriginal', xzoom_magnific);
	        		var aImg1 = data.postList.post_images[0].image_src;
	        		$('#aImg1').attr('href', aImg1);
	        		var imgImg1 = data.postList.post_images[0].image_src;
	        		$('#imgImg1').attr('src', imgImg1);
	        		$('#imgImg1').attr('xpreview', imgImg1);
        		}else{
        			$('#xzoom_magnific').attr('src', defaultImage1);
                    $('#xzoom_magnific').attr('xoriginal', defaultImage1);
                    $('#aImg1').attr('href', defaultImage1);
                    $('#imgImg1').attr('src', defaultImage1);
                    $('#imgImg1').attr('xpreview', defaultImage1);
        		}
        		if(data.postList.post_images[1] != null && data.postList.post_images[1].image_src != ''){
	        		var aImg2 = data.postList.post_images[1].image_src;
	        		$('#aImg2').attr('href', aImg2);
	        		var imgImg2 = data.postList.post_images[1].image_src;
	        		$('#imgImg2').attr('src', imgImg2);
        		}if(data.postList.post_images[1] == null || data.postList.post_images[1].image_src == ''){
        			$('#aImg2').remove();
        			$('#imgImg2').remove();
        		}
        		if(data.postList.post_images[2] != null && data.postList.post_images[2].image_src != ''){
	        		var aImg3 = data.postList.post_images[2].image_src;
	        		$('#aImg3').attr('href', aImg3);
	        		var imgImg3 = data.postList.post_images[2].image_src;
	        		$('#imgImg3').attr('src', imgImg3);
        		}if(data.postList.post_images[2] == null || data.postList.post_images[2].image_src == ''){
        			$('#aImg3').remove();
        			$('#imgImg3').remove();
        		}
        		if(data.postList.post_images[3] != null && data.postList.post_images[3].image_src != ''){
	        		var aImg4 = data.postList.post_images[3].image_src;
	        		$('#aImg4').attr('href', aImg4);
	        		var imgImg4 = data.postList.post_images[3].image_src;
	        		$('#imgImg4').attr('src', imgImg4);
        		}if(data.postList.post_images[3] == null || data.postList.post_images[3].image_src == ''){
        			$('#aImg4').remove();
        			$('#imgImg4').remove();
        		}
        		
        		// 댓글 목록
        		addCommentsToModal(data.commentList);
        		
        		// 게시물 좋아요 버튼 클릭 이벤트 핸들러
        		function togglePostLike() {
        		    if (data.isPostLike == true) {
        		        $('#postLikeCheck').attr('class', 'fa-solid fa-heart');
        		    } else {
        		        $('#postLikeCheck').attr('class', 'fa-regular fa-heart');
        		    }

        		    $('#postLikeCheck').off('click').on('click', function() {
        		        if (data.isPostLike == true) {
        		            // 좋아요 취소
        		            $.ajax({
        		                url: '${pageContext.request.contextPath }/community/postLikeDelete/' + post_id,
        		                type: 'POST',
        		                data: { member_id: $('#loginMemberId').val() },
        		                success: function(data) {
        		                    alert('이 게시물의 좋아요를 취소합니다.');
        		                    $('#postLikeCheck').attr('class', 'fa-regular fa-heart');
        		                    // 상태 업데이트
        		                    data.isPostLike = false;
        		                },
        		                error: function(data) {
        		                    alert('이 게시물 좋아요 취소에 실패했습니다.');
        		                }
        		            });
        		        } else {
        		            // 좋아요 추가
        		            $.ajax({
        		                url: '${pageContext.request.contextPath }/community/postLikeInsert/' + post_id,
        		                type: 'POST',
        		                data: { member_id: $('#loginMemberId').val() },
        		                success: function(data) {
        		                    alert('이 게시물을 좋아합니다.');
        		                    $('#postLikeCheck').attr('class', 'fa-solid fa-heart');
        		                    // 상태 업데이트
        		                    data.isPostLike = true;
        		                },
        		                error: function(data) {
        		                    alert('이 게시물 좋아요에 실패했습니다.');
        		                }
        		            });
        		        }
        		    });
        		}

        		// 게시물 좋아요 버튼 이벤트
        		togglePostLike();
        		
        		// 댓글 좋아요 버튼 클릭 이벤트 핸들러
        		function toggleCommentLike() {
        		    $('.commentLikeCheck').off('click').on('click', function() {
        		        var comment_id = $(this).data('comment-id');
        		        var isCommentLike = $(this).hasClass('fa-solid'); // 현재 좋아요 상태 확인

        		        if (isCommentLike == true) {
        		            // 좋아요 취소
        		            $.ajax({
        		                url: '${pageContext.request.contextPath }/community/commentLikeDelete/' + comment_id,
        		                type: 'POST',
        		                data: { member_id: $('#loginMemberId').val() },
        		                success: function(data) {
        		                    alert('이 댓글의 좋아요를 취소합니다.');
        		                    $(this).attr('class', 'fa-regular fa-heart commentLikeCheck'); // 클릭한 버튼만 변경
        		                    // console.log(comment_id);
        		                }.bind(this), // this를 현재 클릭한 요소로 바인딩
        		                error: function(data) {
        		                    alert('이 댓글 좋아요 취소에 실패했습니다.');
        		                    // console.log(comment_id);
        		                    // console.log($('#loginMemberId').val());
        		                }
        		            });
        		        } else {
        		            // 좋아요 추가
        		            $.ajax({
        		                url: '${pageContext.request.contextPath }/community/commentLikeInsert/' + comment_id,
        		                type: 'POST',
        		                data: { member_id: $('#loginMemberId').val() },
        		                success: function(data) {
        		                    alert('이 댓글을 좋아합니다.');
        		                    $(this).attr('class', 'fa-solid fa-heart commentLikeCheck'); // 클릭한 버튼만 변경
        		                    // console.log(comment_id);
        		                }.bind(this), // this를 현재 클릭한 요소로 바인딩
        		                error: function(data) {
        		                    alert('이 댓글 좋아요에 실패했습니다.');
        		                    // console.log(comment_id);
        		                    // console.log($('#loginMemberId').val());
        		                }
        		            });
        		        }
        		    });
        		}

        		// 댓글 좋아요 버튼 이벤트
        		toggleCommentLike();
        		
        	},
        	error : function(){
        		alert('게시물을 불러오는데 실패했습니다.');
        	}
        	
        }); // $.ajax 
        
     // 댓글 등록
       $('#commentContentBtn').on('click', function(){
       	var content = {
       		'post_id':$('#selectPost').val(),
       		'member_id':$('#loginMemberId').val(),
       		'comment_content':$('#commentContent').val()
       	};
       	
       	// 댓글 내용이 비어있는지 확인
           if (!content.comment_content) {
               alert('댓글을 적어주세요.');
               // 실행 중단
               return;
           }
       	
           Swal.fire({
   			title: '등록하시겠습니까?',
   			text: '댓글이 등록됩니다!',
   			icon: 'info',
   			showCancelButton: true,
   			confirmButtonColor: '#006e60',
   			cancelButtonColor: '#aab2bd',
   			confirmButtonText: '등록',
   			cancelButtonText: '닫기'
   		}).then(function(result) {
   			if (result.isConfirmed) {
   				$.ajax({
   	        		url : '${pageContext.request.contextPath }/community/insertComment',
   	        		type : 'POST',
   	        		data : JSON.stringify(content),
   	        		contentType : "application/json",
   	        		success: function(response) {
   	        			Swal.fire({
       						title: '등록 완료',
       						text: '댓글이 등록되었습니다!',
       						icon: 'success',
       						confirmButtonColor: '#006e60',
       						confirmButtonText: '확인'
       						}).then(function(data){
       							// console.log('댓글 등록 응답 : ',data);
       							$("#commentContent").val('');
    							addCommentsToModal(data);
       						});
   	        		},
   	        		error: function(jqXHR, textStatus, errorThrown) {
   						console.error('등록 실패:', textStatus, errorThrown);
//    						Swal.fire({
//    							title: '오류!',
//    							text: '등록에 실패했습니다.',
//    							icon: 'error',
//    							confirmButtonColor: '#006e60',
//    							confirmButtonText: '확인'
//    						});
   						Swal.fire({
   							title: '로그인 X',
   							text: '로그인이 되어있지 않습니다!',
   							icon: 'error',
   							confirmButtonColor: '#006e60',
   							confirmButtonText: '확인'
   						}).then(function(result){
   							Swal.fire({
   					   			title: '로그인',
   					   			text: '페이지로 이동하시겠습니까?',
   					   			icon: 'info',
   					   			showCancelButton: true,
   					   			confirmButtonColor: '#006e60',
   					   			cancelButtonColor: '#aab2bd',
   					   			confirmButtonText: '이동',
   					   			cancelButtonText: '닫기'
   					   		}).then(function(data){
   					   			if(data.isConfirmed){
   					   				location.href = '/login/customLogin';
   					   			}
   					   		});
   						});
   					}
   	        	}); // $.ajax
   			}
   		});
       	
       }); // 댓글 등록 클릭
       // 댓글 등록
        
        // 댓글 삭제
        $(document).on('click', '.btnDelete', function(){
        	// 버튼에서 댓글 ID 가져오기
         	var comment_id = $(this).data('comment-id');
        	
         	Swal.fire({
    			title: '삭제하시겠습니까?',
    			text: '댓글이 삭제됩니다!',
    			icon: 'info',
    			showCancelButton: true,
    			confirmButtonColor: '#006e60',
    			cancelButtonColor: '#aab2bd',
    			confirmButtonText: '삭제',
    			cancelButtonText: '닫기'
    		}).then(function(result) {
    			if (result.isConfirmed) {
    				$.ajax({
    	        		url : '${pageContext.request.contextPath }/community/deleteComment/' + comment_id,
    	        		type : 'DELETE',
    	        		success: function(response) {
    	        			Swal.fire({
        						title: '삭제 완료',
        						text: '댓글이 삭제되었습니다!',
        						icon: 'success',
        						confirmButtonColor: '#006e60',
        						confirmButtonText: '확인'
        						}).then(function(data){
        							addCommentsToModal(data);
        						});
    	        		},
    	        		error: function(jqXHR, textStatus, errorThrown) {
    						console.error('삭제 실패:', textStatus, errorThrown);
    						Swal.fire({
    							title: '오류!',
    							text: '삭제에 실패했습니다.',
    							icon: 'error',
    							confirmButtonColor: '#006e60',
    							confirmButtonText: '확인'
    						});
    					}
    	        	}); // $.ajax
    			}
    		});
        }); // 댓글 삭제 클릭
     	// 댓글 삭제
     	
     	// 게시물 삭제
     	$(document).on('click', '#deletePost', function(){
     		Swal.fire({
    			title: '삭제하시겠습니까?',
    			text: '게시물이 바로 삭제됩니다!',
    			icon: 'info',
    			showCancelButton: true,
    			confirmButtonColor: '#006e60',
    			cancelButtonColor: '#aab2bd',
    			confirmButtonText: '삭제',
    			cancelButtonText: '닫기'
    		}).then(function(result) {
    			if (result.isConfirmed) {
    				$.ajax({
    					url: '${pageContext.request.contextPath }/community/deletePost/' + post_id,
    					type: 'DELETE',
    					contentType: false,
    					processData: false,
    					success: function(response) {
    						Swal.fire({
    						title: '삭제 완료',
    						text: '게시물이 삭제되었습니다!',
    						icon: 'success',
    						confirmButtonColor: '#006e60',
    						confirmButtonText: '확인'
    						}).then(function(result){
    							if(result.isConfirmed){
    								location.reload();
    							}
    						});
    					},
    					error: function(jqXHR, textStatus, errorThrown) {
    						console.error('삭제 실패:', textStatus, errorThrown);
    						Swal.fire({
    							title: '오류!',
    							text: '삭제에 실패했습니다.',
    							icon: 'error',
    							confirmButtonColor: '#006e60',
    							confirmButtonText: '확인'
    						});
    					}
    				});
    			}
    		});
     	}); // 게시물 삭제 클릭
     	// 게시물 삭제
     	
     	// 게시물 수정
     	$(document).on('click', '#updatePost', function(){
     		Swal.fire({
    			title: '수정하시겠습니까?',
    			text: '확인 버튼을 누르면 이동합니다!',
    			icon: 'info',
    			showCancelButton: true,
    			confirmButtonColor: '#006e60',
    			cancelButtonColor: '#aab2bd',
    			confirmButtonText: '확인',
    			cancelButtonText: '취소'
    		}).then(function(result) {
    			if (result.isConfirmed) {
    				window.location.href = '${pageContext.request.contextPath }/community/update/' + post_id;
    			}
    		});
     	}); // 게시물 수정 클릭
     	// 게시물 수정
     	
    }); // 모달 여는 글자 클릭
    
 	// 댓글을 모달에 추가하는 함수
    function addCommentsToModal(commentList) {
	    let loginMemberId2 = $('#loginMemberId').val();
	    // 댓글 목록을 반복하여 모달에 추가
	    $.each(commentList, function(index, comments) {
	        // 기본 HTML 구조
	        let commentHTML = 
	            '<div class="media" style="margin-bottom: 30px;">' +
	                '<a class="postMemberLink" data-member-id="'+comments.memberVO.member_id+'" href="/community/profile/'+comments.memberVO.member_id+'">'+
	                    '<img src="' + comments.memberVO.member_image + '" class="me-3" style="border-radius: 50%; width: 60px; height: 60px;" alt="...">' +
	                '</a>' +
	                '<div class="media-body">' +
	                    '<div class="container" style="display: flex; flex-direction: column; padding: 0px;">' +
	                        '<div class="top-section" style="display: flex; width: 100%;">' +
	                            '<div class="box" style="display: flex; width: 60%; text-align: left;"><h4 class="mt-0 mb-2 h5">' + comments.memberVO.member_nickname + '</h4></div>' +
	                            '<div class="box" style="display: flex; justify-content: center; align-items: center; width: 40%; text-align: center;">' + comments.comment_date + '</div>' +
	                        '</div>' +
	                        '<div class="bottom-section" style="display: flex; justify-content: flex-start; align-items: center;">' +
	                            '<div class="box" style="text-align: left;">' + comments.comment_content;
	
	        // 조건에 따라 삭제 버튼 추가
	        if (comments.member_id === loginMemberId2) {
	            commentHTML += '<button type="button" style="margin-left: 5px; color: grey;" class="btn btn-link btnDelete" data-comment-id="'+comments.comment_id+'">삭제</button>';
	        }
	
	        commentHTML += '</div></div></div></div></div>';
	
	        // 동적으로 HTML 추가
	        $('.contentRecycle').append(commentHTML);
	    });
	}
 	// 댓글을 모달에 추가하는 함수
 
}); // 돔레디
</script>
<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
