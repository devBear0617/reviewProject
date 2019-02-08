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
		// TODO Auto-generated method stub
		return boardDAO.getTvBoardList();
	}
	
	
	
	
	

}
