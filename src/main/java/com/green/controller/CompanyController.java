package com.green.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CproposalVo;
import com.green.domain.PresumeVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.PersonMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Company")
public class CompanyController {
	@Autowired
	private CompanyMapper comMapper;
	
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
		List<CproposalVo> proposalList = comMapper.getProposal();
		//System.out.println(proposalList);
		
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
	
	
}
