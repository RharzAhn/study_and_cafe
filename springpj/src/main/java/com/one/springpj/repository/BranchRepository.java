package com.one.springpj.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.one.springpj.model.Branch;
import com.one.springpj.model.User;

public interface BranchRepository extends JpaRepository<Branch, Long>{
	public Branch findByManager(User user);
}
