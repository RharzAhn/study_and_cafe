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
		User u = userRepository.findByUsername(user.getUsername());//findbyid처럼 jpa에서 제공되는 함수가아닌 정의한함수는 .get() 할필요X
		log.info("========================"+u.getRole());
		log.info("========================"+u.getUsername());
		log.info("========================"+u.getEmail());
		u.setProfile(user.getProfile());
		
		u.setNick(user.getNick());
		u.setAddr(user.getAddr());
		u.setEmail(user.getEmail());
		userRepository.save(u);
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


