package com.one.springpj.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.one.springpj.constant.FileMaker;
import com.one.springpj.constant.JoinStatus;
import com.one.springpj.constant.StudyRole;
import com.one.springpj.model.Board;
import com.one.springpj.model.Joiner;
import com.one.springpj.model.Likes;
import com.one.springpj.model.Study;
import com.one.springpj.model.User;
import com.one.springpj.service.JoinerService;
import com.one.springpj.service.StudyService;
import com.one.springpj.service.UserService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/study/")
public class StudyController {
	@Autowired
	StudyService studyService;
	@Autowired
	JoinerService joinerService;
	@Autowired
	UserService userService;

	@GetMapping("list")
	public void list(Model model, Principal principal) {
		Long userId = null;
		if (principal != null) {
			userId = userService.findByUsername(principal.getName()).getId();
		}
		List<Study> studies = studyService.getList();
		model.addAttribute("studies", studies);
		model.addAttribute("joins", joinerService.findJoinUserList(userId, JoinStatus.ACCEPT));

	}

	@GetMapping("register")
	public void registerForm() {

	}

	@PostMapping("register")
	public String register(Study study, String username, MultipartFile file, HttpSession session) {
		String imagePath = FileMaker.save(file, session);
		log.info("leader: " + study.getLeader());
		study.setProfile(imagePath);
		study.setLeader(userService.findByUsername(username));
		studyService.insert(study);
		
		Joiner joiner = new Joiner();
		joiner.setStudyRole(StudyRole.LEADER);
		joiner.setJoinStatus(JoinStatus.ACCEPT);
		joiner.setStudy(study);
		joiner.setUser(study.getLeader());
		joinerService.insert(joiner);
		
		return "redirect:/study/list";
	}

	@GetMapping("detail")
	public void detail(Long id, Model model) {
		model.addAttribute("study", studyService.read(id));
	}

	@PostMapping("apply")
	@ResponseBody
	public void apply(Long studyId, Long userId) {
		Study study = studyService.read(studyId);
		if (study != null) {
			Joiner joiner = new Joiner();
			joiner.setStudy(study);
			joiner.setUser(userService.findById(userId));
			joiner.setJoinStatus(JoinStatus.WAITING);
			joinerService.insert(joiner);
		}
	}

	@PostMapping("checkLike")
	@ResponseBody
	public void checkLike(Long studyId, Long userId) {
		Likes like = studyService.isLike(studyId, userId);
		Study study = studyService.read(studyId);
		if (like != null) {
			studyService.deleteLike(like.getId());
			study.setLikes(study.getLikes() - 1);
		} else {
			like = new Likes();
			like.setStudy(new Study(studyId));
			like.setUser(new User(userId));
			studyService.insertLike(like);
			study.setLikes(study.getLikes() + 1);
		}
		studyService.update(study);

	}
	
	
	@GetMapping("/{id}")
	public String enterStudy(@PathVariable("id") Long id, Principal principal, Model model) {
		if(principal==null){
			return "/study/list";
		}
		User user = userService.findByUsername(principal.getName());
		int check = joinerService.joinCheck(user.getId(), JoinStatus.ACCEPT, id);
		if (check ==0) {
			return "/study/list";
		}else {
			Study study = studyService.read(id);
			List<Board> boardList = studyService.findByStudyId(id);
			//추가 예약정보
			model.addAttribute("study", study);
			model.addAttribute("boardList", boardList);
			return "/study/board";
		}
	}
	
	@PostMapping("board/register")
	@ResponseBody
	public void insertBoard(Board board) {
//		board.setWriter(userService.findByUsername(principal.getName()));
		studyService.insertBoard(board);
//		return "/study/board/"+board.getStudy().getId();
	}
	
	@PostMapping("board/imgupload")
	@ResponseBody
	public Object imageUpload(MultipartFile file, HttpSession session) {
		String path = FileMaker.save(file, session);
		Map<String,String> result = new HashMap<String, String>();
		result.put("link", path);
		log.info("====================="+path);
		return result;
	}
	
	@GetMapping("board/{id}")
	@ResponseBody
	public List<Board> enterWithBoard(@PathVariable("id") Long id) {
		List<Board> boardList = studyService.findByStudyId(id);
		return boardList;
	}
}
