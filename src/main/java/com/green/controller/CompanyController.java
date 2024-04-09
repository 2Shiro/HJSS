package com.green.controller;

import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyVo;
import com.green.domain.ComscrapListVo;
import com.green.domain.ComscrapVo;
import com.green.domain.CproposalVo;
import com.green.domain.JobpostVo;
import com.green.domain.MainPageVo;
import com.green.domain.MatchingResultVo;
import com.green.domain.MyProposalVo;
import com.green.domain.PersonVo;
import com.green.domain.PostskillVo;
import com.green.domain.PresumeVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.MainMapper;
import com.green.mapper.PersonMapper;
import com.green.util.AgeUtil;

import jakarta.servlet.http.HttpServletRequest;
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

		//기업 이미지 객체리스트 -> companyVo


		// 기업 이미지 객체리스트 -> companyVo

		List<CompanyVo> companyVo = new ArrayList<>();
		for (int i = 0; i < jobList.size(); i++) {
			String id = jobList.get(i).getId();
			//System.out.println(id);
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
			//System.out.println(companyVo.get(i).getCom_logo());
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("jobList", jobList);
		mv.addObject("mainPageList", mainPageList);
		mv.setViewName("/company/cmain");
		return mv;
	}

	//특정 기업회원이 지원 받은 이력서
	//로그인한 회사에 구직자들이 제안한 현황
	@RequestMapping("/MyParticipate") // /Company/MyParticipate
	public ModelAndView getProposal() {
		//공고에 제안한 것들 테이블
		List<CproposalVo> proposalList = companyMapper.getProposal();
		//System.out.println(proposalList);
		
		//공고 리스트
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
		
		//구직자 이름
		List<PersonVo> personList = new ArrayList<>();
		for(int i = 0; i < proposalList.size(); i++) {
			String id = proposalList.get(i).getId();
			//System.out.println(id);
			PersonVo vo = personMapper.getPname(id);
			personList.add(new PersonVo(vo.getId(), vo.getPname(), vo.getPhone(),
							vo.getAddress(), vo.getBirth()));
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

	// 특정 기업회원의 등록 공고 관리
	@RequestMapping("/MyPost")
	public ModelAndView myPost(UserVo userVo, JobpostVo vo) {
		ModelAndView mv = new ModelAndView();
		String id = "";
		id = "cp2";
		userVo.setId(id);

		userVo = companyMapper.getUser(id);
		List<JobpostVo> list = companyMapper.getpostList(vo);
		List<SkillVo> skill = companyMapper.getSkillList();

		userVo = mainMapper.getUser(id);
		vo.setId(id);

		log.info("list = {}", list);

		mv.addObject("user", userVo);		
		mv.addObject("id", id);		
		mv.addObject("list", list);		
		mv.addObject("skill", skill);		
		mv.setViewName("/company/jobs");
		return mv;
	}

	// /Company/Mypage
	@RequestMapping("/Mypage")
	public ModelAndView mypage( CompanyVo companyVo ) {
		
		CompanyVo vo  =  companyMapper.getCompany( companyVo );
		
		ModelAndView mv = new ModelAndView();

		mv.addObject("vo", vo);
		mv.setViewName("/company/mypage");
		return mv;
	}
	
	// /Company/UpdateForm
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm( CompanyVo companyVo ) {
		
		CompanyVo vo = companyMapper.getCompany( companyVo );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("company/mypageUpdate");
		
		return mv;
	}
	
	// /Company/Update
	@RequestMapping("/Update")
	public ModelAndView update( CompanyVo companyVo ) {
		
		companyMapper.updateCompany( companyVo );
		companyMapper.updateUser( companyVo );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Company/Mypage");
		return mv;
	}
	
	
	// /Company/DeleteForm
	@RequestMapping("/DeleteForm")
	public ModelAndView deleteForm( CompanyVo companyVo ) {
		
		CompanyVo vo = companyMapper.getCompany( companyVo );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/company/delete");
		return mv;
	}
	
	// /Company/DeleteForm
	@RequestMapping("/Delete")
	public ModelAndView delete( CompanyVo companyVo ) {
	   
		companyMapper.deleteCompany( companyVo );
		companyMapper.deleteUser( companyVo );
		   
		ModelAndView mv = new ModelAndView();
		   
		mv.setViewName("redirect:/main");
		
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
		int post_idx = vo.getPost_idx();
		List<SkillVo> postSkills = companyMapper.loadskills(post_idx);
		List<SkillVo> allSkills = mainMapper.getSkillList();
		mv.addObject("vo", vo);
		mv.addObject("allSkills", allSkills);
		mv.addObject("postSkills", postSkills);
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

	// 특정 기업회원의 공고에 대한 인재 추천
	@ResponseBody
	@RequestMapping("/Recommend")
	public ModelAndView recommend(UserVo userVo, JobpostVo jobpostVo, PresumeVo presume, HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		String id = "";
		id = "cp2";
		userVo.setId(id);
		userVo = mainMapper.getUser(id);
		jobpostVo.setId(id);
		// 회사의 공고 목록을 가져옵니다.
		List<JobpostVo> jobPosts = companyMapper.getpostList(jobpostVo);
		log.info("jobPosts = {}", jobPosts);

		// 각 공고에 대한 후보자 목록을 담을 맵
		Map<Integer, List<MatchingResultVo>> candidatesPerPost = new HashMap<>();
		
		// 공고 ID와 공고명을 매핑할 맵
		Map<Integer, String> postNames = new HashMap<>();
		
		// 공고 ID와 마감일을 매핑할 맵을 추가 (Date 타입으로 변경)
		Map<Integer, Date> deadlines = new HashMap<>();
		
		// 공고의 직무 소개를 매핑할 맵
		Map<Integer, String> job_intros = new HashMap<>();
		
		// 이력서의 생일을 만 나이로 매핑할 맵
		Map<Integer, Integer> candidateAges = new HashMap<>();

		for (JobpostVo post : jobPosts) {
			int postIdx = post.getPost_idx();
			// 공고명을 postNames 맵에 추가
			postNames.put(postIdx, post.getPost_name());
			// 마감일을 deadlines 맵에 추가 (String에서 Date로 변환)
			deadlines.put(postIdx, parseStringToDate(post.getDeadline()));
			// 직무소개를 job_intro 맵에 추가
			job_intros.put(postIdx, post.getJob_intro());
			// postId를 사용하여 해당 공고에 추천된 후보자 목록을 가져옵니다.
			
			List<MatchingResultVo> candidates = companyMapper.recommended(postIdx);
			
			log.info("candidates for post {} = {}", postIdx, candidates);
			
			// 후보자 목록을 candidatesPerPost 맵에 추가
			candidatesPerPost.put(postIdx, candidates);
			
			
			for (MatchingResultVo candidate : candidates) {
				// 후보자의 만 나이를 계산하여 맵에 저장합니다.
				candidateAges.put(candidate.getResume_idx(), AgeUtil.calculateAgeFromDate(candidate.getBirth()));
			}

		}
		// candidatesPerPost, postNames, deadlines를 모델에 추가
		mv.addObject("cid", id);
		mv.addObject("candidateAges", candidateAges);
		mv.addObject("candidatesPerPost", candidatesPerPost);
		mv.addObject("postNames", postNames);
		mv.addObject("deadlines", deadlines); // deadlines 맵을 모델에 추가
		mv.addObject("job_intros", job_intros); // deadlines 맵을 모델에 추가
		mv.setViewName("/company/recommend");
		return mv;
	}

	// 날짜 문자열을 Date 객체로 변환하는 메소드
	private Date parseStringToDate(String dateString) {
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			return formatter.parse(dateString);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

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

		//System.out.println("comVo" + companyVo);

		ModelAndView mv = new ModelAndView();
		companyMapper.insert(companyVo);

		mv.setViewName("redirect:/main");
		return mv;
	}

	// 이력서 스크랩 기능
	@RequestMapping("/ScrapAdd")
	public ResponseEntity<?> addScrap(@RequestBody ComscrapVo scrapvo) {
		try {
			companyMapper.insertScrap(scrapvo);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("스크랩 추가에 실패했습니다.");
		}
	}

	@RequestMapping("/ScrapDelete")
	public ResponseEntity<?> deleteScrap(@RequestParam("resume_idx") int resume_idx) {
		try {
			companyMapper.deleteScrap(resume_idx);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("스크랩 삭제에 실패했습니다.");
		}
	}

	@RequestMapping("/CheckScrap")
	public ResponseEntity<?> checkScrap(@RequestParam("resume_idx") int resume_idx, @RequestParam("cid") String cid) {
		int scarapCount = companyMapper.countScrap(cid, resume_idx);
		try {

			if (scarapCount != 0) {
				boolean isScraped = true;
				return ResponseEntity.ok(isScraped);
			} else {
				boolean isScraped = false;
				return ResponseEntity.ok(isScraped);
			}

		} catch (Exception e) {
			return ResponseEntity.badRequest().body("스크랩 상태 확인에 실패했습니다.");
		}
	}
	
	@RequestMapping("/MyScrap")
	public ModelAndView myScrap(ComscrapListVo scrapVo, UserVo userVo) {
		ModelAndView mv = new ModelAndView();
		String id = "";
		id = "cp2";
		userVo.setId(id);
		userVo = mainMapper.getUser(id);
		scrapVo.setCid(id);
		List<ComscrapListVo> comScrapList = companyMapper.getScrapList(scrapVo);
		mv.addObject("ScrapList", comScrapList);
		mv.setViewName("company/myscrap");
		return mv;
	}

}
