package com.one.springpj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.springpj.model.Cafe;
import com.one.springpj.service.CafeService;

@Controller
@RequestMapping("/admin/cafe/")
public class CafeController {
	
	@Autowired(required=false)
	private CafeService cafeService;
	
	@GetMapping("list")
	public void list(Model model) {
		model.addAttribute("list", cafeService.cafeList());

	}
	
//	register.jsp파일을 열기위해 필요한거
	@GetMapping("register")
	public void insertForm(Cafe cafe) {
		
	}
	
//	register.jsp의 submit타입 버튼에 의해 form action명 insert로 post된거 처리
	@PostMapping("insert")
	public String insert(Cafe cafe) {
		cafeService.insert(cafe);
		return "redirect:/admin/cafe/list";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id")Long id) {
		cafeService.delete(id);
		return "redirect:/admin/cafe/list";
	}
}
