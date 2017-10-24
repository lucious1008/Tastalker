package com.in.tastalker.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.in.tastalker.dao.user.UserMemberDAO;
import com.in.tastalker.vo.MemberVO;
import com.in.tastalker.vo.ReportVO;
@Service("userMemberService")
@Transactional
public class UserMemberServiceImpl implements UserMemberService{
	
	@Autowired
	private UserMemberDAO userMemberDAO;
	
	@Override
	public MemberVO userLogin(MemberVO memberVO) {
		return userMemberDAO.userLogin(memberVO);
	}

	@Override
	public void userLogout() {
		userMemberDAO.userLogout();
		
	}

	@Override
	public MemberVO userInfoView(String userId) {
		return userMemberDAO.userInfoView(userId);
	}
	@Transactional
	@Override
	public boolean modifyuserInfo(MemberVO memberVO) {
		return userMemberDAO.modifyuserInfo(memberVO);
	}
	@Transactional
	@Override
	public boolean outOfOurTastalker(MemberVO memberVO) {
		return userMemberDAO.outOfOurTastalker(memberVO);
	}
	@Transactional
	@Override
	public boolean userJoin(MemberVO memberVO) {
		return userMemberDAO.userJoin(memberVO);
	}

	@Override
	public boolean userIdChk(String userId) {
		return userMemberDAO.userIdChk(userId);
	}

	@Override
	public List<ReportVO> userReportInfo(String userId, int page) {
		return userMemberDAO.userReportInfo(userId,page);
	}

	@Override
	public int userReportCount(String userId) {
		return userMemberDAO.userReportCount(userId);
	}

}
