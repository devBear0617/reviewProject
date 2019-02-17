package com.project.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.review.dao.BoardDAO;
import com.project.review.vo.BoardVO;

@Service
public class TvServiceImpl implements TvService {
	
	@Autowired
	private BoardDAO boardDAO;

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
