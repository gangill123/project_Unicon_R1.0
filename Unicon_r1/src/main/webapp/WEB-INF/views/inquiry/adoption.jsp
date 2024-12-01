<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %> <!-- topHeader / jquery 추가 -->

<!-- 추가 템플릿 css/js 작성란 -->

<style>

/* 메인 타이틀 스타일 */
.main-title {
    font-size: 2rem;
    font-weight: bold;
    margin: 60px 0 20px 200px;
    color: black;       
}

</style>


</head>
<%@ include file="../inc/new_header.jsp" %> <!-- header -->

<!--====================================작성부=====================================-->
<!-- start page title section -->
<section class="page-title-section bg-primary">
    <div class="container">
		
        <div class="row">
            <div class="col-md-12">
                <h1>unicon 고객센터</h1>
            </div>
            <div class="col-md-12">
                <ul class="ps-0">
                   <li><a href="inquiry"><i class="ti-home"></i></a></li>
                    <li class="active"><a href="adoption">입양</a></li>
                </ul>
            </div>
        </div>
	
    </div>
</section>
 <!-- end page title section -->  



<!--====================================작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %> <!-- footer -->
