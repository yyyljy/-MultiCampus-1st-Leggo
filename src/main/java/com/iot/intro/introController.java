package com.iot.intro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class introController {
	@RequestMapping("/intro.do")
	public String main() {
		return "intro";
	}
}
