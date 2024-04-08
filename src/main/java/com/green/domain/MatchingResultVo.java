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
	private String job_intro;
	private int post_idx;
	// RESUME_TB에서 선택된 컬럼
	private String resumeId;
	private String title;
	private String self_intro;
	private String profile;
	private int resume_idx;
	
	// PERSON_INFO_TB에서 선택된 컬럼
	private String personId;
	private String pname;
	private String phone;
	private String address;
	private Date birth;

	private String skills;
	
}
