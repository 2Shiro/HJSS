package com.green.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.PresumeVo;
import com.green.domain.PersonVo;
import com.green.domain.UserVo;
import com.green.mapper.PersonMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Person")
public class PersonController {
	@Autowired
	private PersonMapper personMapper;
	
	//구직자의 메인페이지
	@RequestMapping("/Pmain")
	public String pmain() {
		
		return "/person/pmain";
	}
	
	//특정 구직자가 등록한 이력서 관리
	@RequestMapping("/MyResume")
	public String myResume() {
		return "/person/myresume";
	}
	
	//특정 구직자가 지원한 공고
	@RequestMapping("/MyProposal")
	public ModelAndView getProposal() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/myproposal");
		return mv;
	}
	
	@RequestMapping("/GetResume")
	public ModelAndView getResume(PresumeVo presume) {
		int resume_idx = presume.getResume_idx();
		//System.out.println(resume_idx);
		PresumeVo presumeVo = personMapper.getResume(resume_idx);
		//System.out.println("이력서" + presumeVo);
		PersonVo psuerVo = personMapper.getPuser(presumeVo.getId());
		UserVo userVo = personMapper.getUser(presumeVo.getId());
		//System.out.println("유저: " + userVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("presumeVo", presumeVo);
		mv.addObject("psuerVo", psuerVo);
		mv.addObject("userVo", userVo);
		mv.setViewName("/person/popresume");
		return mv;
	}
	
	@RequestMapping("/Pass")
	public String pass(@RequestParam(value="resume_idx") int resume_idx, @RequestParam(value="status") int status) {
		System.out.println("상태" + resume_idx);
		personMapper.updateResumePass(resume_idx, status);
		
		System.out.println(status);
		
		return "/person/updateok";
	}
	
	//특정 구직자의 추천 공고
	@RequestMapping("/Recommend")
	public String recommend() {
		return "/person/recommend";
	}

	@RequestMapping("/resume")
	public ModelAndView resume() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/resume");
		return mv;
	}
	@RequestMapping("/resumeDetail")
	public ModelAndView resumeDetail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/resumeDetail");
		return mv;
	}
	@RequestMapping("/resumeUpdate")
	public ModelAndView resumeUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/resumeUpdate");
		return mv;
	}

	@RequestMapping("/Mypage")
	public ModelAndView mypage( PersonVo personVo ) {
		
		PersonVo vo  =  personMapper.getPerson( personVo );

		log.info("vo : {}", vo);
		
		ModelAndView  mv  =  new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/person/mypage");
		return mv;

	}
}
