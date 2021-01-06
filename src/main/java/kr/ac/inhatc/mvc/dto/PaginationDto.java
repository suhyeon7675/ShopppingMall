package kr.ac.inhatc.mvc.dto;

public class PaginationDto {
	private int listSize=10;	//한 페이지 당 보여질 게시물의 개수 10으로 세팅
	private int rangeSize=10;	//한 페이지 범위에 보여질 페이지의 개수 10으로 세팅
	private int page;			//현재 목록의 페이지 번호
	private int range;			//현재 페이지 범위
	private int startList;		//현재 페이지 범위의 시작 번호
	private int boardCnt;		//전체 게시물의 개수
	private int pageCnt;		//전체 페이지의 개수
	private int startPage;		//각 페이지 범위의 시작 번호
	private int endPage;		//각 페이지 범위의 끝 번호
	
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getRangeSize() {
		return rangeSize;
	}
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int range) {
		this.range = range;
	}
	public int getStartList() {
		return startList;
	}
	public void setStartList(int startList) {
		this.startList = startList;
	}
	public int getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
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
	
	public void pageInfo(int page, int range, int boardCnt) {
		this.page = page;
		this.range = range;
		this.boardCnt = boardCnt;
		
		//게시판 시작번호 (첫번째 게시글은 0, 11번째 게시글은 10 => (페이지 번호 -1)*페이지 사이즈)
		this.startList = (page-1) * listSize;
		
		//(전체 게시글 수 / 한 페이지 당 게시글 수)의 소수점 이하를 Math.ceil 함수로 올림하여 전체 페이지 개수를 구함
		//Math.ceil함수의 결과값이 double이기 때문에 listSize도 double로 변환 후 int로 맞춰줌
		this.pageCnt = (int) Math.ceil(boardCnt/(double)listSize);
		
		//시작 페이지
		this.startPage = (range-1)*rangeSize+1;
		
		//마지막 페이지
		this.endPage = range*rangeSize;
		
		//마지막 페이지 번호와 페이지의 총 개수를 비교하여 마지막 번호가 페이지의 총 개수보다 크면 마지막 페이지 번호를 페이지의 총 개수로 세팅
		if(this.endPage >= this.pageCnt) {
			this.endPage = this.pageCnt;
		}
	}
}
