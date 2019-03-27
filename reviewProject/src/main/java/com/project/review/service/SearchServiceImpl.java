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
	public List<Integer> searchMovie_likeCount(String keyword) {
		
		return searchDAO.searchMovie_likeCount(keyword);
	}
	
	@Override
	public List<Integer> searchMovie_Grade(String keyword) {
		
		return searchDAO.searchMovie_Grade(keyword);
	}
	
	@Override
	public List<Integer> searchMovie_titleContent(String keyword) {
		
		return searchDAO.searchMovie_titleContent(keyword);
	}
	
	@Override
	public List<Integer> searchMovie_Member(String keyword) {
		
		return searchDAO.searchMovie_Member(keyword);
	}
	
	@Override
	public List<Integer> searchMovie_ReplyContent(String keyword) {
		
		return searchDAO.searchMovie_ReplyContent(keyword);
	}
	
	@Override
	public List<Integer> searchMovie_Hashtag(String keyword) {
		
		return searchDAO.searchMovie_Hashtag(keyword);
	}
	
	@Override
	public List<Integer> searchMovie(String keyword) {
		
		return searchDAO.searchMovie(keyword);
	}
	
	@Override
	public List<Integer> searchTotal(String keyword) {
		
		return searchDAO.searchTotal(keyword);
	}
	
	
}
