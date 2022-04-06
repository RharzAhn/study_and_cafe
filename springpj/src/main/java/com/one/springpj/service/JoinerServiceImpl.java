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
		return joinerRepository.findJoinUserList(id,joinStatus.toString());
	}

	@Override
	public List<Joiner> findApplyUser(Long leaderId) {
		return joinerRepository.findApplyUser(leaderId);
	}

	@Override
	public Joiner findById(Long id) {
		return joinerRepository.getById(id);
		
	}
	@Override
	public void update(Joiner joiner) {
		joinerRepository.save(joiner);
	}

	@Override
	public int joinCheck(Long id, JoinStatus joinStatus, Long studyId) {
		 return joinerRepository.joinCheck(id, joinStatus.toString(), studyId);
	}
}
