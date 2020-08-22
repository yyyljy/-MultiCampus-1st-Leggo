package com.iot.parking;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iot.lastmile.FavoriteVO;
import com.iot.lastmile.RecentVO;
import com.iot.parkingAPI.parkingAPIService;
import com.iot.parkingAPI.parkingjsonVO;

@Controller
public class parkingController {
	@Autowired
	parkingService service;
	@Autowired
	parkingAPIService apiService;
	
	   @RequestMapping("/parking.do")
	   public ModelAndView parking() { 
		   //ModelAndView라는 객체를 생성했고. null.
		   ModelAndView mav = new ModelAndView();
		  //DB에서 읽어온 data
		   List<parkingVO> ploc = service.select();
		   List<parkingjsonVO> parkingjson = apiService.getParkingAllJSON();
		   
		   //mav안에 읽어온 data ploc를 넣고
		   mav.addObject("parkingInfo", ploc);
		   //parking API 전부 읽어오기
		   mav.addObject("parkingjson", parkingjson);
		   //이거를 어떤 화면에 뿌릴지 설정 => parking tiles에 설정한 definition name
		   mav.setViewName("parking");
		   
		   //System.out.println("parkingController에 있는 ploc 호출: "+ploc);
	      return mav;
	   }
	   
	 /*  @RequestMapping("/parking/kakaomap.do")
	   public String findRoadTest() {
	      return "parking_findRoad";
	   }*/
	   //준성이형 코드
	/*   @RequestMapping(value="/findmapP.do", method=RequestMethod.POST)
	   public ModelAndView findmap(String input_start_lat, String input_start_lng, String input_end_lat, String input_end_lng) {
	      ModelAndView mav = new ModelAndView();
	      System.out.println(input_start_lat);
	      System.out.println(input_start_lng);
	      System.out.println(input_end_lat);
	      System.out.println(input_end_lng);
	      
	      String url = "https://map.kakao.com/?eX="+input_end_lat+"&eY="+input_end_lng+"&eName=아가방빌딩&sX="+input_start_lat+"&sY="+input_start_lng+"&sName=멀티캠퍼스 역삼";
	      mav.addObject("findmap", url);
	      mav.setViewName("parking_findRoad");
	      return mav;
	   }*/
	   
	   @RequestMapping(value="/findRoadP/start.do",
	         method=RequestMethod.GET,
	         produces="application/text;charset=utf-8")
	   public @ResponseBody String start(String lati,String longi) {
	      System.out.println("!!!!"+lati+"!!!!"+longi);
	      return "success";
	   }
	      
	   @RequestMapping(value="/findRoadP/end.do",
	         method=RequestMethod.GET,
	         produces="application/text;charset=utf-8")
	   public @ResponseBody String end(String lati,String longi) {
	      System.out.println("!!!!"+lati+"!!!!"+longi);
	      return "success";
	   }
	   
		//즐겨찾기(Favorite table) 불러오기
		@RequestMapping(value="/parking/favorite.do")
		public ModelAndView favoriteList(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			String user_id = (String) session.getAttribute("user_id");
			List<FavoriteVO> favoriteList = service.getFavoriteList(user_id);
			
			mav.addObject("favoriteList", favoriteList);
			mav.setViewName("parking/favorite");
			return mav;
		}
		
		//최근 방문(Recent table) 불러오기
		@RequestMapping(value="/parking/recent.do")
		public ModelAndView RecentList(HttpSession session) {
			ModelAndView mav = new ModelAndView();
			String user_id = (String) session.getAttribute("user_id");
			List<RecentVO> recentList = service.getRecentList(user_id);
			
			mav.addObject("recentList", recentList);
			mav.setViewName("parking/recent");
			return mav;
		}
}