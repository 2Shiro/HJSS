package com.green.domain;
//post_skill_tb 접근

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostSkillVo {
	private int csno;
	private int post_idx;
	private int skill_idx;
}
