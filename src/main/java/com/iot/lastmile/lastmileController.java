package com.iot.lastmile;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class lastmileController {
	@Autowired
	LastmileService lastmileService;
	
	//공공 자전거 대여소 정보 API 받아오기 + 주변 라스트마일 
	@RequestMapping("/lastmile.do")
	public ModelAndView lastmile() {
		ModelAndView mav = new ModelAndView();
		List<LastmileVO> lastmileList = lastmileService.getLastmileAPI();
		//System.out.println("========================= 전체 : " + lastmileList.size());
		
		mav.addObject("aroundLastmile", lastmileList);
		mav.setViewName("lastmile");
		
		return mav;
	}
	
	@RequestMapping("/lastmileList.do")
	public String printLastmileList() {
		return "lastmileList";
	}
	
	//즐겨찾기(Favorite table) 불러오기
	@RequestMapping(value="/lastmile/favorite.do")
	public ModelAndView favoriteList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String user_id = (String) session.getAttribute("user_id");
		List<FavoriteVO> favoriteList = lastmileService.getFavoriteList(user_id);
		
		mav.addObject("favoriteList", favoriteList);
		mav.setViewName("lastmile/favorite");
		return mav;
	}
	
	//최근 방문(Recent table) 불러오기
	@RequestMapping(value="/lastmile/recent.do")
	public ModelAndView RecentList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String user_id = (String) session.getAttribute("user_id");
		List<RecentVO> recentList = lastmileService.getRecentList(user_id);
		
		mav.addObject("recentList", recentList);
		mav.setViewName("lastmile/recent");
		return mav;
	}
}
