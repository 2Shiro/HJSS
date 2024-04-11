package com.green.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyVo;
import com.green.domain.CproposalVo;
import com.green.domain.JobpostVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.JobPostMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Company")
public class CompanyController {
	
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private JobPostMapper jobPostMapper;
	
	//로그인한 회사에 구직자들이 제안한 현황
	@RequestMapping("/GetProposal")
	public ModelAndView getProposal() {
		List<CproposalVo> proposalList = companyMapper.getProposal();
		System.out.println(proposalList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("proposalList", proposalList);
		mv.setViewName("/company/getproposal");
		return mv;
	}
	
	@RequestMapping("/jobs")
	public ModelAndView jobs(UserVo userVo ) {
		ModelAndView mv = new ModelAndView();
		String id = "";
		id = "cp1";
		userVo.setId(id);
		userVo = jobPostMapper.getUser(id);
		List<JobpostVo> list = jobPostMapper.getpostList(id);
		List<SkillVo> skill = jobPostMapper.getSkillList();
		log.info("list = {}", list);
		mv.addObject("user", userVo);		
		mv.addObject("id", id);		
		mv.addObject("list", list);		
		mv.addObject("skill", skill);		
		mv.setViewName("/company/jobs");
		return mv;
	}
	@RequestMapping("/jobPost")
	public ModelAndView jobPost(JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();
		jobPostMapper.insertpost(postVo);
		mv.setViewName("redirect:/jobs");
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
	
	@RequestMapping("/Mypage")
	public ModelAndView mypage( CompanyVo companyVo ) {
		
		CompanyVo vo  =  companyMapper.getCompany( companyVo );

		log.info("vo : {}", vo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/company/mypage");
		return mv;
	}
	//기업회원가입폼
	@RequestMapping("/JoinForm")
	public ModelAndView CompanyJoinForm() {
		ModelAndView mv = new ModelAndView();
		
		LocalDateTime today = LocalDateTime.now();
		String    now = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		DayOfWeek day = today.getDayOfWeek();
		now    += " " +day;
		mv.addObject("now",now);
		
		mv.setViewName("company/join");
		return mv;
	}
	//기업회원가입
	@RequestMapping("/Join")
	public ModelAndView ComJoin(CompanyVo companyVo) {
	
		System.out.println("comVo" +companyVo);
		
		ModelAndView mv = new ModelAndView();
		companyMapper.insert(companyVo);
		
		mv.setViewName("company/login");
		return mv;
	}
	//기업로그인폼
	@RequestMapping("/loginForm")
	public String companyLoginForm() {
		return "company/login";
	}

	//기업로그인
	@PostMapping("/login")
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
	   
}
