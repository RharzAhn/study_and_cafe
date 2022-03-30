package com.one.springpj.service;

import java.util.List;

import com.one.springpj.model.Likes;
import com.one.springpj.model.Study;

public interface StudyService {
	public List<Study> getList();
	public void insert(Study study);
	public Study read(Long id);
	public void update(Study study);
	
	public List<Likes> getLikes();
	public void insertLike(Likes like);
	public List<Likes> isLike(Long studyId, Long userId);
	public void deleteLike(Long id);
}
