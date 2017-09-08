package com.in.tastalker.dao.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.in.tastalker.vo.MemberVO;
@Repository("userMemberDAO")
public class UserMemberDAOImpl implements UserMemberDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int userLogin(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void userLogout() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberVO userInfoView(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean ModifyuserInfo(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean outOfOurTastalker(String userPw) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean userJoin(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return false;
	}

}
