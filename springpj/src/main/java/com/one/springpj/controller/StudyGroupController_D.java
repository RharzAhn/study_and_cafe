package com.one.springpj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.springpj.model.Study;
import com.one.springpj.service.StudyGroupService;
import com.one.springpj.service.StudyService;

@Controller
@RequestMapping("/admin/studyGroup/")
public class StudyGroupController_D {
	

//	
//	@Autowired
//	private StudyService studyService;
//	
//	@GetMapping("delete/{id}")
//	public String delete(@PathVariable("id")Long id) {
//		studyGroupService.delete(id);
//		return "redirect:/admin/studyGroup/studyGroupList";
//	}
//	
//	@GetMapping("studyGroupList")
//	public void list(Model model) {
//		List<Study> studies = studyService.getList();
//		model.addAttribute("list",studies);
//		
//	}
//	

}
