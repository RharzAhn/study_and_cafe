package com.one.springpj.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.one.springpj.model.User;
import com.one.springpj.repository.UserRepository;

@Service
public class PrincipalDetailsService implements UserDetailsService{

	@Autowired
	UserRepository userRepository;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		// TODO Auto-generated method stub
		System.out.println("loadUserByUsername()--------");
		User user=userRepository.findByUsername(username);
		
		if(user==null)
			return null;
		
		PrincipalDetails puser=new PrincipalDetails(user);
		
		System.out.println(puser);
		
		return puser;
		
		}
	}