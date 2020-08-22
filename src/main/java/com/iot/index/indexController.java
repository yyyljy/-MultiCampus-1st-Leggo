package com.iot.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class indexController {
	@RequestMapping("/index.do")
	public String main() {
		return "index/index";
	}
	@RequestMapping("/menu.do")
	public String main1() {
		return "index/mainmenu";
	}
	@RequestMapping("/home.do")
	public String main2() {
		return "index/index";
	}
	@RequestMapping("/profile.do")
	public String main3() {
		return "index/CompanyProfile";
	}
	@RequestMapping("/inbox.do")
	public String main6() {
		return "index/Inbox";
	}
}
