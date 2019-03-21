package com.project.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.review.dao.SearchDAO;
import com.project.review.vo.BoardVO;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDAO searchDAO;
	
	@Override
	public List<BoardVO> searchTitle(String s_title) {
		
		return searchDAO.searchTitle(s_title);
	}
	
	
}
