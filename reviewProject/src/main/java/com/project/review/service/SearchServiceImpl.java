package com.project.review.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.project.review.dao.BoardDAO;
import com.project.review.dao.MovieApiDAO;
import com.project.review.dao.SearchDAO;
import com.project.review.vo.BoardVO;
import com.project.review.vo.MovieApiVO;

@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	private SearchDAO searchDAO;
	@Autowired
	private MovieApiDAO movieApiDAO;
	
	@Override
	public List<BoardVO> searchTitle(String s_title) {
		
		return searchDAO.searchTitle(s_title);
	}
	
	@Override
	public List<MovieApiVO> searchMovie(String s_title) {
		MovieApiVO movieApiVO = new MovieApiVO();
		movieApiVO.setMovie_nm(s_title);
		movieApiVO = movieApiDAO.getMovieApi(movieApiVO, false);
		
		System.out.println(movieApiVO.toString());
		List<MovieApiVO> list = new ArrayList<MovieApiVO>();
		list.add(movieApiVO);
		
		return list;
	}

	@Override
	public JsonArray s_autocomplete(String s_title, String s_sort) {
		System.out.println(">"+s_title);
		System.out.println(">"+s_sort);
		
		JsonArray jsonArr = new JsonArray();
		
		switch (s_sort) {
		case "total":
			
			break;
		case "title":
			
			break;
		case "content":
			
			break;
		case "reply":
			
			break;
			
		case "movie":
			jsonArr = movieApiDAO.getMovieArray(s_title);
			break;
			
		case "people":
			jsonArr = movieApiDAO.getCaPeopleArray(s_title, 0);
			System.out.println("___"+jsonArr.toString());
			break;
		default:
			break;
		}
		
		return jsonArr;
	}
	
	
}
