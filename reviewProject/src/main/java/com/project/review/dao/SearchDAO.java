package com.project.review.dao;

import java.util.List;

import com.project.review.vo.BoardVO;

public interface SearchDAO {

	public List<BoardVO> searchTitle(String s_title);
	
	
}
