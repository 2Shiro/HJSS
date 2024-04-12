package com.green.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecommendPostVo {
	private int post_idx;
	private String cname;
	private String id;
	private String post_name;
	private String career;
	private String job_type;
	private String pay;
	private String go_work;
	private String go_home;
	private String deadline;
	private String job_intro;
	private String c_intro;
	private String created_date;
	private String skills;
}