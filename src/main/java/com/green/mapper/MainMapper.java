package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.domain.SkillVo;
import com.green.domain.UserVo;

@Mapper
public interface MainMapper {

	UserVo getUser(String id);

	List<SkillVo> getSkillList();

}
