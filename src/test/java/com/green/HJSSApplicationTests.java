package com.green;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.green.domain.PersonVo;
import com.green.mapper.PersonMapper;

@SpringBootTest
class HJSSApplicationTests {
	@Autowired
	private DataSource ds;
	@Autowired
	private PersonMapper mapper;
	@Test
	void testInsert() {
		
		PersonVo vo = new PersonVo();
		vo.setId("ps16");
		vo.setPassword("1234");
		vo.setPname("person16");
		vo.setPhone("010-1616-1616");
		vo.setAddress("서울특별시");
		vo.setBirth("99/02/08");
		vo.setUser_email("person16@email.com");
		mapper.insert(vo);
		System.out.println("저장");

	}
}