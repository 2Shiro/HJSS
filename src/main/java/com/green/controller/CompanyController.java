package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Company")
public class CompanyController {
	@RequestMapping("/GetProposal")
	public ModelAndView getProposal() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/company/getproposal");
		return mv;
	}
	
	@RequestMapping("/jobs")
	public ModelAndView jobs() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/company/jobs");
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
