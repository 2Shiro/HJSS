package com.green.domain;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ComscrapListVo {

	private int cscrap_idx;
	private String cid;
	private int resume_idx;
	
	private String resumeId;
	private String title;
	private String self_intro;
	private String profile;
	
	private String personId;
	private String pname;
	private String phone;
	private String address;
	private Date birth;
	
	private String skills;
}
