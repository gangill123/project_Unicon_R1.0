package com.Unicon.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NewsVO {
	private int news_id;
	private String news_subject;
	private String news_content;
	private String news_place;
	private String news_startdate;
	private String news_enddate;
	private String news_resion;
	private String news_src;
	private MultipartFile news_file;
	private String news_ins;
	private String news_att;
	
}
