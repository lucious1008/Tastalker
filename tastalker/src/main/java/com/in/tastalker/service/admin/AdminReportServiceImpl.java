package com.in.tastalker.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.in.tastalker.dao.admin.AdminReportDAO;
import com.in.tastalker.vo.ReportVO;
@Service("adminReportService")
public class AdminReportServiceImpl implements AdminReportService{
	
	@Autowired
	private AdminReportDAO adminReportDAO;
	
	@Override
	public List<ReportVO> reportCatalog(int 페이지넘버) {
		// TODO Auto-generated method stub
		return adminReportDAO.reportCatalog(페이지넘버);
	}

	@Override
	public List<ReportVO> sortReportCatalog(String 제보상태, int 페이지넘버) {
		// TODO Auto-generated method stub
		return adminReportDAO.sortReportCatalog(제보상태, 페이지넘버);
	}

	@Override
	public ReportVO specifingReportSecification(int 제보번호) {
		// TODO Auto-generated method stub
		return adminReportDAO.specifingReportSecification(제보번호);
	}

	@Override
	public boolean approveReport(ReportVO reportVO) {
		// TODO Auto-generated method stub
		return adminReportDAO.approveReport(reportVO);
	}

	@Override
	public boolean rejectReport(int reportVO) {
		// TODO Auto-generated method stub
		return adminReportDAO.rejectReport(reportVO);
	}

}
