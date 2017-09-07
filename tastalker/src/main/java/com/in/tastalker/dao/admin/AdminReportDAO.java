package com.in.tastalker.dao.admin;

import java.util.List;

import com.in.tastalker.vo.ReportVO;

public interface AdminReportDAO {
	public List<ReportVO> reportCatalog(int 페이지넘버);
	public List<ReportVO> sortReportCatalog(String 제보상태,int 페이지넘버);
	public ReportVO specifingReportSecification(int 제보번호);
	public boolean approveReport(ReportVO reportVO);
	public boolean rejectReport(int reportVO);

}
