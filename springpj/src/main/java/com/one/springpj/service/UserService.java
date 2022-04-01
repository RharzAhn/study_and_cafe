package com.one.springpj.service;

import java.util.List;

import com.one.springpj.model.User;

public interface UserService {
	
	public void register(User user);

	public User findByUsername(String username);

	public List<User> getUserlist();
	
	public void delete(Long id);
	
	public void update(User user);
}
