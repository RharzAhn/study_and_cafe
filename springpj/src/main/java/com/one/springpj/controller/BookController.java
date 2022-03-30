package com.one.springpj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.springpj.service.CafeService;

@Controller
@RequestMapping("/admin/book/")
public class BookController {
	
	@Autowired(required=false)
	private CafeService cafeService;
	
	@GetMapping("bookCafe")
	public void list(Model model) {
		model.addAttribute("list", cafeService.cafeList());

	}

}
