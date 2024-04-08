package com.green.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CproposalVo {
	
	private int pro_idx;
	
	private String id;
	
	private int post_idx;
	
	private int resume_idx;
	
	private int status;
	
	private String created_at;
}
