package com.project.review.vo;

public class Pagination {
	private int curPage;
	private int startPage;
	private int endPage;
	private int prevPage;
	private int nextPage;
	private int pageCnt;
	private int displayIdx;
	
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;

		int pScale = 5;
		int sp = 0;
		if (curPage%pScale==0)
			sp = curPage-(curPage-1)%pScale;
		else
			sp = curPage-curPage%pScale+1;
		
		setDisplayIdx(((curPage-1)%pScale)*10);
		setStartPage(sp);
		setEndPage(sp+pScale-1);
		setNextPage(sp+pScale);
		if (sp==1)
			setPrevPage(0);
		else
			setPrevPage(sp-pScale);
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getDisplayIdx() {
		return displayIdx;
	}
	public void setDisplayIdx(int displayIdx) {
		this.displayIdx = displayIdx;
	}
	
	@Override
	public String toString() {
		return "Pagination [curPage=" + curPage + ", startPage=" + startPage + ", endPage=" + endPage + ", prevPage="
				+ prevPage + ", nextPage=" + nextPage + ", pageCnt=" + pageCnt + ", displayIdx=" + displayIdx + "]";
	}
}
