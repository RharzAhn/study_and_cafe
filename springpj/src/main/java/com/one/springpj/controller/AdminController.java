package com.one.springpj.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.one.springpj.service.StudyGroupService;
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
	private StudyGroupService studyGroupService;
	
	@Autowired
	private MenuService menuService;
	
	@GetMapping("admin")
	public void adminPage() {
	}
	

	// -----------------------------지점(branch) 컨트롤------------------------------------
	
	//branchList 입장+List불러오기
	@GetMapping("branch/branchList")
	public void list(Model model) {
		model.addAttribute("list", branchService.branchList());
	}
	
	//branchRegister 입장
	@GetMapping("branch/branchRegister")
	public void insertForm(Branch branch) {
	}
	
	//branch추가
	@PostMapping("branch/insert")
	public String insert(Branch branch,MultipartFile file, HttpSession session) {
		String imagePath = FileMaker.save(file, session);
		branch.setProfile(imagePath);
		branchService.insert(branch);
		return "redirect:/admin/branch/branchList";
	}
	
	// id값을 가지고 branchUpdate 입장
	@GetMapping("/banch/branchUpdate/{id}")
	public String updateForm(@PathVariable("id") Long id, Model model) {
		Branch branch = branchService.findById(id);
		model.addAttribute("branch", branch);
		return "/admin/branch/branchUpdate";
	}
	
//	@PostMapping("branchUpdate")
//	public String update(Branch branch) {
//		branchService.update(branch);
//		return "redirect:/admin/branch/branchList";
//	}
	
	//수정한 값 보내기
	@PostMapping("branchUpdate")
	public String update(Branch branch, MultipartFile file, HttpSession session) {
		String imagePath = FileMaker.save(file, session);
		branch.setProfile(imagePath);
		branchService.update(branch);
		return "redirect:/admin/branch/branchList";
	}
	
	//삭제
	@GetMapping("/branch/delete/{id}")
	public String branchDelete(@PathVariable("id")Long id) {
		branchService.delete(id);
		return "redirect:/admin/branch/branchList";
	}
	
	
	//===========================================================================

	//-----------------------메뉴(menu)컨트롤--------------------------------------
	
	//menuList 입장+List 불러오기
	@GetMapping("menu/menuList")
	public void menuList(Model model) {
		model.addAttribute("list", menuService.menuList());
	}
	
	//menuRegister 입장
	@GetMapping("menu/menuRegister")
	public void insertForm(Menu menu) {
	}	
	
	//	menuRegister의 submit타입 버튼에 의해 form action명 insert로 post된거 처리
	@PostMapping("menu/insert")
	public String insert(Menu menu,MultipartFile file, HttpSession session) {
		String imagePath = FileMaker.save(file, session);
		menu.setProfile(imagePath);
		menuService.insert(menu);
		return "redirect:/admin/menu/menuList";
	}	
	
	//menuUpdate로 아이디들고 들어가기
	@GetMapping("/menu/menuUpdate/{id}")
	public String menuupdateForm(@PathVariable("id") Long id, Model model) {
		Menu menu = menuService.findById(id);
		model.addAttribute("menu", menu);
		return "/admin/menu/menuUpdate";
	}
	
	//수정
	@PostMapping("/menu/menuUpdate")
	public String menuupdate(Menu menu,MultipartFile file, HttpSession session) {
		String imagePath = FileMaker.save(file, session);
		menu.setProfile(imagePath);
		menuService.update(menu);
		return "redirect:/admin/menu/menuList";
	}
	
	//삭제
	@GetMapping("menu/delete/{id}")
	public String menuDelete(@PathVariable("id") Long id) {
		menuService.delete(id);
		return "redirect:/admin/menu/menuList";
	}	
	
	//==========================================================================
	
	//----------------------마일리지(mileage)컨트롤------------------------------
	
	@GetMapping("mileage/mileageList")
	public void mileageList() {
	}
	
	//==========================================================================

	//-----------------------스터디(study)컨트롤---------------------------------
	
	//studyList 입장+List
	@GetMapping("/study/studyList")
	public void studyList(Model model) {
		List<Study> studies = studyService.getList();
		model.addAttribute("list",studies);	
	}
	
	@GetMapping("/study/delete/{id}")
	public String delete(@PathVariable("id")Long id) {
		studyGroupService.delete(id);
		return "redirect:/admin/study/studyList";
	}
	
	
	//============================================================================
	
	//---------------------------유저(user) 컨트롤----------------------------------
	
	@GetMapping("user/userList")
	public void userList() {
	}
	
	//===============================================================================

	
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









