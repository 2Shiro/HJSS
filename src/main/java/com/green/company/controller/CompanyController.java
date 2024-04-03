package com.green.company.controller;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.domain.ComVo;
import com.green.company.mapper.ComMapper;
@Controller
public class CompanyController {
	
	@Autowired
	private ComMapper comMapper;
	
	@RequestMapping("/Company/JoinForm")
	public ModelAndView ComJoinForm() {
		ModelAndView mv = new ModelAndView();
		
		LocalDateTime today = LocalDateTime.now();
		String    now = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		DayOfWeek day = today.getDayOfWeek();
		now    += " " +day;
		mv.addObject("now",now);
		
		mv.setViewName("company/join");
		return mv;
	}
	
	@RequestMapping("/Company/Join")
	public ModelAndView ComJoin(ComVo comVo) {
		ModelAndView mv = new ModelAndView();
		
		comMapper.insert(comVo);
		
		mv.setViewName("main");
		return mv;
	}
	

}
