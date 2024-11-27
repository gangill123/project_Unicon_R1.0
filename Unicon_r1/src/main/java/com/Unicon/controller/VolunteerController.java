package com.Unicon.controller;

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
    
    @GetMapping("")
    public String userList(Model model) throws Exception {
    	VolunteerVO volunteerInfo = volService.getVolunteerInfo();
        List<VolunteerVO> ongoingVolunteers = volService.getOngoingVolunteers();
        List<VolunteerVO> closedVolunteers = volService.getClosedVolunteers();
        
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
    
    @PostMapping("/apply")
    @ResponseBody
    public ResponseEntity<?> submitApplication(@ModelAttribute VolunteerApplyVO apply) {
        try {
            volService.submitApplication(apply);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            logger.error("봉사활동 신청 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body(e.getMessage());
        }
    }
    
    @GetMapping("/mylist")
    public String myApplications(HttpSession session, Model model) throws Exception {
        String userId = (String) session.getAttribute("userId");
        List<VolunteerApplyVO> applications = volService.getMyApplications(userId);
        model.addAttribute("applications", applications);
        return "volunteer/volMyList";
    }
    
    // ======= 관리자 뷰 매핑 =======
    // http://localhost:8088/volunteer/manage
    
    @GetMapping("/manage")
    public String adminList(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String status,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String startDate,
            @RequestParam(required = false) String endDate,
            Model model) throws Exception {
            
        Map<String, Object> result = volService.getVolunteerList(page, size, status, keyword, startDate, endDate);
        
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
    
    @PostMapping("/manage/reject/{applicationId}")
    @ResponseBody
    public ResponseEntity<String> rejectApplication(
            @PathVariable Long applicationId,
            @RequestParam String reason) {
        try {
            volService.rejectApplication(applicationId, reason);
            return ResponseEntity.ok("거절되었습니다.");
        } catch (Exception e) {
            logger.error("봉사활동 신청 거절 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body("거절 처리 중 오류가 발생했습니다.");
        }
    }
}
