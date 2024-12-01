package com.Unicon.controller;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.Unicon.domain.NoticeFileVO;
import com.Unicon.domain.NoticeVO;
import com.Unicon.service.NoticeFileService;
import com.Unicon.service.NoticeService;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@Controller
@RequestMapping("/notice")
public class NoticeController {
    
    private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
    
    @Inject
    private NoticeService noService;
    
    @Inject
    private NoticeFileService fileService;
    
    // ======= 사용자 뷰 매핑 =======
    // http://localhost:8088/notice
    
    // 사용자 공지사항 목록
    @GetMapping("")
    public String userList(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "12") int size,
            @RequestParam(value = "category", required = false) String category,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "startDate", required = false) String startDate,
            @RequestParam(value = "endDate", required = false) String endDate,
            Model model) throws Exception {
        
        Map<String, Object> result = noService.getNoticeList(page, size, category, keyword, startDate, endDate);
        
        model.addAttribute("notices", result.get("boards"));
        model.addAttribute("totalCount", result.get("totalCount"));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("category", category);
        model.addAttribute("keyword", keyword);
        
        return "notice/list"; 
    }
    
    @GetMapping("/{noId}")
    public String userDetail(@PathVariable Long noId, Model model) throws Exception {
        try {
            // 현재 공지사항 조회
            NoticeVO notice = noService.getNotice(noId);
            
            // 이전글/다음글 조회
            NoticeVO prevNotice = noService.getPrevNotice(noId);
            NoticeVO nextNotice = noService.getNextNotice(noId);
            
            // 첨부파일 조회
            List<NoticeFileVO> files = fileService.getFilesByNoticeId(noId);
            notice.setFiles(files);
            
            // 모델에 데이터 추가
            model.addAttribute("notice", notice);
            model.addAttribute("prevNotice", prevNotice);
            model.addAttribute("nextNotice", nextNotice);
            
            return "notice/detail";
        } catch (Exception e) {
            // 예외 처리
            logger.error("공지사항 조회 중 오류 발생", e);
            return "redirect:/notice";
        }
    }
    
    // ======= 관리자 뷰 매핑 =======
    // http://localhost:8088/notice/manage
    
    // 관리자 공지사항 목록
    @GetMapping("/manage")
    public String adminList(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            @RequestParam(value = "category", required = false) String category,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "startDate", required = false) String startDate,
            @RequestParam(value = "endDate", required = false) String endDate, 
            Model model) throws Exception {
            
        // 1부터 시작하는 페이지 번호를 0부터 시작하는 인덱스로 변환
    	Map<String, Object> result = noService.getNoticeList(page, size, category, keyword, startDate, endDate);
        
        List<NoticeVO> notices = (List<NoticeVO>) result.get("boards");
        int totalCount = (Integer) result.get("totalCount");
        
        // 페이징 처리를 위한 계산
        int totalPages = (int) Math.ceil((double) totalCount / size);
        int startPage = ((page - 1) / 10) * 10 + 1;
        int endPage = Math.min(startPage + 9, totalPages);
        
        model.addAttribute("boards", notices);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("category", category);
        model.addAttribute("keyword", keyword);
        
        return "notice/manage/list";
    }
    
    @GetMapping("/manage/{noId}")
    public String adminDetail(@PathVariable Long noId, Model model) throws Exception {
        NoticeVO notice = noService.getNotice(noId);
        List<NoticeFileVO> files = fileService.getFilesByNoticeId(noId);
        notice.setFiles(files);
        
        // 이전글, 다음글 정보 조회
        NoticeVO prevNotice = noService.getPrevNotice(noId);
        NoticeVO nextNotice = noService.getNextNotice(noId);
        
        model.addAttribute("notice", notice);
        model.addAttribute("prevNotice", prevNotice);
        model.addAttribute("nextNotice", nextNotice);
        
        return "notice/manage/detail";
    }
    
    @GetMapping("/manage/form")
    public String adminForm(
            @RequestParam(value = "noId", required = false) Long noId,
            Model model) throws Exception {
        if (noId != null) {
            model.addAttribute("notice", noService.getNotice(noId));
        }
        return "notice/manage/form"; 
    }
    
    @PostMapping("/manage/submit")
    public ResponseEntity<?> submitNotice(
        @RequestParam(value = "noId", required = false) Long noId,
        @RequestParam("noWriter") String noWriter,
        @RequestParam("noTitle") String noTitle,
        @RequestParam("noContent") String noContent,
        @RequestParam("noCategory") String noCategory,
        @RequestParam(value = "important", defaultValue = "false") boolean important,
        @RequestParam(value = "noEmail", defaultValue = "false") boolean noEmail,
        @RequestParam(value = "status", required = false, defaultValue = "active") String status,
        @RequestPart(value = "thumbnail", required = false) MultipartFile thumbnail,
        HttpServletRequest request) {
        
        try {
            logger.info("공지사항 등록 시작 - Writer: {}, Title: {}", noWriter, noTitle);
            
            NoticeVO noVO = new NoticeVO();
            noVO.setNoId(noId);
            noVO.setNoWriter(noWriter);
            noVO.setNoTitle(noTitle);
            noVO.setNoContent(noContent);
            noVO.setNoCategory(noCategory);
            noVO.setImportant(important);
            noVO.setNoEmail(noEmail);
            noVO.setStatus(status);
            
            // 썸네일 처리
            if (thumbnail != null && !thumbnail.isEmpty()) {
                logger.info("썸네일 처리 시작 - Original filename: {}", thumbnail.getOriginalFilename());
                
                // 파일 저장 경로 설정
                String uploadDir = request.getServletContext().getRealPath("/uploads/thumbnails");
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                    logger.info("업로드 디렉토리 생성: {}", uploadDir);
                }
                
                // 파일명 생성
                String originalFilename = thumbnail.getOriginalFilename();
                String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
                String storedFileName = "thumb_" + UUID.randomUUID().toString() + fileExtension;
                
                // 파일 저장
                File destFile = new File(dir, storedFileName);
                thumbnail.transferTo(destFile);
                logger.info("썸네일 파일 저장 완료: {}", destFile.getAbsolutePath());
                
                // 썸네일 URL 설정
                String thumbnailUrl = "/uploads/thumbnails/" + storedFileName;
                noVO.setNoThumb(thumbnailUrl);
                logger.info("썸네일 URL 설정: {}", thumbnailUrl);
                
                // 기존 썸네일 삭제 (수정 시)
                if (noId != null) {
                    try {
                        fileService.deleteFilesByType(noId, "THUMBNAIL");
                        logger.info("기존 썸네일 삭제 완료");
                    } catch (Exception e) {
                        logger.warn("기존 썸네일 삭제 실패", e);
                    }
                }
            }
            
            // 공지사항 저장
            if (noId == null) {
                logger.info("신규 공지사항 등록");
                noService.registerNotice(noVO);
                
                // 썸네일 파일 정보 저장
                if (thumbnail != null && !thumbnail.isEmpty()) {
                    NoticeFileVO fileVO = new NoticeFileVO();
                    fileVO.setNoId(noVO.getNoId());
                    fileVO.setOriginalName(thumbnail.getOriginalFilename());
                    fileVO.setStoredName(noVO.getNoThumb().substring(noVO.getNoThumb().lastIndexOf("/") + 1));
                    fileVO.setFilePath(request.getServletContext().getRealPath("/uploads/thumbnails"));
                    fileVO.setFileSize(thumbnail.getSize());
                    fileVO.setFileType("THUMBNAIL");
                    
                    fileService.saveFile(fileVO);
                    logger.info("썸네일 파일 정보 저장 완료");
                }
            } else {
                logger.info("기존 공지사항 수정 - ID: {}", noId);
                noService.updateNotice(noVO);
                
                // 썸네일 파일 정보 저장
                if (thumbnail != null && !thumbnail.isEmpty()) {
                    NoticeFileVO fileVO = new NoticeFileVO();
                    fileVO.setNoId(noId);
                    fileVO.setOriginalName(thumbnail.getOriginalFilename());
                    fileVO.setStoredName(noVO.getNoThumb().substring(noVO.getNoThumb().lastIndexOf("/") + 1));
                    fileVO.setFilePath(request.getServletContext().getRealPath("/uploads/thumbnails"));
                    fileVO.setFileSize(thumbnail.getSize());
                    fileVO.setFileType("THUMBNAIL");
                    
                    fileService.saveFile(fileVO);
                    logger.info("썸네일 파일 정보 저장 완료");
                }
            }
            
            logger.info("공지사항 저장 완료");
            return ResponseEntity.ok().body("/notice/manage");
            
        } catch (Exception e) {
            logger.error("공지사항 저장 중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body(e.getMessage());
        }
    }

    @PostMapping("/manage/update/{noId}")
    public String updateAndRedirect(
            @PathVariable("noId") Long noId,
            @RequestParam("noWriter") String noWriter,
            @RequestParam("noTitle") String noTitle,
            @RequestParam("noContent") String noContent,
            @RequestParam("noCategory") String noCategory,
            @RequestParam(value = "important", defaultValue = "false") boolean important,
            @RequestParam(value = "noEmail", defaultValue = "false") boolean noEmail,
            @RequestPart(value = "thumbnail", required = false) MultipartFile thumbnail) {
        try {
            NoticeVO noVO = new NoticeVO();
            noVO.setNoId(noId);
            noVO.setNoWriter(noWriter);
            noVO.setNoTitle(noTitle);
            noVO.setNoContent(noContent);
            noVO.setNoCategory(noCategory);
            noVO.setImportant(important);
            noVO.setNoEmail(noEmail);
            
            if (noId == null) {
                // 신규 등록
                noService.registerNotice(noVO);
            } else {
                // 수정
                noService.updateNotice(noVO);
            }
            
            // 파일 처리
            if (thumbnail != null && !thumbnail.isEmpty()) {
                fileService.deleteFilesByType(noId, "THUMBNAIL");
                NoticeFileVO thumbnailFile = fileService.uploadFile(thumbnail, "THUMBNAIL");
                thumbnailFile.setNoId(noId);
                fileService.saveFile(thumbnailFile);
            }
            
            return "redirect:/notice/manage";
            
        } catch (Exception e) {
            logger.error("공지사항 저장 실패", e);
            return "redirect:/notice/manage/form?noId=" + noId;
        }
    }
    
    // ======= REST API 엔드포인트 =======
    
    @PostMapping("/api")
    @ResponseBody
    public ResponseEntity<String> register(
    		@RequestParam("noWriter") String noWriter,
            @RequestParam("noTitle") String noTitle,
            @RequestParam("noContent") String noContent,
            @RequestParam("noCategory") String noCategory,
            @RequestParam(value = "important", defaultValue = "false") boolean important,
            @RequestParam(value = "noEmail", defaultValue = "false") boolean noEmail,
            @RequestPart(value = "thumbnail", required = false) MultipartFile thumbnail) {
        try {
            // 1. 공지사항 기본 정보 저장
            NoticeVO noVO = new NoticeVO();
            noVO.setNoWriter(noWriter);
            noVO.setNoTitle(noTitle);
            noVO.setNoContent(noContent);
            noVO.setNoCategory(noCategory);
            noVO.setImportant(important);
            noVO.setNoEmail(noEmail);
            
            noService.registerNotice(noVO);
            
            // 2. 파일 처리
            if (thumbnail != null && !thumbnail.isEmpty()) {
                NoticeFileVO thumbnailFile = fileService.uploadFile(thumbnail, "THUMBNAIL");
                thumbnailFile.setNoId(noVO.getNoId());
                fileService.saveFile(thumbnailFile);
            }
            
            return new ResponseEntity<>("등록 성공", HttpStatus.CREATED);
        } catch (Exception e) {
            logger.error("공지사항 등록 실패", e);
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PostMapping("/api/upload")
    @ResponseBody
    public ResponseEntity<String> uploadImage(
            @RequestParam("file") MultipartFile file,
            HttpServletRequest request) {
        try {
            if (file.isEmpty()) {
                return ResponseEntity.badRequest().body("파일이 비어있습니다.");
            }

            // 파일 확장자 검사
            String originalFilename = file.getOriginalFilename();
            String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1).toLowerCase();
            if (!extension.matches("jpg|jpeg|png|gif")) {
                return ResponseEntity.badRequest().body("지원하지 않는 파일 형식입니다.");
            }

            // 저장할 파일명 생성
            String storedFileName = "image_" + UUID.randomUUID().toString() + "." + extension;
            
            // 이미지 저장 경로 설정
            String uploadDir = request.getServletContext().getRealPath("/uploads/images");
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            
            // 파일 저장
            File destFile = new File(dir, storedFileName);
            file.transferTo(destFile);
            
            // 이미지 URL 반환
            String imageUrl = "/uploads/images/" + storedFileName;
            logger.info("이미지 업로드 완료: {}", imageUrl);

            return ResponseEntity.ok(imageUrl);
            
        } catch (Exception e) {
            logger.error("이미지 업로드 실패", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body("이미지 업로드 실패: " + e.getMessage());
        }
    }
    
    @PostMapping("/api/upload/thumbnail")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> uploadThumbnail(@RequestParam("thumbnail") MultipartFile file) {
        try {
            if (file.isEmpty()) {
                return new ResponseEntity<>(
                    Map.of("error", "파일이 비어있습니다."), 
                    HttpStatus.BAD_REQUEST
                );
            }
            
            NoticeFileVO thumbnailFile = fileService.uploadFile(file, "THUMBNAIL");
            String thumbnailUrl = "/uploads/thumbnails/" + thumbnailFile.getStoredName();
            
            Map<String, Object> response = new HashMap<>();
            response.put("url", thumbnailUrl);
            response.put("originalName", file.getOriginalFilename());
            response.put("storedName", thumbnailFile.getStoredName());
            
            logger.info("썸네일 업로드 성공 - URL: {}", thumbnailUrl);
            return new ResponseEntity<>(response, HttpStatus.OK);
            
        } catch (Exception e) {
            logger.error("썸네일 업로드 실패", e);
            return new ResponseEntity<>(
                Map.of("error", "썸네일 업로드 실패: " + e.getMessage()),
                HttpStatus.INTERNAL_SERVER_ERROR
            );
        }
    }
    
    // 임시저장 목록 조회
    @GetMapping("/manage/drafts")
    @ResponseBody
    public ResponseEntity<List<NoticeVO>> getDrafts() {
        try {
            List<NoticeVO> drafts = noService.getDraftList();
            return ResponseEntity.ok(drafts);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    // 임시저장 글 조회
    @GetMapping("/manage/draft/{noId}")
    @ResponseBody
    public ResponseEntity<NoticeVO> getDraft(@PathVariable Long noId) {
        try {
            NoticeVO draft = noService.getDraft(noId);
            return ResponseEntity.ok(draft);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
    
    @PostMapping("/api/{noId}/update")
    @ResponseBody
    public ResponseEntity<String> update(
            @PathVariable("noId") Long noId,
            @RequestParam("noWriter") String noWriter,
            @RequestParam("noTitle") String noTitle,
            @RequestParam("noContent") String noContent,
            @RequestParam("noCategory") String noCategory,
            @RequestParam(value = "important", defaultValue = "false") boolean important,
            @RequestParam(value = "noEmail", defaultValue = "false") boolean noEmail,
            @RequestPart(value = "thumbnail", required = false) MultipartFile thumbnail) {
        try {
            NoticeVO noVO = new NoticeVO();
            noVO.setNoId(noId);
            noVO.setNoWriter(noWriter);
            noVO.setNoTitle(noTitle);
            noVO.setNoContent(noContent);
            noVO.setNoCategory(noCategory);
            noVO.setImportant(important);
            noVO.setNoEmail(noEmail);
            
            noService.updateNotice(noVO);
            
            if (thumbnail != null && !thumbnail.isEmpty()) {
                fileService.deleteFilesByType(noId, "THUMBNAIL");
                NoticeFileVO thumbnailFile = fileService.uploadFile(thumbnail, "THUMBNAIL");
                thumbnailFile.setNoId(noId);
                fileService.saveFile(thumbnailFile);
            }
            
            return new ResponseEntity<>("수정 성공", HttpStatus.OK);
        } catch (Exception e) {
            logger.error("공지사항 수정 실패", e);
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/api/delete/{noId}")  // URL 패턴 변경
    @ResponseBody
    public ResponseEntity<String> delete(@PathVariable("noId") Long noId) {
        try {
            // 1. 공지사항 존재 여부 확인
            NoticeVO notice = noService.getNotice(noId);
            if (notice == null) {
                return new ResponseEntity<>("존재하지 않는 공지사항입니다.", HttpStatus.NOT_FOUND);
            }
            
            // 2. 파일 삭제 후 공지사항 삭제
            fileService.deleteFilesByNoticeId(noId);
            noService.deleteNotice(noId);
            
            return new ResponseEntity<>("삭제 성공", HttpStatus.OK);
        } catch (Exception e) {
            logger.error("공지사항 삭제 실패", e);
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @GetMapping("/api/more")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getMoreNotices(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(required = false) String category,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) String startDate,
            @RequestParam(required = false) String endDate) {
    	
    	
        try {
            int size = 16; // 한 페이지당 16개의 게시글
            Map<String, Object> result = noService.getNoticeList(page, size, category, keyword, startDate, endDate);
            List<NoticeVO> notices = (List<NoticeVO>) result.get("boards");
            int totalCount = (Integer) result.get("totalCount");
            
            Map<String, Object> response = new HashMap<>();
            response.put("notices", notices);
            response.put("hasNext", (page * size) < totalCount);
            
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            logger.error("공지사항 추가 로딩 중 오류 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}