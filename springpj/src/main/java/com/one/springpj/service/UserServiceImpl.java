package com.one.springpj.service;

import java.security.Principal;
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
	public void delete(long id) {
		userRepository.deleteById(id);
	
	}

	@Override
	public void update(User user) {
		userRepository.save(user);
	}


	@Override
	public void userdelete(User user,Principal principal) {
		// TODO Auto-generated method stub
		if(user == principal) {
		userRepository.delete(user);
		}
		
	}

	@Override
	public void userupdate(User user, Principal principal) {
		// TODO Auto-generated method stub
		if(user == principal) {
		userRepository.save(user);
			}
		}

	@Override
	public User findById(Long id) {
		return userRepository.findById(id).get();
	}
	
	}


