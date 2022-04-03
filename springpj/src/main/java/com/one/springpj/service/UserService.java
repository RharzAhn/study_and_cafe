package com.one.springpj.service;

import com.one.springpj.model.User;

public interface UserService {
	
	public void register(User user);

	public User findByUsername(String username);
	
	public User findById(Long id);

	
}
