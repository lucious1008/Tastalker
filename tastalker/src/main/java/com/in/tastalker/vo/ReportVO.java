package com.in.tastalker.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReportVO {
	private int reportNum;
	private String reportNm;
	private String reportAdrStr;
	private String reportAdrInt;
	private String reportTel;
	private String reportMenu;
	private String reportStatus;
	private String reportUser;
	private String reportComment;
	private String reportSort;
	private Date reportReg;
	private MultipartFile[] reportPicture;
	private String[] reportPictureName;
	
	
	public MultipartFile[] getReportPicture() {
		return reportPicture;
	}
	public void setReportPicture(MultipartFile[] reportPicture) {
		this.reportPicture = reportPicture;
	}
	public String[] getReportPictureName() {
		return reportPictureName;
	}
	public void setReportPictureName(String[] reportPictureName) {
		this.reportPictureName = reportPictureName;
	}
	public int getReportNum() {
		return reportNum;
	}
	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}
	public String getReportNm() {
		return reportNm;
	}
	public void setReportNm(String reportNm) {
		this.reportNm = reportNm;
	}
	public String getReportAdrStr() {
		return reportAdrStr;
	}
	public void setReportAdrStr(String reportAdrStr) {
		this.reportAdrStr = reportAdrStr;
	}
	public String getReportAdrInt() {
		return reportAdrInt;
	}
	public void setReportAdrInt(String reportAdrInt) {
		this.reportAdrInt = reportAdrInt;
	}
	public String getReportTel() {
		return reportTel;
	}
	public void setReportTel(String reportTel) {
		this.reportTel = reportTel;
	}
	public String getReportMenu() {
		return reportMenu;
	}
	public void setReportMenu(String reportMenu) {
		this.reportMenu = reportMenu;
	}
	public String getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}
	public String getReportUser() {
		return reportUser;
	}
	public void setReportUser(String reportUser) {
		this.reportUser = reportUser;
	}
	public String getReportComment() {
		return reportComment;
	}
	public void setReportComment(String reportComment) {
		this.reportComment = reportComment;
	}
	public String getReportSort() {
		return reportSort;
	}
	public void setReportSort(String reportSort) {
		this.reportSort = reportSort;
	}
	public Date getReportReg() {
		return reportReg;
	}
	public void setReportReg(Date reportReg) {
		this.reportReg = reportReg;
	}
	
	
	

}
