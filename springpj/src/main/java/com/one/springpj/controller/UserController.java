package com.one.springpj.controller;

import java.security.Principal;

import javax.transaction.Transactional;
import javax.websocket.Decoder.Text;
import org.hibernate.sql.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.one.springpj.constant.Role;
import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.one.springpj.config.auth.PrincipalDetailsService;
import com.one.springpj.constant.JoinStatus;
import com.one.springpj.constant.StudyRole;
import com.one.springpj.model.Joiner;
import com.one.springpj.model.User;
import com.one.springpj.service.JoinerService;
import com.one.springpj.service.UserService;
import com.one.springpj.service.UserServiceImpl;

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
		List<Joiner> applyerList = joinerService.findApplyUser(user.getId());
		List<Joiner> joinedList = joinerService.findJoinUserList(user.getId(), JoinStatus.ACCEPT);
		
		model.addAttribute("applyerList", applyerList);
		model.addAttribute("joinedList",joinedList);
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


