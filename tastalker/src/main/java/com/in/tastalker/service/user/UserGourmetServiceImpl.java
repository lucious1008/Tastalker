package com.in.tastalker.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.in.tastalker.dao.user.UserGourmetDAO;
import com.in.tastalker.vo.GourmetVO;
import com.in.tastalker.vo.GradeVO;
import com.in.tastalker.vo.ReplyVO;
@Service("userGourmetService")
public class UserGourmetServiceImpl implements UserGourmetService{
	@Autowired
	private UserGourmetDAO userGourmetDAO;
	
	@Override
	public boolean registGrade(GradeVO gradeVO) {
		// TODO Auto-generated method stub
		return userGourmetDAO.registGrade(gradeVO);
	}

	@Override
	public int viewGrade(int gourmetNum) {
		// TODO Auto-generated method stub
		return userGourmetDAO.viewGrade(gourmetNum);
	}

	@Override
	public boolean modifyGrade(GradeVO gradeVO) {
		// TODO Auto-generated method stub
		return userGourmetDAO.modifyGrade(gradeVO);
	}

	@Override
	public boolean registReply(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		return userGourmetDAO.registReply(replyVO);
	}

	@Override
	public int viewReply(int gourmetNum) {
		// TODO Auto-generated method stub
		return userGourmetDAO.viewReply(gourmetNum);
	}

	@Override
	public boolean modifyReply(ReplyVO gradeVO) {
		// TODO Auto-generated method stub
		return userGourmetDAO.modifyReply(gradeVO);
	}

	@Override
	public int deleteReply(int gourmetNum) {
		// TODO Auto-generated method stub
		return userGourmetDAO.deleteReply(gourmetNum);
	}

	@Override
	public List<GourmetVO> searchGourmetByDirectory(String sort, String gpsInfo, int pageNum) {
		// TODO Auto-generated method stub
		return userGourmetDAO.searchGourmetByDirectory(sort, gpsInfo, pageNum);
	}

	@Override
	public List<GourmetVO> searchGourmetByKeyword(String keyword, String gpsInfo, int pageNum) {
		// TODO Auto-generated method stub
		return userGourmetDAO.searchGourmetByKeyword(keyword, gpsInfo, pageNum);
	}

	@Override
	public GourmetVO gourmetInfoView(int gourmetNum) {
		// TODO Auto-generated method stub
		return userGourmetDAO.gourmetInfoView(gourmetNum);
	}

}
