package com.in.tastalker.controller.user;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.user.UserReportService;
import com.in.tastalker.vo.ReportVO;

import util.DuplicateFile;

@Controller
public class UserReportController {
	
	@Autowired
	private UserReportService userReportService;
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value = "29")
	public ModelAndView reportGourmet(ReportVO reportVO,MultipartFile files1){
		ModelAndView mav = new ModelAndView();
		String path = servletContext.getRealPath("경로");
		ArrayList<String> nameList = new ArrayList<>();
		String[] nameArray = new String[5];
		if(!files1.isEmpty()){
			for (MultipartFile mf : reportVO.getReportPicture()) {
				File serverFile = DuplicateFile.getFile(path, mf);
				nameList.add(serverFile.getName());
				try {
					mf.transferTo(serverFile);
				} catch (IllegalStateException | IOException e) {
					System.out.println(e.getMessage());
				}
			}
			for(int i = 0; i < 5; i++){
				if(nameList.size()==0){					
					break;
				}
				nameArray[i] = nameList.get(i);
			}
			reportVO.setReportPictureName(nameArray);
		}
		
		userReportService.reportGourmet(reportVO);
		mav.setViewName("맛집 제보한 후 가는 페이지");
		return mav;
	}
	@RequestMapping(value = "30")
	public ModelAndView gotoreportGourmet(){
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("맛집 제보페이지로 간다");
		return mav;
	}

}
