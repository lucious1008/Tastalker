package com.in.tastalker.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.in.tastalker.dao.admin.AdminMemberDAO;
import com.in.tastalker.vo.MemberVO;
@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	@Override
	public MemberVO specifingMemberSpecification(String 유저아이디) {
		// TODO Auto-generated method stub
		return adminMemberDAO.specifingMemberSpecification(유저아이디);
	}

	@Override
	public List<MemberVO> MemberCatalog(int 페이지넘버) {
		// TODO Auto-generated method stub
		return adminMemberDAO.MemberCatalog(페이지넘버);
	}

	@Override
	public List<MemberVO> searchMemberCatalog(MemberVO memberVO, int 페이지넘버) {
		// TODO Auto-generated method stub
		return adminMemberDAO.searchMemberCatalog(memberVO, 페이지넘버);
	}

	@Override
	public boolean modifyMemberInfo(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return adminMemberDAO.modifyMemberInfo(memberVO);
	}

	@Override
	public boolean deleteMember(String 유저아이디) {
		// TODO Auto-generated method stub
		return adminMemberDAO.deleteMember(유저아이디);
	}

	@Override
	public int pageSum() {
		// TODO Auto-generated method stub
		return adminMemberDAO.pageSum();
	}

	@Override
	public int searchPageSum(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return adminMemberDAO.searchPageSum(memberVO);
	}

	
}
