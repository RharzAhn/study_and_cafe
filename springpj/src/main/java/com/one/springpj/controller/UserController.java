package com.one.springpj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
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
@RequestMapping("/user/")
@Log
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping(value={"","index"})
	public String index() {
		return "index";
	}
	
	@GetMapping("join")
	public String joinForm() {
		return "user/join";
	}
	
	@PostMapping("join")
	@ResponseBody
	public String register(@RequestBody User user) {
		
		if(userService.findByUsername(user.getUsername())!=null) {
			return "fail";
		}
		userService.register(user);
		return "success";
	}
	
	@GetMapping("login")
	public String loginForm() {
		return "user/login";
	}
	
	@PostMapping("login")
	@ResponseBody
	public String loginPro(String username, String password,HttpSession session) {
		User user=userService.findByUsername(username);
		String result="no";
		if(user!=null) {
			if(user.getPassword().equals(password)) {
				session.setAttribute("sUser", user);
				result="success";
			}else {
				result="fail";
			}
		}
		return result;
	}
	
	@GetMapping("logout")
    public String logout(HttpServletRequest request, 
    		HttpServletResponse response) throws Exception{
//	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	// if (auth != null && auth.isAuthenticated()) {
	// new SecurityContextLogoutHandler().logout(request, response, auth);
	//  }
      return "redirect:/";
    }
	
	@GetMapping("admin")
	@ResponseBody
	public String exAdmin() {
		log.info("관리자 권한");
		return "admin";
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
}
