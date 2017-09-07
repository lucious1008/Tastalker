package com.in.tastalker.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.admin.AdminMemberService;
import com.in.tastalker.vo.MemberVO;
@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value = "5")
	public ModelAndView searchMemberCatalog(MemberVO memberVO,int pageNum){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("검색을 한 결과 리스트", adminMemberService.searchMemberCatalog(memberVO, pageNum));
		mav.setViewName("관리자가 검색을 한뒤 보이는 회원 목록");		
		return mav;
	}
	@RequestMapping(value = "6")
	public ModelAndView specifingMemberSpecification(String userId){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("검색을 한 결과 리스트", adminMemberService.specifingMemberSpecification(userId));
		mav.setViewName("회원 상세 및 수정페이지");		
		return mav;
	}
	@RequestMapping(value = "7")
	public ModelAndView gotoMemberModifingForm(String userId){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("검색을 한 결과 리스트", adminMemberService.specifingMemberSpecification(userId));
		mav.setViewName("회원 상세 및 수정페이지");		
		return mav;
	}
	@RequestMapping(value = "8")
	public ModelAndView modifyMemberInfo(MemberVO memberVO){
		ModelAndView mav = new ModelAndView();		
		adminMemberService.modifyMemberInfo(memberVO);
		mav.setViewName("회원 수정 완료 후 가는곳");		
		return mav;
	}
	@RequestMapping(value = "9")
	public ModelAndView deleteMember(String userId){
		ModelAndView mav = new ModelAndView();		
		adminMemberService.deleteMember(userId);
		mav.setViewName("회원 수정 완료 후 가는곳");		
		return mav;
	}


}
