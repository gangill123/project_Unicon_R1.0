package com.Unicon.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Unicon.service.ChatbotService;

@Controller
public class ChatbotController {

    private final ChatbotService chatbotService;

    @Autowired
    public ChatbotController(ChatbotService chatbotService) {
        this.chatbotService = chatbotService;
    }

    @PostMapping("/sendMessage")
    @ResponseBody
    public Map<String, String> sendMessageToChatbot(@RequestBody Map<String, String> request) throws IOException {
        String userMessage = request.get("message");
        
        // 서비스 계층을 통해 카카오 챗봇 API 호출
        String chatbotResponse = chatbotService.sendMessageToChatbotApi(userMessage);

        // 챗봇의 응답을 반환
        Map<String, String> response = new HashMap<>();
        response.put("reply", chatbotResponse);
        return response;
    }
}
