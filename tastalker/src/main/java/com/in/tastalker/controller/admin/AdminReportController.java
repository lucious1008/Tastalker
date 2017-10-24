package com.in.tastalker.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.admin.AdminReportService;
import com.in.tastalker.vo.ReportVO;
@Controller
public class AdminReportController {
	
	@Autowired
	private AdminReportService adminReportService;
	
	@RequestMapping(value = "/admin/10.do")
	public ModelAndView reportCatalog(@RequestParam int pageNum, HttpSession session){
		
		ModelAndView mav = new ModelAndView();	
		
		System.out.println("10");
		session.setAttribute("nowPage", 1);
		//총 게시물의 합
		int listSum = adminReportService.listSum();
		
		//전체 페이지 수
		float dee = (float)listSum/(float)3;
		int sumPage = (int)Math.ceil(dee);
		
		int getnowPage = (int) session.getAttribute("nowPage");
		
		int lastPage = 3*getnowPage;
		int firstPage = 3*getnowPage-2;
		
		if (sumPage < lastPage) {
			mav.addObject("lastPage", sumPage);
		} else {
			mav.addObject("lastPage", lastPage);
		}
		
		mav.addObject("pageNum", pageNum);
		mav.addObject("sumPage", sumPage);
		mav.addObject("firstPage", firstPage);	
		mav.addObject("nowMenu", "report");	
		mav.addObject("report", adminReportService.reportCatalog(pageNum));
		mav.setViewName("/admin/admin-report");		
		return mav;
	}
	
	//게시물 페이지
	@RequestMapping(value = "/admin/10-1.do")
	public ModelAndView page(@RequestParam int pageNum, HttpSession session){
		ModelAndView mav = new ModelAndView();
		// 총 게시물의 합
		int listSum = adminReportService.listSum();

		// 전체 페이지 수
		float dee = (float) listSum / (float) 3;
		int sumPage = (int) Math.ceil(dee);
		
		// 전체 페이징 수
		float pagingSumBefore = (float)sumPage/(float)3;
		int pagingSum = (int)Math.ceil(pagingSumBefore);

		int getnowPage = (int) session.getAttribute("nowPage");

		int lastPage = 3 * getnowPage;
		int firstPage = 3 * getnowPage - 2;

		if (sumPage < lastPage) {
			mav.addObject("lastPage", sumPage);
		} else {
			mav.addObject("lastPage", lastPage);
		}
		
		mav.addObject("pagingSum", pagingSum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("sumPage", sumPage);
		mav.addObject("firstPage", firstPage);
		mav.addObject("nowMenu", "report");
		mav.addObject("report", adminReportService.reportCatalog(pageNum));
		mav.setViewName("/admin/admin-report");
		return mav; 
	}
	//paging
	@RequestMapping(value = "/admin/10-2.do")
	public ModelAndView nextPageReport(@RequestParam int loPage, @RequestParam int flag, HttpSession session){
		ModelAndView mav = new ModelAndView();
		System.out.println("report paging");
		// 총 게시물의 합
		int listSum = adminReportService.listSum();

		// 전체 페이지의 수
		float sumPageBefore = (float) listSum / (float) 3;
		int sumPage = (int) Math.ceil(sumPageBefore);
		System.out.println("전체 페이지 : " + sumPage);
		
		// 전체 페이징 수
		float pagingSumBefore = (float)sumPage/(float)3;
		int pagingSum = (int)Math.ceil(pagingSumBefore);

		// 현재의 페이징 위치
		int locatPage = loPage;
		session.setAttribute("nowPage", locatPage);

		int lastPage = 3 * locatPage;
		int firstPage = 3 * locatPage - 2;

		if (sumPage < lastPage) {
			mav.addObject("lastPage", sumPage);
		} else {
			mav.addObject("lastPage", lastPage);
		}
	
		List<ReportVO> list = null;
		int pageNum = 0;
		switch (flag) {
		case 0:
			list = adminReportService.reportCatalog(firstPage);
			pageNum = firstPage;
			break;
		case 1:
			list = adminReportService.reportCatalog(lastPage);
			pageNum = lastPage;
			break;
			
		case 2:
			list = adminReportService.reportCatalog(sumPage);
			pageNum = sumPage;
			break;
		}
		mav.addObject("pagingSum", pagingSum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("nowMenu", "report");
		mav.addObject("sumPage", sumPage);
		mav.addObject("firstPage", firstPage);
		mav.addObject("report", list);
		mav.setViewName("/admin/admin-report");
		return mav;
	}
	
	//검색화면 및 페이지 이동
	@RequestMapping(value = "/admin/11.do")
	public ModelAndView sortReportCatalog(@RequestParam int reportStatus, @RequestParam int pageNum, HttpSession session){
		ModelAndView mav = new ModelAndView();		
		
		System.out.println("reportStatus :"+ reportStatus + " pageNum : "+ pageNum );
		
		
		int searchSum = adminReportService.searchSum(reportStatus);

		if(pageNum == 1)
			session.setAttribute("nowPage", 1);
		
		
		// 전체 페이지의 수
		float sik = (float)searchSum/(float)3;
		int sumPage = (int)Math.ceil(sik);
		
		// 전체 페이징 수
		float pagingSumBefore = (float)sumPage/(float)3;
		int pagingSum = (int)Math.ceil(pagingSumBefore);
		
		int locPage = (int) session.getAttribute("nowPage");
		
		int lastPage = 3*locPage;
		int firstPage = 3*locPage-2;
		
		if (sumPage < lastPage) {
			mav.addObject("lastPage", sumPage);
		} else {
			mav.addObject("lastPage", lastPage);
		}
		
		mav.addObject("pagingSum", pagingSum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("nowMenu", "report");
		mav.addObject("searchVal", reportStatus);
		mav.addObject("sumPage", sumPage);
		mav.addObject("firstPage", firstPage);
		mav.addObject("reportStatus", reportStatus);
		mav.addObject("report", adminReportService.sortReportCatalog(reportStatus, pageNum));
		mav.setViewName("/admin/admin-report");		
		return mav;
	}
	
	//검색 페이지 이동
	//paging
		@RequestMapping(value = "/admin/11-2.do")
		public ModelAndView nextSearchPageReport(@RequestParam int loPage, @RequestParam int flag, @RequestParam int reportStatus, HttpSession session){
			ModelAndView mav = new ModelAndView();
			
			// 총 게시물의 합
			int searchSum = adminReportService.searchSum(reportStatus);
			
			// 전체 페이지의 수
			float sumPageBefore = (float) searchSum / (float) 3;
			int sumPage = (int) Math.ceil(sumPageBefore);
			
			// 전체 페이징 수
			float pagingSumBefore = (float)sumPage/(float)3;
			int pagingSum = (int)Math.ceil(pagingSumBefore);

			// 현재의 페이징 위치
			int locatPage = loPage;
			session.setAttribute("nowPage", locatPage);
			
			int lastPage = 3 * locatPage;
			int firstPage = 3 * locatPage - 2;

			if (sumPage < lastPage) {
				mav.addObject("lastPage", sumPage);
			} else {
				mav.addObject("lastPage", lastPage);
			}
			int pageNum = 0;
			List<ReportVO> list = null;
			switch (flag) {
			case 0:
				list = adminReportService.sortReportCatalog(reportStatus, firstPage);
				pageNum = firstPage;
				break;
			case 1:
				list = adminReportService.sortReportCatalog(reportStatus, lastPage);
				pageNum = lastPage;
				break;
				
			case 2:
				list = adminReportService.sortReportCatalog(reportStatus, sumPage);
				pageNum = sumPage;
				break;
			}
			
			mav.addObject("pageNum", pageNum);
			mav.addObject("pagingSum", pagingSum);
			mav.addObject("searchVal", reportStatus);
			mav.addObject("reportStatus", reportStatus);
			mav.addObject("nowMenu", "report");
			mav.addObject("sumPage", sumPage);
			mav.addObject("firstPage", firstPage);
			mav.addObject("report", list);
			mav.setViewName("/admin/admin-report");
			return mav;
		}
	@RequestMapping(value = "/admin/12.do")
	public ModelAndView specifingReportSpecification(@RequestParam int reportNum){
		ModelAndView mav = new ModelAndView();
		ReportVO rvo = adminReportService.specifingReportSecification(reportNum);
		
		mav.addObject("nowMenu", "report");
		mav.addObject("reportOne", rvo );
		mav.setViewName("/admin/admin-reportdetail");		
		return mav;
	}
	
	@RequestMapping(value = "/admin/13.do")
	public ModelAndView approveReport(ReportVO reportVo, HttpSession session){
		ModelAndView mav = new ModelAndView();
		System.out.println("approve controller");

		adminReportService.approveReport(reportVo);
		
		mav.setViewName("forward:/admin/10-1.do?pageNum="+session.getAttribute("nowPage"));	
		return mav;
	}
	@RequestMapping(value = "/admin/14.do")
	public ModelAndView rejectReport(@RequestParam int reportNum, HttpSession session){
		ModelAndView mav = new ModelAndView();	

		adminReportService.rejectReport(reportNum);
		mav.addObject("nowMenu", "report");
		mav.setViewName("forward:/admin/10-1.do?pageNum="+session.getAttribute("nowPage"));		
		return mav;
	}


}
