package com.in.tastalker.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.admin.AdminMemberService;
import com.in.tastalker.vo.MemberVO;
@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value = "/admin/5.do")
	public ModelAndView searchMemberCatalog(){
		ModelAndView mav = new ModelAndView();
		MemberVO mvo = new MemberVO();		
		mav.addObject("totalListNum", adminMemberService.searchPageSum(mvo));
		mav.addObject("list", adminMemberService.searchMemberCatalog(mvo,1));
		mav.addObject("mvo",mvo);
		mav.addObject("nowPage",1);
		mav.addObject("userRank",0);
		mav.addObject("searchVal", mvo);
		mav.setViewName("/admin/admin-member");		
		return mav;
		
	}
	@RequestMapping(value = "/admin/5-1.do")	
	public ModelAndView MemberCatalog(@RequestParam int nowPage,MemberVO memberVO){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("totalListNum", adminMemberService.searchPageSum(memberVO));
		mav.addObject("list", adminMemberService.searchMemberCatalog(memberVO,nowPage));
		mav.addObject("userId",memberVO.getUserId());
		mav.addObject("userNm",memberVO.getUserNm());
		mav.addObject("userAdrStr",memberVO.getUserAdrStr());
		mav.addObject("userRank",memberVO.getUserRank());
		mav.addObject("userGender",memberVO.getUserGender());
		mav.addObject("nowPage",nowPage);
		
		mav.setViewName("/admin/admin-member");		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/admin/6.do")
	public ModelAndView specifingMemberSpecification(String userId){
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("nowMenu", "member");
		mav.addObject("selectOne", adminMemberService.specifingMemberSpecification(userId));
		mav.setViewName("/admin/admin-memberDetail");		
		return mav;
	}
	@RequestMapping(value = "/admin/7.do")
	public ModelAndView gotoMemberModifingForm(String userId){
		ModelAndView mav = new ModelAndView();	
		mav.addObject("nowMenu", "member");
		mav.addObject("검색을 한 결과 리스트", adminMemberService.specifingMemberSpecification(userId));
		mav.setViewName("회원 상세 및 수정페이지");		
		return mav;
	}
	@RequestMapping(value = "/admin/8.do")
	public ModelAndView modifyMemberInfo(MemberVO memberVO, HttpSession session){
		ModelAndView mav = new ModelAndView();
		boolean result = adminMemberService.modifyMemberInfo(memberVO);
		if(result)
			mav.setViewName("redirect:5-1?pageNum="+session.getAttribute("nowPage"));
		else
			mav.setViewName("6?userId="+memberVO.getUserId());
		
		mav.addObject("nowMenu", "member");
		mav.setViewName("forward:/admin/5-1.do?pageNum="+session.getAttribute("nowPage"));		
		return mav;
	}
	@RequestMapping(value = "/admin/9.do")
	public ModelAndView deleteMember(String userId, HttpSession session){
		ModelAndView mav = new ModelAndView();		
		boolean result = adminMemberService.deleteMember(userId);
		
		if(result)
			mav.setViewName("forward:/admin/5-1.do?pageNum="+session.getAttribute("nowPage"));
		else
			mav.setViewName("/admin/6.do?userId="+userId);
		
		mav.addObject("nowMenu", "member");
		return mav;
	}

}
