package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.domain.JobpostVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;

@Mapper
public interface JobPostMapper {

	UserVo getUser(String id);

	List<JobpostVo> getpostList(String id);

	List<SkillVo> getSkillList();

	void insertpost(JobpostVo postVo);

}
