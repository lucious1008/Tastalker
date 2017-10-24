package com.in.tastalker.dao.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.in.tastalker.vo.MemberVO;
@Repository("adminMemberDAO")
public class AdminMemberDAOImpl implements AdminMemberDAO{
	
	@Autowired
	private SqlSession sqlSession;

	private static final String USER_GENDER ="and user_gender = ";
	private static final String USER_RANK = "and user_rank = ";
	private static final String USER_NM = "and user_nm Like ";
	private static final String USER_ADR = "and user_adr_str like ";
	private static final String USER_ID = "and user_id like";
	
	@Override
	public MemberVO specifingMemberSpecification(String 유저아이디) {
		MemberVO mvo = new MemberVO();
		
		mvo = sqlSession.selectOne("selectOne", 유저아이디);
		return mvo;
	}

	@Override
	public List<MemberVO> MemberCatalog(int 페이지넘버) {
		// TODO Auto-generated method stub
		List<MemberVO> list = sqlSession.selectList("paging", 페이지넘버);
		return list;
	}

	@Override
	public List<MemberVO> searchMemberCatalog(MemberVO memberVO, int 페이지넘버) {
		String userGender = null;
		String userRank = null;
		String userNm = null;
		String userAdr = null;
		String userIds = null;		

		if(memberVO.getUserGender() == null||memberVO.getUserGender().length()==0){
			userGender = "and 1=1";
			
		}
		else {
			userGender = USER_GENDER + "'"+memberVO.getUserGender() + "'";
		}
		
		if(memberVO.getUserRank() == 0) {
			userRank = "and user_rank > -1";
			
		}else{
			userRank = USER_RANK+ memberVO.getUserRank();
		}
		
		if(memberVO.getUserNm()!= null) {
			userNm = USER_NM + "'%" +memberVO.getUserNm() +"%'";			
		}else{
			userNm = "and 1=1";			
		}
		
		if(memberVO.getUserAdrStr()!= null)  {
			userAdr = USER_ADR+"'%"+memberVO.getUserAdrStr()+"%'";			
		}
		else{
			userAdr = "and 1=1";			
		}
		
		if(memberVO.getUserId()!= null) {
			userIds = USER_ID+"'%"+memberVO.getUserId()+"%'";			
		}else{
			userIds = "and 1=1";			
		}
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("memberVO", memberVO);
		map.put("num", 페이지넘버);
		map.put("userIds", userIds);
		map.put("userAdrs", userAdr);
		map.put("queryGender", userGender);
		map.put("userRank", userRank);
		map.put("userNm", userNm);		
		
		List<MemberVO> list = sqlSession.selectList("search", map);
		
		return list;
	}

	@Override
	public boolean modifyMemberInfo(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
		boolean modi = sqlSession.update("updateRank", memberVO)==1;
		
		
		
		return modi;
	}

	@Override
	public boolean deleteMember(String 유저아이디) {
		// TODO Auto-generated method stub
		boolean result = sqlSession.delete("userDelete", 유저아이디) == 1;
		
		return result;
	}

	@Override
	public int pageSum() {
		// TODO Auto-generated method stub
		int page = sqlSession.selectOne("pageNum", null);
		return page;
	}

	@Override
	public int searchPageSum(MemberVO memberVO) {
		String userGender = null;
		String userRank = null;
		String userNm = null;
		String userAdr = null;
		String userIds = null;
		

		if(memberVO.getUserGender()==null||"".equals(memberVO.getUserGender())){
			userGender = "and 1=1";
		}
		else {
			userGender = USER_GENDER + "'"+memberVO.getUserGender() + "'";
		}
		
		if(memberVO.getUserRank() == 0) {
			userRank = "and user_rank > -1";
		}else{
			userRank = USER_RANK+ memberVO.getUserRank();
		}
		
		if(memberVO.getUserNm()!=null) {
			userNm = USER_NM + "'%" +memberVO.getUserNm() +"%'";			
		}else{
			userNm = "and 1=1";
		}
		
		if(memberVO.getUserAdrStr()!=null)  {
			userAdr = USER_ADR+"'%"+memberVO.getUserAdrStr()+"%'";			
		}
		else{
			userAdr = "and 1=1";
		}
		
		if(memberVO.getUserId()!=null) {
			userIds = USER_ID+"'%"+memberVO.getUserId()+"%'";
		}else{
			userIds = "and 1=1";
		}	

		
		HashMap<String, Object> map = new HashMap<>();
		map.put("memberVO", memberVO);
		map.put("userIds", userIds);
		map.put("userAdrs", userAdr);
		map.put("queryGender", userGender);
		map.put("userRank", userRank);
		map.put("userNm", userNm);
		
		int page = sqlSession.selectOne("searchPageNum", map);
		
		return page;
	}

}
