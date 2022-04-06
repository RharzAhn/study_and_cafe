package com.one.springpj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.springpj.model.Board;
import com.one.springpj.model.Likes;
import com.one.springpj.model.Study;
import com.one.springpj.repository.BoardRepository;
import com.one.springpj.repository.LikesRepository;
import com.one.springpj.repository.StudyRepository;

import lombok.extern.java.Log;

@Service
@Log
public class StudyServiceImpl implements StudyService {

	@Autowired
	StudyRepository studyRepository;
	@Autowired
	LikesRepository likeRepository;
	@Autowired
	BoardRepository boardRepository;
	
	@Override
	public void insert(Study study) {
		studyRepository.save(study);
	}
	
	@Override
	public void update(Study study) {
		studyRepository.save(study);
	}

	@Override
	public List<Study> getList() {
		return studyRepository.findAll();
	}

	@Override
	public Study read(Long id) {
		return studyRepository.findById(id).get();
	}

	@Override
	public void insertLike(Likes like) {
		likeRepository.save(like);
		
	}

	@Override
	public Likes isLike(Long studyId, Long userId) {
		return likeRepository.checkLike(userId, studyId);
	}

	@Override
	public void deleteLike(Long id) {
		likeRepository.deleteById(id);
	}

	@Override
	public List<Likes> getLikes() {
		return likeRepository.findAll();
	}

	@Override
	public List<Board> findByStudyId(Long id) {
		Study study = studyRepository.findById(id).get();
		return boardRepository.findByStudy(study);
	}

	@Override
	public void insertBoard(Board board) {
		boardRepository.save(board);
	}


}
