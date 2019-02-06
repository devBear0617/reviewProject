package com.project.review.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.review.vo.BoardVO;

public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> getBoardList() {
		return boardDAO.getBoardList();
	}

	@Override
	public BoardVO getBoardById(int board_num) {
		return boardDAO.getBoardById(board_num);
	}
}
