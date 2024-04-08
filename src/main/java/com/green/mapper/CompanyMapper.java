package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.domain.CompanyVo;
import com.green.domain.CproposalVo;
import com.green.domain.JobpostVo;
import com.green.domain.PostSkillVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;

@Mapper
public interface CompanyMapper {

	List<CproposalVo> getProposal();

	CompanyVo getCompany(CompanyVo companyVo);
	
	void insert(CompanyVo comVo);

	CompanyVo login(String id, String password);

	CompanyVo getCompanyById(String id);


	
	UserVo getUser(String id);

	List<JobpostVo> getpostList(String id);

	List<SkillVo> getSkillList();

	void insertpost(JobpostVo postVo);

	List<JobpostVo> getmainpostList();

	JobpostVo getpostName(int post_idx);

	JobpostVo getViewPost(int post_idx);

	List<PostSkillVo> getPostSkill(int post_idx);

	String getSkillName(int skill_idx);
}
