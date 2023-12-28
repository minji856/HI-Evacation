package io.acorn.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EventsController {
	@GetMapping("/api/event")
	@ResponseBody
    public List<String> receiveEvent() {
        return Arrays.asList("미팅", "교육");
	}
}
