package com.in.tastalker.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReportVO {
	private int reportNum;
	private String reportNm;
	private String reportAdrStr;
	private double reportAdrLat;
	private double reportAdrLon;
	private String reportTel;
	private String reportMenu;
	private int reportStatus;
	private String reportUser;
	private String reportComment;
	private int reportSort;
	private Date reportReg;
	private MultipartFile[] reportPicture;
	private String reportPictureName;
	
	
	
	public double getReportAdrLon() {
		return reportAdrLon;
	}
	public void setReportAdrLon(double reportAdrLon) {
		this.reportAdrLon = reportAdrLon;
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
	public double getReportAdrLat() {
		return reportAdrLat;
	}
	public void setReportAdrLat(double reportAdrLat) {
		this.reportAdrLat = reportAdrLat;
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
	public int getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(int reportStatus) {
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
	public int getReportSort() {
		return reportSort;
	}
	public void setReportSort(int reportSort) {
		this.reportSort = reportSort;
	}
	public Date getReportReg() {
		return reportReg;
	}
	public void setReportReg(Date reportReg) {
		this.reportReg = reportReg;
	}
	public MultipartFile[] getReportPicture() {
		return reportPicture;
	}
	public void setReportPicture(MultipartFile[] reportPicture) {
		this.reportPicture = reportPicture;
	}
	public String getReportPictureName() {
		return reportPictureName;
	}
	public void setReportPictureName(String reportPictureName) {
		this.reportPictureName = reportPictureName;
	}

}
