package com.green.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
public class PersonInfoVo {
	private String id;
	private String pname;
	private String phone;
	private String address;
	private String birth;
}
