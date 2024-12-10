package com.Unicon.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class ChatbotService {

    public String sendMessageToChatbotApi(String userMessage) throws IOException {
        String apiUrl = "https://kakaoi.kakao.com/v1/api/message";
        
        // 카카오톡 챗봇 API에 요청을 보내는 코드
        HttpURLConnection connection = (HttpURLConnection) new URL(apiUrl).openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestProperty("Authorization", "Bearer {YOUR_ACCESS_TOKEN}");

        // 사용자 메시지 보내기
        JSONObject requestBody = new JSONObject();
        requestBody.put("message", userMessage);

        connection.setDoOutput(true);
        OutputStream os = connection.getOutputStream();
        os.write(requestBody.toString().getBytes("UTF-8"));
        os.flush();
        os.close();

        // 서버에서 받은 응답 처리
        InputStream responseStream = connection.getInputStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(responseStream));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }
        reader.close();

        // 응답 메시지 리턴
        return response.toString();
    }
}
