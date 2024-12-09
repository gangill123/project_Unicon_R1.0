<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/assets_sub/css/style.css" rel="stylesheet">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

	<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
	<script src="https://unpkg.com/react@17/umd/react.development.js"></script>
	<script src="https://unpkg.com/react-dom@17/umd/react-dom.development.js"></script>
	<script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
	    // 카카오톡 초기화
	    Kakao.init('18f9a4aa756be8832a47aaf75ca13ce9');
	</script>

</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<!-- 공지사항 상세 부분 -->
<div class="container-xxl py-5">
    <div class="container">
        <!-- 공지사항 상세 내용 -->
        <div class="card-header bg-white border-bottom">
		    <div class="d-flex flex-column">
		        <div class="d-flex justify-content-between align-items-center mb-2">
		            <div>
		                <span class="badge bg-primary me-2">${notice.noCategory}</span>
		                <h4 class="mb-0 d-inline-block">${notice.noTitle}</h4>
		            </div>
		            <div class="text-muted">
		                <small>등록일: <fmt:formatDate value="${notice.noRegDate}" pattern="yyyy-MM-dd"/></small>
		                <small class="ms-3">조회수: ${notice.viewCount}</small>
		            </div>
		        </div>
		        <div class="d-flex justify-content-end">
		            <button type="button" class="btn btn-outline-primary btn-sm" onclick="openShareModal()">
					    <i class="fas fa-share-alt me-1"></i>공유하기
					</button>
		        </div>
		    </div>
		</div>
            
            <div class="card-body">
                <!-- 썸네일 이미지가 있는 경우 -->
<%--                 <c:if test="${not empty notice.noThumb}"> --%>
<!--                     <div class="text-center mb-4"> -->
<%--                         <img src="${notice.noThumb}" class="img-fluid" alt="썸네일"> --%>
<!--                     </div> -->
<%--                 </c:if> --%>
                
                <!-- 본문 내용 -->
                <div class="notice-content">
                    ${notice.noContent}
                </div>
                
                <!-- 첨부파일 목록 -->
<%--                 <c:if test="${not empty notice.files}"> --%>
<!--                     <div class="mt-4 border-top pt-3"> -->
<!--                         <h6>첨부파일</h6> -->
<!--                         <ul class="list-unstyled"> -->
<%--                             <c:forEach items="${notice.files}" var="file"> --%>
<!--                                 <li> -->
<!--                                     <i class="fas fa-paperclip me-2"></i> -->
<%--                                     <a href="/notice/download/${file.fileId}">${file.originalName}</a> --%>
<!--                                     <span class="text-muted ms-2"> -->
<%--                                         (<fmt:formatNumber value="${file.fileSize / 1024}" pattern="#,##0.0"/> KB) --%>
<!--                                     </span> -->
<!--                                 </li> -->
<%--                             </c:forEach> --%>
<!--                         </ul> -->
<!--                     </div> -->
<%--                 </c:if> --%>
            </div>
            
            <div class="card-footer bg-white">
            	<div class="d-flex justify-content-between align-items-center">
              	  <a href="/notice" class="btn btn-secondary">목록으로</a>
           		<div>
                    <!-- 이전글/다음글 네비게이션 -->
                    <div class="btn-group me-2">
                        <c:if test="${prevNotice != null}">
                            <a href="/notice/${prevNotice.noId}" 
                               class="btn btn-outline-secondary d-flex align-items-center">
                                <i class="fas fa-chevron-left me-2"></i>
                                <span class="d-none d-md-inline">이전글: ${prevNotice.noTitle}</span>
                                <span class="d-inline d-md-none">이전글</span>
                            </a>
                        </c:if>
                        <c:if test="${nextNotice != null}">
                            <a href="/notice/${nextNotice.noId}" 
                               class="btn btn-outline-secondary d-flex align-items-center">
                                <span class="d-none d-md-inline">다음글: ${nextNotice.noTitle}</span>
                                <span class="d-inline d-md-none">다음글</span>
                                <i class="fas fa-chevron-right me-2"></i>
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!--====================================작성부=====================================-->

<!-- 공유하기 모달 -->
<div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="shareModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom-0">
                <h5 class="modal-title" id="shareModalLabel">공유하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex justify-content-center gap-3 mb-3">
                    <!-- 카카오톡 공유 버튼 -->
                    <button onclick="shareToKakao()" class="btn btn-link p-0">
                        <div class="d-flex flex-column align-items-center">
                            <div class="share-icon-circle kakao-circle mb-2">
                                <img src="/resources/assets/images/kakao-icon.png" alt="카카오톡" class="share-icon">
                            </div>
                            <span class="share-text">카카오톡</span>
                        </div>
                    </button>
                    
                    <!-- URL 복사 버튼 -->
                    <button onclick="copyToClipboard()" class="btn btn-link p-0">
                        <div class="d-flex flex-column align-items-center">
                            <div class="share-icon-circle url-circle mb-2">
                                <i class="fas fa-link share-icon"></i>
                            </div>
                            <span class="share-text">URL 복사</span>
                        </div>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- URL 복사 완료 알림 모달 -->
<div class="modal fade" id="copyAlert" tabindex="-1" aria-hidden="true" data-bs-backdrop="false">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
            <div class="modal-body text-center py-3">
                <p class="mb-2">주소가 복사되었습니다.</p>
                <small class="text-muted">원하는 곳에 붙여넣기 해주세요.</small>
            </div>
        </div>
    </div>
</div>

<style>
.share-icon-circle {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
}

.share-icon-circle:hover {
    transform: scale(1.1);
}

.kakao-circle {
    background-color: #FEE500;
}

.url-circle {
    background-color: #f8f9fa;
}

.share-icon {
    width: 24px;
    height: 24px;
    color: #495057;
}

.share-text {
    font-size: 12px;
    color: #495057;
}

.modal-content {
    border-radius: 1rem;
}

.modal-header {
    padding: 1rem 1rem 0.5rem;
}

.modal-body {
    padding: 1rem;
}

#copyAlert .modal-content {
    background-color: rgba(0, 0, 0, 0.8);
    color: white;
}

#copyAlert .modal-body {
    padding: 1.5rem;
}

body.modal-open {
    overflow: auto !important;
    padding-right: 0 !important;
}

#copyAlert {
    z-index: 1056; /* 더 높은 z-index 설정 */
}

#copyAlert .modal-content {
    background-color: rgba(0, 0, 0, 0.8);
    color: white;
    border: none;
}

/* 모달 배경 스타일 */
.modal-backdrop {
    opacity: 0.5;
}

/* 복사 완료 알림 모달의 배경은 투명하게 */
#copyAlert + .modal-backdrop {
    opacity: 0;
}
</style>

<script>
// URL 복사 함수
function copyToClipboard() {
    const currentURL = window.location.href;
    
    // 클립보드 API 사용
    if (navigator.clipboard && window.isSecureContext) {
        navigator.clipboard.writeText(currentURL).then(() => {
            showCopyAlert();
        }).catch(() => {
            // fallback
            fallbackCopyToClipboard(currentURL);
        });
    } else {
        // fallback
        fallbackCopyToClipboard(currentURL);
    }
}

// URL 복사 fallback 함수
function fallbackCopyToClipboard(text) {
    const textArea = document.createElement('textarea');
    textArea.value = text;
    textArea.style.position = 'fixed';
    textArea.style.left = '-9999px';
    document.body.appendChild(textArea);
    textArea.focus();
    textArea.select();
    
    try {
        document.execCommand('copy');
        showCopyAlert();
    } catch (err) {
        console.error('클립보드 복사 실패:', err);
    }
    
    document.body.removeChild(textArea);
}

function cleanupModals() {
    const backdrops = document.querySelectorAll('.modal-backdrop');
    backdrops.forEach(backdrop => backdrop.remove());
    document.body.classList.remove('modal-open');
    document.body.style.overflow = '';
    document.body.style.paddingRight = '';
}

function openShareModal() {
    // 먼저 이전 모달 정리
    cleanupModals();
        
    // 새로운 모달 열기
    const shareModal = new bootstrap.Modal(document.getElementById('shareModal'));
    shareModal.show();
}    
    
//URL 복사 완료 알림 표시
function showCopyAlert() {
    // 기존 모달 닫기
    const shareModal = bootstrap.Modal.getInstance(document.getElementById('shareModal'));
    if (shareModal) {
        shareModal.hide();
        setTimeout(cleanupModals, 200); // 모달이 닫히는 시간(200ms) 후에 cleanup 실행
    }
    
    // 복사 완료 알림 모달 표시
    const copyAlert = new bootstrap.Modal(document.getElementById('copyAlert'));
    copyAlert.show();
    
    // 2초 후 알림 모달 닫기
    setTimeout(() => {
        copyAlert.hide();
        setTimeout(cleanupModals, 200); // 모달이 닫히는 시간(200ms) 후에 cleanup 실행
    }, 2000);
}

// 카카오톡 공유 함수
function shareToKakao() {
    if (!window.Kakao) {
        alert('카카오톡 SDK가 로드되지 않았습니다.');
        return;
    }

    // 현재 도메인 가져오기
    const currentDomain = window.location.origin; // protocol + host
    
    // 썸네일 경로 확인 및 전체 URL 생성
    let imageUrl = '${notice.noThumb}';
    // 만약 이미지 경로가 /로 시작하지 않으면 /를 추가
    if (imageUrl && !imageUrl.startsWith('/')) {
        imageUrl = '/' + imageUrl;
    }

    console.log('공유 이미지 URL:', currentDomain + imageUrl); // 디버깅용

    Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
            title: '${notice.noTitle}',
            description: '[${notice.noCategory}] 공지사항을 확인해보세요.',
            imageUrl: currentDomain + imageUrl,
            link: {
                mobileWebUrl: window.location.href,
                webUrl: window.location.href,
            },
        },
        buttons: [
            {
                title: '자세히 보기',
                link: {
                    mobileWebUrl: window.location.href,
                    webUrl: window.location.href,
                },
            },
        ],
    });
}

//페이지 로드 시 초기화
document.addEventListener('DOMContentLoaded', function() {
    // 카카오톡 초기화
    if (typeof Kakao !== 'undefined' && !Kakao.isInitialized()) {
        Kakao.init('YOUR_JAVASCRIPT_KEY');
    }
    
    // 모달이 완전히 닫힘 이벤트
    document.getElementById('copyAlert').addEventListener('hidden.bs.modal', function () {
        document.querySelector('.modal-backdrop')?.remove();
        document.body.classList.remove('modal-open');
        document.body.style.overflow = '';
        document.body.style.paddingRight = '';
    });
});

</script>
	
	<!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/wow/wow.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/easing/easing.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/waypoints/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/counterup/counterup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/parallax/parallax.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets_sub/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="${pageContext.request.contextPath }/resources/assets_sub/js/main.js"></script>

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->