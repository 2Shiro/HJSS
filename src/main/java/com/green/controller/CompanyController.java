package com.green.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyVo;
import com.green.domain.CproposalVo;

import com.green.domain.PresumeVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.PersonMapper;

import com.green.domain.JobpostVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.JobPostMapper;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Company")
public class CompanyController {
	
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private JobPostMapper jobPostMapper;
	
	@Autowired
	private PersonMapper personMapper;
	
	//기업의 메인페이지
	@RequestMapping("/Cmain")
	public String cmain() {
		return "/company/cmain";
	}
	
	//특정 기업회원의 등록 공고 관리
	@RequestMapping("/MyPost")
	public String myPost() {
		return "/company/mypost";
	}
	
	//특정 기업회원이 지원 받은 이력서
	//로그인한 회사에 구직자들이 제안한 현황
	@RequestMapping("/MyParticipate") // /Company/MyParticipate
	public ModelAndView getProposal() {

		List<CproposalVo> proposalList = companyMapper.getProposal();
		System.out.println(proposalList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("proposalList", proposalList);
		mv.setViewName("company/myparticipate");
		return mv;
	}
	
	//특정 기업회원의 공고에 대한 인재 추천
	@RequestMapping("/Recommend")
	public String recommend() {
		return "/company/recommend";
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
	
	@RequestMapping("/Mypage")
	public ModelAndView mypage( CompanyVo companyVo ) {
		
		CompanyVo vo  =  companyMapper.getCompany( companyVo );

		log.info("vo : {}", vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/company/mypage");
		return mv;
	}
}
