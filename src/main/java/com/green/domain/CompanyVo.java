package com.green.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyVo {
	private String id;
	private String password;
	private int    type;
	private String user_email;
	private String created_date;
	private int    cnumber;
	private String cate;
	private String cname;
	private String com_logo;
	private String crepresentive;
	private String address;
	private String manager_name;
	private String company_managerphone;
	private int    csize;
	private String cyear;
}
