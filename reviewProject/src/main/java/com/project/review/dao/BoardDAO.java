package com.project.review.dao;

import java.util.List;

import com.project.review.vo.BoardVO;

public interface BoardDAO {
	public List<BoardVO> getBoardList();
	public BoardVO getBoardById(int board_num);
}
