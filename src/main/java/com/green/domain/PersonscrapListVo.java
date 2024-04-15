package com.green.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PersonscrapListVo {

	private int post_idx; // 게시물 인덱스
	private String pid; // 개인 식별자
	private String post_name; // 게시물 이름
	private String skills; // 기술 스택, 문자열 형태로 여러 기술이 연결되어 있음
	private String cname; // 회사 이름
	private String id;

}
