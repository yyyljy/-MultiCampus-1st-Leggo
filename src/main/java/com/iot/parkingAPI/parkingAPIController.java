package com.iot.parkingAPI;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iot.member.memberVO;
import com.iot.point.pointService;
import com.iot.reservation.resvService;
import com.iot.reservation.resvVO;

@Controller
public class parkingAPIController {
	@Autowired
	resvService service;
	@Autowired
	pointService pservice;
	@Autowired
	parkingAPIService paservice;
	
	@RequestMapping("/getParkingJsonVO.do")
	public ModelAndView select(String parking_code, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		parkingjsonVO pVO = null;
		if(parking_code==null) {
			System.out.println("parking_code NULL!");
		}else {
			pVO = (parkingjsonVO)paservice.getParkingJSON(parking_code);
			System.out.println("ajax_pVO:"+pVO);
		}
		memberVO user = (memberVO)session.getAttribute("user");
		List<resvVO> list = service.select(user.getUser_id());
		List<parkingInfoVO> pinfolist = new ArrayList<parkingInfoVO>();
		parkingInfoVO pInfoVO;
		for(int i = 0;i<list.size();i++) {
			pInfoVO = paservice.getNameAddr(list.get(i).getParking_code());
			pinfolist.add(pInfoVO);
		}
		/*System.out.println(list);*/
		mav.addObject("resvlist", list);
		mav.addObject("pinfolist", pinfolist);
		mav.setViewName("myResv");
		
		return mav;
	}
	
	@RequestMapping(value="/inputPCode.do", method=RequestMethod.GET)
	public String insertPCode(String parking_code) {
		return "parkingInfo";
	}
	
	@RequestMapping(value="/parking/update.do",method=RequestMethod.POST)
	public String updateParkingSeats(parkingjsonVO pinfoVO) {
		//service.updateParkingSeats(pinfoVO.getParking_code());
		return "redirect:/myResvList.do";
	}
}
