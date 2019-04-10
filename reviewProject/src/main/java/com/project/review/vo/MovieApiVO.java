package com.project.review.vo;

public class MovieApiVO {
	private String movieCd;
	private String movieNm;
	
	private String movie_cd;
	private String movie_nm;
	private String open_dt;
	private String genre;
	private String nation;
	private String director;
	private String actor;
	private String poster;
	
	public String getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public String getMovie_cd() {
		return movie_cd;
	}
	public void setMovie_cd(String movie_cd) {
		this.movie_cd = movie_cd;
	}
	public String getMovie_nm() {
		return movie_nm;
	}
	public void setMovie_nm(String movie_nm) {
		this.movie_nm = movie_nm;
	}
	public String getOpen_dt() {
		return open_dt;
	}
	public void setOpen_dt(String open_dt) {
		this.open_dt = open_dt;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}

	@Override
	public String toString() {
		return "MovieApiVO [movie_cd=" + movie_cd + ", movie_nm=" + movie_nm + ", open_dt=" + open_dt + ", genre="
				+ genre + ", nation=" + nation + ", director=" + director + ", actor=" + actor + ", poster=" + poster
				+ "]";
	}
}
