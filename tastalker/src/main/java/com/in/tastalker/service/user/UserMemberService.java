package com.in.tastalker.service.user;

import com.in.tastalker.vo.MemberVO;

public interface UserMemberService {
	public int userLogin(MemberVO memberVO);
	public void userLogout();
	public MemberVO userInfoView(String userId);
	public boolean ModifyuserInfo(MemberVO memberVO);
	public boolean outOfOurTastalker(String userPw);

}
