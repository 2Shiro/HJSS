package com.green.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MainPageVo {
	private int post_idx;
	private String id;
	private String post_name;
	private String career;
	private String job_type;
	private String com_logo;
}
