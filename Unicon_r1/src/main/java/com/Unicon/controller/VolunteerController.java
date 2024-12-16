package com.Unicon.controller;

import java.sql.Clob;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Unicon.domain.MemberVO;
import com.Unicon.domain.VolunteerApplyVO;
import com.Unicon.domain.VolunteerVO;
import com.Unicon.service.VolunteerService;

@Controller
@RequestMapping("/volunteer")
public class VolunteerController {
    
    private static final Logger logger = LoggerFactory.getLogger(VolunteerController.class);
    
    @Inject
    private VolunteerService volService;
    
    // ======= 사용자 뷰 매핑 =======
    // http://localhost:8088/volunteer
    // http://localhost:8088/volunteer/mylist
    
    @GetMapping("/manage/volForm")
    public String volunteerForm(
            @RequestParam(value = "voId", required = false) Long voId,
            Model model) throws Exception {
        
        if (voId != null) {
            // 수정인 경우, 기존 데이터 조회
            VolunteerVO volunteer = volService.getVolunteer(voId);
            model.addAttribute("volunteer", volunteer);
        }
        
        return "volunteer/manage/volForm";
    }
    
    @GetMapping("/manage/volGuideForm")
    public String guideForm(Model model) throws Exception {
    	VolunteerVO guide = volService.getVolunteerInfo();
        model.addAttribute("guide", guide);
        return "volunteer/manage/volGuideForm";
    }
    
    @GetMapping("/checkLogin")
    @ResponseBody
    public boolean checkLoginStatus(HttpSession session) {
        // 세션에서 로그인 상태 확인 
        return session.getAttribute("user") != null;
    }
    
    @PostMapping("/customLogin")
    public String login(MemberVO member, HttpSession session, RedirectAttributes rttr) {
        MemberVO loginMember = volService.loginProcess(member);
        if (loginMember != null) {
            session.setAttribute("member", loginMember);
            return "redirect:/volunteer/apply/${volunteer.voId}";
        } else {
            rttr.addFlashAttribute("msg", "로그인 실패");
            return "redirect:/login/customLogin";
        }
    }
    
    @GetMapping("")
    public String userList(Model model) throws Exception {
        VolunteerVO volunteerInfo = volService.getVolunteerInfo();
        List<VolunteerVO> ongoingVolunteers = volService.getOngoingVolunteers();  // recruitStatus = OPEN
        List<VolunteerVO> closedVolunteers = volService.getClosedVolunteers();    // recruitStatus = CLOSE
        
        model.addAttribute("volunteerInfo", volunteerInfo);
        model.addAttribute("ongoingVolunteers", ongoingVolunteers);
        model.addAttribute("closedVolunteers", closedVolunteers);
        
        return "volunteer/volList";
    }
    
    @GetMapping("/apply/{voId}")
    public String applicationForm(@PathVariable Long voId, Model model) throws Exception {
        VolunteerVO volunteer = volService.getVolunteer(voId);
        model.addAttribute("volunteer", volunteer);
        return "volunteer/volApply";
    }
    
	/*
	 * @PostMapping("/apply")
	 * 
	 * @ResponseBody public ResponseEntity<?> submitApplication(@ModelAttribute
	 * VolunteerApplyVO apply) { try { volService.submitApplication(apply); return
	 * ResponseEntity.ok().build(); } catch (Exception e) {
	 * logger.error("봉사활동 신청 실패", e); return
	 * ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	 * .body(e.getMessage()); } }
	 */
    
	/* ============================================================================================== */
    @PostMapping("/apply")
    @ResponseBody
    public ResponseEntity<?> submitApplication(@ModelAttribute VolunteerApplyVO apply) {
        try {
            // 날짜 형식 변환
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String birthDateStr = apply.getBirthYear() + "-" + 
                                String.format("%02d", Integer.parseInt(apply.getBirthMonth())) + "-" + 
                                String.format("%02d", Integer.parseInt(apply.getBirthDay()));
            java.sql.Date birthDate = new java.sql.Date(sdf.parse(birthDateStr).getTime());
            apply.setVoBirth(birthDate);

            // 나이 계산 및 검증
            int age = calculateAge(birthDate);
            VolunteerVO volunteer = volService.getVolunteer(apply.getVolunteerId());
            
            // voTarget이 이미 String으로 변환되어 있음
            String target = volunteer.getVoTarget() != null ? volunteer.getVoTarget() : "";

            if (!isEligibleAge(age, target)) {
                String message = target.contains("성인") ? 
                    "성인만 신청 가능합니다." : "청소년만 신청 가능합니다.";
                return ResponseEntity.badRequest().body(message);
            }

            volService.submitApplication(apply);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            logger.error("봉사활동 신청 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body(e.getMessage());
        }
    }

    // 나이 계산 메서드
    private int calculateAge(java.sql.Date birthDate) {
        Calendar birth = Calendar.getInstance();
        birth.setTime(birthDate);
        Calendar today = Calendar.getInstance();
        
        int age = today.get(Calendar.YEAR) - birth.get(Calendar.YEAR);
        
        if (today.get(Calendar.MONTH) < birth.get(Calendar.MONTH) ||
            (today.get(Calendar.MONTH) == birth.get(Calendar.MONTH) && 
             today.get(Calendar.DAY_OF_MONTH) < birth.get(Calendar.DAY_OF_MONTH))) {
            age--;
        }
        return age;
    }

    // 나이 자격 확인 메서드
    private boolean isEligibleAge(int age, String target) {
        if (target.contains("성인")) {
            return age >= 19;
        } else if (target.contains("청소년")) {
            return age >= 14 && age < 19;
        }
        return true;
    }
    /* ============================================================================================== */
    
    @GetMapping("/mylist")
    public String myApplications(HttpSession session, Model model) throws Exception {
        String userId = (String) session.getAttribute("userId");
        List<VolunteerApplyVO> applications = volService.getMyApplications(userId);
        model.addAttribute("applications", applications);
        return "volunteer/volMyList";
    }
    
    @PostMapping("/cancel/{voId}")
    @ResponseBody
    public ResponseEntity<String> cancelApplication(
            @PathVariable Long voId,
            @RequestParam String reason,
            @RequestParam String reasonDetail) {
        try {
            volService.cancelApplication(voId, reason, reasonDetail);
            return ResponseEntity.ok("신청이 취소되었습니다.");
        } catch (Exception e) {
            logger.error("봉사활동 신청 취소 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body("신청 취소 중 오류가 발생했습니다.");
        }
    }
    
    // ======= 관리자 뷰 매핑 =======
    // http://localhost:8088/volunteer/manage/voList
    
    @GetMapping("/manage/voList")
    public String adminList(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String recruitStatus,  // status -> recruitStatus로 변경
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String startDate,
            @RequestParam(required = false) String endDate,
            Model model) throws Exception {
            
    	Map<String, Object> result = volService.getVolunteerList(page, size, recruitStatus, keyword, startDate, endDate);
        
        model.addAttribute("volunteers", result.get("volunteers"));
        model.addAttribute("totalCount", result.get("totalCount"));
        model.addAttribute("page", page);
        model.addAttribute("totalPages", result.get("totalPages"));
        model.addAttribute("startPage", result.get("startPage"));
        model.addAttribute("endPage", result.get("endPage"));
        
        return "volunteer/manage/volList";
    }
    
    @PostMapping("/manage/submit")
    @ResponseBody
    public ResponseEntity<?> submitVolunteer(@ModelAttribute VolunteerVO volunteer) {
        try {
            if (volunteer.getVoId() == null) {
                volService.registerVolunteer(volunteer);
            } else {
                volService.updateVolunteer(volunteer);
            }
            return ResponseEntity.ok("/volunteer/manage");
        } catch (Exception e) {
            logger.error("봉사활동 저장 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body(e.getMessage());
        }
    }
    
    @PostMapping("/manage/updateGuide")
    @ResponseBody
    public ResponseEntity<?> updateGuide(@RequestBody VolunteerVO guide) {
        try {
            logger.info("Received guide update request: {}", guide);  
            volService.updateGuide(guide);
            return new ResponseEntity<>("success", HttpStatus.OK);
        } catch (Exception e) {
            logger.error("안내문 수정 실패: ", e);  
            return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PostMapping("/manage/delete/{voId}")
    @ResponseBody
    public ResponseEntity<String> delete(@PathVariable Long voId) {
        try {
            volService.deleteVolunteer(voId);
            return ResponseEntity.ok("삭제되었습니다.");
        } catch (Exception e) {
            logger.error("봉사활동 삭제 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body("삭제 중 오류가 발생했습니다.");
        }
    }
    
    @PostMapping("/manage/close/{voId}")
    @ResponseBody
    public ResponseEntity<String> closeRecruitment(@PathVariable Long voId) {
        try {
            volService.closeRecruitment(voId);
            return ResponseEntity.ok("마감되었습니다.");
        } catch (Exception e) {
            logger.error("봉사활동 마감 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body("마감 처리 중 오류가 발생했습니다.");
        }
    }
    
    @PostMapping("/manage/open/{voId}")
    @ResponseBody
    public ResponseEntity<String> openRecruitment(@PathVariable Long voId) {
        try {
            volService.openRecruitment(voId);
            return ResponseEntity.ok("모집이 시작되었습니다.");
        } catch (Exception e) {
            logger.error("봉사활동 모집 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body("모집 처리 중 오류가 발생했습니다.");
        }
    }
    
    @PostMapping("/manage/approve/{applicationId}")
    @ResponseBody
    public ResponseEntity<String> approveApplication(@PathVariable Long applicationId) {
        try {
            volService.approveApplication(applicationId);
            return ResponseEntity.ok("승인되었습니다.");
        } catch (Exception e) {
            logger.error("봉사활동 신청 승인 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body("승인 처리 중 오류가 발생했습니다.");
        }
    }
    
    @PostMapping("/manage/reject/{voId}")
    @ResponseBody
    public ResponseEntity<String> rejectApplication(
            @PathVariable Long voId,
            @RequestParam String reason,
            @RequestParam String reasonDetail) {
        try {
            volService.rejectApplication(voId, reason, reasonDetail);
            return ResponseEntity.ok("신청이 거절되었습니다.");
        } catch (Exception e) {
            logger.error("봉사활동 신청 거절 실패: voId=" + voId, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body("거절 처리 중 오류가 발생했습니다.");
        }
    }
    
    @GetMapping("/manage/detail/{voId}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getVolunteerDetail(@PathVariable Long voId) {
        try {
            // 봉사활동 기본 정보 조회
            VolunteerVO volunteer = volService.getVolunteer(voId);
            
            // 해당 봉사활동의 신청자 목록 조회
            Map<String, Object> applicationResult = volService.getApplicationList(voId, null);
            List<VolunteerApplyVO> applications = (List<VolunteerApplyVO>) applicationResult.get("applications");
            
            // 응답 데이터 구성
            Map<String, Object> response = new HashMap<>();
            response.put("voId", volunteer.getVoId());
            response.put("voTitle", volunteer.getVoTitle());
            response.put("voContent", volunteer.getVoContent());
            response.put("voLocation", volunteer.getVoLocation());
            response.put("voTarget", volunteer.getVoTarget());
            response.put("voCapacity", volunteer.getVoCapacity());
            response.put("voManager", volunteer.getVoManager());
            response.put("voContact", volunteer.getVoContact());
            response.put("voStartDate", volunteer.getVoStartDate());
            response.put("voEndDate", volunteer.getVoEndDate());
            response.put("recruitStatus", volunteer.getRecruitStatus());
            response.put("applications", applications);
            
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            logger.error("봉사활동 상세정보 조회 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body(Collections.singletonMap("error", e.getMessage()));
        }
    }
}
