package com.Unicon.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PostVO {
	
	private String post_id;				// 게시글 아이디
	private String member_id;			// 유저아이디
	private String post_title;			// 제목
	private String post_content;		// 내용
	private Timestamp post_date;		// 생성 일자
	private String post_type;			// 게시물 종류
	private int pet_code;				// 동물분류코드
	private String pet_etc_breed;		// 기타동물품종
	private String post_pet_place;		// 실종/발견 장소
	private String post_pet_date;		// 실종/발견 일자
	
//	private MultipartFile image_file1;			// 이미지 파일1
//	private MultipartFile image_file2;			// 이미지 파일2
//	private MultipartFile image_file3;			// 이미지 파일3
//	private MultipartFile image_file4;			// 이미지 파일4
	
	private List<ImageVO> post_images;			// 이미지 테이블
	private List<MultipartFile> upload_images;	// 멀티파트 이미지(실제X)
	private List<CommentVO> post_comments;		// 댓글 테이블
	private List<PostLikeVO> post_likes;		// 게시물 좋아요 테이블
	
//	private List<ImageVO> post_images;	// 게시물 이미지
	
	private JypMemberVO jypMemberVO;			// 임시 멤버 테이블
	private CategoryDataVO categoryDataVO;		// 카테고리 테이블
	
}
