package com.in.tastalker.service.user;

import java.util.List;

import com.in.tastalker.vo.GourmetVO;
import com.in.tastalker.vo.GradeVO;
import com.in.tastalker.vo.ReplyVO;

public interface UserGourmetService {
	public boolean registGrade(GradeVO gradeVO);
	public int viewGrade(int gourmetNum);
	public boolean modifyGrade(GradeVO gradeVO);
	
	public boolean registReply(ReplyVO replyVO);
	public int viewReply(int gourmetNum);
	public boolean modifyReply(ReplyVO gradeVO);
	public int deleteReply(int gourmetNum);
	
	public List<GourmetVO> searchGourmetByDirectory(String sort,String gpsInfo, int pageNum);
	public List<GourmetVO> searchGourmetByKeyword(String keyword,String gpsInfo, int pageNum);
	public GourmetVO gourmetInfoView(int gourmetNum);

}
