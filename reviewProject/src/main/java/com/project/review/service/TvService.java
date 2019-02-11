package com.project.review.service;

import java.util.List;

import com.project.review.vo.BoardVO;

public interface TvService { 
	List<BoardVO> getTvBoardList();
	
	BoardVO searchBoard(int board_num);
	BoardVO newBoard(String board_title, String board_content, String member_id);
	
	
}
