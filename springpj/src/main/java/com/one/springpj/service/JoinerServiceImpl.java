package com.one.springpj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.springpj.constant.JoinStatus;
import com.one.springpj.model.Joiner;
import com.one.springpj.repository.JoinerRepository;

@Service
public class JoinerServiceImpl implements JoinerService{
	
	@Autowired
	JoinerRepository joinerRepository;
	
	@Override
	public void insert(Joiner joiner) {
		joinerRepository.save(joiner);
		
	}

	@Override
	public List<Joiner> findJoinUserList(Long id, JoinStatus joinStatus) {
		return joinerRepository.findJoinUserList(id);
	}
	
}
