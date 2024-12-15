<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %>
<!-- topHeader / jquery 추가 -->
<!-- 추가 템플릿 css/js 작성란 -->
<title>MBTI 테스트 결과</title>
<style>
  

    h1 {
        color: #333;
        text-align: center;
        margin-bottom: 30px;
    }
    p {
        margin-bottom: 20px;
        font-size: 16px;
    }
    strong {
        color: #007bff;
        font-size: 18px;
    }
    .btn {
        display: inline-block;
        background-color: #007bff;
        color: #fff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
        margin-top: 20px;
    }
    .btn:hover {
        background-color: #0056b3;
    }
    .pet-info {
        margin-top: 30px;
        padding: 20px;
        background-color: #f8f9fa;
        border-radius: 5px;
        border-left: 4px solid #007bff;
        margin-bottom: 20px;
    }
    .pet-info h2 {
        color: #333;
        font-size: 1.2em;
        margin-bottom: 15px;
    }
    .pet-info p {
        color: #555;
        line-height: 1.8;
    }
    .text-center {
        text-align: center;
    }
</style>
</head>
<%@ include file="../inc/new_header.jsp" %>
<!-- header -->

<!--====================================작성부=====================================-->
<section>
    <div class="container">
        <div class="section-heading">
            <h1>MBTI 테스트 결과</h1>
        </div>
        <div class="row mt-n1-9">
            <div class="col-md-12">
                <article class="card blog-card">
                    <div class="card-body">
                        <p>당신의 MBTI 유형은 <strong>${mbtiResult}</strong>입니다.</p>
                        <p>추천 반려동물: ${petRecommendation}</p>
                        
                        <div class="pet-info">
                            <h2>🐾 추천 반려동물 특징</h2>
                            <p>${petCharacteristics}</p>
                        </div>
                        
                        <div class="text-center">
                            <a href="/mbti/start" class="btn">테스트 다시 하기</a>
                        </div>
                    </div>
                </article>
            </div>
        </div>
    </div>
</section>
<!--====================================작성부=====================================-->

<!--====================================script 작성부=====================================-->
<!--====================================script 작성부=====================================-->

<%@ include file="../inc/new_footer.jsp" %>
<!-- footer -->
