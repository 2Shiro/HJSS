package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.domain.CompanyInfoVo;
import com.green.domain.CompanyVo;
import com.green.domain.ComscrapListVo;
import com.green.domain.ComscrapVo;
import com.green.domain.CproposalVo;
import com.green.domain.JobpostVo;
import com.green.domain.MatchingResultVo;
import com.green.domain.PostskillVo;
import com.green.domain.SkillVo;

@Mapper
public interface CompanyMapper {

	List<CproposalVo> getProposal();

	CompanyVo getCompanyById(String id);

	CompanyVo getCompany(String id);

	void insert(CompanyVo comVo);

	CompanyVo login(String id, String password);
 
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

	JobpostVo getpostName(int post_idx);

	List<JobpostVo> getmainpostList();

	List<MatchingResultVo> recommended(int post_idx);

	void insertScrap(ComscrapVo scrapvo);

	void deleteScrap(int resume_idx);

	int countScrap(String arg0, int arg1);

	List<ComscrapListVo> getScrapList(ComscrapListVo scrapVo);

}
