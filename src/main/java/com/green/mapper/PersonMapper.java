package com.green.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.domain.PersonVo;

@Mapper
public interface PersonMapper {

	PersonVo getPerson(PersonVo personVo);

	void updatePerson(PersonVo personVo);
	void updateUser(PersonVo personVo);

	void deletePerson(PersonVo personVo);
	void deleteUser(PersonVo personVo);

}
