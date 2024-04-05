package com.green.controller;

import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyVo;
import com.green.domain.PersonVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.PersonMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private PersonMapper personMapper;

	@RequestMapping("/")
	public String home() {
		return "home";
	}

	@RequestMapping("/main")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		return mv;
	}
	
	//기업로그인폼
	@RequestMapping("/Company/loginForm")
	public String companyLoginForm() {
		return "company/login";
	}
	//기업로그인
	@PostMapping("/Company/login")
	public ModelAndView companyLogin(HttpServletRequest request, CompanyVo comVo,
	                           HttpServletResponse response) throws IOException {
	ModelAndView mv = new ModelAndView();
	      
	String id = request.getParameter("id");
	String password = request.getParameter("password");

     comVo= companyMapper.login(id,password);
	      
	 if(comVo != null) {//아이디와 암호 일치시 수행
	 HttpSession session = request.getSession();
	 session.setMaxInactiveInterval(60*60); //60분동안 로그인 유지	      
	 session.setAttribute("login", comVo);            
	 mv.setViewName("redirect:/main");
	            
	 }
	else {//로그인 실패시
	      PrintWriter out = response.getWriter();
	      response.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html; charset=UTF-8;");
	      out.println("<script> alert('Please check your ID password');");
	      out.println("history.go(-1); </script>"); 
	      out.close();             
	      mv.setViewName("redirect:/Company/loginForm");
	      }	   
	      return  mv;	   
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
	 mv.setViewName("redirect:/main");
	            
	 }
	else {//로그인 실패시
	      PrintWriter out = response.getWriter();
	      response.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html; charset=UTF-8;");
	      out.println("<script> alert('Please check your ID password');");
	      out.println("history.go(-1); </script>"); 
	      out.close();             
	      mv.setViewName("redirect:/loginForm");
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
