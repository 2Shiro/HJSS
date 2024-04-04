package com.green.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//@Data : @Getter, @Setter, @ToString, 
//@EqualsAndHashCode, @RequiedArgsConstructor
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PersonVo {
	private String id;
	private String password;
	private int type;
	private String user_email;
	private String created_date;
	private String pname;
	private String phone;
	private String address;
	private String birth;
}
