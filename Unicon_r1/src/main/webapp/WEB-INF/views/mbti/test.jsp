<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/new_topHeader.jsp" %>
<!-- 추가 템플릿 css/js 작성란 -->
<style>
    .answer-scale {
        display: flex;
        justify-content: space-between;
        margin: 20px 0;
    }
    .answer-option input[type="radio"] {
        display: none;
    }
    .answer-option label {
        display: inline-block;
        background-color: #f5f5f5;
        color: #232323;
        padding: 10px 20px;
        border-radius: 30px;
        cursor: pointer;
        transition: all 0.3s ease;
        font-size: 14px;
        font-weight: 500;
    }
    .answer-option input[type="radio"]:checked + label {
        background-color: #232323;
        color: #ffffff;
    }
    .dog-image-container {
        text-align: center; /* 이미지 가운데 정렬 */
        margin-bottom: 20px; /* 이미지 아래 여백 */
    }
    .dog-image {
        max-width: 80%; /* 이미지 크기 조정 */
        height: auto; /* 비율 유지 */
    }
</style>
</head>
<%@ include file="../inc/new_header.jsp" %>

<section>
    <div class="container">
        <div class="section-heading">
            <h2>강아지 MBTI 테스트</h2>
        </div>
        <div class="row mt-n1-9">
            <div class="col-md-12">
                <article class="card blog-card">
                    <div class="card-body">
                        <!-- 이미지 추가 -->
                        <div class="dog-image-container">
                            <img src="https://i1.wp.com/21gram.blog/wp-content/uploads/2024/06/%E1%84%87%E1%85%A6%E1%84%85%E1%85%B5_%E1%84%80%E1%85%A1%E1%86%BC%E1%84%8B%E1%85%A1%E1%84%8C%E1%85%B5%E1%84%80%E1%85%A9%E1%84%8B%E1%85%A3%E1%86%BC%E1%84%8B%E1%85%B5%E1%84%92%E1%85%A1%E1%86%B8%E1%84%89%E1%85%A1_05-1024x546.jpg?ssl=1" 
                                alt="강아지 MBTI" 
                                class="dog-image">
                        </div>
                        <!-- 질문 폼 -->
                        <form id="mbtiForm" action="/mbti/answer" method="post">
                            <h3>${question}</h3>
                            <div class="answer-scale">
                                <div class="answer-option">
                                    <input type="radio" name="answer" value="1" id="answer1" required>
                                    <label for="answer1">매우 아니다</label>
                                </div>
                                <div class="answer-option">
                                    <input type="radio" name="answer" value="2" id="answer2">
                                    <label for="answer2">아니다</label>
                                </div>
                                <div class="answer-option">
                                    <input type="radio" name="answer" value="3" id="answer3">
                                    <label for="answer3">보통이다</label>
                                </div>
                                <div class="answer-option">
                                    <input type="radio" name="answer" value="4" id="answer4">
                                    <label for="answer4">그렇다</label>
                                </div>
                                <div class="answer-option">
                                    <input type="radio" name="answer" value="5" id="answer5">
                                    <label for="answer5">매우 그렇다</label>
                                </div>
                            </div>
                            <button type="submit" class="butn">다음 질문</button>
                        </form>
                    </div>
                </article>
            </div>
        </div>
    </div>
</section>

<script>
    document.getElementById('mbtiForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const formData = new FormData(this);
        const submitButton = document.querySelector('.butn');
        
        const url = submitButton.textContent === '결과 보기' ? '/mbti/finalAnswer' : '/mbti/answer';
        
        fetch(url, {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('서버 응답 오류: ' + response.status);
            }
            return response.json();
        })
        .then(data => {
            console.log('서버 응답:', data);
            if (data.redirectToResult) {
                window.location.href = '/mbti/result';
            } else if (data.question) {
                document.querySelector('.card-body h3').textContent = data.question;
                document.querySelectorAll('input[type="radio"]').forEach(radio => radio.checked = false);
                
                if (data.isLastQuestion) {
                    submitButton.textContent = '결과 보기';
                } else {
                    submitButton.textContent = '다음 질문';
                }
            } else {
                throw new Error('예상치 못한 응답 형식');
            }
        })
        .catch(error => {
            console.error('오류 발생:', error);
            alert('오류가 발생했습니다: ' + error.message);
        });
    });
</script>

<%@ include file="../inc/new_footer.jsp" %>