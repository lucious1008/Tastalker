package com.in.tastalker.controller.admin;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.admin.AdminChatService;
@Controller
public class AdminWebSocketController {
	
	@Resource(name = "adminChatService")
	private AdminChatService adminChatService;
	
	@RequestMapping(value = "15")
	public ModelAndView searchChatLog(String date, String title){
		ModelAndView mav = new ModelAndView();		
		adminChatService.searchChatLog(date, title);		
		mav.setViewName("검색 결과");
		return mav;
	}
	@RequestMapping(value = "16")
	public ModelAndView viewChatLog(String date, String title){
		ModelAndView mav = new ModelAndView();		
		adminChatService.viewChatLog(date, date);
		mav.setViewName("상세 페이지");
		return mav;
	}
	
	

}
