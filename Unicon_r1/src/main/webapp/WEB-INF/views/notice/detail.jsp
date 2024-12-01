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
</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<!-- 공지사항 상세 부분 -->
<div class="container-xxl py-5">
    <div class="container">
        <!-- 공지사항 상세 내용 -->
        <div class="card">
            <div class="card-header bg-white border-bottom">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <span class="badge bg-primary me-2">${notice.noCategory}</span>
                        <h4 class="mb-0 d-inline-block">${notice.noTitle}</h4>
                    </div>
                    <div class="text-muted">
                        <small>등록일: <fmt:formatDate value="${notice.noRegDate}" pattern="yyyy-MM-dd"/></small>
                        <small class="ms-3">조회수: ${notice.viewCount}</small>
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