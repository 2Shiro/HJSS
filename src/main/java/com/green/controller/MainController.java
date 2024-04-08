package com.green.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyVo;
import com.green.domain.JobpostVo;
import com.green.domain.MainPageVo;
import com.green.domain.PersonVo;
import com.green.domain.PostskillVo;
import com.green.domain.PresumeVo;
import com.green.domain.SkillVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.PersonMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {
	@Autowired
	private CompanyMapper companyMapper;

	@Autowired
	private PersonMapper personMapper;

	//메인페이지들
	@RequestMapping("/")
	public ModelAndView cmain() {
		//JOB_POST_TB 리스트
		List<MainPageVo> mainPageList = new ArrayList<>();
		List<JobpostVo> jobList = companyMapper.getmainpostList();
		System.out.println("jobList = " + jobList);
		
		//기업 이미지 객체리스트 -> companyVo
		List<CompanyVo> companyVo = new ArrayList<>();
		for (int i = 0; i < jobList.size(); i++) {
			String id = jobList.get(i).getId();
			//System.out.println(id);
			CompanyVo vo = companyMapper.getCompanyById(id);
			companyVo.add(new CompanyVo(vo.getId(), 
										vo.getCnumber(), 
										vo.getCname(), 
										vo.getCom_logo(), 
										vo.getCrepresentive(), 
										vo.getAddress(), 
										vo.getManager_name(), 
										vo.getCompany_managerphone(), 
										vo.getCsize(), 
										vo.getCyear()));
		}
		
		//담기
		for (int i = 0; i < jobList.size(); i++) {
			mainPageList.add(new MainPageVo(jobList.get(i).getPost_idx(), 
											jobList.get(i).getId(), 
											jobList.get(i).getPost_name(), 
											jobList.get(i).getCareer(), 
											jobList.get(i).getJob_type(), 
											companyVo.get(i).getCom_logo()));
			//System.out.println(companyVo.get(i).getCom_logo());
		}
		
		//세션아이디 확인
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("jobList", jobList);
		mv.addObject("mainPageList", mainPageList);
		//세션별로 바꿔야할듯
		mv.setViewName("/home");
		return mv;
	}
	
	//메인에서 선택한 공고 보러 들어가기
	@RequestMapping("/ViewPost")
	public ModelAndView viewPost(@RequestParam("post_idx") int post_idx, @RequestParam("id") String id) {
		//job_post_tb에서 해당 공고 찾기
		JobpostVo jobpostvo = companyMapper.getViewPost(post_idx);
		log.info("[==jobpostvo==] : {}", jobpostvo);
		
		//공고에 필요한 스킬 post_skill_tb에서 찾기
		List<PostskillVo> postskillList = companyMapper.getPostSkill(post_idx);
		log.info("[==postskillList==] : {}", postskillList);
		
		//스킬 이름 가져오기
		List<SkillVo> jobnameList = new ArrayList<>();
		for(int i = 0; i < postskillList.size(); i++) {
			int skill_idx = postskillList.get(i).getSkill_idx();
			String skill_name = companyMapper.getSkillName(skill_idx);
			jobnameList.add(new SkillVo(skill_idx, skill_name));
		}
		log.info("[==jobnameList==] : {}", jobnameList);
		//System.out.println("스킬들" + jobnameList);
		
		//기업 정보
		CompanyVo companyVo = companyMapper.getCompanyById(id);
		
		//구직자면 지원하기 보이게 할때 가져올 것
		//세션아이디 확인
		String puserId = "ps1";
		List<PresumeVo> presumeVo = personMapper.getResumeList(puserId);
		log.info("==presumeVo== {}", presumeVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("jobpostvo", jobpostvo);
		mv.addObject("jobnameList", jobnameList);
		mv.addObject("companyVo", companyVo);
		mv.addObject("presumeVo", presumeVo);
		mv.setViewName("/viewpost");
		return mv;
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

	@RequestMapping("/main")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		return mv;
	}

	// 기업로그인폼
	@RequestMapping("/Company/loginForm")
	public String companyLoginForm() {
		return "company/login";
	}

	// 기업로그인
	@PostMapping("/Company/login")
	public ModelAndView companyLogin(HttpServletRequest request, CompanyVo comVo, HttpServletResponse response)
			throws IOException {
		ModelAndView mv = new ModelAndView();

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		comVo = companyMapper.login(id, password);

		if (comVo != null) {// 아이디와 암호 일치시 수행
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(60 * 60); // 60분동안 로그인 유지
			session.setAttribute("login", comVo);
			mv.setViewName("redirect:/main");

		} else {// 로그인 실패시
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8;");
			out.println("<script> alert('Please check your ID password');");
			out.println("history.go(-1); </script>");
			out.close();
			mv.setViewName("redirect:/Company/loginForm");
		}
		return mv;
	}

	// 개인회원 로그인폼
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "person/login";
	}

	// 개인회원 로그인
	@PostMapping("/login")
	public ModelAndView login(HttpServletRequest request, PersonVo personVo, HttpServletResponse response)
			throws IOException {
		ModelAndView mv = new ModelAndView();

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		personVo = personMapper.login(id, password);

		if (personVo != null) {// 아이디와 암호 일치시 수행
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(60 * 60); // 60분동안 로그인 유지
			session.setAttribute("login", personVo);
			mv.setViewName("redirect:/main");

		} else {// 로그인 실패시
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8;");
			out.println("<script> alert('Please check your ID password');");
			out.println("history.go(-1); </script>");
			out.close();
			mv.setViewName("redirect:/loginForm");
		}
		return mv;
	}

	// logout
	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/loginForm";
	}
}
