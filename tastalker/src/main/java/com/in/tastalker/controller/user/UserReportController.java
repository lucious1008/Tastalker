package com.in.tastalker.controller.user;

import java.io.File;
import java.io.IOException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.user.UserReportService;
import com.in.tastalker.vo.ReportVO;

import util.DuplicateFile;

@Controller
public class UserReportController {

	@Autowired
	private UserReportService userReportService;		
	private static final String PATH = "C:\\Users\\user\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\tastalker\\resources\\report\\image\\";

	@RequestMapping(value = "member/report.do", method = RequestMethod.POST)
	public ModelAndView reportGourmet(@ModelAttribute ReportVO reportVO,
			@RequestParam(required = false) MultipartFile[] files1) {
		ModelAndView mav = new ModelAndView();
		
		String nameList = "";
		if (files1 != null) {
			for (MultipartFile mf : files1) {
				File serverFile = DuplicateFile.getFile(PATH, mf);
				nameList += serverFile.getName() + "|";
				try {
					mf.transferTo(serverFile);
				} catch (IllegalStateException | IOException e) {
					System.out.println(e.getMessage());
				}
			}
			reportVO.setReportPictureName(nameList);
			userReportService.reportGourmet(reportVO);
			mav.setViewName("redirect:../gotoMain.do");// 맛집 제보한 후 가는 페이지 = main
			return mav;
		} else {
			userReportService.reportGourmet(reportVO);
			mav.setViewName("redirect:../gotoMain.do");// 맛집 제보한 후 가는 페이지 = main
			return mav;
		}

	}

	@RequestMapping(value = "member/gotoReportPage.do")
	public ModelAndView gotoreportGourmet() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("report/user-report");
		return mav;
	}

}
