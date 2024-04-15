package com.green.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyVo;
import com.green.domain.FaqVo;
import com.green.domain.JobpostVo;
import com.green.domain.MainPageVo;
import com.green.domain.PersonVo;
import com.green.domain.PostskillVo;
import com.green.domain.PresumeVo;
import com.green.domain.SkillVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.MainMapper;
import com.green.mapper.PersonMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController {

	@Autowired
	private CompanyMapper companyMapper;

	@Autowired
	private PersonMapper personMapper;
	
	@Autowired
	private MainMapper mainMapper;

	// 메인페이지들
	@RequestMapping("/")
	public ModelAndView main() {
		// JOB_POST_TB 리스트
		List<MainPageVo> mainPageList = new ArrayList<>();
		List<JobpostVo> jobList = companyMapper.getmainpostList();
		// System.out.println("jobList = " + jobList);
		log.info("jobList = {}", jobList);
		// 기업 이미지 객체리스트 -> companyVo
		List<CompanyVo> companyVo = new ArrayList<>();
		for (int i = 0; i < jobList.size(); i++) {
			String id = jobList.get(i).getId();
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
			// System.out.println(companyVo.get(i).getCom_logo());
		}

		// 세션아이디 확인
		log.info("jobList = {}", jobList);
		ModelAndView mv = new ModelAndView();
		mv.addObject("jobList", jobList);
		mv.addObject("mainPageList", mainPageList);
		// 세션별로 바꿔야할듯
		mv.setViewName("/home");
		return mv;
	}
	
	// 검색페이지들
	@RequestMapping("/Search")
	public ModelAndView search( @RequestParam(value="keyword") String keyword ) {
		// JOB_POST_TB 리스트
		List<MainPageVo> mainPageList = new ArrayList<>();
		List<JobpostVo> jobList = companyMapper.getsearchpostList( keyword );
		// System.out.println("jobList = " + jobList);
		log.info("jobList = {}", jobList);
		// 기업 이미지 객체리스트 -> companyVo
		List<CompanyVo> companyVo = new ArrayList<>();
		for (int i = 0; i < jobList.size(); i++) {
			String id = jobList.get(i).getId();
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
			// System.out.println(companyVo.get(i).getCom_logo());
		}

		// 세션아이디 확인
		log.info("jobList = {}", jobList);
		ModelAndView mv = new ModelAndView();
		mv.addObject("jobList", jobList);
		mv.addObject("mainPageList", mainPageList);
		// 세션별로 바꿔야할듯
		mv.setViewName("/home");
		return mv;
	}

	   // 메인에서 선택한 공고 보러 들어가기
	   @RequestMapping("/ViewPost")
	   public ModelAndView viewPost(@RequestParam("post_idx") int post_idx, @RequestParam("id") String id, PersonVo personVo, HttpServletRequest request) {
	      
	      // job_post_tb에서 해당 공고 찾기
	      JobpostVo jobpostvo = companyMapper.getViewPost(post_idx);
	      log.info("[==jobpostvo==] : {}", jobpostvo);

	      // 공고에 필요한 스킬 post_skill_tb에서 찾기
	      List<PostskillVo> postskillList = companyMapper.getPostSkill(post_idx);
	      log.info("[==postskillList==] : {}", postskillList);

	      // 스킬 이름 가져오기
	      List<SkillVo> jobnameList = new ArrayList<>();
	      for (int i = 0; i < postskillList.size(); i++) {
	         int skill_idx = postskillList.get(i).getSkill_idx();
	         String skill_name = companyMapper.getSkillName(skill_idx);
	         jobnameList.add(new SkillVo(skill_idx, skill_name));
	      }
	      log.info("[==jobnameList==] : {}", jobnameList);
	      // System.out.println("스킬들" + jobnameList);

	      // 기업 정보
	      CompanyVo companyVo = companyMapper.getCompanyById(id);

	      // 구직자면 지원하기 보이게 할때 가져올 것
	      // 세션아이디 확인

	      ModelAndView mv = new ModelAndView();
	      
	      //기업 회원 로그인 시 지원하기 목록을 제거하기 위한 코드
	      //세션에서 PersonVo를 받아와서 jstl문법을 이용하여 지원하기 부분을 가리려고 함
	      HttpSession session = request.getSession();
	      Object loginYn = session.getAttribute("login");

	      if (loginYn instanceof PersonVo) {
	          PersonVo sessionVo = (PersonVo) loginYn;
	         String puserId = sessionVo.getId();
	         List<PresumeVo> presumeVo = personMapper.getResumeList(puserId);
	         log.info("==presumeVo== {}", presumeVo);
	          mv.addObject("sessionVo",sessionVo);
	          mv.addObject("presumeVo", presumeVo);
	      } else if (loginYn instanceof CompanyVo) {
	    	  CompanyVo sessionVo = (CompanyVo) loginYn;
	         String puserId = sessionVo.getId();
	         List<PresumeVo> presumeVo = personMapper.getResumeList(puserId);
	         log.info("==presumeVo== {}", presumeVo);
	          mv.addObject("sessionVo",sessionVo);
	          mv.addObject("presumeVo", presumeVo);
	      } 
	      

	   
	      mv.addObject("jobpostvo", jobpostvo);
	      mv.addObject("jobnameList", jobnameList);
	      mv.addObject("companyVo", companyVo);
	      
	      mv.setViewName("/viewpost");
	      return mv;
	   }


	// logout
	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();
		
		return "redirect:/";
	}
	
	//FAQ
	@RequestMapping("/FAQ")
	public ModelAndView faq(FaqVo faqVo) {
		ModelAndView mv = new ModelAndView();
		
		List <FaqVo> faqList1 = mainMapper.getList();
		mv.addObject("faqList", faqList1);
		
		List <FaqVo> faqList2 = mainMapper.getList2();
		mv.addObject("faqList2", faqList2);
						
		mv.setViewName("faq");
		return mv;

	}
	
	//아이디 중복체크(기업+개인)
	@RequestMapping("/CheckId")
	public @ResponseBody int checkId(@RequestParam(value="id") String id) {
		int result = mainMapper.checkId(id);
		return result;
	}
	
}
