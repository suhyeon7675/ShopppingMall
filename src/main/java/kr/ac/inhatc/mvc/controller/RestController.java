package kr.ac.inhatc.mvc.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	@RequestMapping("hello2")
	public String name() {
		return "Hello world!!!!";
	}
}