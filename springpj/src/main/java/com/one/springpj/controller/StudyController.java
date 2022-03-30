package com.one.springpj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.springpj.constant.JoinStatus;
import com.one.springpj.model.Joiner;
import com.one.springpj.model.Likes;
import com.one.springpj.model.Study;
import com.one.springpj.service.JoinerService;
import com.one.springpj.service.StudyService;

import lombok.extern.java.Log;
@Log
@Controller
@RequestMapping("/study/")
public class StudyController {
	@Autowired
	StudyService studyService;
	@Autowired
	JoinerService joinerService;
	
	@GetMapping("list")
	public void list(Model model) {
		List<Study> studies = studyService.getList();
		model.addAttribute("studies",studies);
	}
	
	@GetMapping("register")
	public void registerForm() {
		
	}
	
	@PostMapping("register")
	public String register(Study study) {
		studyService.insert(study);
		return "redirect:/study/list";
	}
	
	@GetMapping("detail")
	public void detail(Long id, Model model) {
		model.addAttribute("study",studyService.read(id));
	}
	
	@PostMapping("apply")
	@ResponseBody
	public void apply(Long studyId, Long userId) {
		Study study= studyService.read(studyId);
		if (study!=null) {
			Joiner joiner = new Joiner();
			joiner.setStudy(study);
			joiner.setUser(null);
			joiner.setJoinStatus(JoinStatus.WAITING);
			joinerService.insert(joiner);
		}
	}
	
	
	public void clickLike(Long studyId, Long userId) {
		List<Likes> likes = studyService.isLike(studyId, userId);
		Study study = studyService.read(studyId);
		if(likes.get(0)!=null) {
			studyService.deleteLike(likes.get(0).getId());
			study.setLikes(study.getLikes()-1);
		}else {
			studyService.insertLike(likes.get(0));
			study.setLikes(study.getLikes()+1);
		}
	}
	
}
