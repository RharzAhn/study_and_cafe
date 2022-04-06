package com.one.springpj.controller;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.springpj.constant.FileMaker;
import com.one.springpj.model.Branch;
import com.one.springpj.model.Seat;
import com.one.springpj.model.User;
import com.one.springpj.service.BranchService;
import com.one.springpj.service.UserService;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/admin/branch/")
@Log
@Transactional
public class BranchController {
	
//	@Autowired
//	private BranchService branchService;
//	@Autowired
//	private UserService userService;
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
//	@PostMapping("insert")
//	public String insert(Branch branch, String username,String[] seatNum) {
//		
//		//알파벳 배열
//		char[] clist = new char[26];
//		for(int i=0; i<26; i++) {
//			clist[i]=(char)(65+i);
//		}
//		
//		User user = userService.findByUsername(username);
//		branch.setManager(user);
//		branchService.insert(branch);
//		
//		//좌석 데이터 저장
//		List<Seat> seatList = new ArrayList<Seat>();
//		for(String s : seatNum) {
//			Seat seat = new Seat();
//			String[] arr = s.split(",");
//			
//			seat.setBranch(branch);
//			seat.setName(clist[Integer.parseInt(arr[0])]+arr[1]);
//			seat.setX(Integer.parseInt(arr[0]));
//			seat.setY(Integer.parseInt(arr[1]));
//			branchService.insertSeat(seat);
//			seatList.add(seat);
//		}
////		branch.setSeats(seatList);
//		
//		return "redirect:/admin/branch/branchList";
//	}
//	
//	@GetMapping("delete/{id}")
//	public String delete(@PathVariable("id")Long id) {
//		branchService.delete(id);
//		return "redirect:/admin/branchManagement";
//	}
}
