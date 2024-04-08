package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.mapper.PersonMapper;
import com.green.domain.PersonVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Person")
public class PersonController {
	
	@Autowired
	private  PersonMapper  personMapper;
	
	@RequestMapping("/MyProposal")
	public ModelAndView getProposal() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/myproposal");
		return mv;
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

	// /Person/Mypage
	@RequestMapping("/Mypage")
	public ModelAndView mypage( PersonVo personVo ) {
		
		PersonVo vo  =  personMapper.getPerson( personVo );
		
		ModelAndView  mv  =  new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/person/mypage");
		return mv;
	}
	
	// /Person/UpdateForm
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm( PersonVo personVo ) {
		
		PersonVo vo = personMapper.getPerson( personVo );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("person/mypageUpdate");
		
		return mv;
	}
	
	// /Person/Update
	@RequestMapping("/Update")
	public ModelAndView update( PersonVo personVo ) {
		
		personMapper.updatePerson( personVo );
		personMapper.updateUser( personVo );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Person/Mypage");
		return mv;
	}
	
	// /Person/DeleteForm
	@RequestMapping("/DeleteForm")
	public ModelAndView deleteForm( PersonVo personVo ) {
		
		PersonVo vo = personMapper.getPerson( personVo );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/person/delete");
		return mv;
	}
	
	// /Person/DeleteForm
	@RequestMapping("/Delete")
	public ModelAndView delete( PersonVo personVo ) {
	   
		personMapper.deletePerson( personVo );
		personMapper.deleteUser( personVo );
		   
		ModelAndView mv = new ModelAndView();
		   
		mv.setViewName("redirect:/main");
		
		return mv;
	}
}
