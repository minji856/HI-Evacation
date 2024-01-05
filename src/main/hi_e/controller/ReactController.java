package com.self;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReactController {
	
	@GetMapping("/api/event")
	public String test1() {
		System.out.println("react api");
		return "안녕하세요";
	}
}
