package com.green.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyProposalVo {
	private int post_idx;
	private String post_name;
	private String pname;
	private int resume_idx;
	private String status;
}
