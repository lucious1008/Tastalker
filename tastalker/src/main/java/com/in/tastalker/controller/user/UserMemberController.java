package com.in.tastalker.controller.user;




import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.user.UserMemberService;
import com.in.tastalker.vo.MemberVO;

@Controller
public class UserMemberController {
	
	@Autowired
	private UserMemberService userMemberService;	
	
	
	@RequestMapping(value = "gotoMain.do")
	public ModelAndView gotoMain(){
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("main");
		
		return mav;		
	}
	@RequestMapping(value = "member/back.do")
	public ModelAndView backToMain(){
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("member/back");
		
		return mav;		
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView userLogin(MemberVO memberVO,HttpSession session){
		ModelAndView mav = new ModelAndView();
		MemberVO member = userMemberService.userLogin(memberVO);		
		if(member.getUserId()!=null){
			switch (member.getUserRank()) {
			case 0: mav.setViewName("관리자");
			session.setAttribute("errMsg", "");
				break;
			default:mav.setViewName("main");
				session.setAttribute("SID", member.getUserId());
				session.setAttribute("rank", member.getUserRank());
				session.setAttribute("errMsg", "");
				break;
			}
		}else{
			mav.setViewName("main");
			session.setAttribute("errMsg", "잘못된 아이디 혹은 비밀번호 입니다");
		}
		return mav;		
	}
	
	@RequestMapping(value = "member/gotoUserInfo.do",method={RequestMethod.GET, RequestMethod.POST})//회원횔동페이지
	public ModelAndView userInfoView(@RequestParam int page, HttpSession session){
		ModelAndView mav = new ModelAndView();
		String userId = "";
		if(session.getAttribute("SID") == null){
			mav.setViewName("main");
			session.invalidate();
			return mav;
		}
		else{
			userId = (String)session.getAttribute("SID");
			mav.addObject("userInfo", userMemberService.userInfoView(userId));
			mav.addObject("userReportInfo",userMemberService.userReportInfo(userId,page));
			mav.addObject("totalReportNum",userMemberService.userReportCount(userId));
			mav.addObject("page",page);
			mav.setViewName("member/user-activity");
			return mav;
		}		
		
	}
	@RequestMapping(value = "member/26.do")
	public ModelAndView gotoModifyuserInfo(){
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("member/user-modify");
		return mav;
	}
	@RequestMapping(value = "member/26-1.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView ModifyuserInfo(@ModelAttribute MemberVO memberVO, HttpSession session){
		ModelAndView mav = new ModelAndView();	
		String userId = (String) session.getAttribute("SID");
		int page = 1;
		userMemberService.modifyuserInfo(memberVO);
		mav.addObject("userInfo", userMemberService.userInfoView(userId));
		mav.addObject("userReportInfo",userMemberService.userReportInfo(userId,page));
		mav.addObject("totalReportNum",userMemberService.userReportCount(userId));
		mav.addObject("page",page);
		mav.setViewName("member/user-activity");
		return mav;//회원정보수정
	}
	@RequestMapping(value = "member/27.do")
	public ModelAndView gotoOutOfOurTastalker(String userId){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/user-leave");
		return mav;//회원탈퇴페이지
	}
	
	@RequestMapping(value = "member/27-1.do", method =  RequestMethod.POST)
	public ModelAndView outOfOurTastalker(@ModelAttribute MemberVO memberVO,HttpSession session){
		ModelAndView mav = new ModelAndView();		
		if(userMemberService.outOfOurTastalker(memberVO)){
			session.invalidate();//session값을 지움
			mav.setViewName("main");
			return mav;//회원탈퇴
		}else{			
			mav.addObject("errorMsg","회원탈퇴 실패하였습니다.");
			mav.setViewName("member/user-leave");
			return mav;
		}
	}
	
	@RequestMapping(value = "member/logout.do")
	public ModelAndView userLogout(HttpSession session){
		session.removeAttribute("SID");
		session.removeAttribute("rank");
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("redirect:../gotoMain.do");		
		return mav;//로그아웃하기
	}
	@RequestMapping(value = "29.do")
	public ModelAndView gotoUserJoin(MemberVO memberVO){
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("member/user-join");
		return mav;//회원가입하러 가는 길
	}
	
	@RequestMapping(value = "29-1.do",method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView userJoin(@ModelAttribute MemberVO memberVO){
		ModelAndView mav = new ModelAndView();
		userMemberService.userJoin(memberVO);
		mav.setViewName("main");//회원 가입 후 이동 할 페이지 = main
		return mav;
	}
	
	@RequestMapping(value = "29-2.do")
	public void userIdChk(HttpServletRequest request,HttpServletResponse response) throws IOException{		
		PrintWriter out = response.getWriter();
		String userId = (request.getParameter("userId")==null) ? "":String.valueOf(request.getParameter("userId"));
		if(userMemberService.userIdChk(userId)){
			out.print("1");
		}else{
			out.print("0");
		}
		out.flush();
		out.close();
		//아이디 중복 체크 용
	}
	@RequestMapping(value = "latLngSession.do")
	public void latLngSession(HttpSession session,@RequestParam("lati") double lati,@RequestParam("lngi") double lngi){
		if(lati==0&&lngi==0){
			session.setAttribute("lati", 37.551169);
			session.setAttribute("lngi", 126.988227);
		}else{
			session.setAttribute("lati", lati);
			session.setAttribute("lngi", lngi);
		}
		
	}


}
