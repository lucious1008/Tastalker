package com.in.tastalker.service.admin;

import java.util.List;

import com.in.tastalker.vo.MemberVO;

public interface AdminMemberService {
	public MemberVO specifingMemberSpecification(String 유저아이디);
	public List<MemberVO> MemberCatalog(int 페이지넘버);
	public List<MemberVO> searchMemberCatalog(MemberVO memberVO,int 페이지넘버);
	public boolean modifyMemberInfo(MemberVO memberVO);
	public boolean deleteMember(String 유저아이디);
	public int pageSum();
	public int searchPageSum(MemberVO memberVO);

}
