package com.iot.news;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class newsController {
	@RequestMapping("/news.do")
	public String news() {
		/*https://news.naver.com/*/
		return "news";
	}
}
