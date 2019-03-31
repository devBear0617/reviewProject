package com.project.review.service;


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
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
import com.project.review.vo.LikeItVO;
import com.project.review.vo.MovieApiVO;
import com.project.review.vo.ReplyVO;


@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private MovieApiDAO movieApiDAO;

	// -- select ---------------------------------------------------------

	// Jsoup getContent
	@Override
	public String getContent(int board_num) {
		
		return boardDAO.getContent(board_num);
	}
	
	//게시글 호출
	@Override
	public BoardVO getBoardById(int board_num) {
		// movie/tv/game -> 해당하는 board값 호출하는 함수 작성
		
		return boardDAO.getBoardById(board_num);
	}
	@Override
	public int replyCount(int board_num) {
		
		return boardDAO.replyCount(board_num);
	}
	@Override
	public List<ReplyVO> replyList(int board_num) {
		
		return boardDAO.replyList(board_num);
	}
	@Override
	public int likeCount(int board_num) {
		
		return boardDAO.likeCount(board_num);
	}
	@Override
	public int likeCheck(Map<String, Object> map) {
		
		return boardDAO.likeCheck(map);
	}
	
	
	//게시판 호출 및 정렬
	@Override
	public List<BoardVO> getMovieBoardList(Board_MovieVO b_MovieVO) {
	
		return boardDAO.getMovieBoardList(b_MovieVO);
	}	
	
	@Override
	public int getMovieBoardCount() {
		return boardDAO.getMovieBoardCount();
	}
	@Override
	public List<ReplyVO> getMovieBoardReplyList() {
		
		return boardDAO.getMovieBoardReplyList();
	}
	@Override
	public List<LikeItVO> getMovieBoardLikeList() {
		
		return boardDAO.getMovieBoardLikeList();
	}
	/*plusReadCount*/
	@Override
	public void plusReadCount(int board_num) {
		
		boardDAO.plusReadCount(board_num);
	}
	
	
	// -- insert ---------------------------------------------------------
	
	// likeItMinus
	@Override
	public void likeItMinus(LikeItVO likeVO, int board_num, String member_id) {
		board_num = likeVO.getBoard_num();
		likeVO.setBoard_num(board_num);
		likeVO.setMember_id(member_id);
			
		boardDAO.likeItMinus(likeVO);
	}
	
	// likeItPlus
	@Override
	public void likeItPlus(LikeItVO likeVO, int board_num, String member_id) {
		board_num = likeVO.getBoard_num();
		likeVO.setBoard_num(board_num);
		likeVO.setMember_id(member_id);
		
		boardDAO.likeItPlus(likeVO);
	}
	
	// 리플 추가 
	@Override
	public void insertReply(ReplyVO replyVO, String member_id) {
		// 보드넘 대입
		replyVO.setMember_id(member_id);
		
		// 리플 추가
		boardDAO.insertReply(replyVO);
	}
	// 리플 수정
	@Override
	public void updateReply(ReplyVO replyVO, String reply_content) {
		
		replyVO.setReply_content(reply_content);
		
		boardDAO.updateReply(replyVO);
	}

	// 리플 삭제
	@Override
	public void deleteReply(int reply_num) {
		
		boardDAO.deleteReply(reply_num);
	}
	
	//게시글 추가 (Board & Board_Movie & Garde & Hashtag)
	@Override
	public void insertMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash, MovieApiVO movieApiVO, String member_id) {
		// member 처리
		board.setMember_id(member_id);
		// board테이블 추가
		boardDAO.insertMovie(board);
		
		// 썸네일 추가
		if (boardDAO.getContent(board.getBoard_num()) != null) {
			String content = boardDAO.getContent(board.getBoard_num());
			Document document = Jsoup.parse(content);
			Element element = document.select("img").first();
			if (element != null) {
				String thumbnail = element.attr("src");
				board.setThumbnail(thumbnail);
				boardDAO.insertThumbnail(board);
			} else if (element == null) {
				String thumbnail = movieApiVO.getPoster();
				board.setThumbnail(thumbnail);
				boardDAO.insertThumbnail(board);
			}
		}
		
		// 추가한 board테이블에서 board_num 추출해서 다른 테이블 board_num에 대입
		movie.setBoard_num(board.getBoard_num());
		setMovieApi(movieApiVO);
		hash.setBoard_num(board.getBoard_num());
		grade.setBoard_num(board.getBoard_num());
		
		// 대입한 board_num으로 다른 테이블들도 insert
		boardDAO.insertGrade(grade);
		boardDAO.insertB_movie(movie);
		boardDAO.insertHashtag(hash);
	}
	

	//게시글 수정 (Board & Board_Movie & Garde & Hashtag)
	@Override
	public void updateMovie(BoardVO board, Board_MovieVO movie, GradeVO grade, HashtagVO hash, MovieApiVO movieApiVO) {
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
		setMovieApi(movieApiVO);
	}
	
	// 게시글 삭제
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
	public JsonArray searchMovie(String movie_nm) {
		
		return movieApiDAO.getMovieArray(movie_nm);
	}
	
	@Override
	public void setMovieApi(MovieApiVO movieApiVO) {
		String isMoiveNm = null;
		try {
			isMoiveNm = getMovieInfo(movieApiVO.getMovie_nm()).getMovie_nm();
		} catch (Exception e) {
			System.out.println("isMoiveNm : "+e);
		}
		
		if (isMoiveNm == null) {
			MovieApiVO movieInfo = movieApiDAO.getMovieApi(movieApiVO, true);
			if (movieInfo != null)
				boardDAO.insertMovieInfo(movieInfo);
			else 
				boardDAO.insertMovieInfo(movieApiVO);
		}
	}
	
	// 영화 기본 정보 호출
	@Override
	public MovieApiVO getMovieInfo(String movie_nm) {
		
		return boardDAO.getMovieInfo(movie_nm);
	}
	
	@Override
	public MovieApiVO getMovie(MovieApiVO movieApiVO) {
		String isMoiveNm = null;
		
		try {
			isMoiveNm = getMovieInfo(movieApiVO.getMovie_nm()).getMovie_nm();
		} catch (Exception e) {
			System.out.println("isMoiveNm : "+e);
			isMoiveNm = null;
		}

		if (isMoiveNm == null) {
			movieApiVO = movieApiDAO.getMovieApi(movieApiVO, false);
			JsonArray jsonArray = searchMovie(movieApiVO.getMovie_nm());
			
			if (jsonArray.size() != 0) {
				JsonObject object = (JsonObject) jsonArray.get(0);
				movieApiVO.setDirector(object.get("director").getAsString());
				movieApiVO.setActor(object.get("actor").getAsString());
				movieApiVO.setPoster(object.get("image").getAsString());
			}
			boardDAO.insertMovieInfo(movieApiVO);
		}
		else
			movieApiVO = getMovieInfo(movieApiVO.getMovie_nm());
		
		return movieApiVO;
	}

	//Category
	@Override
	public Map<String, Object> getCategory(String category_type) {
		if (!category_type.equals(null)) 
			category_type = category_type.split("cg_img_")[1];
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ca_type", category_type);
		List<String> cd = new ArrayList<>();
		List<String> dCategoryNm = new ArrayList<String>();
		
		switch (category_type) {
			case "actor":
				String[] actorCd = {"10057015", "20323971", "10087395", "20322111", "20160378"};  
				String[] actorNm = {"이나라", "이현균", "한기윤", "강길우", "김정팔"};
				
				cd = Arrays.asList(actorCd);
				dCategoryNm = Arrays.asList(actorNm);
				break;
			case "director":
				String[] directorCd = {"10085335", "10087327", "20112325", "20213366"};  
				String[] directorNm = {"다렌 폴 피셔", "줄리아 하트", "강유가람", "허세준"};
				
				cd = Arrays.asList(directorCd);
				dCategoryNm = Arrays.asList(directorNm);
				break;
			case "openDt":
				String[] dtCd = new String[11];
				String[] dtNm = new String[11];
				dtCd[0] = "2010";
				dtNm[0] = "2010년 이전";
				for (int i=1; i<dtCd.length; i++) {
					dtCd[i] = "201"+i;
					dtNm[i] = "201"+i+"년";
				}
				dtCd[10] = "-1";
				dtNm[10] = "현재 상영작";
				cd = Arrays.asList(dtCd);
				dCategoryNm = Arrays.asList(dtNm);
				break;
			case "movieType":
				String[] typeCd = {"220101", "220102", "220103", "220109"};  
				String[] typeNm = {"장편", "단편", "옴니버스", "기타"};
				
				cd = Arrays.asList(typeCd);
				dCategoryNm = Arrays.asList(typeNm);
				break;
			case "nation":
				String[] nationCd = {"22041011", "22042002", "22044010", "22044017", "22041009", "22041008", "22041001", "22041007"};  
				String[] nationNm = {"한국", "미국", "영국", "프랑스", "중국", "일본", "대만", "인도"};
				
				cd = Arrays.asList(nationCd);
				dCategoryNm = Arrays.asList(nationNm);
				break;
			default:
				break;
		}
		map.put("cd", cd);
		map.put("nm", dCategoryNm);
		
		return map;
	}

	@Override
	public Map<String, Object> getCaMovieList(String ca_type, String cd, String nm, int pnum) {
		System.out.println("2>"+cd);
		if (ca_type.equals("actor") || ca_type.equals("director")) {
			Map<String, Object> map = new HashMap<String, Object>();
			List<String> list = movieApiDAO.getCaPeople1(nm, pnum);
			List<String> list2 = list;
			map.put("cd", list);
			map.put("nm", list);
			
			return map;
		}else if (ca_type.equals("openDt") && cd.equals("-1")) {
			Map<String, Object> map = new HashMap<String, Object>();
			String date = LocalDate.now().minusWeeks(1).format(DateTimeFormatter.BASIC_ISO_DATE);
			map = movieApiDAO.getMap(date);
			
			return map;
		}else {
			return movieApiDAO.getCaMovieArray(ca_type, cd, pnum);
		}
	}
}
