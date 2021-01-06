package kr.ac.inhatc.mvc.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.inhatc.mvc.dto.SearchDto;
import kr.ac.inhatc.mvc.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping("/selectSubjectList") 		// RequestParam 어노테이션으로 특정 파라미터를 View에서 전달 받는다
	public ModelAndView selectSubjectList(@RequestParam(required = false, defaultValue = "1") int page, 
			// 반드시 View에서 넘어올 필요는 없으며 데이터가 없을 경우 기본값으로 1을 세팅
			@RequestParam(required = false, defaultValue = "1") int range,
			// searchCondition 기본값으로 subject 세팅
			@RequestParam(required = false, defaultValue = "subject") String searchCondition,
			@RequestParam(required = false) String searchKeyword) throws Exception {

		ModelAndView mv = new ModelAndView();

		// SearchDto 객체 생성 및 세팅
		SearchDto search = new SearchDto();
		search.setSearchCondition(searchCondition);
		search.setSearchKeyword(searchKeyword);
		
		System.out.println(searchCondition);
		System.out.println(searchKeyword);

		// 전체 게시글 개수
		int boardCnt = boardService.getBoardListCnt(search);
		
		System.out.println(boardCnt);

		// 페이지 정보 세팅
		search.pageInfo(page, range, boardCnt);

		// 화면 하단에 페이징 처리를 할 때 필요하므로 화면으로 보냄
		mv.addObject("pagination", search);
		mv.addObject("subjectList", boardService.selectSubjectList(search));
		mv.setViewName("board");
		return mv;
	}

	@RequestMapping("/regSubject.do")
	public ModelAndView regSubject() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("boardDetail");
		return mv;
	}

	@RequestMapping("/registSubject.do")
	public ModelAndView registSubject(String subject, String grade, String useYn, String description, String regUser)
			throws Exception {
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("subject", subject);
		hashMap.put("grade", grade);
		hashMap.put("useYn", useYn);
		hashMap.put("description", description);
		hashMap.put("regUser", regUser);
		boardService.registSubject(hashMap);
		return selectSubjectList(1, 1, "name", "");
	}

	@RequestMapping("/boardDetail.do")
	public ModelAndView boardDetail(String no) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("detailBoard", boardService.selectSubjectOne(no));
		mv.setViewName("boardDetail");
		return mv;
	}

	@RequestMapping("/modifyBoardDetail.do")
	public ModelAndView modifyBoardDetail(String id, String subject, String grade, String useYn, String description,
			String regUser) throws Exception {
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("id", id);
		hashMap.put("subject", subject);
		hashMap.put("grade", grade);
		hashMap.put("useYn", useYn);
		hashMap.put("description", description);
		hashMap.put("regUser", regUser);
		boardService.modifyBoardDetail(hashMap);
		return boardDetail(id);
	}

	@RequestMapping("/deleteBoardDetail.do")
	public ModelAndView deleteBoardDetail(String no) throws Exception {
		boardService.deleteBoardDetail(no);
		return selectSubjectList(1, 1, "name", "");
	}
}