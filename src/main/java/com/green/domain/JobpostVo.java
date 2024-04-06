package com.green.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class JobpostVo {
	
	public JobpostVo(int post_idx, String id, String post_name, String career, String job_type, String pay, String go_work, String go_home, String deadline, String job_intro, String c_intro, String created_date) {
	    this.post_idx = post_idx;
	    this.id = id;
	    this.post_name = post_name;
	    this.career = career;
	    this.job_type = job_type;
	    this.pay = pay;
	    this.go_work = go_work;
	    this.go_home = go_home;
	    this.deadline = deadline;
	    this.job_intro = job_intro;
	    this.c_intro = c_intro;
	    this.created_date = created_date;
	}
	
	private int post_idx;
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
}
