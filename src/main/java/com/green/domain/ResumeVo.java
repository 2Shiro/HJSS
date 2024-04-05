package com.green.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ResumeVo {
	private int resume_idx;
	private String id;
	private String profile;
	private String title;
	private String portfolio;
	private int publish;
	private String self_intro;
	private String created_at;
	private MultipartFile profileFile;

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public MultipartFile getProfileFile() {
		return profileFile;
	}

	public void setProfileFile(MultipartFile profileFile) {
		this.profileFile = profileFile;
	}

}
