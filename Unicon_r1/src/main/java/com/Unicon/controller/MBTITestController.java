package com.Unicon.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Unicon.domain.PetAdoptionVO;
import com.Unicon.service.PetAdoptionService;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@Controller
@RequestMapping("/mbti")
public class MBTITestController {
	 @Autowired
	    private PetAdoptionService petAdoptionService;
    private static final Logger logger = LoggerFactory.getLogger(MBTITestController.class);

    private List<String> questions;
    private int[] scores;
    private int currentQuestionIndex;
    private String mbtiResult; 
    private String petRecommendation;
    private String petCharacteristics;

    public MBTITestController() {
        initializeQuestions();
        resetTest();
    } 

    private void initializeQuestions() {
        questions = new ArrayList<>();
        questions.add("1. 새로운 사람들을 만나는 것을 즐기시나요? (1: 매우 아니다, 5: 매우 그렇다)");
        questions.add("2. 사회적 모임 후에 에너지가 충전되나요? (1: 매우 아니다, 5: 매우 그렇다)");
        questions.add("3. 처음 보는 사람과 대화를 시작하는 것이 어렵지 않나요? (1: 매우 아니다, 5: 매우 그렇다)");
        questions.add("4. 상상력이 풍부한 편인가요? (1: 매우 아니다, 5: 매우 그렇다)");
        questions.add("5. 실제 경험보다 미래의 가능성을 더 중요하게 생각하나요? (1: 매우 아니다, 5: 매우 그렇다)");
        questions.add("6. 새로운 아이디어를 탐구하는 것을 좋아하나요? (1: 매우 아니다, 5: 매우 그렇다)");
        questions.add("7. 논리적인 결정을 내리는 것을 선호하시나요? (1: 매우 아니다, 5: 매우 그렇다)");
        questions.add("8. 감정보다 이성을 더 중요하게 여기나요? (1: 매우 아니다, 5: 매우 그렇다)");
        questions.add("9. 객관적 사실을 기반으로 결정을 내리나요? (1: 매우 아니다, 5: 매우 그렇다)");
        questions.add("10. 계획을 세우고 그대로 실행하는 것을 좋아하시나요? (1: 매우 아니다, 5: 매우 그렇다)");
        questions.add("11. 일정을 미리 정해두는 것을 선호하나요? (1: 매우 아니다, 5: 매우 그렇다)");
        questions.add("12. 즉흥적인 계획 변경을 불편해하시나요? (1: 매우 아니다, 5: 매우 그렇다)");
    }

    @GetMapping("")
    public String redirectToStart() {
        return "redirect:/mbti/start";
    }

    @GetMapping("/start")
    public String startTest(Model model) {
        resetTest();
        model.addAttribute("question", getCurrentQuestion());
        logger.info("MBTI 테스트가 시작되었습니다.");
        return "mbti/start";
    }

    @GetMapping("/test")
    public String showTest(Model model) {
        model.addAttribute("question", getCurrentQuestion());
        model.addAttribute("isLastQuestion", !hasNextQuestion());
        logger.info("MBTI 테스트 페이지로 이동합니다.");
        return "mbti/test";
    }

    @PostMapping("/answer")
    @ResponseBody
    public ResponseEntity<?> handleAnswer(@RequestParam int answer) {
        try {
            logger.info("사용자가 입력한 답변: {}", answer);
            
            if (answer < 1 || answer > 5) {
                return ResponseEntity.badRequest().body("답변은 1에서 5 사이의 숫자여야 합니다.");
            }

            processUserAnswer(answer);
            
            Map<String, Object> response = new HashMap<>();
            if (hasNextQuestion()) {
                response.put("question", getCurrentQuestion());
                response.put("questionNumber", getCurrentQuestionIndex() + 1);
                response.put("isLastQuestion", !hasNextQuestion());
            } else {
                calculateMBTI();
                recommendPet();
                response.put("mbtiResult", getMBTIResult());
                response.put("petRecommendation", getPetRecommendation());
                response.put("petCharacteristics", getPetCharacteristics());
                response.put("redirectToResult", true);
            }
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            logger.error("답변 처리 중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("답변 처리 중 오류가 발생했습니다: " + e.getMessage());
        }
    }
    @GetMapping("/result")
    public String showResult(Model model) {
        if (mbtiResult == null) {
            return "redirect:/mbti/start";
        }
        model.addAttribute("mbtiResult", getMBTIResult());
        model.addAttribute("petRecommendation", getPetRecommendation());
        model.addAttribute("petCharacteristics", getPetCharacteristics());

        // 추천 동물 목록 로그 출력
        List<String> recommendedPets = Arrays.asList(getPetRecommendation().split(", "));
        logger.info("추천 동물 목록: {}", recommendedPets);

        // DAO 호출 결과 로그 출력
        List<PetAdoptionVO> matchingAdoptions = petAdoptionService.findByAnimalTypes(recommendedPets);
        logger.info("매칭된 입양글 수: {}", matchingAdoptions.size());
        
        model.addAttribute("matchingAdoptions", matchingAdoptions);
        return "mbti/result";
    }
    
    @GetMapping("/adoption/detail/{adpt_ai}")
    public String showAdoptionDetail(@PathVariable("adpt_ai") int adpt_ai, Model model) {
        PetAdoptionVO adoption = petAdoptionService.getAdoptionByAdptAi(adpt_ai);
        model.addAttribute("adoption", adoption);
        return "adoption/detail";
    }


    
    

    public void processUserAnswer(int answer) {
        scores[currentQuestionIndex / 3] += answer - 3;
        currentQuestionIndex++;
        logger.info("현재 질문 인덱스: {}, 사용자가 입력한 답변: {}", currentQuestionIndex - 1, answer);
    }

    public String getCurrentQuestion() {
        return questions.get(currentQuestionIndex);
    }

    public boolean hasNextQuestion() {
        return currentQuestionIndex < questions.size() - 1;
    }

    public void calculateMBTI() {
        StringBuilder result = new StringBuilder();
        result.append(scores[0] >= 0 ? "E" : "I");
        result.append(scores[1] >= 0 ? "N" : "S");
        result.append(scores[2] >= 0 ? "T" : "F");
        result.append(scores[3] >= 0 ? "J" : "P");
        mbtiResult = result.toString();
        logger.info("MBTI 결과 계산 완료: {}", mbtiResult);
    }

    public void recommendPet() {
        switch (mbtiResult) {
            case "ESTJ":
                petRecommendation = "로트바일러, 아나톨리아 셰퍼드, 저먼 셰퍼드";
                petCharacteristics = "충성스럽고 보호본능이 강하며, 지능이 높고 훈련이 쉽습니다. 활동적이고 경계심이 강한 편입니다.";
                break;
            case "ESTP":
                petRecommendation = "벨지안 셰퍼드, 불 테리어, 시베리안 허스키, 아메리칸 불리, 아메리칸 스태퍼드셔 테리어, 아메리칸 핏불 테리어, 오스트레일리안 캐틀독, 스노우 슈, 말티즈";
                petCharacteristics = "에너지가 넘치고 독립적이며, 지능이 높습니다. 활동적이고 모험을 좋아하는 성격입니다.";
                break;
            case "ENTJ":
                petRecommendation = "그레이트 데인, 바센지, 보더 콜리";
                petCharacteristics = "지능이 높고 리더십이 있으며, 훈련성이 뛰어납니다. 충성심이 강하고 주인에게 헌신적입니다.";
                break;
            case "ENTP":
                petRecommendation = "데본 렉스, 사바나캣, 통키니즈, 바센지, 에어데일 테리어";
                petCharacteristics = "호기심이 많고 지적이며, 활동적입니다. 독창적이고 창의적인 성격을 가졌습니다.";
                break;
            case "ESFJ":
                petRecommendation = "믹스견, 그레이트 데인, 비숑 프리제, 시추, 요크셔 테리어, 케언 테리어, 포메라니안, 레그돌, 먼치킨, 셀커크 렉스, 아메리칸 쇼트헤어, 하바나 브라운";
                petCharacteristics = "사교적이고 친근한 성격이며, 사람들과의 교감을 좋아합니다. 충실하고 애정이 깊습니다.";
                break;
            case "ESFP":
                petRecommendation = "보스턴 테리어, 브리트니, 치와와, 푸들";
                petCharacteristics = "활발하고 명랑한 성격이며, 사람들과 잘 어울립니다. 놀기 좋아하고 에너지가 넘칩니다.";
                break;
            case "ENFJ":
                petRecommendation = "버니즈 마운틴 도그, 벨지안 셰퍼드, 복서, 아메리칸 스태퍼드셔 테리어";
                petCharacteristics = "따뜻하고 친근한 성격이며, 가족을 사랑하고 보호하려는 본능이 강합니다.";
                break;
            case "ENFP":
                petRecommendation = "사모예드견, 잉글리시 코커 스패니얼, 펨브록 웰시 코기, 프렌치 불도그, 싱가퓨라, 발리네즈";
                petCharacteristics = "밝고 긍정적인 성격이며, 사교적이고 활발합니다. 새로운 것을 좋아하고 적응력이 뛰어납니다.";
                break;
            case "ISTJ":
                petRecommendation = "보더 콜리, 불마스티프, 세인트 버나드";
                petCharacteristics = "신중하고 책임감이 강하며, 충성심이 깊습니다. 규칙적인 생활을 좋아하고 안정적입니다.";
                break;
            case "ISFJ":
                petRecommendation = "불도그, 세인트 버나드, 시추, 하바나 실크 독, 맹크스, 버만, 샴, 페르시안";
                petCharacteristics = "온순하고 충실하며, 가족을 사랑하는 마음이 깊습니다. 조용하고 안정적인 성격입니다.";
                break;
            case "INTJ":
                petRecommendation = "블랙 러시안 테리어, 시베리안 허스키, 오스트레일리언 셰퍼드, 페르시아 마스티프, 스핑크스, 하일랜드 폴드";
                petCharacteristics = "독립적이고 지적이며, 자신만의 공간을 중요시합니다. 훈련성이 높고 영리합니다.";
                break;
            case "INFJ":
                petRecommendation = "니벨룽, 봄베이, 스코티시폴드, 터키시 앙고라";
                petCharacteristics = "조용하고 신중하며, 깊은 유대관계를 형성합니다. 직관력이 뛰어나고 이해심이 깊습니다.";
                break;
            case "ISTP":
                petRecommendation = "샤트룩스";
                petCharacteristics = "독립적이고 영리하며, 적응력이 뛰어납니다. 조용하지만 활동적인 면도 있습니다.";
                break;
            case "ISFP":
                petRecommendation = "러시안 블루, 브리티쉬 롱헤어, 시베리안 포레스트, 재패니즈밥테일";
                petCharacteristics = "예술적 감각이 뛰어나고 조용한 성격입니다. 충실하며 주인과 깊은 유대관계를 형성합니다.";
                break;
            case "INTP":
                petRecommendation = "푸들, 바셋 하운드, 메인쿤, 벵갈, 아비시니안";
                petCharacteristics = "지적 호기심이 많고 독립적입니다. 영리하고 문제해결 능력이 뛰어납니다.";
                break;
            case "INFP":
                petRecommendation = "노르웨이 숲, 라가머핀, 브리티시 쇼트헤어, 소말리, 페르시안 친칠라";
                petCharacteristics = "섬세하고 이해심이 많으며, 충실한 성격입니다. 조용하고 따뜻한 마음을 가졌습니다.";
                break;
            default:
                petRecommendation = "모든 종류의 반려동물과 잘 어울릴 수 있습니다.";
                petCharacteristics = "당신의 성격은 다양한 반려동물과 조화.";
        }
                

        logger.info("추천 반려동물 계산 완료: {}", petRecommendation);
    }

    public void resetTest() {
        scores = new int[4];
        currentQuestionIndex = 0;
        mbtiResult = null;
        petRecommendation = null;
        logger.info("테스트가 초기화되었습니다.");
    }

    public int getCurrentQuestionIndex() {
        return currentQuestionIndex;
    }

    public String getMBTIResult() {
        return mbtiResult;
    }

    public String getPetRecommendation() {
        return petRecommendation;
    }
    public String getPetCharacteristics() {
        return petCharacteristics;
    }

}