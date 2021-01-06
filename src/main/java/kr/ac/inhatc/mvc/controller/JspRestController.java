package kr.ac.inhatc.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.inhatc.mvc.service.JspService;

@RestController
public class JspRestController {
	@Autowired
	JspService jspService;
	
	@RequestMapping("count")
	public String count() {
		return jspService.jsp();
	}
}