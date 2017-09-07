package com.in.tastalker.dao.user;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.in.tastalker.vo.GourmetVO;
import com.in.tastalker.vo.GradeVO;
import com.in.tastalker.vo.ReplyVO;
@Repository("userGourmetDAO")
public class UserGourmetDAOImpl implements UserGourmetDAO{

	@Override
	public boolean registGrade(GradeVO gradeVO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int viewGrade(int gourmetNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean modifyGrade(GradeVO gradeVO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean registReply(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int viewReply(int gourmetNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean modifyReply(ReplyVO gradeVO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int deleteReply(int gourmetNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<GourmetVO> searchGourmetByDirectory(String sort, String gpsInfo, int pageNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GourmetVO> searchGourmetByKeyword(String keyword, String gpsInfo, int pageNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GourmetVO gourmetInfoView(int gourmetNum) {
		// TODO Auto-generated method stub
		return null;
	}

}
