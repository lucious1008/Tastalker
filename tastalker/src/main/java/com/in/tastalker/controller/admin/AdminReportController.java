package com.in.tastalker.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.admin.AdminReportService;
import com.in.tastalker.vo.ReportVO;
@Controller
public class AdminReportController {
	
	@Autowired
	private AdminReportService adminReportService;
	
	@RequestMapping(value = "10")
	public ModelAndView reportCatalog(int pageNum){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("제보 리스트", adminReportService.reportCatalog(pageNum));
		mav.setViewName("관리자 제보페이지");		
		return mav;
	}
	@RequestMapping(value = "11")
	public ModelAndView sortReportCatalog(String reportStatus, int pageNum){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("분류한 제보리스트", adminReportService.sortReportCatalog(reportStatus, pageNum));
		mav.setViewName("관리자 분류 제보페이지");		
		return mav;
	}
	@RequestMapping(value = "12")
	public ModelAndView specifingReportSpecification(int reportNum){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("제보 상세정보", adminReportService.specifingReportSecification(reportNum));
		mav.setViewName("제보 상세 페이지");		
		return mav;
	}
	@RequestMapping(value = "13")
	public ModelAndView approveReport(ReportVO reportVO){
		ModelAndView mav = new ModelAndView();		
		adminReportService.approveReport(reportVO);
		mav.setViewName("제보 승인후 가는 페이지");		
		return mav;
	}
	@RequestMapping(value = "14")
	public ModelAndView rejectReport(int reportNum){
		ModelAndView mav = new ModelAndView();		
		adminReportService.rejectReport(reportNum);
		mav.setViewName("제보 승인후 가는 페이지");		
		return mav;
	}


}
