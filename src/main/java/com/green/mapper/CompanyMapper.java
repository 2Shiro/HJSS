package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.domain.CompanyVo;
import com.green.domain.CproposalVo;

@Mapper
public interface CompanyMapper {

	List<CproposalVo> getProposal();

	CompanyVo getCompany(CompanyVo companyVo);


}
