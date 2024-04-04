package com.green.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVo {
	private String id;
	private String password;
	private int type;
	private String user_email;
	private String created_date;
}
