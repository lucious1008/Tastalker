package com.in.tastalker.service.user;

import java.util.List;

import com.in.tastalker.vo.GourmetVO;
import com.in.tastalker.vo.GradeVO;
import com.in.tastalker.vo.ReplyVO;

public interface UserGourmetService {
	public boolean registGrade(int gourmetNum, int gradeGrade, String userId);
	public int viewGrade(int gourmetNum);
	public boolean modifyGrade(int gourmetNum, int gradeGrade, String userId);
	
	public boolean registReply(int gourmetNum, String replyContent, String userId);
	public List<ReplyVO> viewReply(int gourmetNum, int page);
	public boolean modifyReply(int gourmetNum, int replyNum, String replyContent);
	public int deleteReply(int gourmetNum,int replyNum);
	
	public List<GourmetVO> searchGourmetByDirectory(int food,float lati,float lngi, int pageNum,String sort1,float sort2);
	public List<GourmetVO> searchGourmetByKeyword(String keyword,float lati,float lngi, int pageNum,String sort1,float sort2);
	public int searchGourmetByKeywordCnt(String keyword,float lati,float lngi, int pageNum,String sort1,float sort2);
	public int searchGourmetByDirectoryCnt(int food,float lati,float lngi, int pageNum,String sort1,float sort2);
	public GourmetVO gourmetInfoView(int gourmetNum);

	public int checkGrade(int gourmetNum, String userId);
	public int checkMyGrade(int gourmetNum, String userId);	
	public int viewReplyCount(int gourmetNum);
	
	
	


}
