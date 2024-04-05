package com.green.controller;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import com.green.domain.MyProposalVo;
import com.green.domain.PersonVo;
import com.green.domain.PostskillVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.MainMapper;
import com.green.mapper.PersonMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Company")
public class CompanyController {
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private PersonMapper personMapper;
	@Autowired
	private MainMapper mainMapper;

	// 기업의 메인페이지
	@RequestMapping("/Cmain")
	public ModelAndView cmain() {
		// JOB_POST_TB 리스트
		List<MainPageVo> mainPageList = new ArrayList<>();
		List<JobpostVo> jobList = companyMapper.getmainpostList();

		// 기업 이미지 객체리스트 -> companyVo
		List<CompanyVo> companyVo = new ArrayList<>();
		for (int i = 0; i < jobList.size(); i++) {
			String id = jobList.get(i).getId();
			System.out.println(id);
			CompanyVo vo = companyMapper.getCompanyById(id);
			companyVo.add(new CompanyVo(vo.getId(), vo.getCnumber(), vo.getCname(), vo.getCom_logo(),
					vo.getCrepresentive(), vo.getAddress(), vo.getManager_name(), vo.getCompany_managerphone(),
					vo.getCsize(), vo.getCyear()));
		}

		// 담기
		for (int i = 0; i < jobList.size(); i++) {
			mainPageList.add(
					new MainPageVo(jobList.get(i).getPost_idx(), jobList.get(i).getId(), jobList.get(i).getPost_name(),
							jobList.get(i).getCareer(), jobList.get(i).getJob_type(), companyVo.get(i).getCom_logo()));
			System.out.println(companyVo.get(i).getCom_logo());
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("jobList", jobList);
		mv.addObject("mainPageList", mainPageList);
		mv.setViewName("/company/cmain");
		return mv;
	}

	// 특정 기업회원의 등록 공고 관리
	@RequestMapping("/MyPost")
	public ModelAndView myPost(UserVo userVo, JobpostVo vo) {
		ModelAndView mv = new ModelAndView();
		String id = "";
		id = "cp1";
		userVo.setId(id);
		userVo = mainMapper.getUser(id);
		vo.setId(id);
		List<JobpostVo> list = companyMapper.getpostList(vo);
		List<SkillVo> skill = mainMapper.getSkillList();
		log.info("list = {}", list);
		mv.addObject("user", userVo);
		mv.addObject("vo", vo);
		mv.addObject("id", id);
		mv.addObject("list", list);
		mv.addObject("skill", skill);
		mv.setViewName("/company/mypost");
		return mv;
	}

	
	// 특정 기업회원의 공고 등록
	@RequestMapping("/MyPostWrite")
	public ModelAndView writeMyPost(@RequestParam("skillIdx") List<Integer> skillIdxList, JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();
		int post_idx = companyMapper.selectpostidxmax();
		postVo.setPost_idx(post_idx);
		companyMapper.insertpost(postVo);
		for (Integer skillIdx : skillIdxList) {
			PostskillVo skillVo = new PostskillVo();
			skillVo.setPost_idx(post_idx);
			skillVo.setSkill_idx(skillIdx);
			companyMapper.insertskills(skillVo);
		}
		mv.setViewName("redirect:/Company/MyPost");
		return mv;
	}

	@RequestMapping("/MyPostDetail")
	public ModelAndView myPostDetail(JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();
		JobpostVo vo = companyMapper.viewPost(postVo);
		String id = vo.getId();
		CompanyVo com = companyMapper.getCompany(id);
		UserVo userVo = mainMapper.getUser(id);
		int post_idx = vo.getPost_idx();
		List<SkillVo> skill = companyMapper.loadskills(post_idx);
		mv.addObject("vo", vo);
		mv.addObject("com", com);
		mv.addObject("userVo", userVo);
		mv.addObject("skill", skill);
		mv.setViewName("/company/mypostdetail");
		return mv;
	}

	@RequestMapping("/MyPostEdit")
	public ModelAndView editMyPost(JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();
		JobpostVo vo = companyMapper.viewPost(postVo);
		List<SkillVo> skill = mainMapper.getSkillList();
		mv.addObject("vo", vo);
		mv.addObject("skill", skill);
		mv.setViewName("/company/mypostedit");
		return mv;
	}

	@RequestMapping("/MyPostUpdate")
	public ModelAndView updateMyPost(@RequestParam("skillIdx") List<Integer> skillIdxList, JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();
		int post_idx = postVo.getPost_idx();
		postVo.setPost_idx(post_idx);
		companyMapper.updatePost(postVo);
		companyMapper.deletepostskills(postVo);
		for (Integer skillIdx : skillIdxList) {
			PostskillVo skillVo = new PostskillVo();
			skillVo.setPost_idx(post_idx);
			skillVo.setSkill_idx(skillIdx);
			companyMapper.insertskills(skillVo);
		}
		mv.setViewName("redirect:/Company/MyPost");
		return mv;
	}
	@RequestMapping("/MyPostDelete")
	public ModelAndView postDelete(JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();
		companyMapper.deletepostskills(postVo);
		companyMapper.postDelete(postVo);
		mv.setViewName("redirect:/Company/MyPost");
		return mv;
	}
	
	
	
	
	
	// 특정 기업회원이 지원 받은 이력서
	// 로그인한 회사에 구직자들이 제안한 현황
	@RequestMapping("/MyParticipate") // /Company/MyParticipate
	public ModelAndView getProposal() {
		// 공고에 제안한 것들 테이블
		List<CproposalVo> proposalList = companyMapper.getProposal();
		System.out.println(proposalList);

		// 공고 리스트
		List<JobpostVo> jobpostList = new ArrayList<>();
		for (int i = 0; i < proposalList.size(); i++) {
			JobpostVo vo = companyMapper.getpostName(proposalList.get(i).getPost_idx());
			jobpostList.add(new JobpostVo(vo.getPost_idx(), vo.getId(), vo.getPost_name(), vo.getCareer(),
					vo.getJob_type(), vo.getPay(), vo.getGo_work(), vo.getGo_home(), vo.getDeadline(),
					vo.getJob_intro(), vo.getC_intro(), vo.getCreated_date()));
		}

		// 구직자 이름
		List<PersonVo> personList = new ArrayList<>();
		for (int i = 0; i < proposalList.size(); i++) {
			String id = proposalList.get(i).getId();
			System.out.println(id);
			PersonVo vo = personMapper.getPname(id);
			personList.add(new PersonVo(vo.getId(), vo.getPname(), vo.getPhone(), vo.getAddress(), vo.getBirth()));
		}

		List<MyProposalVo> myproposalList = new ArrayList<>();
		for (int i = 0; i < proposalList.size(); i++) {
			String status;
			// System.out.println(proposalList.get(i).getStatus());
			if (proposalList.get(i).getStatus() == 1) {
				status = "합격";
			} else if (proposalList.get(i).getStatus() == 2) {
				status = "불합격";
			} else {
				status = "미채점";
			}
			myproposalList.add(new MyProposalVo(jobpostList.get(i).getPost_idx(), jobpostList.get(i).getPost_name(),
					personList.get(i).getPname(), proposalList.get(i).getResume_idx(), status));
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("proposalList", proposalList);
		mv.addObject("myproposalList", myproposalList);
		mv.setViewName("company/myparticipate");
		return mv;
	}

	@RequestMapping("/Recommend")
	public String recommend() {
		return "/company/recommend";
	}
 
	// 기업회원가입폼
	@RequestMapping("/JoinForm")
	public ModelAndView CompanyJoinForm() {
		ModelAndView mv = new ModelAndView();

		LocalDateTime today = LocalDateTime.now();
		String now = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		DayOfWeek day = today.getDayOfWeek();
		now += " " + day;
		mv.addObject("now", now);

		mv.setViewName("company/join");
		return mv;
	}

	// 기업회원가입
	@RequestMapping("/Join")
	public ModelAndView ComJoin(CompanyVo companyVo) {

		System.out.println("comVo" + companyVo);

		ModelAndView mv = new ModelAndView();
		companyMapper.insert(companyVo);

		mv.setViewName("redirect:/main");
		return mv;
	}



}
