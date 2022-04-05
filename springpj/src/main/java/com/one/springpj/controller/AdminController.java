package com.one.springpj.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.one.springpj.constant.FileMaker;
import com.one.springpj.model.Branch;
import com.one.springpj.model.Menu;
import com.one.springpj.model.Study;
import com.one.springpj.model.User;
import com.one.springpj.service.BranchService;
import com.one.springpj.service.MenuService;
import com.one.springpj.service.StudyService;
import com.one.springpj.service.UserService;

import lombok.extern.java.Log;
@Log
@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BranchService branchService;
	
	@Autowired
	private StudyService studyService;
	
	@Autowired
	private MenuService menuService;
	
	@GetMapping("branchManagement")
	public void list(Model model) {
		model.addAttribute("list", branchService.branchList());

	}
	
	@PostMapping("branchUpdate")
	public String update(Branch branch,MultipartFile file, HttpSession session) {
		String imagePath = FileMaker.save(file, session);
		branch.setProfile(imagePath);
		branchService.update(branch);
		return "redirect:/admin/branchManagement";
	}
	
	@PostMapping("insert")
	public String insert(Branch branch,MultipartFile file, HttpSession session) {
		String imagePath = FileMaker.save(file, session);
		branch.setProfile(imagePath);
		branchService.insert(branch);
		return "redirect:/admin/branchManagement";
	}
	
	@GetMapping("studyManagement")
	public void studyList(Model model) {
		List<Study> studies = studyService.getList();
		model.addAttribute("list",studies);
		
	}
	
	@GetMapping("menuManagement")
	public void menuList(Model model) {
		model.addAttribute("list", menuService.menuList());

	}
	
	@GetMapping("userManagement")
	public void userManagement() {
	}
	
	@GetMapping("mileageManagement")
	public void mileageManagement() {
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









