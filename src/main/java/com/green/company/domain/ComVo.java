package com.green.company.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ComVo {
	
	String id;
	String password;
	int    type;
	String user_email;
	String created_date;
	int    cnumber;
	String cname;
	String com_logo;
	String crepresentive;
	String address;
	String manager_name;
	String company_managerphone;
	int    csize;
	String cyear;
	
}
