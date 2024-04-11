package com.green.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.domain.FaqVo;

@Mapper
public interface FaqMapper {

	List<FaqVo> getList();

	FaqVo getfaq();

	List<FaqVo> getList2();

}
