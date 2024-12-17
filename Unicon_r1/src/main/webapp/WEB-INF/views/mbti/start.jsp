<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %>
<!-- topHeader / jquery 추가 -->
<!-- 추가 템플릿 css/js 작성란 -->
<title>MBTI 테스트 시작</title>
</head>
<%@ include file="../inc/new_header.jsp" %>
<!-- header -->
 
<!--====================================작성부=====================================-->
<section>
    <div class="container">
        <div class="section-heading">
            <h1>MBTI 테스트</h1>
        </div>
        <div class="row mt-n1-9">
            <div class="col-md-12 text-center">
                <p>테스트를 시작합니다.</p>
                <img src="https://png.pngtree.com/thumb_back/fh260/background/20230609/pngtree-three-puppies-with-their-mouths-open-are-posing-for-a-photo-image_2902292.jpg" alt="강아지 이미지" class="img-fluid mb-4" style="max-width: 300px;">
                <form action="${pageContext.request.contextPath}/mbti/test" method="get">
                    <input type="submit" value="테스트 시작" class="btn btn-primary">
                </form>
            </div>
        </div>
    </div>
</section>
<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->
<script>
$('.navbar #adpt').addClass('current');
</script>
<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %>
<!-- footer -->