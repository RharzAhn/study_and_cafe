package com.one.springpj.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.springpj.model.Cafe;
import com.one.springpj.repository.CafeRepository;

@Service
public class CafeServiceImpl implements CafeService{
	
	@Autowired
	private CafeRepository cafeRepository;

//	@Transactional
	@Override
	public void insert(Cafe cafe) {
		// TODO Auto-generated method stub
		cafeRepository.save(cafe);
		
	}
	@Override
	public List<Cafe> cafeList(){
		return cafeRepository.findAll();
	}
//	@Transactional
	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		cafeRepository.deleteById(id);
		
	}

}
