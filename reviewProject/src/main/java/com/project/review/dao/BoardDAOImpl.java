package com.project.review.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.review.vo.BoardVO;


public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> getMovieBoardList() {
		return boardDAO.getMovieBoardList();
	}

	@Override
	public BoardVO getBoardById(int board_num) {
		return boardDAO.getBoardById(board_num);
	}

	@Override
	public List<BoardVO> getTvBoardList() {
		return boardDAO.getTvBoardList();
	}
	
	@Override
	public BoardVO searchBoard(int board_num) {
		
		return boardDAO.searchBoard(board_num);
	}
	
	@Override
	public BoardVO newBoard(String board_title, String board_content, String member_id) {
		
		return boardDAO.newBoard(board_title, board_content, member_id);
	}
	
	
}
