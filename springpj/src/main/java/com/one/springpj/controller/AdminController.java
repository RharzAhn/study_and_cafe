package com.one.springpj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("admin")
	public void adminpage() {
	}

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String root() {
		return "index";
	}

	@RequestMapping("userList")
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
	
}









