package com.green.company.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ComVo {
	
	int    type;
	String cid;
	String cpassword;
	String cname;
	String com_logo;
	String cate;
	int    cnumber;
	String crepresentive;
	String address;
	String manager_name;
	String manager_tel;
	int    csize;
	int    cyear;
	
}
