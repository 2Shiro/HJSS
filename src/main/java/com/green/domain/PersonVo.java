package com.green.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PersonVo {

	private String id;
	private String password;
	private String pname;
	private String phone;
	private String user_email;
	private String address;
	private String birth;
	private String created_date;
	private int type;

	public PersonVo(String id, String pname, String phone, String address, String birth) {
		this.id = id;
		this.pname = pname;
		this.phone = phone;
		this.address = address;
		this.birth = birth;
	}


}
