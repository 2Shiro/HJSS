package com.green.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchVo {
	private String id;
	private int resume_idx;
	private String profile;
	private String title;
	private String portfolio;
	private int  publish;
	private String self_intro;
	private String address;
	private String skills;
}
