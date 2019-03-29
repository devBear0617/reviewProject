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

	// only TV
	@Override
	public List<BoardVO> searchTV(String keyword) {
		
		return searchDAO.searchTV(keyword);
	}
	
	// only Game
	@Override
	public List<BoardVO> searchGame(String keyword) {
		
		return searchDAO.searchGame(keyword);
	}
	
	// Movie's
	@Override
	public List<BoardVO> searchMovie_likeCount(String keyword) {
		
		return searchDAO.searchMovie_likeCount(keyword);
	}
	
	@Override
	public List<BoardVO> searchMovie_Grade(String keyword) {
		
		return searchDAO.searchMovie_Grade(keyword);
	}
	
	@Override
	public List<BoardVO> searchMovie_titleContent(String keyword) {
		
		return searchDAO.searchMovie_titleContent(keyword);
	}
	
	@Override
	public List<BoardVO> searchMovie_Member(String keyword) {
		
		return searchDAO.searchMovie_Member(keyword);
	}
	
	@Override
	public List<BoardVO> searchMovie_ReplyContent(String keyword) {
		
		return searchDAO.searchMovie_ReplyContent(keyword);
	}
	
	@Override
	public List<BoardVO> searchMovie_Hashtag(String keyword) {
		
		return searchDAO.searchMovie_Hashtag(keyword);
	}
	
	// only Movie
	@Override
	public List<BoardVO> searchMovie(String keyword) {
		
		return searchDAO.searchMovie(keyword);
	}
	
	// Total
	@Override
	public List<BoardVO> searchTotal(String keyword) {
		
		return searchDAO.searchTotal(keyword);
	}
	
	
}
