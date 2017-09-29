package com.in.tastalker.service.user;

import java.util.List;

import com.in.tastalker.vo.MemberVO;
import com.in.tastalker.vo.ReportVO;

public interface UserMemberService {
	public MemberVO userLogin(MemberVO memberVO);
	public void userLogout();//세션값만 지우면 되니 다오와 서비스 말고 컨트롤러에만 있어도 될 듯
	public MemberVO userInfoView(String userId);
	public boolean modifyuserInfo(MemberVO memberVO);
	public boolean outOfOurTastalker(MemberVO memberVO);
	public boolean userJoin(MemberVO memberVO);
	
	public List<ReportVO> userReportInfo(String userId, int page);
	public boolean userIdChk(String userId);//비밀번호 중복체크
	
	public int userReportCount(String userId);

}
