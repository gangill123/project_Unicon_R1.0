package com.Unicon.domain;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BlackConsumerVO {
	private int id;
	private String product_seller_id; // session에서 받아와야함.
    private String member_id; // 문자열로 받아올 임시 필드
    private List<String> memberIdList; // 변환 후 사용할 필드
	private String comment;
	private String reason;
}
