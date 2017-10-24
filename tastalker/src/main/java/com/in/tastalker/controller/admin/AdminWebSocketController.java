package com.in.tastalker.controller.admin;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.TreeSet;

import javax.annotation.Resource;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.admin.AdminChatService;
@Controller
public class AdminWebSocketController {
	
	@Resource(name = "adminChatService")
	private AdminChatService adminChatService;
	
	public static String FILEPATH = "C:\\Users\\user\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\tastalker\\resources\\chatLog\\";

	//검색 및 페이지
	@RequestMapping(value = "/admin/15.do")
	public ModelAndView searchChatLog(){
		ModelAndView mav = new ModelAndView();
		TreeSet<String> logSet = new TreeSet<>();
		//파일 객체생성
		File path = new File(FILEPATH);
		//파일 배열에 저장
		File[] list = path.listFiles();
		for (int i=0; i<list.length; i++) {
			String tempName = FILEPATH+list[i].getName();			
			File subFileList = new File(tempName);
			int lastIndex = tempName.lastIndexOf('\\');
			String folderName = tempName.substring(lastIndex+1);
			
			String year = folderName.substring(0,4);
			String month = folderName.substring(4,6);
			String day = folderName.substring(6,8);
			
			File[] subFileName = subFileList.listFiles();
			for (int j = 0; j < subFileName.length; j++) {				
				String tempSubName = subFileName[j].getName().substring(0,subFileName[j].getName().lastIndexOf('.'));
				logSet.add(String.format("%s", year+month+day)+"/"+String.format("%s", tempSubName));
			}
		}
		TreeSet<String> decSet = new TreeSet<>();
		decSet = (TreeSet<String>) logSet.descendingSet();
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		
		mav.addObject("startDate","2017-10-01");		
		mav.addObject("endDate",sdf.format(today));		
		mav.addObject("logSet",decSet);
		mav.addObject("totalNum",decSet.size());
		mav.addObject("pageNum",1);
		mav.setViewName("/admin/admin-chat");
		return mav;
	}
	@RequestMapping(value = "/admin/15-1.do")
	public ModelAndView searchChatLog2(@RequestParam int pageNum,String startDate,String endDate,@RequestParam(required=false) String area) throws ParseException{
		
		ModelAndView mav = new ModelAndView();
		TreeSet<String> logSet = new TreeSet<>();
		//파일 객체생성
		File path = new File(FILEPATH);
		//파일 배열에 저장
		File[] list = path.listFiles();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfTrans = new SimpleDateFormat("yyyyMMdd");
		
		int lastStart = 0;
		int lastEnd = 0;
		String startInt = "";
		String endInt = "";
		
		if(startDate != ""){
			//startDate, endDate parse
			String[] orignalStart = startDate.split("-");
			String[] orignalEnd = endDate.split("-");
			for(int i=0; i<orignalStart.length; i++){
				startInt += orignalStart[i];
				endInt += orignalEnd[i];
			}
		}
		;
		
		int sDate = Integer.parseInt(startInt);
		int eDate = Integer.parseInt(endInt);
		if(area ==""||area==null){			
			for (int i=0; i<list.length; i++) {
				String tempName = FILEPATH+list[i].getName();			
				File subFileList = new File(tempName);
				int lastIndex = tempName.lastIndexOf('\\');
				String folderName = tempName.substring(lastIndex+1);
				String year = folderName.substring(0,4);
				String month = folderName.substring(4,6);
				String day = folderName.substring(6,8);
				SimpleDateFormat sdfff = new SimpleDateFormat("yyyyMMdd");
				int tempDate = Integer.parseInt(year+month+day);
				
				int compareStartDate = tempDate-sDate;
				int compareEndDate = tempDate-eDate;
				
				if(compareStartDate<0||compareEndDate>0){				
					
					continue;				
				}
				File[] subFileName = subFileList.listFiles();
				for (int j = 0; j < subFileName.length; j++) {				
					String tempSubName = subFileName[j].getName().substring(0,subFileName[j].getName().lastIndexOf('.'));
					logSet.add(String.format("%s", year+month+day)+"/"+String.format("%s", tempSubName));				
				}			
			}
		}else{
			for (int i=0; i<list.length; i++) {
				String tempName = FILEPATH+list[i].getName();			
				File subFileList = new File(tempName);
				int lastIndex = tempName.lastIndexOf('\\');
				String folderName = tempName.substring(lastIndex+1);
				String year = folderName.substring(0,4);
				String month = folderName.substring(4,6);
				String day = folderName.substring(6,8);
				SimpleDateFormat sdfff = new SimpleDateFormat("yyyyMMdd");
				int tempDate = Integer.parseInt(year+month+day);
				
				int compareStartDate = tempDate-sDate;
				int compareEndDate = tempDate-eDate;
				
				if(compareStartDate<0||compareEndDate>0){				
					
					continue;				
				}
				File[] subFileName = subFileList.listFiles();
				for (int j = 0; j < subFileName.length; j++) {				
					String tempSubName = subFileName[j].getName().substring(0,subFileName[j].getName().lastIndexOf('.'));					
					if(area.equals(tempSubName)){
						logSet.add(String.format("%s", year+month+day)+"/"+String.format("%s", tempSubName));	
					}					
									
				}			
			}
		}
		
		TreeSet<String> decSet = new TreeSet<>();
		decSet = (TreeSet<String>) logSet.descendingSet();
		
		mav.addObject("endDate",endDate);
		mav.addObject("startDate",startDate);
		mav.addObject("area",area);
		mav.addObject("logSet",decSet);
		mav.addObject("totalNum",decSet.size());
		mav.addObject("pageNum",pageNum);
		mav.setViewName("/admin/admin-chat");
		return mav;
	}
	//상세 파일읽어오기
	@RequestMapping(value = "/admin/16.do")
	public ModelAndView viewChatLog(@RequestParam String titles){
		ModelAndView mav = new ModelAndView();
		String[]title = titles.split("/");	
		
		
		String filePath = "C:\\Users\\user\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\tastalker\\resources\\chatLog\\"+title[0];
		String fileName = title[1]+".txt";
		
		File outFile = new File(filePath, fileName);
		
		BufferedReader br = null;
		String readFile = "";
		try {
			br = new BufferedReader(new FileReader(outFile));
			String read = "";
			while ((read = br.readLine()) != null) {
				
				readFile += read + "<br/>";
			}
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		mav.addObject("date", title[0]);
		mav.addObject("title", title[1]);
		mav.addObject("content", readFile);
		mav.addObject("nowMenu", "chat");
		mav.setViewName("/admin/admin-chatdetail");
		return mav;
	}
	
	
	

}
