package com.green.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyVo;
import com.green.domain.FaqVo;
import com.green.domain.PersonVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.FaqMapper;
import com.green.mapper.PersonMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	
	@Autowired
	private PersonMapper personMapper;
	
	@Autowired
	private FaqMapper faqMapper;

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
	

	//logout
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "home";
	}
	
	@RequestMapping("/FAQ")
	public ModelAndView faq(FaqVo faqVo) {
		ModelAndView mv = new ModelAndView();
		
		List <FaqVo> faqList1 = faqMapper.getList();
		mv.addObject("faqList", faqList1);
		
		List <FaqVo> faqList2 = faqMapper.getList2();
		mv.addObject("faqList2", faqList2);
						
		mv.setViewName("faq");
		return mv;
	}
}
