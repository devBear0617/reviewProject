package com.project.review.service;


import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project.review.dao.BoardDAO;
import com.project.review.dao.MovieApiDAO;
import com.project.review.vo.BoardVO;
import com.project.review.vo.Board_MovieVO;
import com.project.review.vo.GradeVO;
import com.project.review.vo.HashtagVO;
import com.project.review.vo.MovieApiVO;
import com.project.review.vo.ReplyVO;


@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private MovieApiDAO movieApiDAO;

	// -- select ---------------------------------------------------------
	
	//게시글 호출
	@Override
	public BoardVO getBoardById(int board_num) {
		// movie/tv/game -> 해당하는 board값 호출하는 함수 작성
		
		return boardDAO.getBoardById(board_num);
	}
	
	//게시판 호출
	@Override
	public List<BoardVO> getBoardList() {
		return boardDAO.getBoardList();
	}
	@Override
	public List<BoardVO> getMovieBoardList() {
		// movie/tv/game -> 해당하는 board값 호출하는 함수 작성,
		
		return boardDAO.getMovieBoardList();
	}

	
	
	// -- insert ---------------------------------------------------------
	
	// 리플 추가
	@Override
	public void insertReply(ReplyVO reply, int board_num, String member_id) {
		
		// 보드넘 대입
		/*board_num = reply.getBoard_num();*/
		reply.setBoard_num(board_num);
		reply.setMember_id(member_id);
		// 리플 추가
		boardDAO.insertReply(reply);
		
	}
	
	//게시글 추가 (Board & Board_Movie & Garde & Hashtag)
	@Override
	public void insertMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, 
			HashtagVO hash, String member_id) {
		
		// member 처리
		board.setMember_id(member_id);

		// board테이블 추가
		boardDAO.insertMovie(board);
		// 추가한 board테이블에서 board_num 추출해서 다른 테이블 board_num에 대입
		movie.setBoard_num(board.getBoard_num());
		hash.setBoard_num(board.getBoard_num());
		grade.setBoard_num(board.getBoard_num());
		// 대입한 board_num으로 다른 테이블들도 insert
		boardDAO.insertGrade(grade);
		boardDAO.insertB_movie(movie);
		boardDAO.insertHashtag(hash);
	}
	
	/*@Override
	public int addBoard(BoardVO boardVO) {
		//member 처리 필요
		boardVO.setMember_id("qwe");
		//board 생성
		boardDAO.setBoard(boardVO);
		Board_MovieVO b = new Board_MovieVO();
		b.setBoard_num(boardVO.getBoard_num());
		//board_movie 생성
		boardDAO.setB_Movie(b);
		
		return boardVO.getBoard_num();
		
		if(b_type.equals("movie") ) {
			boardDAO.setB_Movie(board_num);
		}else if(b_type.equals("tv") ) {
			boardDAO.setB_Movie(board_num);
		}else if(b_type.equals("game") ) {
			boardDAO.setB_Movie(board_num);
		}else {
			System.out.println("b_type 오류");
		}
		
	}*/

	//게시글 수정 (Board & Board_Movie & Garde & Hashtag)
	@Override
	public void updateMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash) {
		// 현재 저장되어있는 baord_num을 다른 VO에 대입
		board.setBoard_num(board.getBoard_num());
		movie.setBoard_num(board.getBoard_num());
		grade.setBoard_num(board.getBoard_num());
		hash.setBoard_num(board.getBoard_num());
		// 수정
		boardDAO.updateMovie(board);
		boardDAO.updateB_movie(movie);
		boardDAO.updateGrade(grade);
		boardDAO.updateHashtag(hash);
	}

	@Override
	public void deleteMovie(int board_num) {	
		// 삭제 (board_num으로)
		boardDAO.deleteHashtag(board_num);
		boardDAO.deleteB_movie(board_num);
		boardDAO.deleteGrade(board_num);
		boardDAO.deleteMovie(board_num);
	}	
	
	
	// -- api ---------------------------------------------------------
	@Override
	public JsonObject searchMovie(String movie_nm) {
		JsonArray jsonArray = movieApiDAO.searchMovie(movie_nm);
		
		return movieApiDAO.getMovieNmLsit(jsonArray);
	}
	
	// 영화 기본 정보 호출
	@Override
	public MovieApiVO getMovieInfo(String movie_nm) {
		JsonArray jsonArray = movieApiDAO.searchMovie(movie_nm);
		
		return movieApiDAO.getMovie(jsonArray);
	}
}
