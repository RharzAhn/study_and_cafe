package com.one.springpj.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.springpj.model.User;
import com.one.springpj.service.UserService;


import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String root() {
		return "index";
	}

	@RequestMapping("userlist")
	public String userlist(Model model) {
		model.addAttribute("userlist", userService.getUserlist());
		return "admin/userlist";
	}
	
	@RequestMapping("mileagelist")
	public String mileagelist(Model model) {
		model.addAttribute("userlist", userService.getUserlist());
		return "admin/mileagelist";
	}
	
	@PostMapping("/addmile")
	@ResponseBody
	public void addmile(int mile, String username) {
		log.info("mile:"+mile+"username:"+username);
		User user = userService.findByUsername(username);
		user.setMileage(user.getMileage()+mile);
		userService.update(user);
	}
	
	@PostMapping("/delmile")
	@ResponseBody
	public void delmile(int mile, String username) {
		log.info("mile:"+mile+"username:"+username);
		User user = userService.findByUsername(username);
		user.setMileage(user.getMileage()-mile);
		userService.update(user);
	}
	
	@GetMapping("adminupdate")
	public String adminupdateform(Model model,User user) {
		model.addAttribute(user.getUsername());
		user.getUsername();
		user.getAddr();
		user.getEmail();
		user.getMileage();
		user.getNick();
		user.getRole();
		userService.update(user);
		
		return "admin/userlist";
	}
	
	@PostMapping("adminupdate")
	@ResponseBody
	public String adminupdate(User user) {
		
		user.setId(user.getId());
		user.setUsername(user.getUsername());
		user.setAddr(user.getAddr());
		user.setEmail(user.getEmail());
		user.setMileage(user.getMileage());
		user.setNick(user.getNick());
		user.setRole(user.getRole());
		
		userService.update(user);

		
	return "admin/userlist";
		}

	
	@PostMapping("admindelete")
	@ResponseBody
	public String delete(long id) {
		User user = userService.findById(id);
		if(user==null) {	
			log.info("삭제 실패");
			return "failed";
		}else{
			userService.delete(id);
			log.info("삭제 성공");
		}
		return "success";
	}
}