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
	
	@GetMapping("userDel22/{username}")
	@ResponseBody
	public String userDel(@PathVariable("username") String username) {
		User user = userService.findByUsername(username);
		userService.delete(user.getId());
		return "/user/myPageUpdate";
	}
	
	
	//=========================================================
	
	//------------------------내스터디------------------------------------
	
	@GetMapping("myStudy")
	public void myStudyForm(Principal principal,Model model) {	
		User user = userService.findByUsername(principal.getName());
		List<Joiner> joinerList = joinerService.findJoinUserList(user.getId(), JoinStatus.ACCEPT);
		List<Joiner> waitingList = joinerService.findApplyUser(user.getId());
		
		model.addAttribute("joinerList", joinerList);
		model.addAttribute("waitingList", waitingList);
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
	
	@PostMapping("joinerAccept")
	@ResponseBody
	public void joinerAccept(Long id) {
		Joiner joiner = joinerService.findById(id);
		joiner.setJoinStatus(JoinStatus.ACCEPT);
		joiner.setStudyRole(StudyRole.MEMBER);
		joinerService.update(joiner);
	}
}


