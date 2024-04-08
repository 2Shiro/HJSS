package com.green.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
public class CompanyInfoVo {
	private String id;
	private int cnumber;
	private String cname;
	private String com_logo;
	private String crepresentive;
	private String address;
	private String manager_name;
	private String company_managerphone;
	private int csize;
	private String cyear;
}
