package com.in.tastalker.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.in.tastalker.dao.user.UserGourmetDAO;
import com.in.tastalker.vo.GourmetVO;
import com.in.tastalker.vo.ReplyVO;
@Service("userGourmetService")
@Transactional
public class UserGourmetServiceImpl implements UserGourmetService{
	@Autowired
	private UserGourmetDAO userGourmetDAO;
	@Transactional
	@Override
	public boolean registGrade(int gourmetNum, int gradeGrade, String userId) {
		// TODO Auto-generated method stub
		return userGourmetDAO.registGrade(gourmetNum, gradeGrade, userId);
	}

	@Override
	public int viewGrade(int gourmetNum) {
		// TODO Auto-generated method stub
		return userGourmetDAO.viewGrade(gourmetNum);
	}
	@Transactional
	@Override
	public boolean modifyGrade(int gourmetNum, int gradeGrade, String userId) {
		// TODO Auto-generated method stub
		return userGourmetDAO.modifyGrade(gourmetNum, gradeGrade, userId);
	}
	@Transactional
	@Override
	public boolean registReply(int gourmetNum, String replyContent, String userId) {
		// TODO Auto-generated method stub
		return userGourmetDAO.registReply(gourmetNum, replyContent, userId);
	}

	@Override
	public List<ReplyVO> viewReply(int gourmetNum, int page) {
		// TODO Auto-generated method stub
		return userGourmetDAO.viewReply(gourmetNum, page);
	}
	@Transactional
	@Override
	public boolean modifyReply(int gourmetNum, int replyNum, String replyContent) {
		// TODO Auto-generated method stub
		return userGourmetDAO.modifyReply(gourmetNum, replyNum, replyContent);
	}

	@Override
	public int deleteReply(int gourmetNum,int replyNum) {
		// TODO Auto-generated method stub
		return userGourmetDAO.deleteReply(gourmetNum, replyNum);
	}

	@Override
	public List<GourmetVO> searchGourmetByDirectory(int food,float lati,float lngi, int pageNum,String sort1,float sort2) {
		// TODO Auto-generated method stub
		return userGourmetDAO.searchGourmetByDirectory(food, lati,lngi, pageNum,sort1,sort2);
	}

	@Override
	public List<GourmetVO> searchGourmetByKeyword(String keyword,float lati,float lngi, int pageNum,String sort1,float sort2) {
		// TODO Auto-generated method stub
		return userGourmetDAO.searchGourmetByKeyword(keyword, lati,lngi, pageNum,sort1,sort2);
	}

	@Override
	public GourmetVO gourmetInfoView(int gourmetNum) {
		// TODO Auto-generated method stub
		return userGourmetDAO.gourmetInfoView(gourmetNum);
	}

	@Override
	public int searchGourmetByKeywordCnt(String keyword, float lati, float lngi, int pageNum, String sort1,
			float sort2) {
		// TODO Auto-generated method stub
		return userGourmetDAO.searchGourmetByKeywordCnt(keyword, lati, lngi, pageNum, sort1, sort2);
	}

	@Override
	public int searchGourmetByDirectoryCnt(int food, float lati, float lngi, int pageNum, String sort1, float sort2) {
		// TODO Auto-generated method stub
		return userGourmetDAO.searchGourmetByDirectoryCnt(food, lati, lngi, pageNum, sort1, sort2);
	}

	@Override
	public int checkGrade(int gourmetNum, String userId) {
		// TODO Auto-generated method stub
		return userGourmetDAO.checkGrade(gourmetNum, userId);
	}

	@Override
	public int checkMyGrade(int gourmetNum, String userId) {
		// TODO Auto-generated method stub
		return userGourmetDAO.checkMyGrade(gourmetNum, userId);
	}

	@Override
	public int viewReplyCount(int gourmetNum) {
		// TODO Auto-generated method stub
		return userGourmetDAO.viewReplyCount(gourmetNum);
	}

}
