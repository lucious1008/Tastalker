package com.in.tastalker.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.in.tastalker.service.admin.AdminGourmetService;
import com.in.tastalker.vo.GourmetVO;
import com.in.tastalker.vo.ReplyVO;

@Controller
public class AdminGourmetController {
	
	@Autowired
	private AdminGourmetService adminGourmetService;
	private String address;
	
	@RequestMapping(value = "admin/1.do")
	public ModelAndView AdminGourmetCatalog(@RequestParam int pageNum, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		int listSum = adminGourmetService.gourmetSum(); 
		
		
		// 전체 페이지의 수
		float sumPageBefore = (float) listSum / (float) 3;
		int sumPage = (int) Math.ceil(sumPageBefore);
		
		// 전체 페이징 수
		float pagingSumBefore = (float)sumPage/(float)3;
		int pagingSum = (int)Math.ceil(pagingSumBefore);
		
		int lastPage = 3 * pageNum;
		int firstPage = 3 * pageNum- 2;
		
		if (sumPage < lastPage) {
			mav.addObject("lastPage", sumPage);
		} else {
			mav.addObject("lastPage", lastPage);
		}
		session.setAttribute("nowPage", 1);
		
		mav.addObject("pagingSum", pagingSum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("sumPage", sumPage);
		mav.addObject("firstPage", firstPage);
		mav.addObject("nowMenu", "gourmet");
		mav.addObject("gourmet",adminGourmetService.gourmetCatalog(pageNum));
		mav.setViewName("admin/admin-store");
		return mav;
	}
	
	@RequestMapping(value = "admin/1-1.do")
	public ModelAndView AdminGourmetPage(@RequestParam int pageNum, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		// 총 게시물의 합
		int listSum = adminGourmetService.gourmetSum();

		// 전체 페이지의 수
		float sumPageBefore = (float) listSum / (float) 3;
		int sumPage = (int) Math.ceil(sumPageBefore);
		
		// 전체 페이징 수
		float pagingSumBefore = (float)sumPage/(float)3;
		int pagingSum = (int)Math.ceil(pagingSumBefore);
		
		// 현재의 페이징 위치
		// pageNum이 1일 경우 현재 페이지 세쎤에 1을 저장
		if (pageNum == 1)
			session.setAttribute("nowPage", 1);
		int locatPage = (int) session.getAttribute("nowPage");
		session.setAttribute("nowPage", locatPage);
		int lastPage = 3 * locatPage;
		int firstPage = 3 * locatPage - 2;

		if (sumPage < lastPage) {
			mav.addObject("lastPage", sumPage);
		} else {
			mav.addObject("lastPage", lastPage);
		}
		mav.addObject("pagingSum", pagingSum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("nowMenu", "gourmet");
		mav.addObject("sumPage", sumPage);
		mav.addObject("firstPage", firstPage);
		mav.addObject("gourmet", adminGourmetService.gourmetCatalog(pageNum));

		mav.setViewName("admin/admin-store");
		return mav;
	}
	
	@RequestMapping(value = "admin/1-2.do")
	public ModelAndView MemberPage(@RequestParam int loPage, @RequestParam int flag,HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		// 총 게시물의 합
		int listSum = adminGourmetService.gourmetSum();

		// 전체 페이지의 수
		float sumPageBefore = (float) listSum / (float) 3;
		int sumPage = (int) Math.ceil(sumPageBefore);
		
		// 전체 페이징 수
		float pagingSumBefore = (float)sumPage/(float)3;
		int pagingSum = (int)Math.ceil(pagingSumBefore);
		
		// 현재의 페이징 위치
		int locatPage = loPage;
		session.setAttribute("nowPage", locatPage);
		
		int lastPage = 3*locatPage;
		int firstPage = 3*locatPage-2;
		
		if(sumPage < lastPage){
			mav.addObject("lastPage", sumPage);
		}else{
			mav.addObject("lastPage", lastPage);
		}
		
		List<GourmetVO> list = null;
		int pageNum = 0;
		switch (flag) {
		case 0:
			list = adminGourmetService.gourmetCatalog(firstPage);
			pageNum = firstPage;
			break;

		case 1:
			list = adminGourmetService.gourmetCatalog(lastPage);
			pageNum = lastPage;
			break;
		case 2:
			list = adminGourmetService.gourmetCatalog(sumPage);
			pageNum = sumPage;
			break;
		}
		
		mav.addObject("pagingSum", pagingSum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("nowMenu", "gourmet");
		mav.addObject("sumPage", sumPage);
		mav.addObject("firstPage", firstPage );
		mav.addObject("list", list);
		mav.setViewName("admin/admin-store");
		return mav;
	}
	
	
	//검색 첫페이지
	@RequestMapping(value = "admin/1-5.do")
	public ModelAndView AdminSearchGourmetCatalog(GourmetVO gourmetVO,@RequestParam int pageNum,@RequestParam String address, HttpSession session){
		ModelAndView mav = new ModelAndView();		
		int searchSum = adminGourmetService.searchSum(gourmetVO, address, pageNum);	
		// 전체 페이지의 수
		float sumPageBefore = (float) searchSum / (float) 3;
		int sumPage = (int) Math.ceil(sumPageBefore);
		
		// 전체 페이징 수
		float pagingSumBefore = (float)sumPage/(float)3;
		int pagingSum = (int)Math.ceil(pagingSumBefore);
		
		int lastPage = 3 * 1;
		int firstPage = 3 * 1 - 2;

		if (sumPage < lastPage) {
			mav.addObject("lastPage", sumPage);
		} else {
			mav.addObject("lastPage", lastPage);
		}
		session.setAttribute("nowPage", 1);
		if(gourmetVO.getGourmetAdrStr() == null){
			gourmetVO.setGourmetAdrStr("");
		}
		if(address == null){
			address = "";
		}
		if(gourmetVO.getGourmetNm() == null){
			gourmetVO.setGourmetNm("");
		}
		
		mav.addObject("pagingSum", pagingSum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("nowMenu", "gourmet");
		mav.addObject("searchVal", gourmetVO );
		mav.addObject("address", address);
		mav.addObject("sumPage", sumPage);
		mav.addObject("firstPage", firstPage);
		mav.addObject("gourmet",adminGourmetService.searchGourmetCatalog(gourmetVO,address, pageNum));
		mav.setViewName("admin/admin-store");
		return mav;
	}
	
	//검색 결과 페이지 넘김
	@RequestMapping(value="admin/1-6.do")
	public ModelAndView searchPageGourmet(GourmetVO gvo ,@RequestParam int pageNum, @RequestParam int gourmetSort, @RequestParam String gourmetAdrStr, @RequestParam String gourmetAdrDong, @RequestParam String gourmetNm, HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		
		//결과 값이없는 것은 null을 넣어준다.
		if(gourmetAdrStr.equals("null")){
			gourmetAdrStr = null;
		}else{
			gvo.setGourmetAdrStr(gourmetAdrStr);
		}
		if(gourmetAdrDong.equals("null")){
			address = null;
		}else{
			address = gourmetAdrDong;
		}
		if(gourmetNm.equals("null")){
			gourmetNm = null;
		}else{
			gvo.setGourmetNm(gourmetNm);
		}
		
		int searchSum = adminGourmetService.searchSum(gvo, address, pageNum);		
		
		// 전체 페이지의 수
		float sumPageBefore = (float) searchSum / (float) 3;
		int sumPage = (int) Math.ceil(sumPageBefore);
		
		// 전체 페이징 수
		float pagingSumBefore = (float)sumPage/(float)3;
		int pagingSum = (int)Math.ceil(pagingSumBefore);
		
		// 현재의 페이징 위치
		int locatPage = (int) session.getAttribute("nowPage");
		session.setAttribute("nowPage", locatPage);
		
		int lastPage = 3*locatPage;
		int firstPage = 3*locatPage-2;
		
		if(sumPage < lastPage){
			mav.addObject("lastPage", sumPage);
		}else{
			mav.addObject("lastPage", lastPage);
		}
		
		mav.addObject("pagingSum", pagingSum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("sumPage", sumPage);
		mav.addObject("firstPage", firstPage );
		mav.addObject("gourmet",adminGourmetService.searchGourmetCatalog(gvo, address, pageNum));
		
		
		if(gvo.getGourmetAdrStr() == null){
			gvo.setGourmetAdrStr("null");
		} else if(gvo.getGourmetNm() == null){
			gvo.setGourmetNm("null");
		} else if(address == null){
			address = "null";
		} 
		mav.addObject("nowMenu", "gourmet");
		mav.addObject("searchVal", gvo);
		mav.setViewName("admin/admin-store");
		return mav;
	}
	
	//검색결과 페이징
	@RequestMapping(value = "admin/1-7.do")
	public ModelAndView searchPageing(GourmetVO gvo, @RequestParam int flag ,@RequestParam int loPage, @RequestParam int gourmetSort, @RequestParam String gourmetAdrStr, @RequestParam String gourmetAdrDong, @RequestParam String gourmetNm, HttpSession session){
		ModelAndView mav = new ModelAndView();
		// 결과 값이없는 것은 null을 넣어준다.
		if (gourmetAdrStr.equals("null")) {
			gourmetAdrStr = null;
		} else {
			gvo.setGourmetAdrStr(gourmetAdrStr);
		}
		if (gourmetAdrDong.equals("null")) {
			address = null;
		} else {
			address = gourmetAdrDong;
		}
		if (gourmetNm.equals("null")) {
			gourmetNm = null;
		} else {
			gvo.setGourmetNm(gourmetNm);
		}
		
		// 총 게시물의 합
		int searchSum = adminGourmetService.searchSum(gvo, address, loPage);
		
		// 전체 페이지의 수
		float sumPageBefore = (float) searchSum / (float) 3;
		int sumPage = (int) Math.ceil(sumPageBefore);
		
		// 전체 페이징 수
		float pagingSumBefore = (float)sumPage/(float)3;
		int pagingSum = (int)Math.ceil(pagingSumBefore);

		// 현재의 페이징 위치
		int locatPage = loPage;
		
		int lastPage = 3 * locatPage;
		int firstPage = 3 * locatPage - 2;
		
		if(sumPage < lastPage){
			mav.addObject("lastPage", sumPage);
		}else{
			mav.addObject("lastPage", lastPage);
		}
		List<GourmetVO> gourmet = null;
		int pageNum = 0;
		switch (flag) {
		case 0:
			gourmet = adminGourmetService.searchGourmetCatalog(gvo, address, firstPage);
			pageNum = firstPage;
			break;

		case 1:
			gourmet = adminGourmetService.searchGourmetCatalog(gvo, address, lastPage);
			pageNum = lastPage;
			break;
		case 2:
			gourmet = adminGourmetService.searchGourmetCatalog(gvo, address, sumPage);
			pageNum = sumPage;
			break;
		}
		
		mav.addObject("pagingSum", pagingSum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("sumPage", sumPage);
		mav.addObject("firstPage", firstPage );
		mav.addObject("gourmet", gourmet);
		
		// 검색내용이 없을 경우 임의의 null값을 넣어준다.
		if(gvo.getGourmetAdrStr() == null){
			gvo.setGourmetAdrStr("null");
		} else if(gvo.getGourmetNm() == null){
			gvo.setGourmetNm("null");
		} else if(address == null){
			address = "null";
		} 
		mav.addObject("nowMenu", "gourmet");
		mav.addObject("searchVal", gvo);
		mav.setViewName("admin/admin-store");
		
		return mav;
	}
	
	
	
	
	@RequestMapping(value = "/admin/2.do")
	public ModelAndView AdminModifyGourmetInfo(GourmetVO gourmetVO){
		ModelAndView mav = new ModelAndView();		
		boolean k = adminGourmetService.modifyGourmetInfo(gourmetVO);
		if(k){			
			mav.setViewName("redirect:/admin/4.do?gourmetNum="+gourmetVO.getGourmetNum()+"&pageNum=1");
		}else{
			
			mav.addObject("modifyFalse", "맛집 수정이 실패되었습니다.");
			mav.setViewName("redirect:/admin/4-1.do?gourmetNum="+gourmetVO.getGourmetNum()+"&pageNum=1");
		}
		
		return mav;
	}
	

	//맛집 삭제
	@RequestMapping(value = "admin/3.do")
	public ModelAndView AdminDeleteGourmet(int gourmetNum){
		ModelAndView mav = new ModelAndView();	
		adminGourmetService.deleteGourmet(gourmetNum);		
		mav.setViewName("redirect:/admin/1-1.do?pageNum=1");
		
		return mav;
	}
	
	//상세페이지 이동
	@RequestMapping(value = "admin/4.do")
	public ModelAndView gotoSpecificationOfGourmetPage(int gourmetNum, @RequestParam int pageNum){
		ModelAndView mav = new ModelAndView();
		
		GourmetVO gvo = adminGourmetService.specifingGourmetSpecification(gourmetNum);
		
		String replyTableName = "reply_"+Integer.toString(gvo.getGourmetNum());
		
		List<ReplyVO> rp =  adminGourmetService.replyList(replyTableName);		
		
		int sort = gvo.getGourmetSort();
		String stringSort ="";
		switch (sort) {
		case 1:
			stringSort = "치킨";
			break;
		case 2:
			stringSort = "피자";
			break;
		case 3:
			stringSort = "중국집";
			break;
		case 4:
			stringSort = "양식";
			break;
		case 5:
			stringSort = "한식/분식";
			break;
		case 6:
			stringSort = "회/일식";
			break;
		case 7:
			stringSort = "족발/보쌈";
			break;
		case 8:
			stringSort = "도시락";
			break;
		case 9:
			stringSort = "패스트푸드";
			break;
		}
		mav.addObject("pageNum", pageNum);
		mav.addObject("sort", stringSort);
		mav.addObject("nowMenu", "gourmet");
		mav.addObject("gourmetDetail",gvo);
		mav.addObject("reply", rp);
		mav.setViewName("admin/admin-storedetail");
		return mav;
	}
	
	//수정페이지로 이동
	@RequestMapping(value = "admin/4-1.do")
	public ModelAndView goToModifyGourmetInfoDetail(@RequestParam int gourmetNum, @RequestParam double gourmetAdrLat, @RequestParam double gourmetAdrLon){
		ModelAndView mav = new ModelAndView();		
		GourmetVO gvo = adminGourmetService.specifingGourmetSpecification(gourmetNum);		
		String replyTableName = "reply_"+Integer.toString(gvo.getGourmetNum());		
		List<ReplyVO> rp =  adminGourmetService.replyList(replyTableName);
		
		mav.addObject("nowMenu", "gourmet");
		mav.addObject("lati",gourmetAdrLat);
		mav.addObject("lngi",gourmetAdrLon);
		mav.addObject("gourmetModify",gvo);
		mav.addObject("reply", rp);
		mav.setViewName("/admin/admin-storemodify");
		return mav;
	}
	
	
	//댓글삭제
	@RequestMapping(value = "admin/4-2.do")
	public ModelAndView replyDelete(int gourmetNum,@RequestParam int replyNum){
		ModelAndView mav = new ModelAndView();		
		adminGourmetService.replyDel(gourmetNum,replyNum);
		
		return mav;
	}

}
