package com.green.mapper;

import java.util.List;

//github.com/2Shiro/HJSS.git
import org.apache.ibatis.annotations.Mapper;

import com.green.domain.PersonInfoVo;
import com.green.domain.PersonVo;
import com.green.domain.PersonskillVo;
import com.green.domain.PresumeVo;
import com.green.domain.SkillVo;
//github.com/2Shiro/HJSS.git
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

	void insert(PersonVo personVo);

	PersonVo login(String id, String password);
	
	PersonVo getPname(String id);

	void updateResume(PresumeVo vo);

	void updateResumePass(int resume_idx, int status);


}