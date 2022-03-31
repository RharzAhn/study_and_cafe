package com.one.springpj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import com.one.springpj.model.User;

public interface UserService {
	
	public void register(User user);

	public User findByUsername(String username);

	
	
}
