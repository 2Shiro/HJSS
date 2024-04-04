package com.green.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.green.domain.PersonVo;

@Mapper
public interface PersonMapper {

	PersonVo getPerson(PersonVo personVo);

}
