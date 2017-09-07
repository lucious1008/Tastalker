package com.in.tastalker.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class GourmetVO {
	private int gourmetNum;
	private String gourmetNm;
	private String gourmetAdrStr;
	private String gourmetAdrint;
	private String gourmetTel;
	private String gourmetMenu;
	private String gourmetImage;
	private MultipartFile[] gourmetPicture;
	private String gourmetSort;	
	private Date gourmetReg;
	
	
	public MultipartFile[] getGourmetPicture() {
		return gourmetPicture;
	}
	public void setGourmetPicture(MultipartFile[] gourmetPicture) {
		this.gourmetPicture = gourmetPicture;
	}
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
	public String getGourmetAdrint() {
		return gourmetAdrint;
	}
	public void setGourmetAdrint(String gourmetAdrint) {
		this.gourmetAdrint = gourmetAdrint;
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
	public String getGourmetImage() {
		return gourmetImage;
	}
	public void setGourmetImage(String gourmetImage) {
		this.gourmetImage = gourmetImage;
	}

	public String getGourmetSort() {
		return gourmetSort;
	}
	public void setGourmetSort(String gourmetSort) {
		this.gourmetSort = gourmetSort;
	}
	public Date getGourmetReg() {
		return gourmetReg;
	}
	public void setGourmetReg(Date gourmetReg) {
		this.gourmetReg = gourmetReg;
	}
	
	
	

}
