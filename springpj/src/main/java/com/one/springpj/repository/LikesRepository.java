package com.one.springpj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.one.springpj.model.Likes;

public interface LikesRepository extends JpaRepository<Likes, Long> {
	@Query("select l from Likes l where user_id=?1 and study_id=?2")
	public List<Likes> checkLike(Long userId, Long studyId);
}
