package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.domain.CompanyInfoVo;
import com.green.domain.CproposalVo;
import com.green.domain.JobpostVo;
import com.green.domain.PostskillVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;

@Mapper
public interface CompanyMapper {

	List<CproposalVo> getProposal();

	List<JobpostVo> getpostList(JobpostVo vo);

	void insertpost(JobpostVo postVo);

	JobpostVo viewPost(JobpostVo postVo);

	void updatePost(JobpostVo postVo);

	void postDelete(JobpostVo postVo);

	CompanyInfoVo getInfo(String id);

	void insertskills(PostskillVo postSkill);

	int selectpostidxmax();

	void deletepostskills(JobpostVo postVo);

	List<SkillVo> loadskills(int post_idx);

}
