package com.one.springpj.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.one.springpj.model.Branch;

public interface BookRepository extends JpaRepository<Branch, Long>{

}
