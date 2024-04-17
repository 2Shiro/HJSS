package com.green.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyVo;
import com.green.domain.ComscrapListVo;
import com.green.domain.ComscrapVo;
import com.green.domain.CproposalVo;
import com.green.domain.JobpostVo;
import com.green.domain.MainPageVo;
import com.green.domain.MatchingResultVo;
import com.green.domain.MyProposalVo;
import com.green.domain.Pagination;
import com.green.domain.PagingResponse;
import com.green.domain.PagingVo;
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
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
//github.com/2Shiro/HJSS.git
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

		// 기업 이미지 객체리스트 -> companyVo

		List<CompanyVo> companyVo = new ArrayList<>();
		for (int i = 0; i < jobList.size(); i++) {
			String id = jobList.get(i).getId();
			// System.out.println(id);
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
		log.info("jobList = {}", jobList);
		ModelAndView mv = new ModelAndView();
		mv.addObject("jobList", jobList);
		mv.addObject("mainPageList", mainPageList);
		mv.setViewName("/company/cmain");
		return mv;
	}
	
	// 기업의 검색페이지
	@RequestMapping("/Search")
	public ModelAndView search( @RequestParam(value="keyword") String keyword ) {
		// JOB_POST_TB 리스트
		List<MainPageVo> mainPageList = new ArrayList<>();
		List<JobpostVo> jobList = companyMapper.getsearchpostList( keyword );

		// 기업 이미지 객체리스트 -> companyVo

		// 기업 이미지 객체리스트 -> companyVo

		List<CompanyVo> companyVo = new ArrayList<>();
		for (int i = 0; i < jobList.size(); i++) {
			String id = jobList.get(i).getId();
			// System.out.println(id);
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

		log.info("jobList = {}", jobList);
		ModelAndView mv = new ModelAndView();
		mv.addObject("jobList", jobList);
		mv.addObject("mainPageList", mainPageList);
		mv.setViewName("/company/cmain");
		return mv;
	}

	// 특정 기업회원이 지원 받은 이력서
	// 로그인한 회사에 구직자들이 제안한 현황
	@RequestMapping("/MyParticipate") // /Company/MyParticipate
	public ModelAndView getProposal(@SessionAttribute("login") CompanyVo companyVo) {
		String cid = companyVo.getId();

		// System.out.println(cid);
		// 기업의 공고 번호
		List<JobpostVo> mypost = companyMapper.getMyPost(cid);
		log.info("==mypost==", mypost);
		System.out.println(mypost.size());


		// 공고에 제안한 것들 테이블
		List<CproposalVo> proposalList = new ArrayList<>();
		for (int i = 0; i < mypost.size(); i++) {
			List<CproposalVo> vo = companyMapper.getProposal(mypost.get(i).getPost_idx());
			System.out.println("vo : " + vo.size());
			for (int j = 0; j < vo.size(); j++) {

				proposalList.add(new CproposalVo(vo.get(j).getPro_idx(), vo.get(j).getId(), vo.get(j).getPost_idx(),
						vo.get(j).getResume_idx(), vo.get(j).getStatus(), vo.get(j).getCreated_at()));
			}
		}
		log.info("==proposalList==", proposalList);

		// 공고에 제안한 것들 테이블
		// String cid = companyVo.getId();
		// List<CproposalVo> proposalList = companyMapper.getProposal(cid);
		// System.out.println(proposalList);

		// 공고 리스트
		List<JobpostVo> jobpostList = new ArrayList<>();
		for (int i = 0; i < proposalList.size(); i++) {
			JobpostVo vo = companyMapper.getpostName(proposalList.get(i).getPost_idx());
			jobpostList.add(new JobpostVo(vo.getPost_idx(), vo.getId(), vo.getPost_name(), vo.getCareer(),
					vo.getJob_type(), vo.getPay(), vo.getGo_work(), vo.getGo_home(), vo.getDeadline(),
					vo.getJob_intro(), vo.getC_intro(), vo.getCreated_date()));
		}
		log.info("==jobpostList==", jobpostList);

		// 구직자 이름
		List<PersonVo> personList = new ArrayList<>();
		for (int i = 0; i < proposalList.size(); i++) {
			String id = proposalList.get(i).getId();
			// System.out.println(id);
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
		log.info("==myproposalList==", myproposalList);

		ModelAndView mv = new ModelAndView();
		mv.addObject("proposalList", proposalList);
		mv.addObject("myproposalList", myproposalList);
		mv.setViewName("company/myparticipate");
		return mv;
	}

	// /Company/Mypage
	@RequestMapping("/Mypage")
	public ModelAndView mypage(@SessionAttribute("login") CompanyVo companyVo) {

		CompanyVo vo = companyMapper.getCompany(companyVo);

		ModelAndView mv = new ModelAndView();

		mv.addObject("vo", vo);
		mv.setViewName("/company/mypage");
		return mv;
	}

	// /Company/UpdateForm
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(CompanyVo companyVo) {

		CompanyVo vo = companyMapper.getCompany(companyVo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("company/mypageUpdate");

		return mv;
	}

	// /Company/Update
	@RequestMapping("/Update")
	public ModelAndView update(CompanyVo companyVo) {

		companyMapper.updateCompany(companyVo);
		companyMapper.updateUser(companyVo);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Company/Mypage");
		return mv;
	}

	// /Company/DeleteForm
	@RequestMapping("/DeleteForm")
	public ModelAndView deleteForm(CompanyVo companyVo) {

		CompanyVo vo = companyMapper.getCompany(companyVo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/company/delete");
		return mv;
	}


	// /Company/Delete
	@RequestMapping("/Delete")
	public ModelAndView delete(CompanyVo companyVo, HttpSession session) {

		companyMapper.deleteCompany(companyVo);
		companyMapper.deleteUser(companyVo);

		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:/");

		return mv;
	}

	// 특정 기업회원의 등록 공고 관리
	@RequestMapping("/MyPost")
	public ModelAndView myPost(UserVo userVo, JobpostVo vo, @SessionAttribute("login") CompanyVo comVo,
			@RequestParam(value = "nowpage") int nowpage) {
		ModelAndView mv = new ModelAndView();

		// session에서 id를 가져옴
		String id = comVo.getId();

		// 가져온 id를 UserVo와 JobpostVo에 입력
		userVo.setId(id);
		vo.setId(id);

		// 가져온 id를 통해 해당 id의 등록 공고 목록 불러오기
		List<JobpostVo> list = companyMapper.getpostList(vo);

		// 모든 기술자격 리스트 불러오기
		List<SkillVo> skill = mainMapper.getSkillList();

		// 회사 정보 불러오기
		userVo = mainMapper.getUser(id);

		// 페이징
		int count = companyMapper.countPost(vo);
		PagingResponse<JobpostVo> response = null;
		if (count < 1) {
			response = new PagingResponse<>(Collections.emptyList(), null);
		}
		// 페이징을 위한 초기 설정값
		PagingVo pagingVo = new PagingVo();
		pagingVo.setPage(nowpage);
		pagingVo.setPageSize(5);
		pagingVo.setRecordSize(5);//

		// Pagination 객체를 생성해서 페이지 정보 계산 후 SearchDto 타입의 객체인 params에 계산된 페이지 정보 저장
		Pagination pagination = new Pagination(count, pagingVo);
		pagingVo.setPagination(pagination);

		int offset = pagingVo.getOffset();
		int pageSize = pagingVo.getPageSize();

		List<JobpostVo> pagingList = companyMapper.getPostPaing(id, offset, pageSize);
		response = new PagingResponse<>(pagingList, pagination);

		mv.addObject("response", response);
		mv.addObject("pagingVo", pagingVo);
		mv.addObject("nowpage", nowpage);
		mv.addObject("user", userVo);
		mv.addObject("id", id);
		mv.addObject("list", list);
		mv.addObject("skill", skill);
		mv.setViewName("/company/mypost");
		return mv;
	}

	// 특정 기업회원의 공고 등록
	@RequestMapping("/MyPostWrite")
	public ModelAndView writeMyPost(@RequestParam("skillIdx") List<Integer> skillIdxList, JobpostVo postVo,
			@SessionAttribute("login") CompanyVo comVo) {
		ModelAndView mv = new ModelAndView();
		String id = comVo.getId();
		// 기술자격 데이터를 넣기 위해 미리 post_idx를 확정함
		int post_idx = companyMapper.selectpostidxmax();
		postVo.setPost_idx(post_idx);

		// 공고 등록 모달에서 입력한 데이터를 데이터베이스 insert
		companyMapper.insertpost(postVo);

		// 공고 등록 모달에서 선택된 기술자격 정보를 for문을 이용해서 하나씩 데이터베이스 저장
		for (Integer skillIdx : skillIdxList) {
			PostskillVo skillVo = new PostskillVo();
			skillVo.setPost_idx(post_idx);
			skillVo.setSkill_idx(skillIdx);
			companyMapper.insertskills(skillVo);
		}
		mv.setViewName("redirect:/Company/MyPost?id=" + id + "&nowpage=1");
		return mv;
	}

	@RequestMapping("/MyPostDetail")
	public ModelAndView myPostDetail(JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();

		// 공고의 상세정보를 가져옴
		JobpostVo vo = companyMapper.viewPost(postVo);

		// 해당 공고의 id를 확정하기 위해 id값을 가져옴
		String id = vo.getId();

		// 가져온 id값을 사용하여 해당 공고의 기업 정보를 가져옴
		CompanyVo com = companyMapper.getCompany(id);

		// 해당 공고 기업의 이메일 주소를 가져오기 위해 UserVo 정보를 가져옴
		UserVo userVo = mainMapper.getUser(id);

		// 공고의 기술자격 정보를 가져오기 위해 post_idx를 확정
		int post_idx = vo.getPost_idx();

		// 해당 공고의 기술자격 정보를 가져옴
		List<SkillVo> skill = companyMapper.loadskills(post_idx);

		mv.addObject("vo", vo);
		mv.addObject("com", com);
		mv.addObject("userVo", userVo);
		mv.addObject("skill", skill);
		mv.setViewName("/company/mypostdetail");
		return mv;
	}

	// 시간을 오전 오후 **시로 바꿔주기 위한 메소드
	private String convertTimeFormat(String time) {
		try {
			String[] parts = time.split(" ");
			int hour = Integer.parseInt(parts[1].replaceAll("[^0-9]", ""));

			if ("오후".equals(parts[0]) && hour != 12) {
				hour += 12;
			} else if ("오전".equals(parts[0]) && hour == 12) {
				hour = 0;
			}

			return String.format("%02d:00", hour); // 분은 00으로 설정
		} catch (Exception e) {
			return "00:00"; // 예외 처리, 기본값 반환
		}
	}

	@RequestMapping("/MyPostEdit")
	public ModelAndView editMyPost(JobpostVo postVo) {
		ModelAndView mv = new ModelAndView();

		// 공고의 상세정보를 가져옴
		JobpostVo vo = companyMapper.viewPost(postVo);

		// 모든 기술 자격을 불러온 후 사전에 작성된 기술 자격을 selected 하기 위해 2개의 list를 만듦
		int post_idx = vo.getPost_idx();
		List<SkillVo> postSkills = companyMapper.loadskills(post_idx);
		List<SkillVo> allSkills = mainMapper.getSkillList();

		String goWork = vo.getGo_work();
		String goHome = vo.getGo_home();

		String goWorkTime = convertTimeFormat(goWork);
		String goHomeTime = convertTimeFormat(goHome);
		log.info("goWorkTime = {}", goWorkTime);
		log.info("goHomeTime = {}", goHomeTime);

		mv.addObject("goHomeTime", goHomeTime);
		mv.addObject("goWorkTime", goWorkTime);

		mv.addObject("vo", vo);
		mv.addObject("allSkills", allSkills);
		mv.addObject("postSkills", postSkills);
		mv.setViewName("/company/mypostedit");
		return mv;
	}

	@RequestMapping("/MyPostUpdate")
	public ModelAndView updateMyPost(@RequestParam("skillIdx") List<Integer> skillIdxList, JobpostVo postVo,
			@SessionAttribute("login") CompanyVo comVo) {
		ModelAndView mv = new ModelAndView();
		String id = comVo.getId();
		// 해당 공고의 post_idx를 확정
		int post_idx = postVo.getPost_idx();
		postVo.setPost_idx(post_idx);

		// 해당 공고의 정보를 update
		companyMapper.updatePost(postVo);

		// 해당 공고의 모든 기술자격 데이터를 삭제
		companyMapper.deletepostskills(postVo);

		// 해당 공고의 기술자격 데이터를 다시 입력
		for (Integer skillIdx : skillIdxList) {
			PostskillVo skillVo = new PostskillVo();
			skillVo.setPost_idx(post_idx);
			skillVo.setSkill_idx(skillIdx);
			companyMapper.insertskills(skillVo);
		}
		mv.setViewName("redirect:/Company/MyPost?id=" + id + "&nowpage=1");
		return mv;
	}

	@RequestMapping("/MyPostDelete")
	public ModelAndView postDelete(JobpostVo postVo, @SessionAttribute("login") CompanyVo comVo) {
		ModelAndView mv = new ModelAndView();
		String id = comVo.getId();
		// 해당 공고의 모든 기술자격 데이터 삭제
		companyMapper.deletepostskills(postVo);

		// 해당 공고 삭제
		companyMapper.postDelete(postVo);
		mv.setViewName("redirect:/Company/MyPost?id=" + id + "&nowpage=1");
		return mv;
	}

	// 특정 기업회원의 공고에 대한 인재 추천
	@ResponseBody
	@RequestMapping("/Recommend")
	public ModelAndView recommend(UserVo userVo, JobpostVo jobpostVo, PresumeVo presume,
			@SessionAttribute("login") CompanyVo comVo) {

		ModelAndView mv = new ModelAndView();

		// session에서 id를 가져옴
		String id = comVo.getId();
		userVo.setId(id);

		// 가져온 id를 통해 유저 정보를 가져옴
		userVo = mainMapper.getUser(id);

		// 회사의 공고 목록을 가져옵니다.
		jobpostVo.setId(id);
		List<JobpostVo> jobPosts = companyMapper.getpostList(jobpostVo);

		// MatchingResultVo는 해당 페이지가 여러 테이블의 컬럼을 JOIN하여 가져오기 때문에 만든 Vo
		// 각 공고에 대한 후보자 목록을 담을 맵
		Map<Integer, List<MatchingResultVo>> candidatesPerPost = new HashMap<>();

		// 공고 ID와 공고명을 매핑할 맵
		Map<Integer, String> postNames = new HashMap<>();

		// 공고 ID와 마감일을 매핑할 맵 (Date 타입으로 변경)
		Map<Integer, Date> deadlines = new HashMap<>();

		// 공고의 직무 소개를 매핑할 맵
		Map<Integer, String> job_intros = new HashMap<>();

		// 이력서의 생일을 만 나이로 매핑할 맵
		Map<Integer, Integer> candidateAges = new HashMap<>();

		// for문을 통해 각 맵에 데이터를 추가
		for (JobpostVo post : jobPosts) {
			int postIdx = post.getPost_idx();

			// 공고명을 postNames 맵에 추가
			postNames.put(postIdx, post.getPost_name());

			// 마감일을 deadlines 맵에 추가 (String에서 Date로 변환)
			deadlines.put(postIdx, parseStringToDate(post.getDeadline()));

			// 직무소개를 job_intro 맵에 추가
			job_intros.put(postIdx, post.getJob_intro());

			// post_idx를 사용하여 해당 공고에 추천된 후보자 목록을 가져옴
			List<MatchingResultVo> candidates = companyMapper.recommended(postIdx);

			// 후보자 목록을 candidatesPerPost 맵에 추가
			candidatesPerPost.put(postIdx, candidates);

			// 다시 for문을 통해 각 후보자들의 나이 정보를 가져옴
			for (MatchingResultVo candidate : candidates) {

				// 후보자의 만 나이를 계산하여 맵에 저장합니다.
				candidateAges.put(candidate.getResume_idx(), AgeUtil.calculateAgeFromDate(candidate.getBirth()));
			}

		}

		mv.addObject("cid", id);
		mv.addObject("candidateAges", candidateAges);
		mv.addObject("candidatesPerPost", candidatesPerPost);
		mv.addObject("postNames", postNames);
		mv.addObject("deadlines", deadlines);
		mv.addObject("job_intros", job_intros);
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
/*	@GetMapping("/id/${id}/exists")
	public ResponseEntity<Boolean> checkIdDuplicate(@PathVariable String id){
		return ResponseEntity.ok(userService.checkIdDuplicate(id));
	}*/
	


	// 기업회원가입
	@RequestMapping("/Join")
	public ModelAndView ComJoin(CompanyVo companyVo) {

		// System.out.println("comVo" + companyVo);

		ModelAndView mv = new ModelAndView();
		companyMapper.insert(companyVo);
		
		mv.setViewName("company/login");
		return mv;
	}
	//기업로그인폼
	@RequestMapping("/LoginForm")
	public String companyLoginForm() {
		return "company/login";
	}


	//기업로그인
	@PostMapping("/Login")
	public String companyLogin(HttpServletRequest request, CompanyVo comVo,
	                           HttpServletResponse response) throws IOException {
	
	      
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
    comVo= companyMapper.login(id,password);
    
    
	 if(comVo != null) {//아이디와 암호 일치시 수행
	 HttpSession session = request.getSession();
	 session.setMaxInactiveInterval(60*60); //60분동안 로그인 유지
	 session.setAttribute("login", comVo);
	 session.setAttribute("isLoggedIn", true);
     return "redirect:/Company/Cmain";           
	 }
	 else {//로그인 실패시
		  PrintWriter out = response.getWriter();
		  response.setCharacterEncoding("UTF-8");
		  response.setContentType("text/html; charset=UTF-8;");
	      out.println("<script> alert('Please Check Your ID and Password');");
	      out.println("history.go(-1); </script>"); 
	      out.close();             
	      return "redirect:/Company/LoginForm";
	      }
	 	   
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


	@RequestMapping("/LoadRecommend")
	public ResponseEntity<List<MatchingResultVo>> recommendLoad(@RequestParam("post_idx") int post_idx) {
		List<MatchingResultVo> candidates = companyMapper.recommended(post_idx);
		return new ResponseEntity<>(candidates, HttpStatus.OK);
	}

	
	

	@RequestMapping("/MyScrap")
	   public ModelAndView myScrap(ComscrapListVo scrapVo, UserVo userVo, @SessionAttribute("login") CompanyVo comVo) {
	      ModelAndView mv = new ModelAndView();
	      
	      // ComscrapListVo는 스크랩 리스트를 가져오기 위해 만든 Vo   
	      // session에서 id를 가져옴
	      String id = comVo.getId();
	      userVo.setId(id);
	      userVo.setId(id);
	      
	      // 가져온 id를 사용해서 유저 정보를 가져옴
	      userVo = mainMapper.getUser(id);
	      
	      // 가져온 id를 사용해서 ComscrapListVo의 id값을 확정함
	      scrapVo.setCid(id);
	      
	      // ComscrapListVo 정보를 list로 가져옴
	      List<ComscrapListVo> comScrapList = companyMapper.getScrapList(scrapVo);
	      mv.addObject("cid", id);
	      mv.addObject("ScrapList", comScrapList);
	      mv.setViewName("company/myscrap");
	      return mv;
	   }

}
