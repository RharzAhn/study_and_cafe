package com.one.springpj.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.one.springpj.model.Study;

public interface StudyRepository extends JpaRepository<Study, Long>{
	
}
