package com.in.tastalker.dao.user;

import com.in.tastalker.vo.MemberVO;

public interface UserMemberDAO {
	public int userLogin(MemberVO memberVO);
	public void userLogout();
	public MemberVO userInfoView(String userId);
	public boolean ModifyuserInfo(MemberVO memberVO);
	public boolean outOfOurTastalker(String userPw);
	public boolean userJoin(MemberVO memberVO);

}
