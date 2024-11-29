<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>공지사항 관리</title>
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/resources/admin/css/style.css">
   	<link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<style>
/* 레이아웃 */
body .container-scroller .page-body-wrapper {
   
   /* 사이드바 */
   .sidebar { 
       width: 250px !important; 
       position: fixed !important; 
       left: 0 !important; 
       height: 100vh !important; 
       background: #f8f9fa !important; 
       transition: all 0.3s ease !important;
   }

   /* 메인 컨텐츠 */
   .main-content { 
       margin-left: 250px !important; 
       padding: 20px !important;
       width: calc(100% - 250px) !important;
       transition: all 0.3s ease !important;
       min-width: 0 !important; 
   }

   .content-wrapper {
       width: 100% !important;
       padding: 0 !important;
       min-width: 0 !important; 
       flex: 1 1 auto !important; 
   }

   /* 헤더 영역 */
   .content-header { 
       border-bottom: 1px solid #dee2e6 !important;
       padding-bottom: 1rem !important;
       margin-bottom: 2rem !important;

       .d-flex.flex-column {
           gap: 0.5rem !important;
       }
   }

   /* 검색 영역 */
   .search-bar { 
       background: #f8f9fa !important;
       padding: 1rem !important;
       border-radius: 4px !important;
       margin-bottom: 1rem !important;
   }

   /* 테이블 컨테이너 */
   .card {
       margin: 0 !important;
       width: 100% !important;
       padding: 0 !important;
       min-width: 0 !important;

       .card-body {
           padding: 0 !important;
           width: 100% !important;
           min-width: 0 !important;
       }
   }

   /* 테이블 스타일 */
   .table-responsive {
       width: 100% !important;
       margin: 0 !important;
       padding: 0 !important;
       overflow-x: auto !important;
       -webkit-overflow-scrolling: touch !important;
   }

   .table {
       width: 100% !important;
       margin: 0 !important;
       border-collapse: collapse !important;

       th, td {
           border-top: 1px solid #dee2e6 !important;
           border-bottom: 1px solid #dee2e6 !important;
           padding: 0.75rem !important;
           vertical-align: middle !important;
           line-height: 1.5 !important;
           min-height: 24px !important;
       }

       th {
           background-color: #f8f9fa !important;
           font-weight: 600 !important;
       }

       /* 체크박스 정렬 */
       td:first-child,
       th:first-child {
           width: 40px !important;
           min-width: 40px !important;
           max-width: 40px !important;
           text-align: center !important;
           vertical-align: middle !important;
           position: relative !important;
       }
   }

   /* 기타 요소 */
   .form-check-input {
       margin: 0 !important;
       position: relative !important;
       width: 18px !important;
       height: 18px !important;
       cursor: pointer !important;
       vertical-align: middle !important;
   }

   .badge {
       font-weight: normal !important;
       padding: 0.5em 0.8em !important;
   }
}

/* 검색 영역의 각 요소 높이 통일 */
	#searchForm .form-select,
	#searchForm .form-control,
	#searchForm .btn,
	#searchForm .input-group {
	    height: 38px !important;
	}
	
/* 모바일 반응형 */
@media (max-width: 768px) {
   body .container-scroller .page-body-wrapper {
       .sidebar {
           width: 0 !important;
           overflow: hidden !important;
       }

       .main-content {
           margin-left: 0 !important;
           padding: 15px !important;
           width: 100% !important; 
            max-width: 100vw !important; 
            overflow-x: hidden !important; 
       }
       
       .content-wrapper {
            padding: 0 !important;
            width: 100% !important;
            max-width: 100% !important;
        }

        .card {
            margin: 0 !important;
            width: 100% !important;
            max-width: 100% !important;
        }

        .card-body {
            padding: 0 !important;
            width: 100% !important;
        }

       .content-header {
           flex-direction: column !important;
           align-items: stretch !important;
           gap: 1rem !important;

           .btn {
               width: 100% !important;
               margin-bottom: 0.5rem !important;
           }
       }

       .search-bar {
           .row {
               margin: 0 !important;
           }

           .col-md-3,
           .col-md-2,
           .col-md-4 {
               padding: 5px !important;
               width: 100% !important;
           }
       }

       .table {
           th:not(:nth-child(1)):not(:nth-child(4)):not(:nth-child(8)),
           td:not(:nth-child(1)):not(:nth-child(4)):not(:nth-child(8)) {
               display: none !important;
           }
       }

       .notice-title {
           max-width: 200px !important;
       }

       .action-buttons {
           display: flex !important;
           gap: 0.25rem !important;
           justify-content: flex-end !important;
       }
   }
}
</style>
</head>
<body>
<div class="container-scroller">
        <%@ include file="/WEB-INF/views/inc/admin_navbar_adpt.jsp"%>
        <div class="container-fluid page-body-wrapper">
            <%@ include file="/WEB-INF/views/inc/admin_sidebar_adpt.jsp"%>
		    <!-- 메인 컨텐츠 -->
		    <div class="main-content">
		        <div class="content-header d-flex justify-content-between align-items-center mb-4">
				    <h4 class="mb-0">공지사항 관리</h4>
				    <div class="d-flex gap-2"> 
				        <button class="btn btn-primary" onclick="location.href='/notice/manage/form'">
				            <i class="fas fa-plus"></i> 공지사항 등록
				        </button>
				        <button class="btn btn-danger" onclick="deleteSelected()">
				            <i class="fas fa-trash"></i> 선택 삭제
				        </button>
				    </div>
				</div>
		
		        <!-- 검색 영역 -->
		        <form id="searchForm" class="search-bar">
		            <div class="row g-3">
		                <div class="col-md-2">
		                    <select name="category" class="form-select">
		                        <option value="">전체 카테고리</option>
		                        <option value="안내사항" ${param.category == '안내사항' ? 'selected' : ''}>안내사항</option>
		                        <option value="이벤트" ${param.category == '이벤트' ? 'selected' : ''}>이벤트</option>
		                        <option value="센터소식" ${param.category == '센터소식' ? 'selected' : ''}>센터소식</option>
		                    </select>
		                </div>
		                <div class="col-md-3">
		                    <input type="text" name="keyword" class="form-control" 
		                           placeholder="제목 또는 내용 검색" value="${param.keyword}">
		                </div>
		                <div class="col-md-4">
		                    <div class="input-group">
		                        <input type="date" name="startDate" class="form-control" value="${param.startDate}">
		                        <span class="input-group-text">~</span>
		                        <input type="date" name="endDate" class="form-control" value="${param.endDate}">
		                    </div>
		                </div>
		                <div class="col-md-3">
		                    <button type="submit" class="btn btn-primary" id="searchBtn">
		                        <i class="fas fa-search"></i> 검색
		                    </button>
		                    <button type="button" class="btn btn-outline-secondary" onclick="resetSearch()">
		                        <i class="fas fa-undo"></i> 초기화
		                    </button>
		                </div>
		            </div>
		        </form>
		
		        <!-- 공지사항 목록 -->
		        <div class="card">
		            <div class="card-body">
		                <div class="table-responsive">
						    <table class="table table-hover">
						        <thead class="table-light">
						            <tr>
						                <th class="text-center" style="width: 50px;">
						                    <input type="checkbox" class="form-check-input" id="headerCheckbox">
						                </th>
						                <th class="text-center" style="width: 80px;">번호</th>
						                <th style="width: 100px;">카테고리</th>
						                <th>제목</th>
						                <th style="width: 100px;">작성자</th>
						                <th style="width: 120px;">등록일</th>
						                <th class="text-center" style="width: 80px;">조회수</th>
						                <th style="width: 100px;">관리</th>
						            </tr>
						        </thead>
						        <tbody>
						            <c:forEach items="${boards}" var="notice">
						                <tr>
						                    <td class="text-center">
						                        <input type="checkbox" class="form-check-input notice-check" value="${notice.noId}">
						                    </td>
						                    <td class="text-center">${notice.noId}</td>
						                    <td>
						                        <span class="badge bg-secondary">${notice.noCategory}</span>
						                    </td>
						                    <td class="notice-title">
						                        <a href="/notice/manage/${notice.noId}" class="notice-title">
						                            ${notice.important ? '<span class="important-badge">[중요]</span>' : ''}
						                            ${notice.noTitle}
						                            <c:if test="${not empty notice.noThumb}">
						                                <i class="fas fa-image text-muted ms-1"></i>
						                            </c:if>
						                            <c:if test="${not empty notice.files}">
						                                <i class="fas fa-paperclip text-muted ms-1"></i>
						                            </c:if>
						                        </a>
						                    </td>
						                    <td>${notice.noWriter}</td>
						                    <td><fmt:formatDate value="${notice.noRegDate}" pattern="yyyy-MM-dd"/></td>
						                    <td class="text-center">${notice.viewCount}</td>
						                    <td>
						                        <div class="d-flex action-buttons">
						                            <button class="btn btn-sm btn-outline-primary" 
						                                    onclick="location.href='/notice/manage/form?noId=${notice.noId}'"
						                                    title="수정">
						                                <i class="fas fa-edit"></i>
						                            </button>
						                            <button class="btn btn-sm btn-outline-danger" 
						                                    onclick="deleteNotice(${notice.noId})"
						                                    title="삭제">
						                                <i class="fas fa-trash"></i>
						                            </button>
						                        </div>
						                    </td>
						                </tr>
						            </c:forEach>
						        </tbody>
						    </table>
						</div>
		
		                <!-- 페이지네이션 -->
		                <div class="d-flex justify-content-center mt-4">
						    <nav>
						        <ul class="pagination">
						            <!-- 첫 페이지로 -->
						            <c:if test="${page > 1}">
						                <li class="page-item">
						                    <a class="page-link" href="javascript:goToPage(1)">
						                        <i class="fas fa-angle-double-left"></i>
						                    </a>
						                </li>
						                <!-- 이전 페이지로 -->
						                <li class="page-item">
						                    <a class="page-link" href="javascript:goToPage(${page - 1})">
						                        <i class="fas fa-angle-left"></i>
						                    </a>
						                </li>
						            </c:if>
						            
						            <!-- 페이지 번호들 -->
						            <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
						                <li class="page-item ${pageNum == page ? 'active' : ''}">
						                    <a class="page-link" href="javascript:goToPage(${pageNum})">${pageNum}</a>
						                </li>
						            </c:forEach>
						            
						            <!-- 다음 페이지로 -->
						            <c:if test="${page < totalPages}">
						                <li class="page-item">
						                    <a class="page-link" href="javascript:goToPage(${page + 1})">
						                        <i class="fas fa-angle-right"></i>
						                    </a>
						                </li>
						                <!-- 마지막 페이지로 -->
						                <li class="page-item">
						                    <a class="page-link" href="javascript:goToPage(${totalPages})">
						                        <i class="fas fa-angle-double-right"></i>
						                    </a>
						                </li>
						            </c:if>
						        </ul>
						    </nav>
						</div>
		            </div>
		        </div>
		        <%@ include file="/WEB-INF/views/inc/admin_footer_adpt.jsp"%>
		    </div>
    	</div>
    </div>

    <!-- Scripts -->
    <script src="/resources/admin/vendors/js/vendor.bundle.base.js"></script>
    <script src="/resources/admin/js/off-canvas.js"></script>
    <script src="/resources/admin/js/hoverable-collapse.js"></script>
    <script src="/resources/admin/js/misc.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
    window.goToPage = function(page) {
        var category = $('select[name="category"]').val();
        var keyword = $('input[name="keyword"]').val();
        var startDate = $('input[name="startDate"]').val();
        var endDate = $('input[name="endDate"]').val();
        
        var params = new URLSearchParams();
        params.append('page', page);
        params.append('size', '10');
        
        if (category) params.append('category', category);
        if (keyword) params.append('keyword', keyword);
        if (startDate) params.append('startDate', startDate);
        if (endDate) params.append('endDate', endDate);
        
        window.location.href = '/notice/manage?' + params.toString();
    };

    // 검색 초기화
    window.resetSearch = function() {
        window.location.href = '/notice/manage?page=1&size=10';
    };

    // 공지사항 삭제
    window.deleteNotice = function(noId) {
        if (!confirm('정말 삭제하시겠습니까?')) {
            return;
        }
        
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
                alert('삭제되었습니다.');
                location.reload();
            },
            error: function(xhr) {
                console.error('Error:', xhr);
                var errorMsg = xhr.responseText || '서버 오류가 발생했습니다.';
                alert('삭제 실패: ' + errorMsg);
            }
        });
    };
    
    // 공지사항 선택 삭제
    window.deleteSelected = function() {
    const selectedIds = [];
    $('.notice-check:checked').each(function() {
        selectedIds.push($(this).val());
    });
    
    if (selectedIds.length === 0) {
        alert('삭제할 항목을 선택해주세요.');
        return;
    }
    
    if (!confirm('선택한 ' + selectedIds.length + '개의 항목을 삭제하시겠습니까?')) {
        return;
    }
    
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    
    // 선택된 항목들을 순차적으로 삭제
    let deleteCount = 0;
    let errorCount = 0;
    
    function deleteNext(index) {
        if (index >= selectedIds.length) {
            if (errorCount === 0) {
                alert('선택한 항목이 모두 삭제되었습니다.');
                location.reload();
            } else {
                alert(deleteCount + '개 항목이 삭제되었으며, ' + errorCount + '개 항목 삭제 중 오류가 발생했습니다.');
                location.reload();
            }
            return;
        }
        
        $.ajax({
            url: '/notice/api/delete/' + selectedIds[index],
            type: 'POST',
            beforeSend: function(xhr) {
                if (token && header) {
                    xhr.setRequestHeader(header, token);
                }
            },
            success: function() {
                deleteCount++;
                deleteNext(index + 1);
            },
            error: function(xhr) {
                console.error('Error:', xhr);
                errorCount++;
                deleteNext(index + 1);
            }
        });
    }
    
    deleteNext(0);
	};

    // DOM이 완전히 로드된 후 이벤트 핸들러 설정
    $(document).ready(function() {
        // 검색 폼 제출
        $('#searchForm').on('submit', function(e) {
            e.preventDefault();
            goToPage(1);
        });
        
        // 전체 선택 체크박스
    $('#headerCheckbox').on('change', function() {
        $('.notice-check').prop('checked', $(this).is(':checked'));
    });
});
 	
</script>
</body>
</html>