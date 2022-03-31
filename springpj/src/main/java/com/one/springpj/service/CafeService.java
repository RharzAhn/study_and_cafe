package com.one.springpj.service;

import java.util.List;

import com.one.springpj.model.Cafe;

public interface CafeService {
	
	public void insert(Cafe cafe);

	List<Cafe> cafeList();

	public void delete(Long id);

	Cafe findById(Long id);

	void update(Cafe cafe);

}
