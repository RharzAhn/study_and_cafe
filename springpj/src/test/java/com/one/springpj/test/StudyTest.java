package com.one.springpj.test;

import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

import com.one.springpj.model.Joiner;
import com.one.springpj.repository.JoinerRepository;

@SpringBootTest
@TestPropertySource(locations = "classpath:application.properties")
public class StudyTest {
	@Autowired
	JoinerRepository joinerRepository;
	
//	@Test
	void load() {
//		studyRepository.findByJoinUser((long) 1);
//		System.out.println(joinerRepository.findJoinUserList((long)1));
		List<Joiner> list = joinerRepository.findAll();
		for (Joiner l:list) {
			System.out.println(l);
		}
		System.out.println();
	}
}
