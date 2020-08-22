package com.iot.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.iot.freeboard.freeboardService;


@Controller//controller 명시
public class cmtController {
	@Autowired//setget메소드 정의
	cmtService service;//cmtService 내부메소드를 controller단에서 쓰기 위해 정의
	@RequestMapping(value="/comment.do", method=RequestMethod.POST)//요청 path지정, DB저장 --> POST방식
	public String insert(cmtVO cmt) {
		int result = service.insert(cmt);
		String url = "redirect:/freeboardread.do?brd_num="+cmt.getBrd_num();
		return url;//자유게시판 댓글폼에 제출
	}
	
	//댓글 삭제
	@RequestMapping(value="/delcmt.do")
	public String deleteone(int cmt_num, String brd_num) {
		System.out.println("현재 게시판 번호 : "+brd_num);
		System.out.println("삭제할 댓글 번호 : "+cmt_num);
		int delcmt = service.deleteone(cmt_num,brd_num);
		System.out.println("삭제완료 여부 : "+delcmt);
		return "redirect:/freeboardread.do?brd_num="+brd_num;
	}
	
	
}