package com.one.springpj.controller;

import java.security.Principal;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.springpj.constant.MenuStatus;
import com.one.springpj.constant.MenuType;
import com.one.springpj.model.Branch;
import com.one.springpj.model.CafeMenu;
import com.one.springpj.model.User;
import com.one.springpj.service.BranchService;
import com.one.springpj.service.CafeMenuService;
import com.one.springpj.service.MenuService;
import com.one.springpj.service.UserService;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/manager/")
public class ManagerController {
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private BranchService branchService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CafeMenuService cafeMenuService;
	
	@GetMapping("manager")
	public void managerPage() {
		
	}
	//--------------------------매장현황-----------------------------------
	
	@GetMapping("currentStatus")
	public void statusPage() {
	}
	
	//===================================================================
	
	//-------------------------메뉴상태관리--------------------------------
	
	@GetMapping("cafeMenu/cafeMenuList")
	public void menuStatus(Model model) {
//		model.addAttribute("list", cafeMenuService.findAll());
	}
	
	@GetMapping("cafeMenu/cafeMenuBalju")
	public void list(Model model, Principal principal) {
		User user = userService.findByUsername(principal.getName());
		Branch branch = branchService.findByManager(user);
		
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
		model.addAttribute("branchId", branch.getId());
	}
	

	@GetMapping("cafeMenu/cafeMenuSelect")
	public void branchMenu(Long[] ch, Long branchId){
		Branch branch = branchService.findById(branchId);
		for(int i=0; i<ch.length; i++) {
			CafeMenu cafeMenu = new CafeMenu();
			cafeMenu.setCafe(branch);
			cafeMenu.setMenu(menuService.findById(ch[i]));
			cafeMenu.setMenuStatus(MenuStatus.SELL);
			cafeMenuService.save(cafeMenu);
		}
	}
	
	//=====================================================================
	
	//---------------------------예약상태 관리-----------------------------
	
	@GetMapping("bookStatus")
	public void bookStatus() {
		
	}
	
	//======================================================================
	

}
