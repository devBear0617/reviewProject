package com.project.review.dao;

import java.util.List;

import com.project.review.vo.BoardVO;
import com.project.review.vo.MovieApiVO;

public interface SearchDAO {

	public List<BoardVO> searchTitle(String s_title);
}
