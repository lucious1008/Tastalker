package com.in.tastalker.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class GourmetVO {
	private int gourmetNum;
	private String gourmetNm;
	private String gourmetAdrStr;
	private double gourmetAdrLat;
	private double gourmetAdrLon;
	private String gourmetTel;
	private String gourmetMenu;
	private String gourmetPictureName;
	private MultipartFile[] gourmetPicture;
	private int gourmetSort;	
	private Date gourmetReg;
	private float gourmetTotalGrd;
	private int gourmetTotalRpl;
	public int getGourmetNum() {
		return gourmetNum;
	}
	public void setGourmetNum(int gourmetNum) {
		this.gourmetNum = gourmetNum;
	}
	public String getGourmetNm() {
		return gourmetNm;
	}
	public void setGourmetNm(String gourmetNm) {
		this.gourmetNm = gourmetNm;
	}
	public String getGourmetAdrStr() {
		return gourmetAdrStr;
	}
	public void setGourmetAdrStr(String gourmetAdrStr) {
		this.gourmetAdrStr = gourmetAdrStr;
	}
	public double getGourmetAdrLat() {
		return gourmetAdrLat;
	}
	public void setGourmetAdrLat(double gourmetAdrLat) {
		this.gourmetAdrLat = gourmetAdrLat;
	}
	public double getGourmetAdrLon() {
		return gourmetAdrLon;
	}
	public void setGourmetAdrLon(double gourmetAdrLon) {
		this.gourmetAdrLon = gourmetAdrLon;
	}
	public String getGourmetTel() {
		return gourmetTel;
	}
	public void setGourmetTel(String gourmetTel) {
		this.gourmetTel = gourmetTel;
	}
	public String getGourmetMenu() {
		return gourmetMenu;
	}
	public void setGourmetMenu(String gourmetMenu) {
		this.gourmetMenu = gourmetMenu;
	}
	public String getGourmetPictureName() {
		return gourmetPictureName;
	}
	public void setGourmetPictureName(String gourmetPictureName) {
		this.gourmetPictureName = gourmetPictureName;
	}
	public MultipartFile[] getGourmetPicture() {
		return gourmetPicture;
	}
	public void setGourmetPicture(MultipartFile[] gourmetPicture) {
		this.gourmetPicture = gourmetPicture;
	}
	public int getGourmetSort() {
		return gourmetSort;
	}
	public void setGourmetSort(int gourmetSort) {
		this.gourmetSort = gourmetSort;
	}
	public Date getGourmetReg() {
		return gourmetReg;
	}
	public void setGourmetReg(Date gourmetReg) {
		this.gourmetReg = gourmetReg;
	}
	public float getGourmetTotalGrd() {
		return gourmetTotalGrd;
	}
	public void setGourmetTotalGrd(float gourmetTotalGrd) {
		this.gourmetTotalGrd = gourmetTotalGrd;
	}
	public int getGourmetTotalRpl() {
		return gourmetTotalRpl;
	}
	public void setGourmetTotalRpl(int gourmetTotalRpl) {
		this.gourmetTotalRpl = gourmetTotalRpl;
	}

	
}
