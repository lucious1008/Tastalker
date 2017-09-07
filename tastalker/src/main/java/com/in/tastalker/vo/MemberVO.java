package com.in.tastalker.vo;

import java.util.Date;

public class MemberVO {
	private String userId;
	private String userPw;
	private String userEmail;
	private String userGender;
	private String userAdrStr;
	private String userAdrInt;	
	private int userRank;
	private Date userReg;
	
	public int getUserRank() {
		return userRank;
	}
	public void setUserRank(int userRank) {
		this.userRank = userRank;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserAdrStr() {
		return userAdrStr;
	}
	public void setUserAdrStr(String userAdrStr) {
		this.userAdrStr = userAdrStr;
	}
	public String getUserAdrInt() {
		return userAdrInt;
	}
	public void setUserAdrInt(String userAdrInt) {
		this.userAdrInt = userAdrInt;
	}
	public Date getUserReg() {
		return userReg;
	}
	public void setUserReg(Date userReg) {
		this.userReg = userReg;
	}
	
	
}
