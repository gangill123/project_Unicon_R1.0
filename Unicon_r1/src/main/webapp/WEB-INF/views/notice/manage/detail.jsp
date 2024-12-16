<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>공지사항 상세</title>
    
    <!-- plugins:css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/style.css">
    <!-- End layout styles -->
    
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/admin/images/favicon.png" />
    
    <!-- SweetAlert2 CSS -->
	<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
	<!-- SweetAlert2 JS -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>

<style>
	/* 기본 카드 스타일 */
	.card {
	    border: 1px solid #DDE2E6;
	    border-radius: 1rem !important;  /* 모서리 둥글게 변경 */
	    overflow: hidden;  /* 내부 요소가 모서리를 벗어나지 않도록 처리 */
	}
	
	.badge.bg-primary {
	    background-color: #348E38 !important;  /* 카테고리 뱃지 색상 */
	    color: white;
	    font-weight: 500;
	}
	
	/* 버튼 공통 스타일 */
	.btn {
	    font-size: 14px;
	    border-radius: 4px;
	    height: 38px;
	    line-height: 24px;
	    padding: 6px 16px;
	}
	
	/* 버튼 변형 스타일 */
	.btn-warning {
	    background-color: #FFA000;
	    border-color: #FFA000;
	    color: #000;
	    border: 500;
	}
	
	.btn-danger {
	    background-color: #DC3545;
	    border-color: #DC3545;
	    color: white;
	    border: 500;
	}
	
	.btn-dark {
	    background-color: #495057;
	    color: white;
	}
	
	.btn-secondary {
	    background-color: #424242;    /* 더 진한 회색 */
	    border-color: #424242;
	    color: white;
	    font-weight: 500;
	}
	
	.btn-outline-secondary {
	    color: #424242;
	    border-color: #424242;
	    font-weight: 500;
	}
	
	.btn-outline {
	    background-color: white;
	    color: #495057;
	    border: 1px solid #DDE2E6;
	}
	
	/* 이전글/다음글 버튼 내의 제목 말줄임표 처리 */
	.btn-group .btn-outline-secondary {
	    max-width: 200px;            /* 버튼 최대 너비 설정 */
	    overflow: hidden;            /* 넘치는 내용 숨김 */
	}
	
	.btn-outline-secondary span {
	    white-space: nowrap;         /* 줄바꿈 방지 */
	    overflow: hidden;            /* 넘치는 텍스트 숨김 */
	    text-overflow: ellipsis;     /* 말줄임표 표시 */
	    display: block;              /* 블록 요소로 변경 */
	}
	
	/* 뱃지 스타일 */
	.badge {
	    font-weight: normal;
	    padding: 6px 12px;
	    font-size: 13px;
	    border-radius: 4px;
	}
	
	.badge-success {
	    background-color: #37B24D;
	}
	
	.badge-dark {
	    background-color: #495057;
	}
	
	/* 텍스트 스타일 */
	.text-info {
	    font-size: 14px;
	    color: #424242 !important;
	}
	
	/* 레이아웃 스타일 */
	.content-section {
	    min-height: 500px;
	    padding: 2rem;
	    background: #fff;
	}
	
	.footer-section {
	    background-color: rgb(248, 249, 250);
	}
	
	.border-bottom {
	    border-bottom: 1px solid #DDE2E6;
	}
	
	/* 여백 스타일 */
	.px-4 {
	    padding-left: 1.5rem;
	    padding-right: 1.5rem;
	}
	
	.py-4 {
	    padding-top: 1.5rem;
	    padding-bottom: 1.5rem;
	}
	
	.pt-4 {
	    padding-top: 1.5rem;
	}
	
	.pb-3 {
	    padding-bottom: 1rem;
	}
	
	.p-3 {
	    padding: 1rem;
	}
	
	/* 본문 영역 스타일 */
	.content-section {
	    min-height: 500px;  /* 최소 세로 길이 설정 */
	    padding: 2rem;      /* 여백 설정 */
	    background: #fff;   /* 배경색 설정 */
	}
	
	/* 썸머노트 에디터 내용 영역 스타일 */
	.notice-content {
	    width: 100%;        /* 전체 너비 사용 */
	    height: 100%;       /* 전체 높이 사용 */
	    overflow-x: hidden; /* 가로 스크롤 방지 */
	    color: #212121; 
	}
	
	/* 썸머노트 에디터 내부 이미지 반응형 처리 */
	.notice-content img {
	    max-width: 100%;    /* 이미지 최대 너비를 부모 요소에 맞춤 */
	    height: auto;       /* 이미지 비율 자동 조정 */
	    display: block;     /* 이미지를 블록 요소로 변경 */
	    margin: 1rem 0;     /* 이미지 상하 여백 */
	}
	
	/* 1행의 제목/정보 영역 전체 레이아웃 */
	.px-4.pt-4.pb-3 .d-flex {
	    flex-wrap: nowrap !important; /* 줄바꿈 방지 */
	    gap: 1rem;                    /* 요소들 사이 간격 */
	}
	
	/* 제목 영역 */
	.d-flex .align-items-center {
	    min-width: 0;                /* flex-basis 오버플로우 버그 수정 */
	    flex: 1;                     /* 남은 공간 모두 차지 */
	}
	
	/* 제목 말줄임표 처리 */
	.d-flex h5 {
		color: #212121;
		font-size: 18px;
		font-weight: 700;
	    white-space: nowrap;         /* 줄바꿈 방지 */
	    overflow: hidden;            /* 넘치는 텍스트 숨김 */
	    text-overflow: ellipsis;     /* 말줄임표 표시 */
	    margin-bottom: 0;            /* 기본 마진 제거 */
	    width: 100%;                 /* 부모 너비 전체 사용 */
	}
	
	/* 등록일/조회수 영역 */
	.d-flex > div:last-child {
	    flex-shrink: 0;              /* 크기 축소 방지 */
	    white-space: nowrap;         /* 줄바꿈 방지 */
	}
	
	/* 링크 색상 */
	a {
	    color: #424242;
	}
	
	/* 호버 효과 */
	.btn-outline-secondary:hover {
	    background-color: #424242;
	    color: white;
	}
	
	/* SweetAlert2 커스텀 스타일 */
	.swal2-popup .swal2-actions {
	    justify-content: center;
	}
	
	.swal2-popup .swal2-confirm {
	    background-color: #86bc42 !important;
	}
	
	.swal2-popup .swal2-cancel {
	    background-color: #aaa !important;
	}
	
	.swal2-popup {
	    font-size: 0.9rem !important;
	}
	
	/* 반응형 처리를 위한 미디어 쿼리 */
	@media screen and (min-width: 768px) {
	    .d-flex h5 {
	        max-width: 500px;        /* 태블릿/데스크톱에서의 최대 너비 */
	    }
	}
	
	@media screen and (min-width: 1024px) {
	    .d-flex h5 {
	        max-width: 800px;        /* 큰 화면에서의 최대 너비 */
	    }
	}
	
	.btn-group .btn-outline-secondary {
        max-width: 300px;        /* 태블릿/데스크톱에서 더 넓게 표시 */
	    }
	}
	
	/* 이전글/다음글 아이콘 위치 고정 */
	.btn-outline-secondary i {
	    flex-shrink: 0;             /* 아이콘 크기 고정 */
	}
	
</style>
</head>
<body>
    <div class="container-scroller">
        <!-- partial:navbar.jsp -->
        <%@ include file="/WEB-INF/views/inc/admin_navbar_adpt.jsp"%>
        <!-- partial -->
        
        <div class="container-fluid page-body-wrapper">
            <!-- partial:sidebar.jsp -->
            <%@ include file="/WEB-INF/views/inc/admin_sidebar_adpt.jsp"%>
            <!-- partial -->
            
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-12 grid-margin stretch-card">
                            <div class="card border-0">
                                <div class="card-body p-0">
                                    <!-- 1행: 제목/정보 영역 -->
                                    <div class="px-4 pt-4 pb-3 border-bottom">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="d-flex align-items-center">
                                                <span class="badge bg-primary me-2">${notice.noCategory}</span>
                                                <h5 class="mb-0 ms-2">${notice.noTitle}</h5>
                                            </div>
                                            <div>
                                                <span class="text-info me-3">등록일: <fmt:formatDate value="${notice.noRegDate}" pattern="yyyy-MM-dd"/></span>
                                                <span class="text-info me-3">조회수: ${notice.viewCount}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- 2행: 본문 영역 -->
                                    <div class="px-4 py-4 content-section">
                                        <div class="notice-content">
                                            ${notice.noContent}
                                        </div>
                                    </div>

                                    <!-- 3행: 버튼 영역 -->
                                    <div class="card-footer bg-white">
									    <div class="d-flex justify-content-between align-items-center">
									        <a href="/notice/manage/noList" class="btn btn-secondary">목록으로</a>
									        <div>
									            <!-- 이전글/다음글 네비게이션 -->
									            <div class="btn-group me-2">
									                <c:if test="${prevNotice != null}">
									                    <a href="/notice/manage/${prevNotice.noId}" 
									                       class="btn btn-outline-secondary d-flex align-items-center">
									                        <i class="fas fa-chevron-left me-2"></i>
									                        <span class="d-none d-md-inline">이전글: ${prevNotice.noTitle}</span>
									                        <span class="d-inline d-md-none">이전글</span>
									                    </a>
									                </c:if>
									                <c:if test="${nextNotice != null}">
									                    <a href="/notice/manage/${nextNotice.noId}" 
									                       class="btn btn-outline-secondary d-flex align-items-center">
									                        <span class="d-none d-md-inline">다음글: ${nextNotice.noTitle}</span>
									                        <span class="d-inline d-md-none">다음글</span>
									                        <i class="fas fa-chevron-right ms-2"></i>
									                    </a>
									                </c:if>
									            </div>
									            <!-- 관리 버튼 -->
									            <div class="btn-group">
									                <button class="btn btn-warning" 
									                        onclick="location.href='/notice/manage/form?noId=${notice.noId}'">수정</button>
									                <button class="btn btn-danger" 
									                        onclick="confirmDelete(${notice.noId})">삭제</button>
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
                
                <!-- partial:footer.jsp -->
                <%@ include file="/WEB-INF/views/inc/admin_footer_adpt.jsp"%>
                <!-- partial -->
            </div>
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    
    <!-- plugins:js -->
    <script src="${pageContext.request.contextPath}/resources/admin/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/hoverable-collapse.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/js/misc.js"></script>
    <!-- endinject -->

    <script>
    function confirmDelete(noId) {
        Swal.fire({
            title: '삭제 확인',
            text: '정말 삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '삭제',
            cancelButtonText: '취소',
            reverseButtons: false
        }).then((result) => {
            if (result.isConfirmed) {
                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");

                $.ajax({
                    url: '/notice/api/delete/' + noId,
                    type: 'POST',
                    beforeSend: function(xhr) {
                        if (token && header) {
                            xhr.setRequestHeader(header, token);
                        }
                    },
                    success: function() {
                        Swal.fire({
                            title: '삭제 완료',
                            text: '성공적으로 삭제되었습니다.',
                            icon: 'success',
                            confirmButtonText: '확인'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href = '/notice/manage/noList';
                            }
                        });
                    },
                    error: function(xhr) {
                        console.error('Error:', xhr);
                        var errorMsg = xhr.responseText || '서버 오류가 발생했습니다.';
                        Swal.fire({
                            title: '삭제 실패',
                            text: errorMsg,
                            icon: 'error',
                            confirmButtonText: '확인'
                        });
                    }
                });
            }
        });
    }

    // 버튼 클릭 이벤트 리스너
    document.getElementById('confirmDelete').addEventListener('click', function(event) {
        event.preventDefault();
        var noId = this.dataset.noId; 
        confirmDelete(noId);
    });
    </script>
</body>
</html>