package com.one.springpj.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.springpj.constant.MenuStatus;
import com.one.springpj.model.Book;
import com.one.springpj.model.Branch;
import com.one.springpj.model.CafeMenu;
import com.one.springpj.model.User;
import com.one.springpj.service.BookService;
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
	
	@Autowired
	private BookService bookService;
	
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
	public void menuStatus(Model model, Principal principal) {
		User user = userService.findByUsername(principal.getName());
		Branch branch = branchService.findByManager(user);
		log.info("+++++++++++++++++++++++++++"+branch);
		List<CafeMenu> list = branchService.cafeMenufindByBranchId(branch);
		model.addAttribute("list", list);
	}
	
	@GetMapping("cafeMenu/cafeMenuBalju")
	public void list(Model model, Principal principal) {
		User user = userService.findByUsername(principal.getName());
		Branch branch = branchService.findByManager(user);
		
		model.addAttribute("list", menuService.menuList());
		model.addAttribute("branchId", branch.getId());
	}
	

	@PostMapping("cafeMenu/cafeMenuSelect")
	public String branchMenu(Long[] ch, Long branchId){
		Branch branch = branchService.findById(branchId);
		for(int i=0; i<ch.length; i++) {
			CafeMenu cafeMenu = new CafeMenu();
			cafeMenu.setBranch(branch);
			cafeMenu.setMenu(menuService.findById(ch[i]));
			cafeMenu.setMenuStatus(MenuStatus.SELL);
			cafeMenuService.save(cafeMenu);
		}
		return"redirect:/manager/cafeMenu/cafeMenuList";
	}
	
	//메뉴 상태 전환
	@GetMapping("cafeMenu/switch/cafeMenuList/{id}")
	@ResponseBody
	public String switchMenuStatus(@PathVariable("id") Long id) {
		CafeMenu cafeMenu = branchService.cafeMenuFindById(id);
		MenuStatus status = cafeMenu.getMenuStatus();
		String result;
		if(status == MenuStatus.SELL) {
			cafeMenu.setMenuStatus(MenuStatus.SOLD_OUT);
			result= "sold-out";
		}else {
			cafeMenu.setMenuStatus(MenuStatus.SELL);
			result= "sell";
		}
		cafeMenuService.save(cafeMenu);
		return result;
	}
	
	//=====================================================================
	
	//---------------------------예약상태 관리-----------------------------
	
	@GetMapping("bookStatus")
	public void bookStatus(Principal principal, Model model) {
		Branch branch = branchService.findByManager(userService.findByUsername(principal.getName()));
		if (branch!=null) {
			List<Book> bookList = bookService.findByBranch(branch);
			model.addAttribute("bookList", bookList);
		}
		
	}
	
	//======================================================================
	

}
