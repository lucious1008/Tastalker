package com.in.tastalker.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.in.tastalker.dao.user.UserMemberDAO;
import com.in.tastalker.vo.MemberVO;
@Service("userMemberService")
@Transactional
public class UserMemberServiceImpl implements UserMemberService{
	
	@Autowired
	private UserMemberDAO userMemberDAO;
	
	@Override
	public int userLogin(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return userMemberDAO.userLogin(memberVO);
	}

	@Override
	public void userLogout() {
		// TODO Auto-generated method stub
		userMemberDAO.userLogout();
		
	}

	@Override
	public MemberVO userInfoView(String userId) {
		// TODO Auto-generated method stub
		return userMemberDAO.userInfoView(userId);
	}

	@Override
	public boolean ModifyuserInfo(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return userMemberDAO.ModifyuserInfo(memberVO);
	}

	@Override
	public boolean outOfOurTastalker(String userPw) {
		// TODO Auto-generated method stub
		return userMemberDAO.outOfOurTastalker(userPw);
	}
	@Transactional
	@Override
	public boolean userJoin(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return false;
	}

}
