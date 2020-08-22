
package com.iot.noticeboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.iot.comment.cmtService;
import com.iot.comment.cmtVO;
import com.iot.freeboard.freeboardVO;
import com.iot.member.memberService;
import com.iot.member.memberVO;

@Controller
public class noticeboardController {
	@Autowired
	 noticeboardService service;
	
	//공지사항 메인화면
	@RequestMapping(value="/noticeboardmain.do")
	public ModelAndView noticeboardmain(){
		List<noticeboardVO> list = service.boardList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticelist",list);
		mav.setViewName("noticemain");
		return mav;
	}
	
	//공지사항 보여주기
		@RequestMapping(value="/noticeboardread.do", method=RequestMethod.GET)
		public ModelAndView readview(String brd_num) {
			ModelAndView mav = new ModelAndView();
				noticeboardVO result = service.read(brd_num);
				System.out.println("읽어지냐?"+brd_num);
				mav.addObject("readnotice", result);
				mav.setViewName("noticeread");
			return mav;
		}

}
