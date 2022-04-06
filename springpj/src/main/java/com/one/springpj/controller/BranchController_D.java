package com.one.springpj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.one.springpj.constant.FileMaker;
import com.one.springpj.model.Branch;
import com.one.springpj.service.BranchService;

@Controller
@RequestMapping("/admin/branch/")
public class BranchController_D {
	
//	@Autowired
//	private BranchService branchService;
//	
//	@GetMapping("branchList")
//	public void list(Model model) {
//		model.addAttribute("list", branchService.branchList());
//
//	}
//	
////	register.jsp파일을 열기위해 필요한거
//	@GetMapping("branchRegister")
//	public void insertForm(Branch branch) {
//		
//	}
//	
//	@GetMapping("branchUpdate/{id}")
//	public String updateForm(@PathVariable("id") Long id, Model model) {
//		Branch branch = branchService.findById(id);
//		model.addAttribute("branch", branch);
//		return "/admin/branch/branchUpdate";
//	}
//	
//	@PostMapping("branchUpdate")
//	public String update(Branch branch) {
//		branchService.update(branch);
//		return "redirect:/admin/branch/branchList";
//	}
//	
////	register.jsp의 submit타입 버튼에 의해 form action명 insert로 post된거 처리
//
//	
//	@GetMapping("delete/{id}")
//	public String delete(@PathVariable("id")Long id) {
//		branchService.delete(id);
//		return "redirect:/admin/branchManagement";
//	}
}
