package com.green.domain;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MatchingResultVo {

	// JOB_POST_TB에서 선택된 컬럼
	private String postName;
	private Date deadline;

	// RESUME_TB에서 선택된 컬럼
	private String resumeId; // 실제 필드에 맞게 추가
	private String title; // 예시 필드, 실제 필드에 맞게 추가
	private String self_intro; // 예시 필드, 실제 필드에 맞게 추가

	// PERSON_INFO_TB에서 선택된 컬럼
	private String personId;
	private String pname;
	private String phone;
	private String address;
	private Date birth;

	private String skills;
	
}
