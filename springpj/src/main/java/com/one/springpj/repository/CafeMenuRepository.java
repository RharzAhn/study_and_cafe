package com.one.springpj.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.one.springpj.model.CafeMenu;

public interface CafeMenuRepository extends JpaRepository<CafeMenu, Long>{

}
