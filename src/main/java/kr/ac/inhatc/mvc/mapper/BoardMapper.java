package kr.ac.inhatc.mvc.mapper;

import java.util.HashMap;
import java.util.List;

import kr.ac.inhatc.mvc.dto.BoardDto;
import kr.ac.inhatc.mvc.dto.SearchDto;

public interface BoardMapper {
	
   public String getName() throws Exception;
   
   //게시판의 페이지 정보를 가지고 있는 search 객체를 받을 수 있도록 파라미터 수정
   public List<?> selectSubjectList(SearchDto search) throws Exception;
   
   //검색어에 맞는 게시글 개수를 받아옴
   public int getBoardListCnt(SearchDto search) throws Exception;
   
   public HashMap selectSubjectOne(String no) throws Exception;
   
   public int registSubject(HashMap<String, String> map) throws Exception;
   
   public int modifyBoardDetail(HashMap<String, String> map) throws Exception;
   
   public int deleteBoardDetail(String no) throws Exception;
}