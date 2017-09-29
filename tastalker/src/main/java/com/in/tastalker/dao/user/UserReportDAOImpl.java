package com.in.tastalker.dao.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.in.tastalker.vo.ReportVO;
@Repository("userReportDAO")
public class UserReportDAOImpl implements UserReportDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean reportGourmet(ReportVO reportVO) {
		return sqlSession.insert("reportGourmet", reportVO) == 1;
	}
}
