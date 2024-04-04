package com.green.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
public class CproposalVo {
	
	private int pro_idx;
	
	private String id;
	
	private int post_id;
	
	private int resume_id;
	
	private int status;
	
	private String created_at;
}
