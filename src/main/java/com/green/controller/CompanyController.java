package com.green.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyVo;
import com.green.domain.CproposalVo;
import com.green.domain.JobpostVo;
import com.green.domain.MainPageVo;
import com.green.domain.MyProposalVo;
import com.green.domain.PersonVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.JobPostMapper;
import com.green.mapper.PersonMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Company")
public class CompanyController {
	
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private JobPostMapper jobPostMapper;
		
	@Autowired
	private PersonMapper personMapper;
	
	//기업의 메인페이지
	@RequestMapping("/Cmain")
	public ModelAndView cmain() {
		//JOB_POST_TB 리스트
		List<MainPageVo> mainPageList = new ArrayList<>();
		List<JobpostVo> jobList = jobPostMapper.getmainpostList();
		
		//기업 이미지 객체리스트 -> companyVo
		List<CompanyVo> companyVo = new ArrayList<>();
		for (int i = 0; i < jobList.size(); i++) {
			String id = jobList.get(i).getId();
			System.out.println(id);
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
			System.out.println(companyVo.get(i).getCom_logo());
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("jobList", jobList);
		mv.addObject("mainPageList", mainPageList);
		mv.setViewName("/company/cmain");
		return mv;
	}
	
	//특정 기업회원의 등록 공고 관리
	@RequestMapping("/MyPost")
	public String myPost() {
		return "/company/mypost";
	}
	
	//특정 기업회원이 지원 받은 이력서
	//로그인한 회사에 구직자들이 제안한 현황
	@RequestMapping("/MyParticipate") // /Company/MyParticipate
	public ModelAndView getProposal() {
		//공고에 제안한 것들 테이블
		List<CproposalVo> proposalList = companyMapper.getProposal();
		System.out.println(proposalList);
		
		//공고 리스트
		List<JobpostVo> jobpostList = new ArrayList<>();
		for(int i = 0; i < proposalList.size(); i++) {
			JobpostVo vo = jobPostMapper.getpostName(proposalList.get(i).getPost_idx());
			jobpostList.add(new JobpostVo(vo.getPost_idx(),
										  vo.getId(),
										  vo.getPost_name(),
										  vo.getCareer(),
										  vo.getJob_type(),
										  vo.getPay(),
										  vo.getGo_work(),
										  vo.getGo_home(),
										  vo.getDeadline(),
										  vo.getJob_intro(),
										  vo.getC_intro(),
										  vo.getCreated_date()));
		}
		
		//구직자 이름
		List<PersonVo> personList = new ArrayList<>();
		for(int i = 0; i < proposalList.size(); i++) {
			String id = proposalList.get(i).getId();
			System.out.println(id);
			PersonVo vo = personMapper.getPname(id);
			personList.add(new PersonVo(vo.getId(), vo.getPname(), vo.getPhone(), vo.getAddress(), vo.getBirth()));
		}
		
		List<MyProposalVo> myproposalList = new ArrayList<>();
		for(int i = 0; i < proposalList.size(); i++) {
			String status;
			//System.out.println(proposalList.get(i).getStatus());
			if (proposalList.get(i).getStatus() == 1) {
				status = "합격";
			} else if (proposalList.get(i).getStatus() == 2) {
				status = "불합격";
			} else {
				status = "미채점";
			}
			myproposalList.add(new MyProposalVo(jobpostList.get(i).getPost_idx(),
												jobpostList.get(i).getPost_name(),
												personList.get(i).getPname(),
												proposalList.get(i).getResume_idx(),
												status));
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("proposalList", proposalList);
		mv.addObject("myproposalList", myproposalList);
		mv.setViewName("company/myparticipate");
		return mv;
	}
	
	//특정 기업회원의 공고에 대한 인재 추천
	@RequestMapping("/Recommend")
	public String recommend() {
		return "/company/recommend";
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
}
