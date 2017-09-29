package com.in.tastalker.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.in.tastalker.dao.user.UserReportDAO;
import com.in.tastalker.vo.ReportVO;
@Service("userReportService")
@Transactional
public class UserReportServiceImpl implements UserReportService{
	@Autowired
	private UserReportDAO userReportDAO;
	
	@Override
	@Transactional
	public boolean reportGourmet(ReportVO reportVO) {
		return userReportDAO.reportGourmet(reportVO);
	}

}
