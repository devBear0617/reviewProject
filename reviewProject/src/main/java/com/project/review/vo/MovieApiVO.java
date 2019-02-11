package com.project.review.vo;

import java.util.Date;

public class MovieApiVO {
	private int movieCd;
	private String movieNm;
	private String movieNmEn;
	private Date openDt;
	private String genreAlt;
	private String repNationNm;
	private String peopleNm;
	
	public int getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(int movieCd) {
		this.movieCd = movieCd;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	public String getMovieNmEn() {
		return movieNmEn;
	}
	public void setMovieNmEn(String movieNmEn) {
		this.movieNmEn = movieNmEn;
	}
	public Date getOpenDt() {
		return openDt;
	}
	public void setOpenDt(Date openDt) {
		this.openDt = openDt;
	}
	public String getGenreAlt() {
		return genreAlt;
	}
	public void setGenreAlt(String genreAlt) {
		this.genreAlt = genreAlt;
	}
	public String getRepNationNm() {
		return repNationNm;
	}
	public void setRepNationNm(String repNationNm) {
		this.repNationNm = repNationNm;
	}
	public String getPeopleNm() {
		return peopleNm;
	}
	public void setPeopleNm(String peopleNm) {
		this.peopleNm = peopleNm;
	}
	
	@Override
	public String toString() {
		return "MovieApiVO [movieCd=" + movieCd + ", movieNm=" + movieNm + ", movieNmEn=" + movieNmEn + ", openDt="
				+ openDt + ", genreAlt=" + genreAlt + ", repNationNm=" + repNationNm + ", peopleNm=" + peopleNm + "]";
	}
}
