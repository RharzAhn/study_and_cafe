package com.one.springpj.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.one.springpj.model.Branch;

public interface BranchRepository extends JpaRepository<Branch, Long>{

}
