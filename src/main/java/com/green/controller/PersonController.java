package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Person")
public class PersonController {
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

	@RequestMapping("/Mypage")
	public ModelAndView mypage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/mypage");
		return mv;
	}
}
