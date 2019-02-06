package com.project.review.dao;

import com.project.review.vo.MovieApiVO;

public interface MovieApiDAO {
	public MovieApiVO getMovie(String query);
}
