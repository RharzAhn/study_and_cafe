package com.one.springpj.mapper;

import java.util.HashMap;
import java.util.List;

import com.one.springpj.domain.BoardVO;

public interface BoardMapper {

	List<BoardVO> getList();

	void hitCount(int bno);

	BoardVO read(int bno);

	void insert(BoardVO vo);

	int boardCount();

	List<BoardVO> findAll(HashMap<String, Object> hm);

	int boardCount(HashMap<String, Object> hm);

	List<BoardVO> findPage(HashMap<String, Object> hm);

	int delete(int bno);

	int update(BoardVO vo);

}
