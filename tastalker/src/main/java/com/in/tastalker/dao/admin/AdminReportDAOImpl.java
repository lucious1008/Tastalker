package com.in.tastalker.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.in.tastalker.vo.ReportVO;
@Repository("adminReportDAO")
public class AdminReportDAOImpl implements AdminReportDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReportVO> reportCatalog(int 페이지넘버) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ReportVO> sortReportCatalog(String 제보상태, int 페이지넘버) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReportVO specifingReportSecification(int 제보번호) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean approveReport(ReportVO reportVO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean rejectReport(int reportVO) {
		// TODO Auto-generated method stub
		return false;
	}

}
