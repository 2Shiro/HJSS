package com.green.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.CompanyVo;
import com.green.domain.CproposalVo;
import com.green.domain.JobpostVo;
import com.green.domain.MainPageVo;
import com.green.domain.PersonInfoVo;

import com.green.domain.PersonVo;
import com.green.domain.PersonskillVo;
import com.green.domain.PproposalVo;
import com.green.domain.PresumeVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;
import com.green.mapper.CompanyMapper;
import com.green.mapper.MainMapper;

import com.green.mapper.PersonMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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

	// 구직자의 메인페이지

	@RequestMapping("/Pmain")
	public ModelAndView pmain() {
		// JOB_POST_TB 리스트
		List<MainPageVo> mainPageList = new ArrayList<>();
		List<JobpostVo> jobList = companyMapper.getmainpostList();

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

		ModelAndView mv = new ModelAndView();
		mv.addObject("jobList", jobList);
		mv.addObject("mainPageList", mainPageList);
		// 세션별로 바꿔야할듯
		mv.setViewName("/person/pmain");
		return mv;
	}

	// 특정 구직자의 특정 공고에 지원하기
	@RequestMapping("/JoinPost")
	public ModelAndView joinPost(@RequestParam HashMap<String, Object> map) {
		// System.out.println("resume_idx" + map);
		String id = (String) map.get("id");
		// System.out.println("id" + id);
		int post_idx = Integer.parseInt((String.valueOf(map.get("post_idx"))));
		// System.out.println("post_idx" + post_idx);
		int resume_idx = Integer.parseInt((String.valueOf(map.get("resume_idx"))));
		// System.out.println("resume_idx" + resume_idx);

		// insert MY_PROPOSAL_TB
		personMapper.insertProposal(id, post_idx, resume_idx);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Person/MyProposal");
		return mv;
	}

	@RequestMapping("/MyResume")
	public ModelAndView resume(UserVo userVo, PresumeVo presume, @SessionAttribute("login") PersonVo personVo) {
		ModelAndView mv = new ModelAndView();
		String id = personVo.getId();
		userVo.setId(id);
		userVo = mainMapper.getUser(id);
		presume.setId(id);
		List<PresumeVo> list = personMapper.getResumeList(id);
		PersonInfoVo info = personMapper.getInfo(id);
		List<SkillVo> skill = mainMapper.getSkillList();
		mv.addObject("info", info);
		mv.addObject("user", userVo);
		mv.addObject("id", id);
		mv.addObject("list", list);
		mv.addObject("skill", skill);
		mv.setViewName("/person/myresume");
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

				String fileName = file.getOriginalFilename();
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
		mv.setViewName("redirect:/Person/MyResume"); // 리다이렉트 설정
		return mv; // ModelAndView 반환
	}

	@RequestMapping("/MyResumeDetail")
	public ModelAndView detailResume(PresumeVo presume) {
		ModelAndView mv = new ModelAndView();
		int resume_idx = presume.getResume_idx();
		PresumeVo vo = personMapper.getResume(resume_idx);
		String id = vo.getId();
		PersonInfoVo info = personMapper.getInfo(id);
		List<SkillVo> skill = personMapper.loadskills(id);
		UserVo userVo = mainMapper.getUser(id);
		mv.addObject("info", info);
		mv.addObject("skill", skill);
		mv.addObject("vo", vo);
		mv.addObject("userVo", userVo);
		mv.setViewName("/person/myresumedetail");
		return mv;
	}

	@RequestMapping("/MyResumeEdit")
	public ModelAndView editResume(PresumeVo presume) {
		ModelAndView mv = new ModelAndView();
		int resume_idx = presume.getResume_idx();
		PresumeVo vo = personMapper.getResume(resume_idx);
		String id = vo.getId();
		PersonInfoVo info = personMapper.getInfo(id);
		List<SkillVo> userSkills = personMapper.loadskills(id); // 유저의 기술스택 리스트
		List<SkillVo> allSkills = mainMapper.getSkillList(); // 스킬 테이블에 있는 모든 기술 목록들
		UserVo userVo = mainMapper.getUser(id);
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
				// System.out.println(namePattern);
				String fileName = file.getOriginalFilename();
				String filePath = Paths.get(imagesDirPath, fileName).toString();

				// 파일 저장
				Files.copy(file.getInputStream(), Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);

				// 데이터베이스에 저장할 파일 경로 설정
				String relativePath = "/images/" + namePattern + fileName;
				vo.setProfile(relativePath);

			} catch (IOException e) {
				e.printStackTrace();
				// 에러 처리 로직
			}
		} else {
			// 파일이 선택되지 않았거나 비어 있는 경우, 기존 이미지 경로를 사용
			String relativePath = vo.getProfile();
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
		mv.setViewName("redirect:/Person/MyResume"); // 리다이렉트 설정
		return mv; // ModelAndView 반환
	}

	@RequestMapping("/MyResumeDelete")
	public ModelAndView resumeDelete(PresumeVo presume) {
		ModelAndView mv = new ModelAndView();
		personMapper.resumeDelete(presume);
		mv.setViewName("redirect:/Person/MyResume");
		return mv;
	}

	// 특정 구직자가 지원한 공고
	@RequestMapping("/MyProposal")
	public ModelAndView getProposal() {
		// 아이디에 따라 하는 것 추가하기
		// 지원 전부 가져오기
		List<CproposalVo> proposalList = companyMapper.getProposal();

		// 공고 정보 가져오기
		List<JobpostVo> jobpostList = new ArrayList<>();
		for (int i = 0; i < proposalList.size(); i++) {
			JobpostVo vo = companyMapper.getpostName(proposalList.get(i).getPost_idx());
			jobpostList.add(new JobpostVo(vo.getPost_idx(), vo.getId(), vo.getPost_name(), vo.getCareer(),
					vo.getJob_type(), vo.getPay(), vo.getGo_work(), vo.getGo_home(), vo.getDeadline(),
					vo.getJob_intro(), vo.getC_intro(), vo.getCreated_date()));
		}

		// 이력서 가져오기
		List<PresumeVo> presumeVo = new ArrayList<>();
		for (int i = 0; i < proposalList.size(); i++) {
			int resume_idx = proposalList.get(i).getResume_idx();
			PresumeVo vo = personMapper.getResume(resume_idx);
			presumeVo.add(vo);
		}

		// 필요한 정보를 담은 리스트
		List<PproposalVo> pproposalList = new ArrayList<>();
		for (int i = 0; i < proposalList.size(); i++) {
			// comment를 굳이 테이블에서 가져와?
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
			pproposalList.add(new PproposalVo(proposalList.get(i).getPost_idx(), jobpostList.get(i).getPost_name(),
					jobpostList.get(i).getDeadline(), proposalList.get(i).getResume_idx(), presumeVo.get(i).getTitle(),
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

	// 이력서 가져오기

	@RequestMapping("/GetResume")
	public ModelAndView getResume(PresumeVo presume) {
		int resume_idx = presume.getResume_idx();
		// System.out.println(resume_idx);
		PresumeVo presumeVo = personMapper.getResume(resume_idx);
		// System.out.println("이력서" + presumeVo);
		PersonVo psuerVo = personMapper.getPuser(presumeVo.getId());
		UserVo userVo = personMapper.getUser(presumeVo.getId());
		// System.out.println("유저: " + userVo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("presumeVo", presumeVo);
		mv.addObject("psuerVo", psuerVo);
		mv.addObject("userVo", userVo);
		mv.setViewName("/person/popresume");
		return mv;
	}

	@RequestMapping("/Pass")
	public String pass(@RequestParam(value = "resume_idx") int resume_idx, @RequestParam(value = "status") int status) {
		// System.out.println("상태" + resume_idx);
		personMapper.updateResumePass(resume_idx, status);

		// System.out.println(status);

		return "/person/updateok";
	}

	// /Person/Mypage
	@RequestMapping("/Mypage")
	public ModelAndView mypage(@SessionAttribute("login") PersonVo personVo) {

		PersonVo vo = personMapper.getPerson(personVo);

		ModelAndView mv = new ModelAndView();

		mv.addObject("vo", vo);
		mv.setViewName("/person/mypage");
		return mv;

	}

	// /Person/UpdateForm
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(PersonVo personVo) {

		PersonVo vo = personMapper.getPerson(personVo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("person/mypageUpdate");

		return mv;
	}

	// /Person/Update
	@RequestMapping("/Update")
	public ModelAndView update(PersonVo personVo) {

		personMapper.updatePerson(personVo);
		personMapper.updateUser(personVo);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Person/Mypage");
		return mv;
	}

	// /Person/DeleteForm
	@RequestMapping("/DeleteForm")
	public ModelAndView deleteForm(PersonVo personVo) {

		PersonVo vo = personMapper.getPerson(personVo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/person/delete");
		return mv;
	}

	// /Person/DeleteForm
	@RequestMapping("/Delete")
	public ModelAndView delete(PersonVo personVo) {
		personMapper.deletePerson(personVo);
		personMapper.deleteUser(personVo);

		ModelAndView mv = new ModelAndView();

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
			mv.setViewName("person/pmain");

		} else {// 로그인 실패시
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8;");
			out.println("<script> alert('Please check your ID password');");
			out.println("history.go(-1); </script>");
			out.close();
			mv.setViewName("person/login");
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

}
