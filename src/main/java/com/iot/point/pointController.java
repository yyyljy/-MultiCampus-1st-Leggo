package com.iot.point;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class pointController {
	@Autowired
	pointService service;
	@RequestMapping("/point/insert.do")
	public String insert(pointVO point) {
		service.insert(point);
		return "point/insert";
	}
	@RequestMapping("/point/delete.do")
	public String delete(pointVO point) {
		service.delete(point);
		return "point/delete";
	}
	@RequestMapping("/point/update.do")
	public String update(pointVO point) {
		service.update(point);
		return "point/update";
	}
	@RequestMapping(value="/point/select.do", method=RequestMethod.GET)
	public ModelAndView select(String user_id) {
		/*System.out.println(user_id+"의 포인트 select");*/
		ModelAndView mav = new ModelAndView();
		List<pointVO> pointlist = service.select(user_id);
		pointVO userpoint = service.selectMyPoint(user_id);
		mav.addObject("plist", pointlist);
		mav.addObject("userpoint", userpoint);
		mav.setViewName("myPoint");
		/*System.out.println(pointlist);*/
		return mav;
	}
	
	@RequestMapping(value="/point/totalPoint.do", method=RequestMethod.POST)
	public ModelAndView chargePointView(pointVO point) {
		/*System.out.println("너는 지금 충전하러 왔따."+ point);*/
		/*System.out.println("total:"+point);*/
		ModelAndView mav = new ModelAndView();
		mav.addObject("point", point);
		mav.setViewName("chargePoint");
		return mav;
	}
	
	@RequestMapping(value="/point/chargePoint.do", method=RequestMethod.POST)
	public String chargePoint(pointVO point) {
		/*System.out.println("너는 지금 인서트하러 왔따."+ point);*/
		point.setPointAvail(point.getPointAvail()+point.getPointChange());
		service.chargePoint(point);
		return "redirect:/point/select.do?user_id="+point.getUser_id();
	}
}
