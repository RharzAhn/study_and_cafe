package com.one.springpj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.one.springpj.constant.MenuType;
import com.one.springpj.model.Menu;

public interface MenuRepository extends JpaRepository<Menu, Long>{

	public List<Menu> findByMenuType(MenuType menuType);
	
}
