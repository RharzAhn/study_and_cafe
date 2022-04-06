package com.one.springpj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.one.springpj.constant.JoinStatus;
import com.one.springpj.model.Joiner;

public interface JoinerRepository extends JpaRepository<Joiner, Long>{
//	@Query(value="select * from joiner where user_id=?1 and join_status=?2",nativeQuery=true)
	@Query(value="select j from Joiner j join fetch j.study where user_id=?1 and join_status=?2")
	public List<Joiner> findJoinUserList(Long userId, String joinStatus);
	
	@Query(value="select j from Joiner j join fetch j.study where leader_id=?1 and join_status='WAITING'")
	public List<Joiner> findApplyUser(Long leaderId);
}
