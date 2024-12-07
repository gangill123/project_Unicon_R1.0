package com.Unicon.mbtitest;

import java.util.Scanner;

import com.Unicon.controller.MBTITestController;

public class MBTITest {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        MBTITestController controller = new MBTITestController();

        System.out.println("MBTI 테스트를 시작합니다.");

        while (controller.hasNextQuestion()) {
            System.out.println(controller.getCurrentQuestion());
            int answer = scanner.nextInt();
            
            // 유효성 검사
            while (answer < 1 || answer > 5) {
                System.out.println("1에서 5 사이의 숫자를 입력하세요.");
                answer = scanner.nextInt();
            }
            
            controller.processUserAnswer(answer);
        }

        controller.calculateMBTI();
        controller.recommendPet();

        System.out.println("\n테스트 결과:");
        System.out.println("당신의 MBTI 유형은 " + controller.getMBTIResult() + "입니다.");
        System.out.println("추천 반려동물: " + controller.getPetRecommendation());

        scanner.close();
    }
}