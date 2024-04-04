package com.green.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class JobpostVo {
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
	private List<PostskillVo> skillList = new ArrayList<>();
}
