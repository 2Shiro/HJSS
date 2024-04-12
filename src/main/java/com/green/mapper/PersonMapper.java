package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.domain.PersonInfoVo;
import com.green.domain.PersonScrapVo;
import com.green.domain.PersonVo;
import com.green.domain.PersonscrapListVo;
import com.green.domain.PersonskillVo;
import com.green.domain.PresumeVo;
import com.green.domain.RecommendPostVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;

@Mapper
public interface PersonMapper {

	List<PresumeVo> getresumeList(PresumeVo vo);

	UserVo getUser(String id);

	PersonVo getPuser(String string);

	PresumeVo getResume(int resume_id);

	PersonInfoVo getInfo(String id);

	List<SkillVo> loadskills(String id);

	void insertResume(PresumeVo vo);

	void insertskills(PersonskillVo skillVo);

	void resumeDelete(PresumeVo presumeVo);

	void deletepersonskills(UserVo userVo);

	void insertProfile(String profile);

	int selectresumeidxmax();

	PersonVo getPerson(PersonVo personVo);

	void updatePerson(PersonVo personVo);
	void updateUser(PersonVo personVo);

	void deletePerson(PersonVo personVo);
	void deleteUser(PersonVo personVo);

	void insert(PersonVo personVo);

	PersonVo login(String id, String password);
	
	PersonVo getPname(String id);

	void updateResume(PresumeVo vo);

	void updateResumePass(int resume_idx, int status);

	List<PresumeVo> getResumeList(String puserId);

	void insertProposal(String id, int post_idx, int resume_idx);

	List<RecommendPostVo> recommendPost(String id);

	void insertScrap(PersonScrapVo scrapvo);

	void deleteScrap(int post_idx);

	int countScrap(String pid, int post_idx);

	List<PersonscrapListVo> getScrapList(PersonscrapListVo scrapVo);

	int count(PresumeVo presume);

	List<PresumeVo> getResumePaing(@Param("id") String id, @Param("offset") int offset, @Param("pageSize") int pageSize);

}
