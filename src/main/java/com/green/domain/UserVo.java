package com.green.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserVo {
	private String id;
	private String password;
	private int type;
	private String user_email;
	private String created_date;
}
