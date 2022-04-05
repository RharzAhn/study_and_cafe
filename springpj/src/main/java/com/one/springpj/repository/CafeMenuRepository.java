package com.one.springpj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.one.springpj.model.Branch;
import com.one.springpj.model.CafeMenu;

public interface CafeMenuRepository extends JpaRepository<CafeMenu, Long>{
	public List<CafeMenu> findByBranch(Branch branch);
}
