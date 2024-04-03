package com.green.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.domain.ComVo;
@Mapper
public interface ComMapper {

	void insert(ComVo comVo);


}
