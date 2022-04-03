package com.one.springpj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.springpj.repository.StudyRepository;

@Service
public class StudyGroupServiceImpl implements StudyGroupService {
	
	@Autowired
	private StudyRepository studyRepository;
	

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		studyRepository.deleteById(id);
		
	}

}
