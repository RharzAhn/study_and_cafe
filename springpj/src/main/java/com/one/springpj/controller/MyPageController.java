package com.one.springpj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.domain.Pageable;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.one.springpj.model.User;

import com.one.springpj.service.UserService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/user/*")
public class MyPageController {
	
	@Autowired
	private UserService userService;
	
	
	@GetMapping("register")
	public void insert() {
		
	}
	
	@PostMapping("insert")
	public String insert(User user) {
		log.info("user.............."+user.getWriter());
		
		User user1=userService.findByUsername(user1.getWriter());
		log.info("User.............."+user);
		
		userService.insert(user,user);
		return "redirect:/user/list";
	}
	
	//@GetMapping("list")
	public String list(Model model) {
		model.addAttribute("list", userService.userList());
		model.addAttribute("count", userService.count());
		return "/user/list2";
	}
	
	//전체보기(페이징)
	@GetMapping("list")
	public String listPage(Model model, 
			@PageableDefault(size=3,sort="id", 
			direction=Sort.Direction.DESC) Pageable pageable) {
		
		Page<User> lists=userService.findAll(pageable);
		
		long pageSize=pageable.getPageSize();
		long rowNm=userService.count();
		long totPage=(long)Math.ceil((double)rowNm/pageSize);
		long currPage=pageable.getPageNumber();
		System.out.println("CurrPag=============="+currPage);
		
		long startPage=((currPage)/pageSize)*pageSize;
		long endPage=startPage+pageSize;
		if(endPage>totPage) 
			endPage=totPage;
			
		boolean prev=startPage>0?true:false;
		boolean next=endPage<totPage?true:false;
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage-1);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("count", rowNm);
		model.addAttribute("lists", lists);
		model.addAttribute("totPage", totPage);
		model.addAttribute("cp", currPage);
		
		return "user/index";
	}
	
	@GetMapping("detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", userService.findById(id));
		return "/user/index";
	}
	
		
	@GetMapping("update/{id}")
	public String update(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", userService.findById(id));
		return "/user/index";
	}
	
	@PostMapping("update")
	public String update(User user) {
		userService.update(user);
		return "redirect:/user/index";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable Long id) {
		userService.delete(id);
		return "redirect:/user/index";
	}

}

