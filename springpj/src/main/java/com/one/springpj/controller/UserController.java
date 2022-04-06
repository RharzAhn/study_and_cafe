package com.one.springpj.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	@GetMapping("user")
	public void userForm() {	
	}
	
	//-------------------------내정보-----------------------------------
	
	@GetMapping("myPage")
	public void myPageForm() {	
	}
	
	//=========================================================
	
	//------------------------내스터디------------------------------------
	
	@GetMapping("myStudy")
	public void myStudyForm() {	
	}
	
	//=================================================================
	
	//-------------------------내마일리지---------------------------------
	
	@GetMapping("myMileage")
	public void myMileageForm() {	
	}
	
	//=============================================================
	
	@GetMapping("joiner")
	public void joiner(Model model, Principal principal) {
		User user = userService.findByUsername(principal.getName());
		List<Joiner> applyerList = joinerService.findApplyUser(user.getId());
		List<Joiner> joinedList = joinerService.findJoinUserList(user.getId(), JoinStatus.ACCEPT);
		
		model.addAttribute("applyerList", applyerList);
		model.addAttribute("joinedList",joinedList);
	}
	
	@PostMapping("joinerAlert")
	@ResponseBody
	public Object joinerAlert(String username){
		User user = userService.findByUsername(username);
		List<Joiner> applyerList = joinerService.findApplyUser(user.getId());
		List<Joiner> joinedList = joinerService.findJoinUserList(user.getId(), JoinStatus.ACCEPT);
		return applyerList;
	}
	
	@GetMapping("register")
	public void registerForm() {
		
	}

	@RequestMapping("userpage")
	public String userlist(Model model, Principal principal) {
		User user = userService.findByUsername(principal.getName());
		model.addAttribute("user", user);
		return "user/userpage";
	}

	@RequestMapping("usermileage")
	public String usermileage(Model model, Principal principal) {
		User user = userService.findByUsername(principal.getName());
		model.addAttribute("user", user);
		return "user/usermileage";
	}

	
	@GetMapping("userupdate")
	public String userupdateForm(Model model, Principal principal) {
		User user = userService.findByUsername(principal.getName());
		model.addAttribute("user", user);
		user.getAddr();
		user.getEmail();
		user.getNick();
		user.getPassword();
		user.getUsername();
		userService.userupdate(user, principal);
		return "user/userupdate";
	}

	@PostMapping("joinerAccept")
	@ResponseBody
	public void joinerAccept(Long id) {
		Joiner joiner = joinerService.findById(id);
		joiner.setJoinStatus(JoinStatus.ACCEPT);
		joiner.setStudyRole(StudyRole.MEMBER);
		joinerService.update(joiner);
	}
	
	@PostMapping("userupdate")
	public String userupdate(User user) {
		User reguser = userService.findByUsername(user.getUsername());
		reguser.setAddr(user.getAddr());
		reguser.setEmail(user.getEmail());
		reguser.setNick(user.getNick());
		userService.update(reguser);
		return "user/userpage";
	}
	
	
	@PostMapping("userdelete")
	@ResponseBody
	public String userdelete(String username) {
		User user = userService.findByUsername(username);
		userService.delete(user.getId());
		return "success";
	}
	
	@PostMapping("joinerDecline")
	@ResponseBody
	public void joinerDecline(Long id) {
		Joiner joiner= joinerService.findById(id);
		joiner.setJoinStatus(JoinStatus.DECLINE);
		joinerService.update(joiner);
	}
}


