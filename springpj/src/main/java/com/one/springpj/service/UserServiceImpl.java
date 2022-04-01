package com.one.springpj.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.one.springpj.model.User;
import com.one.springpj.repository.UserRepository;

import lombok.extern.java.Log;


@Service
@Log
public class UserServiceImpl implements UserService{

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public void register(User user) {
		userRepository.save(user);
	}

	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return userRepository.findByUsername(username);
	}

	@Override
	public List<User> getUserlist() {
		// TODO Auto-generated method stub
		return userRepository.findAll();
	}
	
	@Override
	public void delete(Long id) {
		userRepository.deleteById(id);
	}

	@Override
	public void update(User user) {
		userRepository.save(user);
	}
	
}
