package com.green.company.controller;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.domain.ComVo;
import com.green.company.mapper.ComMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
@Controller
public class CompanyController {
	
	@Autowired
	private ComMapper comMapper;
	
	@RequestMapping("/Company/JoinForm")
	public ModelAndView ComJoinForm() {
		ModelAndView mv = new ModelAndView();
		
		LocalDateTime today = LocalDateTime.now();
		String    now = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		DayOfWeek day = today.getDayOfWeek();
		now    += " " +day;
		mv.addObject("now",now);
		
		mv.setViewName("company/join");
		return mv;
	}
	
	@RequestMapping("/Company/Join")
	public ModelAndView ComJoin(ComVo comVo) {
		
		System.out.println("comVo" +comVo);
		
		ModelAndView mv = new ModelAndView();
		comMapper.insert(comVo);
		
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "company/login";
	}
	
	@PostMapping("/login")
	public ModelAndView login(HttpServletRequest request,ComVo comVo) {
		ModelAndView mv = new ModelAndView();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		comVo= comMapper.login(id,password);
		
		if(comVo != null) {//아이디와 암호 일치시 수행
			HttpSession session = request.getSession();
			session.setAttribute("login", comVo);
			session.setMaxInactiveInterval(60*60); //60분동안 로그인 유지
			
			if(comVo != null) {
				HttpSession session1 = request.getSession();
				session.setAttribute("login", comVo);
				mv.setViewName("redirect:/main");
			}
			 else {//로그인 실패
			mv.setViewName("redirect:/loginForm");
		}
	}
		return  mv;
	
	}
	//logout
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/loginForm";
	}
}