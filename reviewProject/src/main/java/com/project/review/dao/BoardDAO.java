package com.project.review.dao;

import java.util.List;

import com.project.review.vo.BoardVO;


public interface BoardDAO {
	public List<BoardVO> getMovieBoardList();
	public List<BoardVO> getTvBoardList();
	public BoardVO getBoardById(int board_num);
	
	public BoardVO searchBoard(int board_num);
	public BoardVO newBoard(String board_title, String board_content, String member_id);
	
}
