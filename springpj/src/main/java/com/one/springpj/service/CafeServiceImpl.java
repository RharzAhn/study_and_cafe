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
	
	@Override
	public Cafe findById(Long id) {
		Cafe cafe = cafeRepository.findById(id).get();
		return cafe;
	}
	
	@Override
	public void update(Cafe cafe) {
		Cafe c = cafeRepository.findById(cafe.getId()).get();
		c.setName(cafe.getName());
		c.setAddr(cafe.getAddr());
		c.setPhone(cafe.getPhone());
		cafeRepository.save(c);
	}
	

}
