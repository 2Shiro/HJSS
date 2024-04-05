package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyInfoVo;
import com.green.domain.CproposalVo;
import com.green.domain.JobpostVo;
import com.green.domain.PostskillVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;
import com.green.mapper.CompanyMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Company")
public class CompanyController {
	@Autowired
	private CompanyMapper comMapper;

	// 로그인한 회사에 구직자들이 제안한 현황
	@RequestMapping("/GetProposal")
	public ModelAndView getProposal() {
		List<CproposalVo> proposalList = comMapper.getProposal();
		System.out.println(proposalList);

		ModelAndView mv = new ModelAndView();
		mv.addObject("proposalList", proposalList);
		mv.setViewName("/company/getproposal");
		return mv;
	}

	@RequestMapping("/jobs")
	public ModelAndView jobs(UserVo userVo, JobpostVo vo) {
		ModelAndView mv = new ModelAndView();
		String id = "";
		id = "cp1";
		userVo.setId(id);
		userVo = comMapper.getUser(id);
		vo.setId(id);
		List<JobpostVo> list = comMapper.getpostList(vo);
		List<SkillVo> skill = comMapper.getSkillList();
		log.info("list = {}", list);
		mv.addObject("user", userVo);
		mv.addObject("vo", vo);
		mv.addObject("id", id);
		mv.addObject("list", list);
		mv.addObject("skill", skill);
		mv.setViewName("/company/jobs");
		return mv;
	}

	@RequestMapping("/jobPost")
	public ModelAndView jobPost(@RequestParam("skillIdx") List<Integer> skillIdxList, JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();
		int post_idx = comMapper.selectpostidxmax();
		postVo.setPost_idx(post_idx);
		comMapper.insertpost(postVo);
		 for (Integer skillIdx : skillIdxList) {
		        PostskillVo skillVo = new PostskillVo();
		        skillVo.setPost_idx(post_idx);
		        skillVo.setSkill_idx(skillIdx);
		        comMapper.insertskills(skillVo);
		    }
		mv.setViewName("redirect:/Company/jobs");
		return mv;
	}

	@RequestMapping("/jobDetail")
	public ModelAndView jobDetail(JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();
		JobpostVo vo = comMapper.viewPost(postVo);
		String id = vo.getId();
		CompanyInfoVo com = comMapper.getInfo(id);
		UserVo userVo = comMapper.getUser(id);
		mv.addObject("vo", vo);
		mv.addObject("com", com);
		mv.addObject("userVo", userVo);
		mv.setViewName("/company/jobDetail");
		return mv;
	}

	@RequestMapping("/jobUpdateForm")
	public ModelAndView jobUpdateForm(JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();
		JobpostVo vo = comMapper.viewPost(postVo);
		mv.addObject("vo", vo);
		mv.setViewName("/company/jobUpdate");
		return mv;
	}

	@RequestMapping("/jobUpdate")
	public ModelAndView jobUpdate(JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();
		comMapper.updatePost(postVo);
		mv.setViewName("redirect:/Company/jobs");
		return mv;
	}

	@RequestMapping("/postDelete")
	public ModelAndView postDelete(JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();
		comMapper.deletepostskills(postVo);
		comMapper.postDelete(postVo);
		mv.setViewName("redirect:/Company/jobs");
		return mv;
	}



	

}
