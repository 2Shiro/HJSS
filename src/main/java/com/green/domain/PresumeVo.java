package com.green.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PresumeVo {
	private int resume_idx;
	private int publish;
	private String id;
	private String profile;
	private String title;
	private String portfolio;
	private String self_intro;
	private String created_at;
}
