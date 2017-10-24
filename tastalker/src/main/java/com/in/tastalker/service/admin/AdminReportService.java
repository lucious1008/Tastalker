package com.in.tastalker.service.admin;

import java.util.List;

import com.in.tastalker.vo.ReportVO;

public interface AdminReportService {
	public List<ReportVO> reportCatalog(int 페이지넘버);
	public List<ReportVO> sortReportCatalog(int reportStatus,int 페이지넘버);
	public ReportVO specifingReportSecification(int 제보번호);
	public boolean approveReport(ReportVO reportVO);
	public boolean rejectReport(int reportVO);
	public int listSum();
	public int searchSum(int reportSearch);

}
