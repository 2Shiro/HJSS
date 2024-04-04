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
	private String pname;
	private String phone;
	private String address;
	private String birth;
}
