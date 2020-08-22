package com.iot.reservation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iot.member.memberVO;
import com.iot.parkingAPI.parkingAPIService;
import com.iot.parkingAPI.parkingInfoVO;
import com.iot.parkingAPI.parkingjsonVO;
import com.iot.point.pointService;
@Controller
public class resvController {
	@Autowired
	resvService service;
	@Autowired
	pointService pservice;
	@Autowired
	parkingAPIService paservice;
	
	@RequestMapping("/myResvList.do")
	public ModelAndView myResvList(HttpSession session) {
		/*System.out.println("myResvList");*/
		ModelAndView mav = new ModelAndView();
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
	
	/*
	@RequestMapping(value="/resvMake.do", method=RequestMethod.POST)
	public ModelAndView doResvMaker(parkingjsonVO jsonVO, HttpSession session) {
		System.out.println("들어오나?");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("resvMake");
		mav.addObject("mypoint", pservice.selectMyPoint((String)session.getAttribute("user_id")));
		mav.addObject("resvPInfo", jsonVO);
		session.setAttribute("resvPInfo", jsonVO);
		System.out.println(pservice.selectMyPoint((String)session.getAttribute("user_id")));
		System.out.println(jsonVO);
		System.out.println("reservation maker view");
		pointVO point = (pointVO)request.getAttribute("mypoint");
		return mav;
	}*/
	
	@RequestMapping(value="/resvInsert.do", method=RequestMethod.POST)
	public ModelAndView resvMaker(resvVO resv) {
		ModelAndView mav = new ModelAndView();
		/*System.out.println("받은resv:"+resv);*/
		service.insert(resv);
		resv.setRv_id(service.getResvInfo(resv.getUser_id()).getRv_id());
		/*System.out.println("주는resv"+resv);*/
		mav.addObject("mypoint", pservice.selectMyPoint(resv.getUser_id()));
		mav.addObject("resv", resv);
		/*(parkingjsonVO)paservice.getParkingJSON(resv.getParking_code())*/
		/*parkingjsonVO par = new parkingjsonVO(200.0,"논현로22길(구)","1","현재~20분이내 연계데이터 존재(현재 주차대수 표현)",97.0,53.0,"2020-02-13 16:59:58","1040225","","","","","","","","");
		System.out.println("reserve"+par);
		mav.addObject("parkingInfo", par);*/
		mav.setViewName("payMake");
		return mav;
	}
	/*@RequestMapping(value="/resvMake.do", method=RequestMethod.GET)
	public ModelAndView viewResvMaker(String parking_code, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("resvMake");
		mav.addObject("mypoint", pservice.selectMyPoint((String)session.getAttribute("user_id")));
		System.out.println(pservice.selectMyPoint((String)session.getAttribute("user_id")));
		mav.addObject("parking_code", parking_code);
		System.out.println("reservation maker view");
		pointVO point = (pointVO)request.getAttribute("mypoint");
		return mav;
	}*/
	
	/*@RequestMapping(value="/resvInsert.do", method=RequestMethod.POST)
	public ModelAndView resvMaker(resvVO resv) {
		System.out.println("reservation:"+resv);
		service.insert(resv);
		ModelAndView mav = new ModelAndView();
		mav.addObject("mypoint", pservice.selectMyPoint(resv.getUser_id()));
		(parkingjsonVO)paservice.getParkingJSON(resv.getParking_code())
		parkingjsonVO par = new parkingjsonVO(200.0,"논현로22길(구)","1","현재~20분이내 연계데이터 존재(현재 주차대수 표현)",97.0,53.0,"2020-02-13 16:59:58","1040225","","","","","","","","");
		System.out.println("reserve"+par);
		mav.addObject("parkingInfo", par);
		mav.setViewName("payMake");
		return mav;
	}*/
	/*RATES, PARKING_NAME, QUE_STATUS, QUE_STATUS_NM, CAPACITY, 
	CUR_PARKING, CUR_PARKING_TIME, PARKING_CODE,"","","","","","","",""*/
	
	
	//주차장 정보 화면에서 "예약하기" 클릭 > parking_code 받아서 parkingjsonVO로 전달 > 예약하기 페이지로 이동	
	@RequestMapping(value="/getParkingJsonVO.do", method=RequestMethod.GET)	
	public ModelAndView resvMaker(String parking_code, HttpSession session) {	
		parkingjsonVO jsonVO = paservice.getParkingJSON(parking_code);
		System.out.println(jsonVO);
		ModelAndView mav = new ModelAndView();	
		mav.addObject("parkingjsonVO", jsonVO);	
		mav.setViewName("resvMake");	
		session.setAttribute("resvPInfo", jsonVO);
		return mav;	
	}
}