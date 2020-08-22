package com.iot.navi;


import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iot.lastmile.FavoriteVO;
import com.iot.lastmile.LastmileService;
import com.iot.lastmile.RecentVO;
import com.iot.parking.parkingService;

@Controller
public class naviController {
	@Autowired
	NaviService service;
	@Autowired
	parkingService pservice;
	@Autowired
	LastmileService lservice;
	
	@RequestMapping("/navi.do")
	public String navi() {
		return "navi";
	}
	
	@RequestMapping(value="/findmap.do", method=RequestMethod.POST)
	public ModelAndView findmap(String input_start_lat, String input_start_lng, String input_end_lat, String input_end_lng, String input_end) {
		ModelAndView mav = new ModelAndView();
		
		String url = "https://map.kakao.com/?eX="+input_end_lat+"&eY="+input_end_lng+"&eName="+input_end+"&sX="+input_start_lat+"&sY="+input_start_lng+"&sName=현재위치";
		mav.addObject("findmap", url);
		mav.setViewName("navi_findRoad");
		return mav;
	}
	
	@RequestMapping(value="/findRoad/start.do",
			method=RequestMethod.GET,
			produces="application/text;charset=utf-8")
	public @ResponseBody String start(String lati,String longi) {
		System.out.println("!!!!"+lati+"!!!!"+longi);
		return "success";
	}
		
	@RequestMapping(value="/findRoad/end.do",
			method=RequestMethod.GET,
			produces="application/text;charset=utf-8")
	public @ResponseBody String end(String lati,String longi) {
		//System.out.println("!!!!"+lati+"!!!!"+longi);
		return "success";
	}
	
	@RequestMapping("/findRoad/setEnd.do")
	public ModelAndView endFromLastmile(String lati, String longi, String name) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("endLati", lati);
		mav.addObject("endLongi", longi);
		mav.addObject("endName", URLDecoder.decode(name));
		mav.setViewName("navi");
		
		return mav;
	}
	
	//즐겨찾기(Favorite table) 불러오기
	@RequestMapping(value="/navi/favorite.do")
	public ModelAndView favoriteList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String user_id = (String) session.getAttribute("user_id");
		List<FavoriteVO> pFavoriteList = pservice.getFavoriteList(user_id);
		List<FavoriteVO> lFavoriteList = lservice.getFavoriteList(user_id);
		List<FavoriteVO> favoriteList = new ArrayList<FavoriteVO>();
		
		for(int i=0;i<pFavoriteList.size();i++)
			favoriteList.add(pFavoriteList.get(i));
		for(int i=0;i<lFavoriteList.size();i++)
			favoriteList.add(lFavoriteList.get(i));
		
		mav.addObject("favoriteList", favoriteList);
		mav.setViewName("navi/favorite");
		return mav;
	}
	
	//최근 방문(Recent table) 불러오기
	@RequestMapping(value="/navi/recent.do")
	public ModelAndView RecentList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String user_id = (String) session.getAttribute("user_id");
		List<RecentVO> pRecentList = pservice.getRecentList(user_id);
		List<RecentVO> lRecentList = lservice.getRecentList(user_id);
		List<RecentVO> recentList = new ArrayList<RecentVO>();
		
		for(int i=0;i<pRecentList.size();i++)
			recentList.add(pRecentList.get(i));
		for(int i=0;i<lRecentList.size();i++)
			recentList.add(lRecentList.get(i));
		
		mav.addObject("recentList", recentList);
		mav.setViewName("navi/recent");
		return mav;
	}
	
}
