package com.green.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
//github.com/2Shiro/HJSS.git
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyVo;
import com.green.domain.CproposalVo;
import com.green.domain.JobpostVo;
import com.green.domain.MainPageVo;
import com.green.domain.Pagination;
import com.green.domain.PagingResponse;
import com.green.domain.PagingVo;
import com.green.domain.PersonInfoVo;
import com.green.domain.PersonScrapVo;
import com.green.domain.PersonVo;
import com.green.domain.PersonscrapListVo;
import com.green.domain.PersonskillVo;
import com.green.domain.PproposalVo;
import com.green.domain.PresumeVo;
import com.green.domain.RecommendPostVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.MainMapper;
import com.green.mapper.PersonMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//github.com/2Shiro/HJSS.git
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Person")
public class PersonController {

	@Autowired
	private MainMapper mainMapper;

	@Autowired
	private PersonMapper personMapper;
	
	@Autowired
	private CompanyMapper companyMapper;
	
	// 개인의 메인페이지
	@RequestMapping("/Pmain")
	public ModelAndView pmain() {
		//JOB_POST_TB 리스트
		List<MainPageVo> mainPageList = new ArrayList<>();
		List<JobpostVo> jobList = companyMapper.getmainpostList();
		
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
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("jobList", jobList);
		mv.addObject("mainPageList", mainPageList);
		//세션별로 바꿔야할듯
		mv.setViewName("/person/pmain");
		return mv;
	}
	
	// 개인의 메인페이지
	@RequestMapping("/Search")
	public ModelAndView search( @RequestParam(value="keyword") String keyword ) {
		//JOB_POST_TB 리스트
		List<MainPageVo> mainPageList = new ArrayList<>();
		List<JobpostVo> jobList = companyMapper.getsearchpostList( keyword );
		
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
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("jobList", jobList);
		mv.addObject("mainPageList", mainPageList);
		//세션별로 바꿔야할듯
		mv.setViewName("/person/pmain");
		return mv;
	}

	//특정 구직자의 특정 공고에 지원하기
	@RequestMapping("/JoinPost")
	public ModelAndView joinPost( @RequestParam HashMap<String, Object> map) {
		//System.out.println("resume_idx" + map);
		String id = (String) map.get("id");
		//System.out.println("id" + id);
		int post_idx = Integer.parseInt((String.valueOf(map.get("post_idx"))));
		//System.out.println("post_idx" + post_idx);
		int resume_idx = Integer.parseInt((String.valueOf(map.get("resume_idx"))));
		//System.out.println("resume_idx" + resume_idx);
		
		//insert MY_PROPOSAL_TB
		personMapper.insertProposal(id, post_idx, resume_idx);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Person/MyProposal");
		return mv;
	}

	@RequestMapping("/MyResume")
	public ModelAndView resume(UserVo userVo, PresumeVo presume, @SessionAttribute("login") PersonVo personVo,
			@RequestParam(value = "nowpage") int nowpage) {
		ModelAndView mv = new ModelAndView();
		String id = personVo.getId();
		userVo.setId(id);
		userVo = mainMapper.getUser(id);
		presume.setId(id);
		List<PresumeVo> list = personMapper.getResumeList(id);

		int count = personMapper.countResume(presume);
		PagingResponse<PresumeVo> response = null;
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

		List<PresumeVo> pagingList = personMapper.getResumePaing(id, offset, pageSize);
		response = new PagingResponse<>(pagingList, pagination);
		System.out.println(response);
		System.out.println(pagingVo.getRecordSize());
		PersonInfoVo info = personMapper.getInfo(id);
		List<SkillVo> skill = mainMapper.getSkillList();
		log.info("nowpage = {}", nowpage);
		mv.addObject("info", info);
		mv.addObject("user", userVo);
		mv.addObject("response", response);
		mv.addObject("pagingVo", pagingVo);
		mv.addObject("nowpage", nowpage);
		mv.addObject("id", id);
		mv.addObject("list", list);
		mv.addObject("skill", skill);
		mv.setViewName("/person/myresume");
		return mv;
	}

	//특정 구직자가 지원한 공고
	   @RequestMapping("/MyProposal")
	   public ModelAndView getProposal(@SessionAttribute("login") PersonVo personVo) {
	      //아이디에 따라 하는 것 추가하기
	      String pid = personVo.getId();
	      //나의 지원 가져오기
	      List<CproposalVo> proposalList = companyMapper.getmyProposal(pid);
	      
	      //지원 전부 가져오기
	      //List<CproposalVo> proposalList = companyMapper.getProposalq();
	      
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
                     status, comment,
                     proposalList.get(i).getId()));
	      }
	      
	      ModelAndView mv = new ModelAndView();
	      mv.addObject("pid", pid);
	      mv.addObject("proposalList", proposalList);
	      mv.addObject("jobpostList", jobpostList);
	      mv.addObject("presumeVo", presumeVo);
	      mv.addObject("pproposalList", pproposalList);
	      mv.setViewName("/person/myproposal");
	      return mv;
	   }

	@RequestMapping("/MyResumeWrite")
	public ModelAndView WriteResume(@RequestParam("skillIdx") List<Integer> skillIdxList, PresumeVo vo, UserVo userVo,
			@RequestParam("file") MultipartFile file, @Value("${file.upload-dir}") String uploadDir) {
		ModelAndView mv = new ModelAndView();

		String id = userVo.getId();
		vo.setId(id);
		if (file != null && !file.isEmpty()) {
			try {
				// 파일 저장 경로 구성
				String baseDir = System.getProperty("user.dir");
				String imagesDirPath = baseDir + uploadDir; // application.properties에서 설정된 값을 사용

				File directory = new File(imagesDirPath);
				if (!directory.exists()) {
					directory.mkdirs();
				}
				DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
				ZonedDateTime current = ZonedDateTime.now();
				String namePattern = current.format(format);

				// 파일의 원래 이름을 가져옵니다.
				String originalFileName = file.getOriginalFilename();
				// 파일 확장자를 추출합니다.
				String extension = "";
				if (originalFileName != null && originalFileName.contains(".")) {
					extension = originalFileName.substring(originalFileName.lastIndexOf("."));
				}

				// System.out.println(namePattern);
				String fileName = namePattern + "_" + originalFileName;
				String filePath = Paths.get(imagesDirPath, fileName).toString();

				// 파일 저장
				Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);

				// 데이터베이스에 저장할 파일 경로 설정
				String relativePath = "/images/" + fileName;
				vo.setProfile(relativePath);

			} catch (IOException e) {
				e.printStackTrace();
				// 에러 처리 로직
			}
		} else {
			// 파일이 선택되지 않았거나 비어 있는 경우, 기본 이미지 경로를 사용
			String relativePath = "/images/default.png";
			vo.setProfile(relativePath);
		}

		personMapper.insertResume(vo); // 이력서 정보 삽입

		// 기술 스킬 정보 삽입
		personMapper.deletepersonskills(userVo);
		for (Integer skillIdx : skillIdxList) {
			PersonskillVo skillVo = new PersonskillVo();
			skillVo.setId(id); // 사용자 ID 설정
			skillVo.setSkill_idx(skillIdx); // 스킬 인덱스 설정
			personMapper.insertskills(skillVo); // 스킬 정보 삽입
		}

		mv.addObject("userVo", userVo); // ModelAndView 객체에 UserVo 객체 추가
		mv.setViewName("redirect:/Person/MyResume?id=" + id + "&nowpage=1"); // 리다이렉트 설정
		return mv; // ModelAndView 반환
	}

	@RequestMapping("/MyResumeDetail")
	public ModelAndView detailResume(PresumeVo presume, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int resume_idx = presume.getResume_idx();
		PresumeVo vo = personMapper.getResume(resume_idx);
		String id = vo.getId();
		PersonInfoVo info = personMapper.getInfo(id);
		List<SkillVo> skill = personMapper.loadskills(id);
		UserVo userVo = mainMapper.getUser(id);

		HttpSession session = request.getSession();
		Object loginYn = session.getAttribute("login");

		if (loginYn instanceof PersonVo) {
			PersonVo sessionVo = (PersonVo) loginYn;
			mv.addObject("sessionVo", sessionVo);
		} else if (loginYn instanceof CompanyVo) {
			CompanyVo sessionVo = (CompanyVo) loginYn;
			log.info("==sessionVo== {}", sessionVo);
			mv.addObject("sessionVo", sessionVo);
		}

		log.info("id = {}", id);
		mv.addObject("info", info);
		mv.addObject("skill", skill);
		mv.addObject("vo", vo);
		mv.addObject("userVo", userVo);
		mv.setViewName("/person/myresumedetail");
		return mv;
	}
	@RequestMapping("/MyResumeEdit")
	public ModelAndView editResume(PresumeVo presume, @SessionAttribute("login") PersonVo personVo) {
		ModelAndView mv = new ModelAndView();
		int resume_idx = presume.getResume_idx();
		PresumeVo vo = personMapper.getResume(resume_idx);

		String id = personVo.getId();
		PersonInfoVo info = personMapper.getInfo(id);

		List<SkillVo> userSkills = personMapper.loadskills(id); // 유저의 기술스택 리스트

		List<SkillVo> allSkills = mainMapper.getSkillList(); // 스킬 테이블에 있는 모든 기술 목록들
		UserVo userVo = mainMapper.getUser(id);
		mv.addObject("id", id);
		mv.addObject("vo", vo);
		mv.addObject("info", info);
		mv.addObject("allSkills", allSkills);
		mv.addObject("userSkills", userSkills);
		mv.addObject("userVo", userVo);
		mv.setViewName("/person/myresumeedit");
		return mv;
	}


	@RequestMapping("/MyResumeUpdate")
	public ModelAndView updateResume(@RequestParam("skillIdx") List<Integer> skillIdxList, PresumeVo vo, UserVo userVo,
			@RequestParam("file") MultipartFile file, @Value("${file.upload-dir}") String uploadDir,
			@SessionAttribute("login") PersonVo personVo) {
		ModelAndView mv = new ModelAndView();
		String id = personVo.getId();
		vo.setId(id);
		userVo.setId(id);
		if (file != null && !file.isEmpty()) {
			try {
				// 파일 저장 경로 구성
				String baseDir = System.getProperty("user.dir");
				String imagesDirPath = baseDir + uploadDir; // application.properties에서 설정된 값을 사용

				File directory = new File(imagesDirPath);
				if (!directory.exists()) {
					directory.mkdirs();
				}
				DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyyMMdd");
				ZonedDateTime current = ZonedDateTime.now();
				String namePattern = current.format(format);

				// 파일의 원래 이름을 가져옵니다.
				String originalFileName = file.getOriginalFilename();
				// 파일 확장자를 추출합니다.
				String extension = "";
				if (originalFileName != null && originalFileName.contains(".")) {
					extension = originalFileName.substring(originalFileName.lastIndexOf("."));
				}

				// System.out.println(namePattern);
				String fileName = namePattern + "_" + originalFileName;
				String filePath = Paths.get(imagesDirPath, fileName).toString();

				// 파일 저장
				Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);

				// 데이터베이스에 저장할 파일 경로 설정
				String relativePath = "/images/" + fileName;
				vo.setProfile(relativePath);

			} catch (IOException e) {
				e.printStackTrace();
				// 에러 처리 로직
			}
		} else {
			// 파일이 선택되지 않았거나 비어 있는 경우, 기본 이미지 경로를 사용
			String relativePath = "/images/default.png";
			vo.setProfile(relativePath);
		}

		personMapper.updateResume(vo); // 이력서 정보 삽입
		// 기술 스킬 정보 삽입
		personMapper.deletepersonskills(userVo);

		for (Integer skillIdx : skillIdxList) {
			PersonskillVo skillVo = new PersonskillVo();
			skillVo.setId(id); // 사용자 ID 설정
			skillVo.setSkill_idx(skillIdx); // 스킬 인덱스 설정
			personMapper.insertskills(skillVo); // 스킬 정보 삽입
		}
		mv.addObject("userVo", userVo); // ModelAndView 객체에 UserVo 객체 추가
		mv.setViewName("redirect:/Person/MyResume?id=" + id + "&nowpage=1"); // 리다이렉트 설정
		return mv; // ModelAndView 반환
	}

	@RequestMapping("/MyResumeDelete")
	public ModelAndView resumeDelete(PresumeVo presume, @SessionAttribute("login") PersonVo personVo) {
		ModelAndView mv = new ModelAndView();
		String id = personVo.getId();
		personMapper.resumeDelete(presume);
		mv.setViewName("redirect:/Person/MyResume?id=" + id + "&nowpage=1");
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
      String id = userVo.getId();
      List<SkillVo> skill = personMapper.loadskills(id);
      ModelAndView mv = new ModelAndView();
      mv.addObject("presumeVo", presumeVo);
      mv.addObject("skill", skill);
      mv.addObject("psuerVo", psuerVo);
      mv.addObject("userVo", userVo);
      mv.setViewName("/person/popresume");
      return mv;
   }
   
	@RequestMapping("/Pass")
	public String pass(@RequestParam(value="resume_idx") int resume_idx, @RequestParam(value="status") int status) {
		//System.out.println("상태" + resume_idx);
		personMapper.updateResumePass(resume_idx, status);
		
		//System.out.println(status);
		
		return "/person/updateok";
	}

	// /Person/Mypage
	@RequestMapping("/Mypage")
	public ModelAndView mypage(@SessionAttribute("login") PersonVo personVo) {

		PersonVo vo = personMapper.getPerson(personVo);

		log.info("vo : {}", vo);

		ModelAndView mv = new ModelAndView();

		mv.addObject("vo", vo);
		mv.setViewName("/person/mypage");
		return mv;

	}
   
   // /Person/UpdateForm
   @RequestMapping("/UpdateForm")
   public ModelAndView updateForm( PersonVo personVo ) {
      
      PersonVo vo = personMapper.getPerson( personVo );
      
      ModelAndView mv = new ModelAndView();
      mv.addObject("vo", vo);
      mv.setViewName("person/mypageUpdate");
      
      return mv;
   }
   
   // /Person/Update
   @RequestMapping("/Update")
   public ModelAndView update( PersonVo personVo ) {
      
      personMapper.updatePerson( personVo );
      personMapper.updateUser( personVo );
      
      ModelAndView mv = new ModelAndView();
      mv.setViewName("redirect:/Person/Mypage");
      return mv;
   }
   
   // /Person/DeleteForm
   @RequestMapping("/DeleteForm")
   public ModelAndView deleteForm( PersonVo personVo ) {
      
      PersonVo vo = personMapper.getPerson( personVo );
      
      ModelAndView mv = new ModelAndView();
      mv.addObject("vo", vo);
      mv.setViewName("/person/delete");
      return mv;
   }
   
   // /Person/Delete
   @RequestMapping("/Delete")
   public ModelAndView delete( PersonVo personVo, HttpSession session) {
      
      personMapper.deletePerson( personVo );
      personMapper.deleteUser( personVo );
         
      ModelAndView mv = new ModelAndView();
      session.invalidate();
      mv.setViewName("redirect:/");
      
      return mv;
   }


	// 개인회원 로그인폼
	@RequestMapping("/LoginForm")
	public ModelAndView loginForm() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("person/login");

		return mv;
	}

	// 개인회원 로그인
	@PostMapping("/Login")
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
			session.setAttribute("isLoggedIn", true);
			mv.setViewName("redirect:/Person/Pmain");

		} else {// 로그인 실패시
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8;");
			out.println("<script> alert('Please check your ID password');");
			out.println("history.go(-1); </script>");
			out.close();
			mv.setViewName("redirect:/Person/Login");
		}
		return mv;
	}

	// /Person/JoinForm
	@RequestMapping("/JoinForm")
	public ModelAndView personJoinForm() {
		ModelAndView mv = new ModelAndView();

		LocalDateTime today = LocalDateTime.now();
		String now = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		DayOfWeek day = today.getDayOfWeek();
		now += " " + day;
		mv.addObject("now", now);

		mv.setViewName("person/join");
		return mv;
	}

	@RequestMapping("/Join")
	public ModelAndView join(PersonVo personVo) {
		// System.out.println("개인회원" + personVo);
		personMapper.insert(personVo);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");

		return mv;
	}

	@ResponseBody
	@RequestMapping("/Recommend")
	public ModelAndView recommend(@SessionAttribute("login") PersonVo personVo, UserVo userVo, JobpostVo jobpostVo,
			@RequestParam(value = "nowpage") int nowpage) {

		ModelAndView mv = new ModelAndView();

		// session에서 id를 가져옴
		String id = personVo.getId();
		userVo.setId(id);

		// 가져온 id를 통해 유저 정보를 가져옴
		userVo = mainMapper.getUser(id);

		// 회사의 공고 목록을 가져옵니다.
		List<RecommendPostVo> jobPosts = personMapper.recommendPost(id);

		SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat targetFormat = new SimpleDateFormat("MM/dd(E)", new Locale("ko", "KR"));

		// 마감기한 문자열 바꾸기
		for (RecommendPostVo post : jobPosts) {
			String deadlineStr = post.getDeadline(); // 기존 문자열 형태의 deadline
			try {
				Date deadline = originalFormat.parse(deadlineStr); // 문자열을 Date로 파싱
				String formattedDeadline = targetFormat.format(deadline); // 원하는 형식으로 변환
				post.setDeadline(formattedDeadline); // 변환된 문자열을 다시 저장
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		// 페이징 설정
		int count = personMapper.countRecommendPost(jobpostVo);
		PagingResponse<RecommendPostVo> response = null;
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

		List<RecommendPostVo> pagingList = personMapper.getRecommendPaing(id, offset, pageSize);
		response = new PagingResponse<>(pagingList, pagination);

		log.info("pagingVo = {}", pagingVo);
		mv.addObject("response", response);
		mv.addObject("pagingVo", pagingVo);
		mv.addObject("nowpage", nowpage);
		mv.addObject("pid", id);
		mv.addObject("jobPosts", jobPosts);
		mv.setViewName("/person/recommend");
		return mv;
	}

	@RequestMapping("/ScrapAdd")
	public ResponseEntity<?> addScrap(@RequestBody PersonScrapVo scrapvo) {
		try {
			personMapper.insertScrap(scrapvo);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("스크랩 추가에 실패했습니다.");
		}
	}

	@RequestMapping("/ScrapDelete")
	public ResponseEntity<?> deleteScrap(@RequestParam("post_idx") int post_idx) {
		try {
			personMapper.deleteScrap(post_idx);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("스크랩 삭제에 실패했습니다.");
		}
	}

	@RequestMapping("/CheckScrap")
	public ResponseEntity<?> checkScrap(@RequestParam("post_idx") int post_idx, @RequestParam("pid") String pid) {
		int scarapCount = personMapper.countScrap(pid, post_idx);
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
	public ModelAndView myScrap(PersonscrapListVo scrapVo, UserVo userVo,
			@SessionAttribute("login") PersonVo personVo) {
		ModelAndView mv = new ModelAndView();

		// ComscrapListVo는 스크랩 리스트를 가져오기 위해 만든 Vo
		// session에서 id를 가져옴
		String id = personVo.getId();
		userVo.setId(id);

		// 가져온 id를 사용해서 유저 정보를 가져옴
		userVo = mainMapper.getUser(id);

		// 가져온 id를 사용해서 ComscrapListVo의 id값을 확정함
		scrapVo.setPid(id);

		// ComscrapListVo 정보를 list로 가져옴
		List<PersonscrapListVo> personScrapList = personMapper.getScrapList(scrapVo);
		mv.addObject("pid", id);
		mv.addObject("ScrapList", personScrapList);
		mv.setViewName("person/myscrap");
		return mv;
	}
}
