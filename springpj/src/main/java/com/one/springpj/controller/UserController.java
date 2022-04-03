package com.one.springpj.controller;

import java.util.List;

import org.apache.tomcat.jni.User;
import org.springframework.beans.factory.annotation.Autowired;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.springpj.constant.Role;
import com.one.springpj.repository.UserRepository;
import com.one.springpj.constant.JoinStatus;
import com.one.springpj.constant.StudyRole;
import com.one.springpj.model.Joiner;
import com.one.springpj.model.User;
import com.one.springpj.service.JoinerService;
import com.one.springpj.service.UserService;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/user/")
@Log
public class UserController {
	@Autowired
	JoinerService joinerService;
	@Autowired
	UserService userService;
	
	@GetMapping("joiner")
	public void joiner(Model model, Principal principal) {
		User user = userService.findByUsername(principal.getName());
		//?¥Í? ?¥ÏòÅ?òÎäî ?§ÌÑ∞??
		List<Joiner> applyerList = joinerService.findApplyUser(user.getId());
		//?¥Í? Í∞Ä?ÖÌïú ?§ÌÑ∞??
		List<Joiner> joinedList = joinerService.findJoinUserList(user.getId(), JoinStatus.ACCEPT);
		
		model.addAttribute("applyerList", applyerList);
		model.addAttribute("joinedList",joinedList);
	}
	
	@Autowired
	private UserService userService;
	@Autowired
	private UserRepository userRepository;
	
	@GetMapping("register")
	public void registerForm() {
		
	}

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String root() {
		return "index";
	}

	@RequestMapping("userpage")
	public String userlist(Model model, User user) {
		model.addAttribute("userpage", userService.getUserlist());
		return "userpage";
	}

	@RequestMapping("usermileage")
	public String usermilge(Model model, User user) {
		model.addAttribute("usermileage", userService.getUserlist());
		return "usermileage";
	}

	@PostMapping("joinerAccept")
	@ResponseBody
	public void joinerAccept(Long id) {
		Joiner joiner = joinerService.findById(id);
		joiner.setJoinStatus(JoinStatus.ACCEPT);
		joiner.setStudyRole(StudyRole.MEMBER);
		joinerService.update(joiner);
	}
	@PostMapping("joinerDecline")
	@ResponseBody
	public void joinerDecline(Long id) {
		Joiner joiner= joinerService.findById(id);
		joiner.setJoinStatus(JoinStatus.DECLINE);
		joinerService.update(joiner);
	}
}




