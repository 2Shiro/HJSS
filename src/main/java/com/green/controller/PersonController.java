package com.green.controller;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.PersonVo;
import com.green.mapper.PersonMapper;

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

	@RequestMapping("/Mypage")
	public ModelAndView mypage( PersonVo personVo ) {
		
		PersonVo vo  =  personMapper.getPerson( personVo );

		log.info("vo : {}", vo);
		
		ModelAndView  mv  =  new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/person/mypage");
		return mv;
	}
	   @RequestMapping("/joinForm")
	   public ModelAndView joinForm() {
	      ModelAndView mv = new ModelAndView();
	         
	      LocalDateTime today = LocalDateTime.now();
	      String    now = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	      DayOfWeek day = today.getDayOfWeek();
	        now+= " " +day;
	       mv.addObject("now",now);
	         
	       mv.setViewName("person/join");
	    return mv;
	      }
	   
	   @RequestMapping("/join")
	   public ModelAndView join(PersonVo personVo) {
	      System.out.println("개인회원" + personVo);
	      
	      personMapper.insert(personVo);
	      
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("redirect:/main");
	      
	      return mv;
	   }
}
