package com.in.tastalker.dao.user;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.in.tastalker.vo.MemberVO;
import com.in.tastalker.vo.ReportVO;
@Repository("userMemberDAO")
public class UserMemberDAOImpl implements UserMemberDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private MemberVO membVO;

	@Override
	public MemberVO userLogin(MemberVO memberVO) {
		
		membVO = sqlSession.selectOne("login",memberVO);
		if(membVO ==null)membVO = new MemberVO();
		return membVO;
	}

	@Override
	public void userLogout() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberVO userInfoView(String userId) {
		return sqlSession.selectOne("userInfoView", userId);
	}

	@Override
	public boolean modifyuserInfo(MemberVO memberVO) {
		return sqlSession.update("modifyuserInfo", memberVO) == 1;
	}

	@Override
	public boolean outOfOurTastalker(MemberVO memberVO) {
		return sqlSession.delete("outOfOurTastalker", memberVO) == 1;
	}
	
	@Override
	public boolean userJoin(MemberVO memberVO) {
		return sqlSession.insert("userJoin", memberVO) == 1;
	}

	@Override
	public boolean userIdChk(String userId) {
		int result = sqlSession.selectOne("userIdChk",userId);
		if(result == 1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<ReportVO> userReportInfo(String userId, int page) {
		HashMap<String,Object> reportHash = new HashMap<>();
		reportHash.put("userId", userId);
		reportHash.put("page", page);
		return sqlSession.selectList("userReportInfo", reportHash);
	}

	@Override
	public int userReportCount(String userId) {
		return sqlSession.selectOne("userReportCount", userId);
	}
}
