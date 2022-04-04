package com.one.springpj.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.springpj.constant.MenuType;
import com.one.springpj.model.Menu;
import com.one.springpj.service.BranchService;
import com.one.springpj.service.MenuService;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/manager/")
public class ManagerController {
	
	@Autowired
	private MenuService menuService;
	
	@GetMapping("manager")
	public void managerPage() {
		
	}
	
	@GetMapping("management")
	public void managementPage() {
		
	}
	
	@GetMapping("menuStatuse")
	public void menuStatusePage() {
		
	}
	
	@GetMapping("branchMenu")
	public void list(Model model) {
		model.addAttribute("list", menuService.menuList());
		ArrayList<MenuType> menuTypeList = new ArrayList<MenuType>(); 
		menuTypeList.add(MenuType.COFFEE);
		menuTypeList.add(MenuType.LATTE);
		menuTypeList.add(MenuType.TEA);
		menuTypeList.add(MenuType.ADE);
		menuTypeList.add(MenuType.JUICE);
		menuTypeList.add(MenuType.SMOOTHIE);
		menuTypeList.add(MenuType.DESSERT);
		menuTypeList.add(MenuType.ETC);
		model.addAttribute("Type", menuTypeList);
	}
	

	@GetMapping("branchMenuSelect")
	public void branchMenu(String[] ch){
		log.info("ch================"+ch);
	}

}
