package com.green.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyVo {
	
	public CompanyVo(String id, int cnumber, String cname, String com_logo, String crepresentive, String address,
			String manager_name, String company_managerphone, int csize, String cyear) {
		this.id = id;
		this.cnumber = cnumber;
		this.cname = cname;
		this.com_logo = com_logo;
		this.crepresentive = crepresentive;
		this.address = address;
		this.manager_name = manager_name;
		this.company_managerphone = company_managerphone;
		this.csize = csize;
		this.cyear = cyear;
	}

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
