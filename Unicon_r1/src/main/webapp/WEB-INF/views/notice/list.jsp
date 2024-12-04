<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ include file="../inc/new_topHeader.jsp" %>

<!-- CSS 파일 -->
<link href="${pageContext.request.contextPath }/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets_sub/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 추가 스타일 -->
<style>
.notice-card {
    cursor: pointer;
    transition: transform 0.2s;
    height: 100%;
    max-width: 300px;  /* 카드 최대 너비 제한 */
    margin: 0 auto;    /* 중앙 정렬 */
}
.notice-card:hover {
    transform: translateY(-5px);
}
.notice-image-wrapper {
    position: relative;
    padding-bottom: 100%;  /* 4:3 비율 설정 */
    overflow: hidden;
}
.notice-image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.notice-title {
    font-size: 1rem;  /* 글자 크기 축소 */
    margin: 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.badge-wrapper {
    display: flex;
    align-items: center;
    gap: 0.5rem;
}
.notice-header {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    margin-bottom: 0.5rem;
}
.card-body {
    padding: 1rem;  /* 패딩 축소 */
}
.load-more-btn {
    background-color: #fff;
    border: 2px solid #0d6efd;
    color: #0d6efd;
    padding: 10px 30px;
    border-radius: 25px;
    transition: all 0.3s;
}
.load-more-btn:hover {
    background-color: #0d6efd;
    color: #fff;
}
</style>

<%@ include file="../inc/new_header.jsp" %>

<!--====================================작성부=====================================-->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            <h1 class="mb-3">공지사항</h1>
            <p>유니콘의 새로운 소식과 정보를 전해드립니다</p>
        </div>

        <!-- 검색 영역 -->
        <form class="row g-4 mb-5" action="/notice" method="get">
            <div class="col-md-3">
                <select class="form-select" name="category">
                    <option value="">전체 카테고리</option>
                    <option value="안내사항" <c:if test="${category == '안내사항'}">selected</c:if>>안내사항</option>
                    <option value="이벤트" <c:if test="${category == '이벤트'}">selected</c:if>>이벤트</option>
                    <option value="센터소식" <c:if test="${category == '센터소식'}">selected</c:if>>센터소식</option>
                </select>
            </div>
            <div class="col-md-7">
                <input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요" value="${keyword}">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100">검색</button>
            </div>
        </form>

        <!-- 공지사항 목록 -->
        <div class="row g-4" id="noticeContainer">
		    <c:forEach items="${notices}" var="notice" varStatus="status">
		        <div class="col-lg-3 col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
		            <div class="card notice-card" onclick="location.href='/notice/${notice.noId}'">
		                <div class="notice-image-wrapper">
		                    <img src="${not empty notice.noThumb ? (notice.noThumb.startsWith('/') ? notice.noThumb : '/'.concat(notice.noThumb)) : '/resources/assets/images/default-thumb.png'}" 
		                         class="notice-image" 
		                         alt="공지사항 썸네일"
		                         onerror="this.src='/resources/assets_sub/img/default-thumb.jpg'">
		                </div>
		                <div class="card-body">
		                    <div class="notice-header">
		                        <c:if test="${notice.important}">
		                            <span class="badge bg-danger">중요</span>
		                        </c:if>
		                        <span class="badge bg-primary">${notice.noCategory}</span>
		                    </div>
		                    <h5 class="notice-title">${notice.noTitle}</h5>
		                </div>
		            </div>
		        </div>
		    </c:forEach>
		</div>
		
		<!-- 더보기 버튼 추가 -->
		<div class="text-center mt-5">
		    <button type="button" class="load-more-btn" id="loadMoreBtn" data-page="1">
		        더보기 <i class="fas fa-chevron-down ms-2"></i>
		    </button>
		</div>
		
		<!-- JavaScript 추가 -->
		<script>
		$(document).ready(function() {
		    var currentPage = 1;
		    var isLoading = false;
		    console.log("Initial total notices:", '${fn:length(notices)}');
		    var totalNotices = parseInt('${fn:length(notices)}'); // JSP 변수를 JavaScript 변수로 변환
			
		 	// 페이지 로드 시 체크
		    if (performance.navigation.type === performance.navigation.TYPE_RELOAD) {
		        // 새로고침으로 페이지가 로드된 경우
		        window.location.href = '/notice';
		    }
		    
		    // 초기에 더 불러올 데이터가 없으면 버튼 숨기기
		    if (totalNotices > 0) {  // 공지사항이 있으면 버튼 표시
		        $('#loadMoreBtn').show();
		    } else {
		        $('#loadMoreBtn').hide();
		    }

		    $('#loadMoreBtn').click(function() {
		        if (isLoading) return;
		        isLoading = true;
		        
		        currentPage++; // 페이지 증가
		        console.log("Loading page:", currentPage); // 디버깅용
		        
		        $.ajax({
		            url: '/notice/api/more',
		            type: 'GET',
		            data: {
		                page: currentPage,
		                category: $('select[name="category"]').val(),
		                keyword: $('input[name="keyword"]').val()
		            },
		            success: function(response) {
		                console.log("Response:", response); // 디버깅용
		                
		                if (response.notices && response.notices.length > 0) {
		                    response.notices.forEach(function(notice) {
		                        var thumbPath = notice.noThumb ? 
		                            (notice.noThumb.startsWith('/') ? notice.noThumb : '/' + notice.noThumb) : 
		                            '/resources/assets_sub/img/default-thumb.jpg';
		                            
		                        var card = 
		                            '<div class="col-lg-3 col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">' +
		                                '<div class="card notice-card" onclick="location.href=\'/notice/' + notice.noId + '\'">' +
		                                    '<div class="notice-image-wrapper">' +
		                                        '<img src="' + thumbPath + '" class="notice-image" alt="공지사항 썸네일" onerror="this.src=\'/resources/assets_sub/img/default-thumb.jpg\'">' +
		                                    '</div>' +
		                                    '<div class="card-body">' +
		                                        '<div class="notice-header">' +
		                                            (notice.important ? '<span class="badge bg-danger">중요</span>' : '') +
		                                            '<span class="badge bg-primary">' + notice.noCategory + '</span>' +
		                                        '</div>' +
		                                        '<h5 class="notice-title">' + notice.noTitle + '</h5>' +
		                                    '</div>' +
		                                '</div>' +
		                            '</div>';
		                            
		                        $('#noticeContainer').append(card);
		                    });
		                    
		                    if (!response.hasNext) {
		                        $('#loadMoreBtn').hide();
		                    }
		                } else {
		                    $('#loadMoreBtn').hide();
		                }
		            },
		            error: function(xhr, status, error) {
		                console.error('Error:', error);
		                console.error('Status:', status);
		                console.error('Response:', xhr.responseText);
		                currentPage--; // 실패시 페이지 번호 원복
		                alert('더 많은 공지사항을 불러오는데 실패했습니다.');
		            },
		            complete: function() {
		                isLoading = false;
		            }
		        });
		    });
		
		    function appendNotices(notices) {
		        const container = $('#noticeContainer');
		        notices.forEach(function(notice) {
		            var noticeHtml = 
		                '<div class="col-lg-3 col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">' +
		                    '<div class="card notice-card" onclick="location.href=\'/notice/' + notice.noId + '\'">' +
		                        '<div class="notice-image-wrapper">' +
		                            '<img src="' + (notice.noThumb || '/resources/assets_sub/img/default-thumb.jpg') + '" ' +
		                                 'class="notice-image" ' +
		                                 'alt="공지사항 썸네일">' +
		                        '</div>' +
		                        '<div class="card-body">' +
		                            '<div class="notice-header">' +
		                                (notice.important ? '<span class="badge bg-danger">중요</span>' : '') +
		                                '<span class="badge bg-primary">' + notice.noCategory + '</span>' +
		                            '</div>' +
		                            '<h5 class="notice-title">' + notice.noTitle + '</h5>' +
		                        '</div>' +
		                    '</div>' +
		                '</div>';
		            container.append(noticeHtml);
		        });
		    }
		});

		</script>	

		<!-- 빈 목록 처리 -->
		<c:if test="${empty notices}">
		    <div class="col-12 text-center">
		        <p>등록된 공지사항이 없습니다.</p>
		    </div>
		</c:if>

		<!-- 페이지네이션 -->
		<c:if test="${not empty notices}">
		    <div class="row mt-5">
		        <div class="col-12">
		            <nav aria-label="Page navigation">
		                <ul class="pagination justify-content-center">
		                    <!-- 첫 페이지 버튼 -->
		                    <c:if test="${page > 1}">
		                        <li class="page-item">
		                            <a class="page-link" href="/notice?page=1&amp;category=${category}&amp;keyword=${keyword}">
		                                <i class="fas fa-angle-double-left"></i>
		                            </a>
		                        </li>
		                    </c:if>
		                    
		                    <!-- 페이지 번호 -->
		                    <c:forEach begin="${Math.max(1, page - 2)}" end="${Math.min(totalPages, page + 2)}" var="pageNum">
		                        <li class="page-item ${pageNum == page ? 'active' : ''}">
		                            <a class="page-link" href="/notice?page=${pageNum}&amp;category=${category}&amp;keyword=${keyword}">
		                                ${pageNum}
		                            </a>
		                        </li>
		                    </c:forEach>
		                    
		                    <!-- 마지막 페이지 버튼 -->
		                    <c:if test="${page < totalPages}">
		                        <li class="page-item">
		                            <a class="page-link" href="/notice?page=${totalPages}&amp;category=${category}&amp;keyword=${keyword}">
		                                <i class="fas fa-angle-double-right"></i>
		                            </a>
		                        </li>
		                    </c:if>
		                </ul>
		            </nav>
		        </div>
		    </div>
		</c:if>
	
	</div>
</div> 		

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- 기존 JavaScript 라이브러리들 -->

<%@ include file="../inc/new_footer.jsp" %>