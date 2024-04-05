package com.green.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.green.domain.PersonInfoVo;
import com.green.domain.PersonskillVo;
import com.green.domain.ResumeVo;
import com.green.domain.SkillVo;
import com.green.domain.UserVo;
import com.green.mapper.MainMapper;
import com.green.mapper.PersonMapper;

@Controller
@RequestMapping("/Person")
public class PersonController {

	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	private MainMapper mainMapper;

	@Autowired
	private PersonMapper personMapper;

	@RequestMapping("/MyProposal")
	public ModelAndView getProposal() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/person/myproposal");
		return mv;
	}

	@RequestMapping("/Resume")
	public ModelAndView resume(UserVo userVo, ResumeVo vo) {
		ModelAndView mv = new ModelAndView();
		String id = "";
		id = "ps1";
		userVo.setId(id);
		userVo = mainMapper.getUser(id);
		vo.setId(id);
		List<ResumeVo> list = personMapper.getresumeList(vo);
		PersonInfoVo info = personMapper.getInfo(id);
		List<SkillVo> skill = mainMapper.getSkillList();
		mv.addObject("info", info);
		mv.addObject("user", userVo);
		mv.addObject("id", id);
		mv.addObject("list", list);
		mv.addObject("skill", skill);
		mv.setViewName("/person/resume");
		return mv;
	}

	@RequestMapping("/InsertResume")
	public ModelAndView insertResume(@RequestParam("skillIdx") List<Integer> skillIdxList, ResumeVo vo, UserVo userVo,
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
		mv.setViewName("redirect:/Person/Resume"); // 리다이렉트 설정
		return mv; // ModelAndView 반환
	}

	@RequestMapping("/ResumeDetail")
	public ModelAndView resumeDetail(ResumeVo resumeVo) {
		ModelAndView mv = new ModelAndView();
		ResumeVo vo = personMapper.viewResume(resumeVo);
		String id = vo.getId();
		PersonInfoVo info = personMapper.getInfo(id);
		UserVo userVo = mainMapper.getUser(id);
		List<SkillVo> skill = personMapper.loadskills(id);
		mv.addObject("info", info);
		mv.addObject("skill", skill);
		mv.addObject("vo", vo);
		mv.addObject("userVo", userVo);
		mv.setViewName("/person/resumeDetail");
		return mv;
	}

	@RequestMapping("/ResumeUpdate")
	public ModelAndView resumeUpdate(ResumeVo resumeVo) {
		ModelAndView mv = new ModelAndView();
		ResumeVo vo = personMapper.viewResume(resumeVo);
		mv.addObject("vo", vo);
		mv.setViewName("/person/resumeUpdate");
		return mv;
	}

	@RequestMapping("/ResumeDelete")
	public ModelAndView resumeDelete(ResumeVo resumeVo) {
		ModelAndView mv = new ModelAndView();
		personMapper.resumeDelete(resumeVo);
		mv.setViewName("redirect:/Person/Resume");
		return mv;
	}
}
