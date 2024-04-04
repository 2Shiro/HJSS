package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CproposalVo;
import com.green.domain.JobpostVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;
import com.green.mapper.ComMapper;
import com.green.mapper.JobPostMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Company")
public class CompanyController {
	@Autowired
	private ComMapper comMapper;
	@Autowired
	private JobPostMapper jobPostMapper;
	
	//로그인한 회사에 구직자들이 제안한 현황
	@RequestMapping("/GetProposal")
	public ModelAndView getProposal() {
		List<CproposalVo> proposalList = comMapper.getProposal();
		System.out.println(proposalList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("proposalList", proposalList);
		mv.setViewName("/company/getproposal");
		return mv;
	}
	
	@RequestMapping("/jobs")
	public ModelAndView jobs(UserVo userVo ) {
		ModelAndView mv = new ModelAndView();
		String id = "";
		id = "cp1";
		userVo.setId(id);
		userVo = jobPostMapper.getUser(id);
		List<JobpostVo> list = jobPostMapper.getpostList(id);
		List<SkillVo> skill = jobPostMapper.getSkillList();
		log.info("list = {}", list);
		mv.addObject("user", userVo);		
		mv.addObject("id", id);		
		mv.addObject("list", list);		
		mv.addObject("skill", skill);		
		mv.setViewName("/company/jobs");
		return mv;
	}
	@RequestMapping("/jobPost")
	public ModelAndView jobPost(JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();
		jobPostMapper.insertpost(postVo);
		mv.setViewName("redirect:/jobs");
		return mv;
	}
	@RequestMapping("/jobDetail")
	public ModelAndView jobDetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/company/jobDetail");
		return mv;
	}
	@RequestMapping("/jobUpdate")
	public ModelAndView jobUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/company/jobUpdate");
		return mv;
	}
	
}
