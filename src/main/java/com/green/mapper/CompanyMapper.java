package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.domain.CompanyVo;
import com.green.domain.CproposalVo;

@Mapper
public interface CompanyMapper {

	List<CproposalVo> getProposal();

	CompanyVo getCompany(CompanyVo companyVo);

	void updateCompany(CompanyVo companyVo);
	void updateUser(CompanyVo companyVo);

	void deleteCompany(CompanyVo companyVo);
	void deleteUser(CompanyVo companyVo);

}
