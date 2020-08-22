package com.iot.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mapController {
	@RequestMapping("/createmap.do")
	public String createMap() {
		return "createmap";
	}
	@RequestMapping("/maptypechange.do")
	public String maptypeChange() {
		return "maptypechange";
	}
	@RequestMapping("/markonclick.do")
	public String markonClick() {
		return "markonclick";
	}
	@RequestMapping("/placesearchbykeyword.do")
	public String placesearchbyKeyword() {
		return "placesearchbykeyword";
	}
	@RequestMapping("/searchplacebykeyword.do")
	public String searchplacebyKeyword() {
		return "searchplacebykeyword";
	}
	@RequestMapping("/searchroad_and_createmarker.do")
	public String signUp() {
		return "searchroad_and_createmarker";
	}
	@RequestMapping("/usercontrolonthemap.do")
	public String usercontrolonthemap() {
		return "usercontrolonthemap";
	}
	
	
}
