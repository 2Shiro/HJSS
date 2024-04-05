package com.green.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.domain.PersonVo;
import com.green.domain.PresumeVo;
import com.green.domain.UserVo;

@Mapper
public interface PersonMapper {

	PresumeVo getResume(int resume_id);

	UserVo getUser(String id);

	PersonVo getPuser(String string);
	
	PersonVo getPerson(PersonVo personVo);
	
	void insert(PersonVo personVo);
	   
	PersonVo login(String id, String password);

	void updateResumePass(int resume_idx, int status);

	PersonVo getPname(String id);

}