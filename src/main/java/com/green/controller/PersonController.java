package com.green.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
//github.com/2Shiro/HJSS.git
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.PersonInfoVo;
import com.green.domain.PersonVo;
import com.green.domain.PersonskillVo;
import com.green.domain.PresumeVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;
import com.green.mapper.MainMapper;
import com.green.mapper.PersonMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Person")
public class PersonController {

	@Autowired
	private ResourceLoader resourceLoader;

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
		id = "ps1";
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
	public ModelAndView insertResume(@RequestParam("skillIdx") List<Integer> skillIdxList, PresumeVo vo, UserVo userVo,
			@RequestParam("file") MultipartFile file) {
		ModelAndView mv = new ModelAndView();

		String id = userVo.getId();
		vo.setId(id);
		if (file != null && !file.isEmpty()) {
			try {
				// 파일 저장 경로 생성
				Resource resource = resourceLoader.getResource("classpath:/static/images/");
				File directory = resource.getFile();

				if (!directory.exists()) {
					directory.mkdirs(); // 디렉토리가 없다면 생성
				}

				Path path = Paths.get(directory.getAbsolutePath()).resolve(file.getOriginalFilename());
				// 파일 저장
				Files.write(path, file.getBytes());

				String fileName = file.getOriginalFilename();
				String relativepath = "/images/";
				String filePathString = relativepath + fileName;
				vo.setProfile(filePathString);

			} catch (IOException e) {
				e.printStackTrace();
				// 에러 발생 시 처리 로직
			}
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
	public ModelAndView resumeDetail(PresumeVo presume) {
		ModelAndView mv = new ModelAndView();
		int resume_idx = presume.getResume_idx();
		PresumeVo vo = personMapper.getResume(resume_idx);
		String id = vo.getId();
		PersonInfoVo info = personMapper.getInfo(id);
		UserVo userVo = mainMapper.getUser(id);
		List<SkillVo> skill = personMapper.loadskills(id);
		mv.addObject("info", info);
		mv.addObject("skill", skill);
		mv.addObject("vo", vo);
		mv.addObject("userVo", userVo);
		mv.setViewName("/person/myresumedetail");
		return mv;
	}

	@RequestMapping("/MyResumeEdit")
	public ModelAndView resumeUpdate(PresumeVo presume) {
		ModelAndView mv = new ModelAndView();
		int resume_idx = presume.getResume_idx();
		PresumeVo vo = personMapper.getResume(resume_idx);
		mv.addObject("vo", vo);
		mv.setViewName("/person/myresumeupdate");
		return mv;
	}

	@RequestMapping("/MyResumeDelete")
	public ModelAndView resumeDelete(PresumeVo presume) {
		ModelAndView mv = new ModelAndView();
		personMapper.resumeDelete(presume);
		mv.setViewName("redirect:/Person/MyResume");
		return mv;
	}

	@RequestMapping("/MyProposal")
	public ModelAndView getProposal() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/myproposal");
		return mv;
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
