package com.one.springpj.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.one.springpj.model.User;



public interface UserRepository extends JpaRepository<User, Long> {
	
	public User findByUsername(String username);
}
