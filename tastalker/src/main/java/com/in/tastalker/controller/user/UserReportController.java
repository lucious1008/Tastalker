package com.in.tastalker.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.user.UserReportService;
import com.in.tastalker.vo.ReportVO;

@Controller
public class UserReportController {
	
	@Autowired
	private UserReportService userReportService;
	
	@RequestMapping(value = "")
	public ModelAndView reportGourmet(ReportVO reportVO){
		ModelAndView mav = new ModelAndView();		
		userReportService.reportGourmet(reportVO);
		mav.setViewName("맛집 제보한 후 가는 페이지");
		return mav;
	}
	@RequestMapping(value = "")
	public ModelAndView gotoreportGourmet(){
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("맛집 제보페이지로 간다");
		return mav;
	}

}
