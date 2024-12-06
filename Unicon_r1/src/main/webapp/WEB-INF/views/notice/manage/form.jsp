<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="_csrf" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
    
    <title>유니콘 - 공지사항 ${notice.noId == null ? '등록' : '수정'}</title>
    <link rel="stylesheet" href="/resources/admin/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/admin/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/resources/admin/css/style.css">
    <link rel="shortcut icon" href="/resources/admin/images/favicon.png" />
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    
    <!-- Summernote JS -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
    
	<!-- SweetAlert2 CSS -->
	<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css" rel="stylesheet">
	<!-- SweetAlert2 JS -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.all.min.js"></script>

    <style>
     .sidebar { 
       width: 250px; 
       position: fixed; 
       left: 0; 
       height: 100vh; 
       transition: all 0.3s ease;
   }
   
   .main-content {
	    margin-left: 250px;
	    padding: 20px;
	    width: calc(100% - 250px);
	    min-height: calc(100vh - 70px); /* 헤더 높이를 뺀 높이 */
		background: #f8f9fa;
	}
	
	.footer {
	    background: #f8f9fa !important;
	}

   /* 카드 스타일 */
   .card {
       background: #ffffff !important;
	   border: 1px solid #dee2e6 !important;
	   border-radius: 1rem !important;
	   margin-bottom: 1rem !important;
	   
   }
   
   .card:not(.note-editor) > .card-header {
	    background-color: #006e60 !important;
	    color: #ffffff !important;
	    border-top-left-radius: 1rem !important;
	    border-top-right-radius: 1rem !important;
	}
	
	.card:not(.note-editor) > .card-header .card-title {
	    color: #ffffff !important;
	    margin-bottom: 0;
	}
   
   .note-editor.card {
	    border-radius: 0 !important;
	}
   
   .note-editor .card-header {
	    background-color: #f8f9fa !important;
	    color: #000000 !important;
	    border-radius: 0 !important;
	}

   .card-body {
       padding: 2rem !important;
   }

   /* 폼 요소 스타일 */
   .form-label {
       font-weight: 500;
       margin-bottom: 0.5rem;
   }

   .form-control {
       border-radius: 4px;
   }

   /* 에디터 스타일 */
   .note-editor .note-editable { 
       background-color: white; 
   }

   .note-editor {
       border-radius: 4px;
   }

	.draft-preview {
	    background: #f8f9fa;
	    border-radius: 4px;
	    padding: 1rem;
	    height: calc(100% - 80px); /* 버튼과 라벨 높이를 고려한 조정 */
	    margin-top: 10px;
	}
	
	.preview-image {
	    max-width: 100%;
	    max-height: 200px;
	    object-fit: contain;
	    border-radius: 4px;
	}
	
	.gap-2 {
	    gap: 0.5rem !important;
	}
	
	.form-group {
	    height: 100%;
	}
	
	/* 버튼 여백 조정 */
	.btn + .btn {
	    margin-left: 0.5rem;
	}
	
	/* 저장 버튼 스타일 */
	.btn-primary {
	    background-color: #006e60 !important;
	    border-color: #006e60 !important;
	    color: white;
	}
	
	/* 임시저장 및 불러오기 버튼 스타일 */
	.btn-info, 
	.btn-outline-info {
	    background-color: #006e60 !important;
	    border-color: #006e60 !important;
	    color: white;
	}
	
	/* 임시저장 불러오기 버튼(아웃라인 버전) */
	.btn-outline-info {
	    background-color: transparent !important;
	    color: #006e60 !important;
	}
	
	/* 호버 효과 */
	.btn-primary:hover,
	.btn-info:hover {
	    background-color: #005a4e !important;
	    border-color: #005a4e !important;
	}
	
	.btn-outline-info:hover {
	    background-color: #006e60 !important;
	    color: white !important;
	}
	
	.toggle-switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    .toggle-switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .toggle-slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        transition: .4s;
        border-radius: 34px;
    }

    .toggle-slider:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        transition: .4s;
        border-radius: 50%;
    }

    input:checked + .toggle-slider {
        background-color: #2196F3;
    }

    input:checked + .toggle-slider:before {
        transform: translateX(26px);
    }

    .toggle-container {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }

    .toggle-item {
        display: flex;
        align-items: center;
        gap: 1rem;
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

   /* 모바일 반응형 */
   @media (max-width: 768px) {
       /* 레이아웃 */
       .sidebar {
           width: 0;
           overflow: hidden;
       }
       
        .main-content {
	        margin-left: 0;
	        width: 100%;
	        padding: 15px;
	    }

       /* 카드 */
       .card-body {
           padding: 1rem;
       }

       /* 그리드 순서 */
       .order-1 {
           order: 1;
       }
       
       .order-2 {
           order: 2;
       }
       
       .order-3 {
           order: 3;
       }

       /* 폼 요소 */
       .row > div[class^="col-"] {
           margin-bottom: 1rem;
       }

       .form-control {
           height: calc(2.5rem + 2px);
       }

       /* 에디터 */
       #noContent {
           height: 200px !important;
       }

       /* 이미지 */
       .preview-image {
           max-width: 100%;
           height: auto;
       }

       /* 버튼 */
       .btn {
           padding: 0.75rem 1.5rem;
           width: 100%;
           margin-bottom: 0.5rem;
       }
       
       /* 임시저장 삭제 버튼 크기 조정 */
	    .btn-outline-danger.btn-sm {
	        padding: 0.25rem 0.5rem;
	        font-size: 0.875rem;
	        line-height: 1.5;
	        width: auto;
	        margin-bottom: 0;
	    }
	    
	    /* 임시저장 삭제 버튼 아이콘 크기 조정 */
	    .btn-outline-danger.btn-sm .fas {
	        font-size: 0.875rem;
	    }
	    
	    /* 임시저장 항목 간격 조정 */
	    #recentDrafts .mb-2 {
	        margin-bottom: 0.5rem !important;
	    }
	    
	    /* 임시저장 목록 아이템 패딩 조정 */
	    .list-group-item {
	        padding: 0.5rem 0.75rem;
	    }
       
       .toggle-container {
            flex-direction: row;
            justify-content: space-between;
            margin-top: 1rem;
        }
        
        #setting-label {
        	margin-top: 3rem;
        }
        
        .draft-preview {
            margin-bottom: 1rem;
        }
   }

    </style>
</head>
<body>

<div class="container-scroller">
    <%@ include file="/WEB-INF/views/inc/admin_navbar_adpt.jsp"%>
    <div class="container-fluid page-body-wrapper">
        <%@ include file="/WEB-INF/views/inc/admin_sidebar_adpt.jsp"%>
    
    <div class="main-content">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">공지사항 ${notice.noId == null ? '등록' : '수정'}</h5>
            </div>
            <div class="card-body">
                <form id="noticeForm" method="post" action="/notice/manage/submit" enctype="multipart/form-data">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="hidden" name="noId" value="${notice.noId}" />
                    
                    <div class="row mb-3">
					    <div class="col-md-2 order-md-1 order-1">
					        <label class="form-label">카테고리</label>
					        <select class="form-control" name="noCategory" required>
					            <option value="">카테고리 선택</option>
					            <option value="안내사항" ${notice.noCategory == '안내사항' ? 'selected' : ''}>안내사항</option>
					            <option value="이벤트" ${notice.noCategory == '이벤트' ? 'selected' : ''}>이벤트</option>
					            <option value="센터소식" ${notice.noCategory == '센터소식' ? 'selected' : ''}>센터소식</option>
					        </select>
					    </div>
					    
					    <div class="col-md-7 order-md-2 order-2">
					        <label class="form-label">제목</label>
					        <input type="text" class="form-control" name="noTitle" value="${notice.noTitle}" required>
					    </div>
					    
					    <div class="col-md-3 order-md-3 order-3">
					        <label class="form-label">작성자</label>
					        <input type="text" class="form-control" name="noWriter" value="${notice.noWriter}" required>
					    </div>
					</div>
                    
                    <div class="mb-3">
                        <label class="form-label">내용</label>
                        <textarea id="noContent" name="noContent">${notice.noContent}</textarea>
                    </div>
                    
                    <div class="row mb-3">
				    <!-- 썸네일 영역 -->
				    <div class="col-md-4">
				        <div class="form-group">
				            <label class="form-label">썸네일</label>
				            <input type="file" class="form-control mb-2" name="thumbnail" accept="image/*" onchange="previewImage(this, 'thumbnailPreview')">
				            <div class="mt-2 text-center">
				                <img id="thumbnailPreview" src="${notice.noThumb}" class="preview-image" onerror="this.src='/resources/assets/images/default-thumb.png'">
				            </div>
				        </div>
				    </div>
				    
				    <!-- 임시저장 관리 영역 -->
				    <div class="col-md-4">
				        <div class="form-group h-100">
				            <label class="form-label">임시저장 관리</label>
				            <div class="d-flex gap-2 mb-2">
				                <button type="button" class="btn btn-info" onclick="saveDraft()">
				                    <i class="fas fa-save"></i> 임시저장
				                </button>
				                <button type="button" class="btn btn-outline-info" onclick="loadDraftList()">
				                    <i class="fas fa-folder-open"></i> 불러오기
				                </button>
				            </div>
				            <div class="draft-preview">
				                <small class="text-muted">최근 임시저장 항목</small>
				                <div id="recentDrafts" class="small"></div>
				            </div>
				        </div>
				    </div>
                    <!-- 토글 스위치 영역 -->
				    <div class="col-md-4">
				        <div class="form-group h-100">
				            <label id="setting-label" class="form-label">공지사항 설정</label>
				            <div class="toggle-container">
				                <div class="toggle-item">
				                    <label class="toggle-switch">
				                        <input type="checkbox" id="important" name="important" ${notice.important ? 'checked' : ''}>
				                        <span class="toggle-slider"></span>
				                    </label>
				                    <span>중요공지</span>
				                </div>
				                <div class="toggle-item">
				                    <label class="toggle-switch">
				                        <input type="checkbox" id="noEmail" name="noEmail" ${notice.noEmail ? 'checked' : ''}>
				                        <span class="toggle-slider"></span>
				                    </label>
				                    <span>메일발송</span>
				                </div>
				            </div>
				        </div>
                    </div>
                </div>
                    
                <div class="text-right">
			        <div class="row">
			            <div class="col-6">
			                <button type="button" class="btn btn-secondary w-100" onclick="location.href='/notice/manage'">취소</button>
			            </div>
			            <div class="col-6">
			                <button type="submit" id="submitBtn" class="btn btn-primary w-100">저장</button>
			            </div>
			        </div>
			    </div>
		    </form>
		</div>
	</div>
		<!-- 임시저장 목록 모달 -->
		<div class="modal fade" id="draftListModal" tabindex="-1">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title">임시저장 목록</h5>
		                <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        <div class="modal-body">
		                <div id="draftList"></div>
			            </div>
				    </div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/inc/admin_footer_adpt.jsp"%>
	    </div>
	</div>
</div>

<script>
//CSRF 설정
var csrfToken = $("meta[name='_csrf']").attr("content");
var csrfHeader = $("meta[name='_csrf_header']").attr("content");

// CSRF 토큰이 존재할 때만 ajaxSetup 설정
if (csrfToken && csrfHeader) {
    $.ajaxSetup({
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        }
    });
}

// 유틸리티 함수
function formatDate(dateString) {
    if (!dateString) return '';
    var date = new Date(dateString);
    return date.getFullYear() + '-' + 
           padZero(date.getMonth() + 1) + '-' + 
           padZero(date.getDate()) + ' ' + 
           padZero(date.getHours()) + ':' + 
           padZero(date.getMinutes());
}

function padZero(num) {
    return String(num).padStart(2, '0');
}

function validateForm() {
    const title = $('input[name="noTitle"]').val().trim();
    const content = $('#noContent').summernote('isEmpty');
    const category = $('select[name="noCategory"]').val();
    
    if (!title) {
        alert('제목을 입력해주세요.');
        return false;
    }
    if (content) {
        alert('내용을 입력해주세요.');
        return false;
    }
    if (!category) {
        alert('카테고리를 선택해주세요.');
        return false;
    }
    return true;
}

function previewImage(input, previewId) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#' + previewId).attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

// 이미지 업로드 함수
function uploadSummernoteImage(file, editor) {
    var formData = new FormData();
    formData.append("file", file);

    $.ajax({
        url: '/notice/api/upload',
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

// 임시저장 관련 함수
function saveDraft() {
    var formData = new FormData($('#noticeForm')[0]);
    formData.set('status', 'draft');

    $.ajax({
        url: '/notice/manage/submit',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            Swal.fire({
                title: '임시저장 완료',
                text: '성공적으로 임시저장되었습니다.',
                icon: 'success',
                confirmButtonText: '확인'
            });
            loadRecentDrafts();
        },
        error: function(xhr, status, error) {
            console.error('임시저장 실패:', error);
            Swal.fire({
                title: '임시저장 실패',
                text: '임시저장 중 오류가 발생했습니다.',
                icon: 'error',
                confirmButtonText: '확인'
            });
        }
    });
}

function loadDraftList() {
    $.ajax({
        url: '/notice/manage/drafts',
        type: 'GET',
        success: function(drafts) {
            if (drafts && drafts.length > 0) {
                var html = '<div class="list-group">';
                drafts.forEach(function(draft) {
                    html += '<div class="list-group-item">' +
                           '<div class="d-flex w-100 justify-content-between align-items-center">' +
                           '<div class="flex-grow-1" style="cursor: pointer;" onclick="loadDraft(' + draft.noId + ')">' +
                           '<h6 class="mb-1">' + draft.noTitle + '</h6>' +
                           '<small class="text-muted">' + formatDate(draft.noRegdate) + '</small>' +
                           '</div>' +
                           '<button type="button" class="btn btn-outline-danger btn-sm ml-2" ' +
                           'onclick="deleteDraft(' + draft.noId + ', true)">' +
                           '<i class="fas fa-trash-alt"></i>' +
                           '</button>' +
                           '</div>' +
                           '</div>';
                });
                html += '</div>';
                $('#draftList').html(html);
            } else {
                $('#draftList').html('<p class="text-center p-3">임시저장된 글이 없습니다.</p>');
            }
            $('#draftListModal').modal('show');
        },
        error: function(xhr, status, error) {
            console.error('임시저장 목록 로드 실패:', error);
            alert('임시저장 목록을 불러오는데 실패했습니다.');
        }
    });
}

function loadDraft(noId) {
    $.ajax({
        url: '/notice/manage/draft/' + noId,
        type: 'GET',
        success: function(draft) {
            if (draft) {
                // form 필드 업데이트
                $('input[name="noId"]').val(''); // noId를 비워서 신규 등록으로 처리
                // 임시저장에서 불러온 글임을 표시
                $('<input>').attr({
                    type: 'hidden',
                    id: 'isFromDraft',
                    name: 'isFromDraft',
                    value: 'true'
                }).appendTo('#noticeForm');
                
                // 나머지 필드들 업데이트
                $('input[name="noTitle"]').val(draft.noTitle);
                $('select[name="noCategory"]').val(draft.noCategory);
                $('input[name="noWriter"]').val(draft.noWriter);
                $('#noContent').summernote('code', draft.noContent || '');
                
                if (draft.noThumb) {
                    $('#thumbnailPreview').attr('src', draft.noThumb);
                } else {
                    $('#thumbnailPreview').attr('src', '/resources/assets_sub/img/default-thumb.jpg');
                }
                
                $('#important').prop('checked', draft.important);
                $('#noEmail').prop('checked', draft.noEmail);
                
                $('#draftListModal').modal('hide');
            }
        },
        error: function(xhr, status, error) {
            console.error('임시저장 불러오기 실패:', error);
            alert('임시저장 글을 불러오는데 실패했습니다.');
        }
    });
}

function loadRecentDrafts() {
    $.ajax({
        url: '/notice/manage/drafts',
        type: 'GET',
        success: function(drafts) {
            var html = '<ul class="list-unstyled mb-0">';
            drafts.slice(0, 3).forEach(function(draft) {
                html += '<li class="mb-2 d-flex justify-content-between align-items-center">' +
                       '<a href="#" onclick="loadDraft(' + draft.noId + ')" class="text-decoration-none flex-grow-1">' +
                       '<div class="text-truncate">' + draft.noTitle + '</div>' +
                       '<small class="text-muted">' + formatDate(draft.noRegdate) + '</small>' +
                       '</a>' +
                       '<button type="button" class="btn btn-outline-danger btn-sm ml-2" ' +
                       'onclick="deleteDraft(' + draft.noId + ', false)">' +
                       '<i class="fas fa-trash-alt"></i>' +
                       '</button>' +
                       '</li>';
            });
            html += '</ul>';
            $('#recentDrafts').html(html);
        }
    });
}

function deleteDraft(noId, fromModal) {
    // fromModal이 undefined일 경우 false로 설정
    fromModal = fromModal || false;
    Swal.fire({
        title: '임시저장 삭제',
        text: '임시저장된 글을 삭제하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '삭제',
        cancelButtonText: '취소',
        reverseButtons: false
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: '/notice/manage/draft/' + noId,
                type: 'DELETE',
                success: function() {
                    Swal.fire({
                        title: '삭제 완료',
                        text: '임시저장이 삭제되었습니다.',
                        icon: 'success',
                        confirmButtonText: '확인'
                    }).then(() => {
                    	if (fromModal) {
                            // 모달에서 삭제한 경우
                            loadRecentDrafts();
                            loadDraftList();  // 모달 목록 갱신
                    	} else {
                            // 최근 임시저장 항목에서 삭제한 경우
                            loadRecentDrafts();  // 최근 임시저장 목록만 갱신
                        }
                    });
                },
                error: function(xhr, status, error) {
                    console.error('임시저장 삭제 실패:', error);
                    Swal.fire({
                        title: '삭제 실패',
                        text: '임시저장 삭제에 실패했습니다.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            });
        }
    });
}

// 페이지 로드 시 초기화
$(document).ready(function() {
    // Summernote 초기화
    $('#noContent').summernote({
        height: 300,
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
            onImageUpload: function(files) {
                for(let file of files) {
                    uploadSummernoteImage(file, this);
                }
            }
        }
    });

    // 페이지 로드 시 임시저장 목록 로드
    loadRecentDrafts();
    
    // 폼 제출
    $('#noticeForm').on('submit', function(e) {
        e.preventDefault();
        
        if (!validateForm()) {
            return false;
        }

        // FormData 객체 생성
        var formData = new FormData(this);
        formData.delete('status'); 
        formData.append('status', 'active'); 
        
     	// 임시저장에서 불러온 글인지, 순수 수정인지 확인
        var isFromDraft = $('#isFromDraft').length > 0;
        
        // 폼 제출
        $.ajax({
            url: this.action,
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                Swal.fire({
                    title: formData.get('noId') ? '수정 완료' : '등록 완료',
                    text: formData.get('noId') ? '공지사항이 수정되었습니다.' : '공지사항이 등록되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = '/notice/manage';
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error('저장 실패:', error);
                Swal.fire({
                    title: '저장 실패',
                    text: '저장 중 오류가 발생했습니다.',
                    icon: 'error',
                    confirmButtonText: '확인'
                });
            }
        });
    });
});
</script>
</body>
</html>