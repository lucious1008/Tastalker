package com.in.tastalker.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.user.UserMemberService;
import com.in.tastalker.vo.MemberVO;

@Controller
public class UserMemberController {
	
	@Autowired
	private UserMemberService userMemberService;	

	
	@RequestMapping(value = "24")
	public ModelAndView userLogin(MemberVO memberVO,HttpSession session){
		ModelAndView mav = new ModelAndView();
		int grade = userMemberService.userLogin(memberVO);
		switch (grade) {
		case 0://관리자 로그인			
			break;
		default://일반회원 로그인
			break;
		}
		session.setAttribute("SID", memberVO.getUserId());		
		mav.setViewName("로그인 후 이동");
		return mav;		
	}
	@RequestMapping(value = "25")
	public ModelAndView userInfoView(String userId){
		ModelAndView mav = new ModelAndView();
		mav.addObject("회원 상세 정보", userMemberService.userInfoView(userId));
		mav.setViewName("회원 상세정보페이지");
		return mav;
	}
	@RequestMapping(value = "26")
	public ModelAndView ModifyuserInfo(MemberVO memberVO){
		ModelAndView mav = new ModelAndView();
		userMemberService.ModifyuserInfo(memberVO);
		mav.setViewName("회원 정보 수정후 페이지");
		return mav;
	}
	@RequestMapping(value = "27")
	public ModelAndView outOfOurTastalker(String userPw,HttpSession session){
		ModelAndView mav = new ModelAndView();
		userMemberService.outOfOurTastalker(userPw);
		session.invalidate();
		mav.setViewName("회원 탈퇴 후 페이지");
		return mav;
	}
	@RequestMapping(value = "28")
	public ModelAndView userLogout(HttpSession session){
		ModelAndView mav = new ModelAndView();
		userMemberService.userLogout();
		session.invalidate();
		mav.setViewName("회원 탈퇴 후 페이지");
		return mav;
	}

}
