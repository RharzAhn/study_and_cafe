package com.one.springpj.service;

import java.security.Principal;
import java.util.List;

import com.one.springpj.model.User;

public interface UserService {
	
	public void register(User user);

	public User findByUsername(String username);
	
	public User findById(Long id);
	
	public List<User> getUserlist();
	public void delete(long id);
	
	public void update(User user);

	
	void userdelete(User user, Principal principal);

	void userupdate(User user, Principal principal);

	
	

	
}
