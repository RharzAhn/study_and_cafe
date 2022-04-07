package com.one.springpj.controller;

import java.nio.file.attribute.UserPrincipal;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.one.springpj.constant.FileMaker;
import com.one.springpj.constant.JoinStatus;
import com.one.springpj.constant.StudyRole;
import com.one.springpj.model.Joiner;
import com.one.springpj.model.Menu;
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
	public void userlist(Principal principal, Model model) {
		User user = userService.findByUsername(principal.getName());
		model.addAttribute(user);
	}
	
	@GetMapping("myPageUpdate/{username}")
	public String myPageupdateForm(@PathVariable("username") String username, Model model) {
		User user = userService.findByUsername(username);
		model.addAttribute("user", user);
		return "/user/myPageUpdate";
	}
	
	//수정
	@PostMapping("/myPageUpdate")
	public String menuupdate(User user,MultipartFile file, HttpSession session) {
		String imagePath = FileMaker.save(file, session);
		user.setProfile(imagePath);
		userService.update(user);
		return "redirect:/user/myPage";
	}
	//=========================================================
	
	//------------------------내스터디------------------------------------
	
	@GetMapping("myStudy")
	public void myStudyForm(Principal principal,Model model) {	
		User user = userService.findByUsername(principal.getName());
		List<Joiner> joinerList = joinerService.findJoinUserList(user.getId(), JoinStatus.ACCEPT);
		model.addAttribute("joinerList", joinerList);
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
	
	@GetMapping("register")
	public void registerForm() {
		
	}

//	@RequestMapping("userpage")
//	public String userlist(Model model, User user) {
//		model.addAttribute("userpage", userService.getUserlist());
//		return "userpage";
//	}

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




