package com.project.review.vo;

import java.util.Date;

public class MovieApiVO {
	private int movie_cd;
	private String movie_nm;
	private Date open_dt;
	private String genre;
	private String nation;
	private String people;
	
	public int getMovie_cd() {
		return movie_cd;
	}
	public void setMovie_cd(int movie_cd) {
		this.movie_cd = movie_cd;
	}
	public String getMovie_nm() {
		return movie_nm;
	}
	public void setMovie_nm(String movie_nm) {
		this.movie_nm = movie_nm;
	}
	public Date getOpen_dt() {
		return open_dt;
	}
	public void setOpen_dt(Date open_dt) {
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
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	
	@Override
	public String toString() {
		return "MovieApiVO [movie_cd=" + movie_cd + ", movie_nm=" + movie_nm + ", open_dt=" + open_dt + ", genre="
				+ genre + ", nation=" + nation + ", people=" + people + "]";
	}
}
