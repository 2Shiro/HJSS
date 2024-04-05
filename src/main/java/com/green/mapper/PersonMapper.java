package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.domain.PersonInfoVo;
import com.green.domain.PersonskillVo;
import com.green.domain.ResumeVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;

@Mapper
public interface PersonMapper {

	List<ResumeVo> getresumeList(ResumeVo vo);

	ResumeVo viewResume(ResumeVo resumeVo);

	PersonInfoVo getInfo(String id);

	List<SkillVo> loadskills(String id);

	void insertResume(ResumeVo vo);

	void insertskills(PersonskillVo skillVo);

	void resumeDelete(ResumeVo resumeVo);

	void deletepersonskills(UserVo userVo);

	void insertProfile(String profile);

	int selectresumeidxmax();

}
