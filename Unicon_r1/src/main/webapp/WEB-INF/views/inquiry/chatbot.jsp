<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 추가 템플릿 css/js 작성란 -->

<style>
  /* 챗봇 아이콘 스타일 */
.chatbot-icon {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background-color: #007bff;
    border-radius: 50%;
    padding: 10px;
    cursor: pointer;
    z-index: 1000;
}

.chatbot-icon img {
    width: 50px;
    height: 50px;
}

/* 챗봇 팝업 스타일 */
.chatbot-popup {
    position: fixed;
    bottom: 80px;
    right: 20px;
    width: 300px;
    height: 400px;
    background-color: white;
    border: 1px solid #ccc;
    border-radius: 5px;
    display: none; /* 처음에는 보이지 않도록 설정 */
    z-index: 999;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

/* 챗봇 헤더 스타일 */
.chatbot-header {
    background-color: #007bff;
    color: white;
    padding: 10px;
    text-align: center;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
}

.chatbot-header button {
    background: none;
    border: none;
    color: white;
    cursor: pointer;
    font-size: 16px;
}

/* 챗봇 본문 스타일 */
.chatbot-body {
    padding: 10px;
    height: 270px;
    overflow-y: auto;
}

/* 챗봇 입력 영역 스타일 */
.chatbot-footer {
    padding: 10px;
    border-top: 1px solid #ccc;
    text-align: center;
}

.chatbot-footer input {
    width: 70%;
    padding: 5px;
    margin-right: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.chatbot-footer button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
}

</style>


</head>


<!--====================================작성부=====================================-->

  <div class="chatbot-popup" id="chatbot-popup">
        <div class="chatbot-header">
            <h3>챗봇</h3>
            <button onclick="toggleChatbot()">닫기</button>
        </div>
        <div class="chatbot-body" id="chatbot-body">
            <!-- 챗봇 대화 내용 -->
        </div>
        <div class="chatbot-footer">
            <input type="text" id="userMessage" placeholder="메시지를 입력하세요..." />
            <button onclick="sendMessage()">전송</button>
        </div>
    </div>

    <script>
        function toggleChatbot() {
            var chatbotPopup = document.getElementById('chatbot-popup');
            chatbotPopup.style.display = (chatbotPopup.style.display === 'none' || chatbotPopup.style.display === '') ? 'block' : 'none';
        }

        function sendMessage() {
            var userMessage = document.getElementById('userMessage').value;
            var chatbotBody = document.getElementById('chatbot-body');

            // 사용자 메시지 표시
            chatbotBody.innerHTML += "<p><strong>나:</strong> " + userMessage + "</p>";

            // 서버로 메시지 보내기
            fetch('/sendMessage', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ message: userMessage })
            })
            .then(response => response.json())
            .then(data => {
                // 챗봇의 응답을 화면에 표시
                chatbotBody.innerHTML += "<p><strong>챗봇:</strong> " + data.reply + "</p>";
            })
            .catch(error => console.error('Error:', error));
        }
    </script>


<!--====================================작성부=====================================-->


