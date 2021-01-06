package kr.ac.inhatc.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.inhatc.mvc.service.BoardService;

@Controller
public class MvcController {
	@Autowired
	BoardService boardService;

	@RequestMapping("hello")
	public String hello(Model model, String id) {
		model.addAttribute("key", id);
		return "hello";
	}

	@RequestMapping("board")
	public String board(Model model, String id) {
		model.addAttribute("id", id);
		return "board";
	}

	@RequestMapping("gugudan")
	public String gugudan(Model model, int num) {
		String gugu = "";
		for (int i = 1; i < 10; i++) {
			gugu = gugu + " " + num + "*" + i + "=" + num * i;
		}
		model.addAttribute("gugudan", gugu);
		return "gugudan";
	}

	@RequestMapping("sum")
	public String sum(Model model) {
		int sum = 0;
		for (int i = 1; i <= 100; i++) {
			sum = sum + i;
		}
		model.addAttribute("sum", sum);
		return "sum";
	}

	@RequestMapping("sum2")
	public String sum2(Model model, int num) {
		int sum = 0;
		for (int i = 1; i <= num; i++) {
			sum = sum + i;
		}
		model.addAttribute("sum", sum);
		model.addAttribute("num", num);
		return "sum";
	}
}