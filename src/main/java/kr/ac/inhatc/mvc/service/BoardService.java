package kr.ac.inhatc.mvc.service;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.inhatc.mvc.dto.BoardDto;
import kr.ac.inhatc.mvc.dto.SearchDto;
import kr.ac.inhatc.mvc.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired
	BoardMapper board;
   
	//게시판의 페이지 정보를 가지고 있는 search 객체를 받을 수 있도록 파라미터 수정
	public List<?> selectSubjectList(SearchDto search) throws Exception{
		return board.selectSubjectList(search);   
	}
	//검색어에 맞는 게시글 개수를 받아옴
	public int getBoardListCnt(SearchDto search) throws Exception {
		return board.getBoardListCnt(search);
	}
	
	public HashMap selectSubjectOne(String no) throws Exception{
		return board.selectSubjectOne(no);
	}
	
	public int registSubject(HashMap<String, String> map) throws Exception {
		return board.registSubject(map);
	}
	
	public int modifyBoardDetail(HashMap<String, String> map) throws Exception {
		return board.modifyBoardDetail(map);
	}
	
	public int deleteBoardDetail(String no) throws Exception {
		return board.deleteBoardDetail(no);
	}
}