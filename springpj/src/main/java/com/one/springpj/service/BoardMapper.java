package com.one.springpj.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.one.springpj.model.Board;

@Repository("BoardMapper")
public interface BoardMapper {
	
	public boolean addBoard(Board b);
    public List<Board> getBoard();
    public Board getBoardOne(int idx);
  
}
