package com.green.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PproposalVo {
	private int post_idx;
	private String post_name;
	private String deadline;
	private int resume_idx;
	private String resume_name;
	private String status;
	private String comment;
	private String cid;
}
