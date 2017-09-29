package com.in.tastalker.vo;

import java.util.Date;

public class ReplyVO {
	private int replyNum;
	private String replyContent;
	private Date replyReg;
	private String userId;
	private int userRank;
	
	
	public int getUserRank() {
		return userRank;
	}
	public void setUserRank(int userRank) {
		this.userRank = userRank;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyReg() {
		return replyReg;
	}
	public void setReplyReg(Date replyReg) {
		this.replyReg = replyReg;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	

}
