package com.one.springpj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.springpj.model.User;
import com.one.springpj.service.UserService;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/")
@Log
public class HomeController {
	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping(value = { "", "index" })
	public String index() {
		return "index";
	}

	@GetMapping("join")
	public void joinForm() {
	}

	@PostMapping("joinProc")
	@ResponseBody
	public String join(@RequestBody User user) {
		if (userService.findByUsername(user.getUsername()) != null) {
			return "fail";
		}
		String rawPassword = user.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setMileage(0);

		userService.register(user);
		return "success";
	}

	@GetMapping("login")
	public void loginForm() {
	}

	@GetMapping("manager")
	public String exManager() {
		log.info("매니저 권한");
		return "manager";
	}

	@GetMapping("user")
	@ResponseBody
	public String exUser() {
		log.info("유저 권한");
		return "user";
	}
	
	@PostMapping("idCheck")
	@ResponseBody
	public String idCheck(String username) {
		User user = userService.findByUsername(username);
		if(user!=null) {
			return "unavailable";
		}return "available";
	}
	
}
