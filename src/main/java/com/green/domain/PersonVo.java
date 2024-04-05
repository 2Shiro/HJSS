package com.green.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PersonVo {
	private String id;
	private String pname;
	private String phone;
	private String address;
	private String birth;
}
