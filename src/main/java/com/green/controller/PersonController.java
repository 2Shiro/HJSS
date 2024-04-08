package com.green.controller;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyVo;
import com.green.domain.CproposalVo;
import com.green.domain.JobpostVo;
import com.green.domain.MainPageVo;
import com.green.domain.PersonVo;
import com.green.domain.PproposalVo;
import com.green.domain.PresumeVo;
import com.green.domain.UserVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.PersonMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Person")
public class PersonController {
	@Autowired
	private PersonMapper personMapper;
	
	@Autowired
	private CompanyMapper companyMapper;
	
	//구직자의 메인페이지
	@RequestMapping("/Pmain")
	public ModelAndView cmain() {
		//JOB_POST_TB 리스트
		List<MainPageVo> mainPageList = new ArrayList<>();
		List<JobpostVo> jobList = companyMapper.getmainpostList();
		
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
		//세션별로 바꿔야할듯
		mv.setViewName("/Person/Pmain");
		return mv;
	}
	
	//특정 구직자의 특정 공고에 지원하기
	@RequestMapping("/JoinPost")
	public ModelAndView joinPost( @RequestParam HashMap<String, Object> map) {
		System.out.println("resume_idx" + map);
		String id = (String) map.get("id");
		System.out.println("id" + id);
		int post_idx = Integer.parseInt((String.valueOf(map.get("post_idx"))));
		System.out.println("post_idx" + post_idx);
		int resume_idx = Integer.parseInt((String.valueOf(map.get("resume_idx"))));
		System.out.println("resume_idx" + resume_idx);
		
		//insert MY_PROPOSAL_TB
		personMapper.insertProposal(id, post_idx, resume_idx);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/Person/MyResume");
		return mv;
	}
	
	//특정 구직자가 등록한 이력서 관리
	@RequestMapping("/MyResume")
	public String myResume() {
		return "/person/resume";
	}
	
	//특정 구직자가 지원한 공고
	@RequestMapping("/MyProposal")
	public ModelAndView getProposal() {
		//아이디에 따라 하는 것 추가하기
		//지원 전부 가져오기
		List<CproposalVo> proposalList = companyMapper.getProposal();
		
		//공고 정보 가져오기
		List<JobpostVo> jobpostList = new ArrayList<>();
		for(int i = 0; i < proposalList.size(); i++) {
			JobpostVo vo = companyMapper.getpostName(proposalList.get(i).getPost_idx());
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
		
		//이력서 가져오기
		List<PresumeVo> presumeVo = new ArrayList<>();
		for (int i = 0; i < proposalList.size(); i++) {
			int resume_idx = proposalList.get(i).getResume_idx();
			PresumeVo vo = personMapper.getResume(resume_idx);
			presumeVo.add(vo);
		}
		
		//필요한 정보를 담은 리스트
		List<PproposalVo> pproposalList = new ArrayList<>();
		for (int i = 0; i < proposalList.size(); i++) {
			//comment를 굳이 테이블에서 가져와?
			String status, comment;
			if (proposalList.get(i).getStatus() == 1) {
				status = "합격";
				comment = "합격했습니다. ";
			} else if (proposalList.get(i).getStatus() == 2) {
				status = "불합격";
				comment = "불합격했습니다. ";
			} else {
				status = "미처리";
				comment = "아직 처리되지않았습니다. ";
			}
			pproposalList.add(new PproposalVo(proposalList.get(i).getPost_idx(), 
											  jobpostList.get(i).getPost_name(), 
											  jobpostList.get(i).getDeadline(), 
											  proposalList.get(i).getResume_idx(),
											  presumeVo.get(i).getTitle(),
											  status, comment));
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("proposalList", proposalList);
		mv.addObject("jobpostList", jobpostList);
		mv.addObject("presumeVo", presumeVo);
		mv.addObject("pproposalList", pproposalList);
		mv.setViewName("/person/myproposal");
		return mv;
	}
	
	//이력서 가져오기
	@RequestMapping("/GetResume")
	public ModelAndView getResume(PresumeVo presume) {
		int resume_idx = presume.getResume_idx();
		//System.out.println(resume_idx);
		PresumeVo presumeVo = personMapper.getResume(resume_idx);
		//System.out.println("이력서" + presumeVo);
		PersonVo psuerVo = personMapper.getPuser(presumeVo.getId());
		UserVo userVo = personMapper.getUser(presumeVo.getId());
		//System.out.println("유저: " + userVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("presumeVo", presumeVo);
		mv.addObject("psuerVo", psuerVo);
		mv.addObject("userVo", userVo);
		mv.setViewName("/person/popresume");
		return mv;
	}
	
	@RequestMapping("/Pass")
	public String pass(@RequestParam(value="resume_idx") int resume_idx, @RequestParam(value="status") int status) {
		System.out.println("상태" + resume_idx);
		personMapper.updateResumePass(resume_idx, status);
		
		System.out.println(status);
		
		return "/person/updateok";
	}
	
	//특정 구직자의 추천 공고
	@RequestMapping("/Recommend")
	public String recommend() {
		return "/person/recommend";
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
