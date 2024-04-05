package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping("/")
	public String home() {
		return "home";
	}

//	@RequestMapping("/main")
//	public ModelAndView main() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("main");
//		return mv;
//	}
	
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
