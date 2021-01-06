package kr.ac.inhatc.mvc.service;

import org.springframework.stereotype.Service;

@Service
public class JspService {
	
	private int a=0;
	
	public String jsp() {
		return ++a + "";
	}
	
}