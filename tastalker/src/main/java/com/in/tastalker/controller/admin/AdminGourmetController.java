package com.in.tastalker.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.admin.AdminGourmetService;
import com.in.tastalker.vo.GourmetVO;

@Controller
public class AdminGourmetController {
	
	@Autowired
	private AdminGourmetService adminGourmetService;
	
	@RequestMapping(value = "1")
	public ModelAndView AdminGourmetCatalog(@RequestParam(required = true) int pageNum){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("맛집 리스트",adminGourmetService.gourmetCatalog(pageNum));
		mav.setViewName("관리자의 맛집목록 페이지가 있는 곳");
		return mav;
	}
	@RequestMapping(value = "")
	public ModelAndView AdminSearchGourmetCatalog(GourmetVO gourmetVO,String adress,@RequestParam int pageNum){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("맛집 리스트",adminGourmetService.searchGourmetCatalog(gourmetVO.getGourmetSort(), gourmetVO.getGourmetNm(), adress, pageNum));
		mav.setViewName("관리자의 맛집목록 페이지가 있는 곳(검색)");
		return mav;
	}
	@RequestMapping(value = "2")
	public ModelAndView AdminModifyGourmetInfo(GourmetVO gourmetVO){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("수정 성공 여부",adminGourmetService.modifyGourmetInfo(gourmetVO));
		mav.setViewName("관리자가 맛집 정보 수정후 가는 페이지");
		return mav;
	}
	@RequestMapping(value = "3")
	public ModelAndView AdminDeleteGourmet(@RequestParam int gourmetNum){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("삭제 성공 여부",adminGourmetService.deleteGourmet(gourmetNum));
		mav.setViewName("관리자가 맛집 정보 삭제후 가는 페이지");
		return mav;
	}
	@RequestMapping(value = "4")
	public ModelAndView gotoSpecificationOfGourmetPage(@RequestParam int gourmetNum){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("맛집 상세정보",adminGourmetService.specifingGourmetSpecification(gourmetNum));
		mav.setViewName("관리자 맛집 상세정보 페이지");
		return mav;
	}

}
