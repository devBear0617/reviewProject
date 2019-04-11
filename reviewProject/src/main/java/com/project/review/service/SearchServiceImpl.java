package com.project.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	//searchMovie_likeCount
	@Override
	public List<BoardVO> searchMovie_likeCount(String keyword, int pnum) {
		int limit = 10;
		int start_content = (pnum - 1) * 10 + 1;
		int end_content = start_content + limit -1;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("start_content", start_content);
		map.put("end_content", end_content);
		
		return searchDAO.searchMovie_likeCount(map);
	}
	@Override
	public int searchMovie_likeCount_cnt(String keyword) {		
		return searchDAO.searchMovie_likeCount_cnt(keyword);
	}
	
	//searchMovie_Grade
	@Override
	public List<BoardVO> searchMovie_Grade(String keyword , int pnum) {
		int limit = 10;
		int start_content = (pnum - 1) * 10 + 1;
		int end_content = start_content + limit -1;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("start_content", start_content);
		map.put("end_content", end_content);
		
		return searchDAO.searchMovie_Grade(map);
	}
	@Override
	public int searchMovie_Grade_cnt(String keyword) {		
		return searchDAO.searchMovie_Grade_cnt(keyword);
	}
	
	//searchMovie_titleContent
	@Override
	public List<BoardVO> searchMovie_titleContent(String keyword, int pnum) {
		int limit = 10;
		int start_content = (pnum - 1) * 10 + 1;
		int end_content = start_content + limit -1;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("start_content", start_content);
		map.put("end_content", end_content);
		
		return searchDAO.searchMovie_titleContent(map);
	}
	@Override
	public int searchMovie_titleContent_cnt(String keyword) {		
		return searchDAO.searchMovie_titleContent_cnt(keyword);
	}
	
	//searchMovie_Member
	@Override
	public List<BoardVO> searchMovie_Member(String keyword , int pnum) {
		int limit = 10;
		int start_content = (pnum - 1) * 10 + 1;
		int end_content = start_content + limit -1;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("start_content", start_content);
		map.put("end_content", end_content);
		
		return searchDAO.searchMovie_Member(map);
	}
	@Override
	public int searchMovie_Member_cnt(String keyword) {		
		return searchDAO.searchMovie_Member_cnt(keyword);
	}
	
	//searchMovie_Hashtag
	@Override
	public List<BoardVO> searchMovie_Hashtag(String keyword, int pnum) {
		int limit = 10;
		int start_content = (pnum - 1) * 10 + 1;
		int end_content = start_content + limit -1;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("start_content", start_content);
		map.put("end_content", end_content);		
		return searchDAO.searchMovie_Hashtag(map);
	}
	@Override
	public int searchMovie_Hashtag_cnt(String keyword) {		
		return searchDAO.searchMovie_Hashtag_cnt(keyword);
	}	
	
	//searchMovie_ReplyContent
	@Override
	public List<BoardVO> searchMovie_ReplyContent(String keyword , int pnum) {
		int limit = 10;
		int start_content = (pnum - 1) * 10 + 1;
		int end_content = start_content + limit -1;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("start_content", start_content);
		map.put("end_content", end_content);		
		return searchDAO.searchMovie_ReplyContent(map);
	}
	@Override
	public int searchMovie_ReplyContent_cnt(String keyword) {		
		return searchDAO.searchMovie_ReplyContent_cnt(keyword);
	}	
	
	// only Movie
	@Override
	public List<BoardVO> searchMovie(String keyword, int pnum) {
		int limit = 10;
		int start_content = (pnum - 1) * 10 + 1;
		int end_content = start_content + limit -1;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("start_content", start_content);
		map.put("end_content", end_content);
		
		return searchDAO.searchMovie(map);
	}
	
	@Override
	public int searchMovie_cnt(String keyword) {		
		return searchDAO.searchMovie_cnt(keyword);
	}
	
	// Total
	@Override
	public List<BoardVO> searchTotal(String keyword, int pnum) {		
		int limit = 10;
		int start_content = (pnum - 1) * 10 + 1;
		int end_content = start_content + limit -1;
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("start_content", start_content);
		map.put("end_content", end_content);
		
		return searchDAO.searchTotal(map);
	}	
	@Override
	public int searchTotal_cnt(String keyword) {		
		return searchDAO.searchTotal_cnt(keyword);
	}
	
}
