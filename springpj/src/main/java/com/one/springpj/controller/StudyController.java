package com.one.springpj.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import com.one.springpj.model.Reply;
import com.one.springpj.model.Study;
import com.one.springpj.model.User;
import com.one.springpj.service.BookService;
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
	@Autowired
	BookService bookService;

	@GetMapping("list")
	public void list(Model model, Principal principal) {
		Long userId = null;
		if (principal != null) {
			userId = userService.findByUsername(principal.getName()).getId();
			List<Joiner> joinedStudies = joinerService.findJoinUserList(userId, JoinStatus.ACCEPT);
			if (joinedStudies.size() != 0) {
				model.addAttribute("joins", joinedStudies);
			}
		}
		List<Study> studies = studyService.getList();
		model.addAttribute("studies", studies);

	}

	@GetMapping("register")
	public void registerForm() {

	}

	@PostMapping("register")
	public String register(Study study, Principal principal, MultipartFile file, HttpSession session) {
		String imagePath = FileMaker.save(file, session);

		User user = userService.findByUsername(principal.getName());
		log.info("leader: " + study.getLeader());
		study.setProfile(imagePath);
		study.setLeader(user);
		studyService.insert(study);

		Joiner joiner = new Joiner();
		joiner.setStudyRole(StudyRole.LEADER);
		joiner.setJoinStatus(JoinStatus.ACCEPT);
		joiner.setStudy(study);
		joiner.setUser(user);
		joinerService.insert(joiner);

		return "redirect:/study/list";
	}

	@GetMapping("detail")
	public void detail(Long id, Model model) {
		model.addAttribute("study", studyService.read(id));
	}
	
	
	//>>>>>>>>>>>>>>>>>>>>>>>>>>> 스터디 가입 신청 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	
	@PostMapping("apply")
	@ResponseBody
	public String apply(Long studyId, Long userId) {
		Study study = studyService.read(studyId);
		int joinedCount = joinerService.joinCount(study, JoinStatus.ACCEPT);
		if(study.getLimitCount()==joinedCount) {
			return "fulled";
		}
		if (study != null) {
			Joiner joiner = new Joiner();
			joiner.setStudy(study);
			joiner.setUser(userService.findById(userId));
			joiner.setJoinStatus(JoinStatus.WAITING);
			joinerService.insert(joiner);
			return "success";
		}
		return "failed";
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

	@PostMapping("confirm")
	@ResponseBody
	public String confirm(Long id, Principal principal) {
		User user = userService.findByUsername(principal.getName());
		Study study = studyService.read(id);
		int joiend = joinerService.joinCheck(user.getId(), JoinStatus.ACCEPT, study.getId());
		if (joiend == 0) {
			return "failed";
		}
		return "success";
	}

	
	//>>>>>>>>>>>>>>>>>>>>>>>>  허가된 스터디원 게시판 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	@GetMapping("/{id}")
	public String enterStudy(@PathVariable("id") Long id, Principal principal, Model model) {
		if (principal == null) {
			return "redirect:/study/list";
		}
		User user = userService.findByUsername(principal.getName());
		int check = joinerService.joinCheck(user.getId(), JoinStatus.ACCEPT, id);
		if (check == 0) {
			return "/study/list";
		} else {
			Study study = studyService.read(id);
			List<Board> boardList = studyService.findByStudyId(id);
			
			//가입된 스터디원 수
			int joinedCount = joinerService.joinCount(study, JoinStatus.ACCEPT);
			model.addAttribute("joinedCount", joinedCount);
			
			// 추가 예약정보
			model.addAttribute("study", study);
			model.addAttribute("boardList", boardList);
			model.addAttribute("bookList", bookService.findByStudy(study));
			return "/study/board";
			
		}
	}
	
	@DeleteMapping("board/{id}")
	@ResponseBody
	public void deleteBoard(@PathVariable("id") Long id) {
		studyService.deleteBoard(id);
		return;
	}

	@PostMapping("board/register")
	@ResponseBody
	public void insertBoard(Board board) {
		board.setProfile(userService.findByUsername(board.getWriter()).getProfile());
		studyService.insertBoard(board);
//		return "/study/board/"+board.getStudy().getId();
	}

	@PostMapping("board/imgupload")
	@ResponseBody
	public Object imageUpload(MultipartFile file, HttpSession session) {
		String path = FileMaker.save(file, session);
		Map<String, String> result = new HashMap<String, String>();
		result.put("link", path);
		log.info("=====================" + path);
		return result;
	}

	@GetMapping("board/{id}")
	@ResponseBody
	public List<Board> enterWithBoard(@PathVariable("id") Long id) {
		List<Board> boardList = studyService.findByStudyId(id);
		return boardList;
	}
	
	
	//댓글 등록 및 삭제
	
	@PostMapping("reply/register")
	@ResponseBody
	public ResponseEntity<String> replyInsert(Reply reply){
		reply.setProfile(userService.findByUsername(reply.getReplyer()).getProfile());
		studyService.insertReply(reply);
		
		int replyCount = studyService.replyCountbyBoard(reply.getBoard());
		Board board = reply.getBoard();
		board.setReplyCount(replyCount);
		studyService.insertBoard(board);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@GetMapping("reply/{id}")
	@ResponseBody
	public List<Reply> replyList(@PathVariable("id") Long id){
		List<Reply> replyList = studyService.findReplyByBoard(id);
		return replyList;
	}
	
	
	@DeleteMapping("reply/{id}")
	@ResponseBody
	public Long replyDelete(@PathVariable Long id) {
		studyService.deleteReply(id);
		return id;
	}
}
