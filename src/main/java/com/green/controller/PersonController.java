package com.green.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
//github.com/2Shiro/HJSS.git
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
//github.com/2Shiro/HJSS.git
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.PersonInfoVo;
//github.com/2Shiro/HJSS.git
import com.green.domain.PersonVo;
import com.green.domain.PersonskillVo;
import com.green.domain.PresumeVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;
import com.green.mapper.MainMapper;
//github.com/2Shiro/HJSS.git
import com.green.mapper.PersonMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Person")
public class PersonController {

	@Autowired
	private Environment env; // application.properties에 접근하기 위한 Environment 객체

	@Autowired
	private MainMapper mainMapper;

	@Autowired
	private PersonMapper personMapper;

	@RequestMapping("/Pmain")
	public String pmain() {

		return "/person/pmain";
	}

	@RequestMapping("/MyResume")
	public ModelAndView resume(UserVo userVo, PresumeVo presume) {
		ModelAndView mv = new ModelAndView();
		String id = "";
		id = "ps2";
		userVo.setId(id);
		userVo = mainMapper.getUser(id);
		presume.setId(id);
		List<PresumeVo> list = personMapper.getresumeList(presume);
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
		    // 파일이 선택되지 않았거나 비어 있는 경우, 기존 이미지 경로를 사용
		    String relativePath = vo.getPortfolio();
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

	//특정 구직자가 지원한 공고
	@RequestMapping("/MyProposal")
	public ModelAndView getProposal() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/myproposal");
		return mv;
	}

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

	@RequestMapping("/Mypage")
	public ModelAndView mypage(PersonVo personVo) {

		PersonVo vo = personMapper.getPerson(personVo);

		log.info("vo : {}", vo);

		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("/person/mypage");
		return mv;

	}

	@RequestMapping("/joinForm")
	public ModelAndView joinForm() {
		ModelAndView mv = new ModelAndView();

		LocalDateTime today = LocalDateTime.now();
		String now = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		DayOfWeek day = today.getDayOfWeek();
		now += " " + day;
		mv.addObject("now", now);

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
