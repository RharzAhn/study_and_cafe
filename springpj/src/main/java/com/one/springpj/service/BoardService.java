package com.one.springpj.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.one.springpj.domain.BoardVO;
import com.one.springpj.model.Board;
import com.one.springpj.model.User;


@Service
public interface BoardService {
	
public void insert(Board board,User user);
	
	BoardVO read(int bno);
	void insert(BoardVO vo);
	int boardCount();
	int boardCount(HashMap<String, Object> hm);
	boolean update(BoardVO vo);
	boolean delete(int bno);
	List<BoardVO> getList();
	List<BoardVO> findAll(HashMap<String, Object> hm);
	public List<BoardVO> findPage(HashMap<String,Object>hm);
	

}
