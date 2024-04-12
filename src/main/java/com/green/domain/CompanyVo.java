package com.green.domain;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyVo {
	@NotBlank(message = "공백없이 입력해주세요")
	private String id;
	
	@NotBlank(message = "공백없이 입력해주세요")
	@Size(min=8,max=20,message="비밀번호는 8자 이상 20자 이하로 입력해주세요.")
	private String password;
	private int    type;
	private String user_email;
	private String created_date;
	private int    cnumber;


	private String cname;
	private String com_logo;
	private String crepresentive;
	private String address;
	private String manager_name;
	private String company_managerphone;
	private int csize;
	private String cyear;
	
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

}
