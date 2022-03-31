package com.one.springpj.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.one.springpj.domain.BoardVO;
import com.one.springpj.mapper.BoardMapper;
import com.one.springpj.model.Board;
import com.one.springpj.model.User;



@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper boardMapper;

	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		return boardMapper.getList();
	}

	@Override
	public BoardVO read(int bno) {
		// TODO Auto-generated method stub
		boardMapper.hitCount(bno);
		return boardMapper.read(bno);
	}

	@Override
	public void insert(BoardVO vo) {
		// TODO Auto-generated method stub
		boardMapper.insert(vo);
	}

	@Override
	public int boardCount() {
		// TODO Auto-generated method stub
		return boardMapper.boardCount();
	}

	@Override
	public boolean update(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardMapper.update(vo)==1;
	}

	@Override
	public boolean delete(int bno) {
		// TODO Auto-generated method stub
	return boardMapper.delete(bno)==1;
}

	@Override
	public List<BoardVO> findPage(HashMap<String,Object> hm) {
		// TODO Auto-generated method stub
		return boardMapper.findPage(hm);
	}

	@Override
	public List<BoardVO> findAll(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return boardMapper.findAll(hm);
	}

	@Override
	public int boardCount(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return boardMapper.boardCount(hm);
	}

	@Override
	public void insert(Board board, User user) {
		// TODO Auto-generated method stub
		
	}

	
}
