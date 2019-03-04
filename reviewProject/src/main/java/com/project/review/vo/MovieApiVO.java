package com.project.review.vo;

public class MovieApiVO {
	private String movie_nm;
	private String open_dt;
	private String genre;
	private String nation;
	private String director;
	private String actor;
	private String poster;
	
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
		return "MovieApiVO [movie_nm=" + movie_nm + ", open_dt=" + open_dt + ", genre=" + genre + ", nation=" + nation
				+ ", director=" + director + ", actor=" + actor + ", poster=" + poster + "]";
	}
}
