package com.in.tastalker.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.in.tastalker.vo.MemberVO;
@Repository("adminMemberDAO")
public class AdminMemberDAOImpl implements AdminMemberDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVO specifingMemberSpecification(String 유저아이디) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> MemberCatalog(int 페이지넘버) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> searchMemberCatalog(MemberVO memberVO, int 페이지넘버) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modifyMemberInfo(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMember(String 유저아이디) {
		// TODO Auto-generated method stub
		return false;
	}

}
