package com.project.review.service;

import java.util.List;

import com.project.review.vo.BoardVO;

public interface SearchService {
	
	public List<BoardVO> searchTitle(String s_title);
	
}
