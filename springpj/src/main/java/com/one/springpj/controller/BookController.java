package com.one.springpj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.springpj.model.Seat;
import com.one.springpj.service.BranchService;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/book/")
@Log
public class BookController {
	
	@Autowired
	private BranchService branchService;
	
	@GetMapping("bookCafe")
	public void list(Model model) {
		model.addAttribute("list", branchService.branchList());

	}

	@GetMapping("bookSeat")
	public void bookSeatForm(Long id, Model model) {
		List<Seat> seatList = branchService.findByBranchId(id);
		if(seatList!=null) {
			model.addAttribute("seats",seatList);
			model.addAttribute("cafeId", id);
		}
	}

	@GetMapping("bookMenu")
	@ResponseBody
	public void bookMenuForm(Long cafeId, String[] seat) {
		
	}
}
