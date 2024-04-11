package com.green.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.JobpostVo;
import com.green.domain.PersonVo;
import com.green.mapper.JobPostMapper;
import com.green.mapper.PersonMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Person")
public class PersonController {
	
	@Autowired
	private  PersonMapper  personMapper;
	
	@Autowired
	private JobPostMapper jobpostMapper;
	
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
	      mv.setViewName("person/login");
	      
	      return mv;
	   }
	   
		//개인회원 로그인폼
		@RequestMapping("/loginForm")
		public  String  loginForm() {
		return "person/login";
		}
		
		//개인회원 로그인
		@PostMapping("/login")
		public ModelAndView login(HttpServletRequest request, PersonVo personVo,
		                           HttpServletResponse response) throws IOException {
		ModelAndView mv = new ModelAndView();
		      
		String id = request.getParameter("id");
		String password = request.getParameter("password");

	     personVo= personMapper.login(id,password);
		      
		 if(personVo != null) {//아이디와 암호 일치시 수행
		 HttpSession session = request.getSession();
		 session.setMaxInactiveInterval(60*60); //60분동안 로그인 유지	      
		 session.setAttribute("login", personVo);            
		 mv.setViewName("main");
		            
		 }
		else {//로그인 실패시
		      PrintWriter out = response.getWriter();
		      response.setCharacterEncoding("UTF-8");
		      response.setContentType("text/html; charset=UTF-8;");
		      out.println("<script> alert('Please check your ID password');");
		      out.println("history.go(-1); </script>"); 
		      out.close();             
		      mv.setViewName("redirect:/Person/loginForm");
		      }	   
		      return  mv;	   
		   }

	   
	   
	   
}
