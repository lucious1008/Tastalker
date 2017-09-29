package com.in.tastalker.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.user.UserGourmetService;


@Controller
public class UserGourmetController {
	
	@Autowired
	private UserGourmetService userGourmetService;
	@RequestMapping(value = "member/17.do", method = RequestMethod.POST)//댓글 등록
	public void registReply(@RequestParam String gourmetNum, @RequestParam String replyContent,HttpServletResponse response, HttpServletRequest request ) throws IOException{
		ModelAndView mav = new ModelAndView();
		PrintWriter out = response.getWriter();
		String userId = (String)request.getSession().getAttribute("SID");
		if(userGourmetService.registReply(Integer.parseInt(gourmetNum),replyContent,userId)){
			out.print("1");
		}else{
			out.print("0");
		}
		out.flush();
		out.close();
	}
	@RequestMapping(value = "member/18.do")
	public void registGrade(@RequestParam String gourmetNum, @RequestParam String gradeGrade,HttpServletResponse response, HttpServletRequest request) throws IOException{
		ModelAndView mav = new ModelAndView();
		String userId = (String)request.getSession().getAttribute("SID");
		PrintWriter out = response.getWriter();
		// select 먼저 하고 값이 있으면 수정 없으면 등록
		if(userGourmetService.checkGrade(Integer.parseInt(gourmetNum), userId) == 1){
			userGourmetService.modifyGrade(Integer.parseInt(gourmetNum),Integer.parseInt(gradeGrade),userId);
			out.print("1");
			out.close();
		}else{
			userGourmetService.registGrade(Integer.parseInt(gourmetNum),Integer.parseInt(gradeGrade),userId);
			out.print("1");					
			out.close();			
		} 
		//평점 등록후 가는 페이지 = 평점 등록한 상세 페이지
	}
	
	@RequestMapping(value = "member/19.do")
	public void deleteReply(@RequestParam int gourmetNum, @RequestParam int replyNum, HttpServletResponse response, HttpServletRequest request ) throws IOException{
		ModelAndView mav = new ModelAndView();
		PrintWriter out = response.getWriter();
		mav.setViewName("search/user-storedetail");//댓글 삭제후 가는 페이지 = 댓글 삭제한 상세 페이지
		if(userGourmetService.deleteReply(gourmetNum,replyNum) == 1){
			out.print("1");
		}else{
			out.print("0");
		}
		out.flush();
		out.close();
	}
	@RequestMapping(value = "member/20.do")//댓글 수정후 가는 페이지 = 맛집 상세 페이지
	public void modifyReply(@RequestParam String gourmetNum, @RequestParam String replyNum, @RequestParam String replyContent, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();		
		userGourmetService.modifyReply(Integer.parseInt(gourmetNum),Integer.parseInt(replyNum),replyContent);
		if(userGourmetService.modifyReply(Integer.parseInt(gourmetNum),Integer.parseInt(replyNum),replyContent)){
			out.print("1");
		}else{
			out.print("0");
		}
		out.flush();
		out.close();
	}

	
	@RequestMapping(value = "gourmetInfo.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView gourmetInfoView(@RequestParam int gourmetNum , @RequestParam int page , HttpServletRequest request ){
		ModelAndView mav = new ModelAndView();
		String userId = "";
		if(request.getSession().getAttribute("SID") ==null ){
			userId = "";
		}
		else{			
			userId = (String)request.getSession().getAttribute("SID");
		}		
		mav.addObject("gourmetInfo", userGourmetService.gourmetInfoView(gourmetNum));
		mav.addObject("gourmetInfo", userGourmetService.gourmetInfoView(gourmetNum));
		mav.addObject("replyList", userGourmetService.viewReply(gourmetNum,page));
		mav.addObject("totalReplyNum", userGourmetService.viewReplyCount(gourmetNum));		
		if(!userId.equals("")){			
			mav.addObject("checkMyGrade", userGourmetService.checkMyGrade(gourmetNum, userId));			
		}
		mav.addObject("gourmetNum", gourmetNum);
		mav.addObject("page", page);
		mav.setViewName("search/user-storedetail");//맛집 상세 페이지
		return mav;
	}


	@RequestMapping(value = "searchDir.do",method=RequestMethod.GET)
	public ModelAndView searchGourmetByDirectory(@RequestParam String lati, @RequestParam String lngi, @RequestParam String pageNum,@RequestParam String food,@RequestParam String sort1,@RequestParam String sort2){
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("searchDir", userGourmetService.searchGourmetByDirectory(Integer.parseInt(food), Float.parseFloat(lati), Float.parseFloat(lngi), Integer.parseInt(pageNum),sort1,Float.parseFloat(sort2)));
		mav.addObject("totalPage",userGourmetService.searchGourmetByDirectoryCnt(Integer.parseInt(food), Float.parseFloat(lati), Float.parseFloat(lngi), Integer.parseInt(pageNum),sort1,Float.parseFloat(sort2)));
		mav.addObject("lati",lati);
		mav.addObject("lngi",lngi);
		mav.addObject("food",food);
		mav.addObject("sort1",sort1);
		mav.addObject("sort2",sort2);
		mav.addObject("page",pageNum);
		mav.addObject("sendType", "directory");
		mav.setViewName("search/searchResult");
		return mav;
		
	}
	@RequestMapping(value = "searchKey.do",method=RequestMethod.GET)
	public ModelAndView searchGourmetByKeyword(@RequestParam String keyword,@RequestParam String lati, @RequestParam String lngi, @RequestParam String pageNum,@RequestParam String sort1,@RequestParam String sort2){
		ModelAndView mav = new ModelAndView();
		String keywords = keyword.replace("'", "");		
		mav.addObject("searchDir", userGourmetService.searchGourmetByKeyword(keywords, Float.parseFloat(lati), Float.parseFloat(lngi), Integer.parseInt(pageNum),sort1,Float.parseFloat(sort2)));		
		mav.addObject("totalPage",userGourmetService.searchGourmetByKeywordCnt(keywords, Float.parseFloat(lati), Float.parseFloat(lngi), Integer.parseInt(pageNum),sort1,Float.parseFloat(sort2)));
		mav.addObject("lati",lati);
		mav.addObject("lngi",lngi);		
		mav.addObject("keyword",keyword);
		mav.addObject("sort1",sort1);
		mav.addObject("sort2",sort2);
		mav.addObject("page",pageNum);
		mav.addObject("sendType", "keyword");
		mav.setViewName("search/searchResult");
		return mav;
	}


	
}
