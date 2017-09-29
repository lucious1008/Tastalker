package com.in.tastalker.dao.user;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.in.tastalker.vo.GourmetVO;
import com.in.tastalker.vo.GradeVO;
import com.in.tastalker.vo.ReplyVO;
@Repository("userGourmetDAO")
public class UserGourmetDAOImpl implements UserGourmetDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean registGrade(int gourmetNum, int gradeGrade, String userId) {
		HashMap<String,Object> registGrade = new HashMap<>();
		registGrade.put("gourmetNum", gourmetNum);
		registGrade.put("gradeGrade", gradeGrade);
		registGrade.put("userId", userId);		
		return sqlSession.insert("registGrade", registGrade) == -1;
	}

	@Override
	public int viewGrade(int gourmetNum) {
		HashMap<String,Integer> gourmetHash = new HashMap<>();
		gourmetHash.put("gourmetNum", gourmetNum);
		return sqlSession.selectOne("viewGrade", gourmetHash);
	}

	@Override
	public boolean modifyGrade(int gourmetNum, int gradeGrade, String userId) {
		HashMap<String,Object> modifyGrade = new HashMap<>();
		modifyGrade.put("gourmetNum", gourmetNum);
		modifyGrade.put("gradeGrade", gradeGrade);
		modifyGrade.put("userId", userId);
		return sqlSession.insert("modifyGrade", modifyGrade) == -1;
	}

	@Override
	public boolean registReply(int gourmetNum, String replyContent, String userId) {
		HashMap<String,Object> registReply = new HashMap<>();
		registReply.put("gourmetNum", gourmetNum);
		registReply.put("replyContent", replyContent);
		registReply.put("userId", userId);
		
		return sqlSession.insert("registReply", registReply) == -1;
	}

	@Override
	public List<ReplyVO> viewReply(int gourmetNum, int page) {
		HashMap<String,Integer> gourmetHash = new HashMap<>();
		gourmetHash.put("num", gourmetNum);
		gourmetHash.put("page", page);
		return sqlSession.selectList("viewReply", gourmetHash);
	}

	@Override
	public boolean modifyReply(int gourmetNum, int replyNum, String replyContent) {
		HashMap<String,Object> replyHash = new HashMap<>();
		replyHash.put("gourmetNum", gourmetNum);
		replyHash.put("replyNum", replyNum);
		replyHash.put("replyContent", replyContent);
		return sqlSession.update("modifyReply", replyHash) == 1;
	}

	@Override
	public int deleteReply(int gourmetNum,int replyNum) {
		HashMap<String,Integer> replyHash = new HashMap<>();
		replyHash.put("gourmetNum", gourmetNum);
		replyHash.put("replyNum", replyNum);
		return sqlSession.delete("deleteReply", replyHash);
	}

	@Override
	public List<GourmetVO> searchGourmetByDirectory(int food,float lati,float lngi, int pageNum,String sort1,float sort2) {
		HashMap<String,Object> dirHash = new HashMap<>();
		dirHash.put("food", food);
		dirHash.put("lati", lati);
		dirHash.put("lngi", lngi);
		dirHash.put("pageNum", (pageNum*10)-10);
		dirHash.put("pageNum+", pageNum*10);		
		dirHash.put("sort2", sort2);
		if(sort1.equals("first")){
			return sqlSession.selectList("searchDirF", dirHash);
		}
		else if(sort1.equals("second")){
			return sqlSession.selectList("searchDirS", dirHash);
		}
		else{
			return sqlSession.selectList("searchDirT", dirHash);
		}

		
	}

	@Override
	public List<GourmetVO> searchGourmetByKeyword(String keyword,float lati,float lngi, int pageNum,String sort1,float sort2) {
		HashMap<String,Object> keyHash = new HashMap<>();
		keyHash.put("keyword", keyword);
		keyHash.put("lati", lati);
		keyHash.put("lngi", lngi);
		keyHash.put("pageNum", (pageNum*10)-10);
		keyHash.put("pageNump", pageNum*10);		
		keyHash.put("sort2", sort2);
		if(sort1.equals("first")){
			return sqlSession.selectList("searchKeyF", keyHash);
		}
		
		else if(sort1.equals("second")){
			return sqlSession.selectList("searchKeyS", keyHash);
		}
		else{
			return sqlSession.selectList("searchKeyT", keyHash);
		}		
		
	}

	@Override
	public GourmetVO gourmetInfoView(int gourmetNum) {
		HashMap<String,Integer> gourmetHash = new HashMap<>();
		gourmetHash.put("num", gourmetNum);
		return sqlSession.selectOne("gourmetInfoView", gourmetHash);
	}

	@Override
	public int searchGourmetByDirectoryCnt(int food, float lati, float lngi, int pageNum, String sort1, float sort2) {
		HashMap<String,Object> dirHash = new HashMap<>();
		dirHash.put("sort", food);
		dirHash.put("lati", lati);
		dirHash.put("lngi", lngi);				
		dirHash.put("sort2", sort2);
		return sqlSession.selectOne("searchDirCnt", dirHash);
	}

	@Override
	public int searchGourmetByKeywordCnt(String keyword, float lati, float lngi, int pageNum, String sort1,
			float sort2) {
		HashMap<String,Object> keyHash = new HashMap<>();
		keyHash.put("keyword", keyword);
		keyHash.put("lati", lati);
		keyHash.put("lngi", lngi);		
		keyHash.put("sort2", sort2);
		return sqlSession.selectOne("searchKeyCnt", keyHash);
	}

	@Override
	public int checkGrade(int gourmetNum, String userId) {
		HashMap<String,Object> checkGrade = new HashMap<>();
		checkGrade.put("gourmetNum", gourmetNum);
		checkGrade.put("userId", userId);
		return sqlSession.selectOne("checkGrade", checkGrade);		
	}

	@Override
	public int checkMyGrade(int gourmetNum, String userId) {
		HashMap<String,Object> checkMyGrade = new HashMap<>();
		checkMyGrade.put("gourmetNum", gourmetNum);
		checkMyGrade.put("userId", userId);
		
		if(sqlSession.selectOne("checkMyGrade", checkMyGrade) == null){
			return 0;
		}else{
			return sqlSession.selectOne("checkMyGrade", checkMyGrade);
		}
		
	}

	@Override
	public int viewReplyCount(int gourmetNum) {
		HashMap<String,Integer> gourmetHash = new HashMap<>();
		gourmetHash.put("num", gourmetNum);
		return sqlSession.selectOne("viewReplyCount", gourmetHash);
	}


}
