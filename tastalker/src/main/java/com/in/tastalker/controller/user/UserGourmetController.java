package com.in.tastalker.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.user.UserGourmetService;
import com.in.tastalker.vo.GradeVO;
import com.in.tastalker.vo.ReplyVO;

@Controller
public class UserGourmetController {
	
	@Autowired
	private UserGourmetService userGourmetService;
	
	@RequestMapping(value = "17")
	public ModelAndView registReply(ReplyVO replyVO){
		ModelAndView mav = new ModelAndView();
		userGourmetService.registReply(replyVO);
		mav.setViewName("댓글 등록후 가는 페이지");
		return mav;
	}
	@RequestMapping(value = "18")
	public ModelAndView registGrade(GradeVO gradeVO){
		ModelAndView mav = new ModelAndView();
		userGourmetService.registGrade(gradeVO);		
		mav.setViewName("평점 등록후 가는 페이지");
		return mav;
	}
	@RequestMapping(value = "19")
	public ModelAndView deleteReply(@RequestParam int replyNum){
		ModelAndView mav = new ModelAndView();
		userGourmetService.deleteReply(replyNum);
		mav.setViewName("댓글 삭제후 가는 페이지");
		return mav;
	}
	@RequestMapping(value = "20")
	public ModelAndView modifyGrade(GradeVO gradeVO){
		ModelAndView mav = new ModelAndView();
		userGourmetService.modifyGrade(gradeVO);
		mav.setViewName("평점 수정후 가는 페이지");
		return mav;
	}
	@RequestMapping(value = "100")
	public ModelAndView modifyGrade(ReplyVO replyVO){
		ModelAndView mav = new ModelAndView();
		userGourmetService.modifyReply(replyVO);
		mav.setViewName("댓글 수정후 가는 페이지");
		return mav;
	}
	@RequestMapping(value = "21")
	public ModelAndView searchGourmetByDirectory(String directory, String gpsInfo, @RequestParam(required = true)int pageNum){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("검색결과 리스트(디렉토리)", userGourmetService.searchGourmetByDirectory(directory, gpsInfo,pageNum));
		mav.setViewName("검색결과 (디렉토리)");
		return mav;
	}
	@RequestMapping(value = "22")
	public ModelAndView searchGourmetByKeyword(String keyword, String gpsInfo, @RequestParam(required = true)int pageNum){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("검색결과 리스트(키워드)", userGourmetService.searchGourmetByKeyword(keyword, gpsInfo,pageNum));
		mav.setViewName("검색결과(키워드)");
		return mav;
	}
	@RequestMapping(value = "23")
	public ModelAndView gourmetInfoView(@RequestParam(required = true)int gourmetNum){
		ModelAndView mav = new ModelAndView();		
		mav.addObject("맛집 상세정보", userGourmetService.gourmetInfoView(gourmetNum));
		mav.addObject("맛집 댓글", userGourmetService.viewGrade(gourmetNum));
		mav.addObject("맛집 평점", userGourmetService.viewReply(gourmetNum));		
		mav.setViewName("맛집 상세 페이지");
		return mav;
	}
	
	

}
