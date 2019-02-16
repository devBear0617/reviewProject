package com.project.review.vo;



import java.sql.Timestamp;
import java.util.List;

public class BoardVO {
	private int board_num;
	private String board_title;
	private String board_content;
	private Timestamp board_date;
	//private Date boardupdate;
	
	
	private String member_id;
/*	private String member_pw;
	private String member_name;*/
	
	private String board_type;
	private int lemon_grade;
	private int recommend;
	private String score_name1;
	private int score_grade1;
	private String score_name2;
	private int score_grade2;
	private String score_name3;
	private int score_grade3;
	private String score_name4;
	private int score_grade4;
	
	
	private Board_MovieVO b_movieVO;
	private Board_TvVO b_tvVO;
	/*private Board_GameVO b_gameVO;*/
	
	private MemberVO memberVO;
	private HashtagVO hashtagVO;
	private List<ReplyVO> replyList;
	
	
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Timestamp getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public int getLemon_grade() {
		return lemon_grade;
	}
	public void setLemon_grade(int lemon_grade) {
		this.lemon_grade = lemon_grade;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public String getScore_name1() {
		return score_name1;
	}
	public void setScore_name1(String score_name1) {
		this.score_name1 = score_name1;
	}
	public int getScore_grade1() {
		return score_grade1;
	}
	public void setScore_grade1(int score_grade1) {
		this.score_grade1 = score_grade1;
	}
	public String getScore_name2() {
		return score_name2;
	}
	public void setScore_name2(String score_name2) {
		this.score_name2 = score_name2;
	}
	public int getScore_grade2() {
		return score_grade2;
	}
	public void setScore_grade2(int score_grade2) {
		this.score_grade2 = score_grade2;
	}
	public String getScore_name3() {
		return score_name3;
	}
	public void setScore_name3(String score_name3) {
		this.score_name3 = score_name3;
	}
	public int getScore_grade3() {
		return score_grade3;
	}
	public void setScore_grade3(int score_grade3) {
		this.score_grade3 = score_grade3;
	}
	public String getScore_name4() {
		return score_name4;
	}
	public void setScore_name4(String score_name4) {
		this.score_name4 = score_name4;
	}
	public int getScore_grade4() {
		return score_grade4;
	}
	public void setScore_grade4(int score_grade4) {
		this.score_grade4 = score_grade4;
	}
	public Board_MovieVO getB_movieVO() {
		return b_movieVO;
	}
	public void setB_movieVO(Board_MovieVO b_movieVO) {
		this.b_movieVO = b_movieVO;
	}
	public Board_TvVO getB_tvVO() {
		return b_tvVO;
	}
	public void setB_tvVO(Board_TvVO b_tvVO) {
		this.b_tvVO = b_tvVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public HashtagVO getHashtagVO() {
		return hashtagVO;
	}
	public void setHashtagVO(HashtagVO hashtagVO) {
		this.hashtagVO = hashtagVO;
	}
	public List<ReplyVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<ReplyVO> replyList) {
		this.replyList = replyList;
	}
	@Override
	public String toString() {
		return "BoardVO [board_num=" + board_num + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_date=" + board_date + ", member_id=" + member_id + ", board_type=" + board_type
				+ ", lemon_grade=" + lemon_grade + ", recommend=" + recommend + ", score_name1=" + score_name1
				+ ", score_grade1=" + score_grade1 + ", score_name2=" + score_name2 + ", score_grade2=" + score_grade2
				+ ", score_name3=" + score_name3 + ", score_grade3=" + score_grade3 + ", score_name4=" + score_name4
				+ ", score_grade4=" + score_grade4 + ", b_movieVO=" + b_movieVO + ", b_tvVO=" + b_tvVO + ", memberVO="
				+ memberVO + ", hashtagVO=" + hashtagVO + ", replyList=" + replyList + "]";
	}
	
	
	
	
	
	

}
