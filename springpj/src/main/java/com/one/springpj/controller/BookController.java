package com.one.springpj.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.springpj.constant.JoinStatus;
import com.one.springpj.model.Branch;
import com.one.springpj.model.CafeMenu;
import com.one.springpj.model.Joiner;
import com.one.springpj.model.Seat;
import com.one.springpj.model.User;
import com.one.springpj.service.BranchService;
import com.one.springpj.service.JoinerService;
import com.one.springpj.service.UserService;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/book/")
@Log
public class BookController {
	
	@Autowired
	private BranchService branchService;
	@Autowired
	private UserService userService;
	@Autowired
	private JoinerService joinerService;
	
	
	@GetMapping("bookCafe")
	public void list(Model model) {
		model.addAttribute("list", branchService.branchList());

	}

	@GetMapping("bookSeat")
	public void bookSeatForm(Long id, Model model, Principal principal) {
		List<Seat> seatList = branchService.findByBranchId(id);
		User user = userService.findByUsername(principal.getName());
		List<Joiner> joinerList = joinerService.findJoinUserList(user.getId(), JoinStatus.ACCEPT);
		log.info(joinerList.toString()+"ddddddddddddd");
		
		if(seatList!=null) {
			model.addAttribute("seats",seatList);
			model.addAttribute("joinerList", joinerList);
			model.addAttribute("cafeId", id);
		}
	}

	@GetMapping("bookMenu")
	public void bookMenuForm( Long studyId, Long cafeId, String[] seat, Model model) {
		Branch branch = branchService.findById(cafeId);
		List<CafeMenu> cafeMenuList = branchService.cafeMenufindByBranchId(branch);
		model.addAttribute("cafeMenus",cafeMenuList);
		model.addAttribute("seatList",seat);
		model.addAttribute("studyId", studyId);
		model.addAttribute("cafeId", cafeId);
	}
	
	@GetMapping("bookAll")
	public void bookAll(Long studyId, Long cafeId, String[] seat, Long[] menuList) {
//		Book book = new Book();
//		book.set
	}
}
