package com.one.springpj.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.one.springpj.model.Branch;

public interface BranchRepository extends JpaRepository<Branch, Long>{
	@Query(value="select max(id) from branch", nativeQuery = true)
	public Long countMax();
}
