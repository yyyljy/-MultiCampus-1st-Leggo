package com.iot.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.iot.point.pointService;
import com.iot.point.pointVO;

@Controller
public class memberController {
	@Autowired
	memberService service;
	@Autowired
	pointService pservice;
	/* ===========================
	 * 로그인 관련
	 * ===========================
	 */
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginPage(HttpSession session) {
		memberVO user = (memberVO)session.getAttribute("user");
		if(user!=null) {
			return "redirect:/menu.do";
		}else {
		return "login";
		}
	}

	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView login(memberVO loginUserInfo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		memberVO user = service.login(loginUserInfo);
		/*System.out.println("로그인정보:"+user);*/
		String viewName = "";
		if(user!=null) {
			/*System.out.println("session 생성");*/
			HttpSession ses = request.getSession();
			ses.setAttribute("user", user);
			ses.setAttribute("user_id", user.getUser_id());
			viewName = "mainmenu";
		}else {
			viewName = "login";
		}
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login.do";
	}
	
	@RequestMapping("/kakaoLogin.do")
	public String kakaoLogin(kakaoVO kuser, HttpServletRequest request) {
		memberVO user = new memberVO();
		user.setUser_id(kuser.getkId());
		user.setUser_name(kuser.getkNickname());
		user.setPass_hint(kuser.getkLImg());
		user.setPass_ans(kuser.getkSImg());
		HttpSession ses = request.getSession();
		ses.setAttribute("user", user);
		return "redirect:/menu.do";
	}

	/* ==========================
	 *  회원가입 관련
	 * ===========================
	 */
	@RequestMapping("/signUp.do")
	public String signUp() {
		return "signUp";
	}
	
	@RequestMapping("/signUpTerms.do")
	public String signUpTerms() {
		return "signUpTerms";
	}
	
	@RequestMapping(value="/signUpSucc.do", method=RequestMethod.POST)
	public ModelAndView signUpSucc(memberVO user) {
		ModelAndView mav = new ModelAndView();
		int result = service.insert(user);
		if(result == 1) {
			pointVO pVO = new pointVO(user.getUser_id());
			int presult = pservice.insert(pVO);
			if(presult==1) {
				mav.addObject("user", user);
				mav.setViewName("signUpSucc");
			}else {
				System.out.println("[P_Error]:"+user.getUser_id());
				mav.addObject("user", user);
				mav.setViewName("signUpSucc");
			}
		}else {
			mav.setViewName("signUp");
		}
		/*System.out.println("insert result?:"+result);*/
		return mav;
	}
	
	@RequestMapping(value="/idCheck.do", method=RequestMethod.GET, produces="application/text;charset=utf-8")
	public @ResponseBody String idCheck(String user_id) {
		boolean state = service.idCheck(user_id);
		String result;
		if(state) {
			result = "사용 불가능한 아이디 입니다";
		}else {
			result = "사용 가능한 아이디 입니다";
		}
		return result;
	}
	
	/* ========================
	 * 회원 정보 관련 
	 * ========================*/
	@RequestMapping("/resetPwd.do")
	public String resetPwd() {
		return "resetPwd";
	}
	
	@RequestMapping("/myInfo.do")
	public String myInfo() {
		return "myInfo";
	}
	
	@RequestMapping(value="/modifyMyInfo.do", method=RequestMethod.POST)
	public String modifyMyInfo(memberVO user, HttpSession session) {
		memberVO loginInfo = (memberVO)session.getAttribute("user");
		user.setUser_id(loginInfo.getUser_id());
		user.setPass(loginInfo.getPass());
		memberVO modifiedUser = service.modifyMyInfo(user);
		if(modifiedUser!=null) {
			session.setAttribute("user", modifiedUser);
			return "redirect:/myInfo.do";
		}else {
			return "myInfo";
		}
	}
	
	@RequestMapping("/withdrawal.do")
	public String withdrawal(HttpSession session) {
		memberVO user = (memberVO)session.getAttribute("user");
		int result = service.delete(user);
		/*System.out.println("탈퇴 결과:"+result);*/
		if(result==1) {
			session.invalidate();
		}
		//탈퇴 후 로그인 페이지로 이동
		return "redirect:/login.do";
	}
	
}
