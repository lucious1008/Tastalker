package com.in.tastalker.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.in.tastalker.dao.user.UserReportDAO;
import com.in.tastalker.vo.ReportVO;
@Service("userReportService")
public class UserReportServiceImpl implements UserReportService{
	@Autowired
	private UserReportDAO userReportDAO;
	@Override
	public boolean reportGourmet(ReportVO reportVO) {
		// TODO Auto-generated method stub
		return userReportDAO.reportGourmet(reportVO);
	}

}
