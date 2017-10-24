package com.in.tastalker.dao.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.in.tastalker.vo.GourmetVO;
import com.in.tastalker.vo.ReplyVO;
@Repository("adminGourmetDAO")
public class AdminGourmetDAOImpl implements AdminGourmetDAO{
	
	private static final String GOURMET_SORT = "and gourmet_sort =";
	private static final String GOURMET_ADR_STR = "and gourmet_adr_str Like ";
	private static final String GOURMET_NM = "and gourmet_nm like ";
	
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<GourmetVO> gourmetCatalog(int 페이지넘버) {
		// TODO Auto-generated method stub
		
		List<GourmetVO> gvo = sqlSession.selectList("gourmetList", 페이지넘버);
		return gvo;
	}

	@Override
	public List<GourmetVO> searchGourmetCatalog(GourmetVO gourmetVO, String address, int 페이지넘버) {
		// TODO Auto-generated method stub
		String gourmetSort = null;
		String gourmetAdrStr = null;
		String gourmetName = null;
		
		if(gourmetVO.getGourmetSort() !=0){
			gourmetSort = GOURMET_SORT + gourmetVO.getGourmetSort();
		}else{
			gourmetSort = "and 1=1";
		}
		if(gourmetVO.getGourmetAdrStr() != null){
			gourmetAdrStr = GOURMET_ADR_STR+"'%"+gourmetVO.getGourmetAdrStr()+"%'";
		}else if(gourmetVO.getGourmetAdrStr() != null && address != null){
			gourmetAdrStr = GOURMET_ADR_STR+"'%"+gourmetVO.getGourmetAdrStr()+ " " + address +"%'";
		}else if(address != null){
			gourmetAdrStr = GOURMET_ADR_STR+"'%" + address +"%'";
		}else{
			gourmetAdrStr = "and 1=1";
		}
		if(gourmetVO.getGourmetNm() != null){
			gourmetName = GOURMET_NM+" '%"+gourmetVO.getGourmetNm()+"%'";
		}else{
			gourmetName = "and 1=1";
		}
		
		HashMap<String, Object> map = new HashMap<>();		
		map.put("num", 페이지넘버);
		map.put("sort", gourmetSort);
		map.put("adrStr", gourmetAdrStr);
		map.put("name", gourmetName);
		
		List<GourmetVO> list = sqlSession.selectList("gourmetSearch", map);
		
		
		return list;
	}

	@Override
	public GourmetVO specifingGourmetSpecification(int 맛집번호) {
		// TODO Auto-generated method stub
	
		HashMap<String, Object> map = new HashMap<>();
		map.put("num", 맛집번호);
		
		return sqlSession.selectOne("selectGourmetOne", map);
	}

	@Override
	public boolean modifyGourmetInfo(GourmetVO gourmetVO) {
		// TODO Auto-generated method stub
		boolean result = sqlSession.update("modifyInsert", gourmetVO) ==1;
		
		return result;
	}

	@Override
	public boolean deleteGourmet(int 맛집번호) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("groumetNum", 맛집번호);
		//맛집 정보삭제
		boolean result = sqlSession.delete("deleteGroumet", map) ==1;
		//맛집 댓글 삭제
		//1.맛집 댓글 테이블 이름 만들기
		String replyDel = "REPLY_"+맛집번호;
		//2.hashmap에 저장
		map.put("replyTitle", replyDel);
		//3.댓글 테이블 삭제쿼리 수행
		sqlSession.selectOne("dropReply", map);
		//4.평점 테이블 삭제 구문 만들기
		String gradeDel = "GRADE_"+맛집번호;
		map.put("gradeTitle", gradeDel);
		sqlSession.selectOne("dropGrade", map);
		
		return result;
	}

	@Override
	public int gourmetSum() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("gourmetSum");
	}

	@Override
	public int searchSum(GourmetVO gourmetVO, String address, int pageNum) {
		// TODO Auto-generated method stub
		String gourmetSort = null;
		String gourmetAdrStr = null;
		String gourmetName = null;
		
		if(gourmetVO.getGourmetSort() !=0){
			gourmetSort = GOURMET_SORT + gourmetVO.getGourmetSort();
		}else{
			gourmetSort = "and 1=1";
		}
		if(gourmetVO.getGourmetAdrStr() != null){
			gourmetAdrStr = GOURMET_ADR_STR+"'%"+gourmetVO.getGourmetAdrStr()+"%'";
		}else if(gourmetVO.getGourmetAdrStr() != null && address != null){
			gourmetAdrStr = GOURMET_ADR_STR+"'%"+gourmetVO.getGourmetAdrStr()+ " " + address +"%'";
		}else if(address != null){
			gourmetAdrStr = GOURMET_ADR_STR+"'%" + address +"%'";
		}else{
			gourmetAdrStr = "and 1=1";
		}
		if(gourmetVO.getGourmetNm() != null){
			gourmetName = GOURMET_NM+" '%"+gourmetVO.getGourmetNm()+"%'";
		}else{
			gourmetName = "and 1=1";
		}
		
		HashMap<String, Object> map = new HashMap<>();		
		
		map.put("num", pageNum);
		map.put("sort", gourmetSort);
		map.put("adrStr", gourmetAdrStr);
		map.put("name", gourmetName);
		
		int page = sqlSession.selectOne("searchGourmetSumPage", map);
		
		
		return page;
	}

	@Override
	public List<ReplyVO> replyList(String replyTable) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("reply", replyTable);
		return sqlSession.selectList("repyList", map);
	}

	@Override
	public int replyDel(int k,int val) {
		// TODO Auto-generated method stub
		String tableName = "reply_"+k;
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("tableName", tableName);
		map.put("replyNum", val);
	
		
		sqlSession.delete("gourmetReplyDel", map);
		
		return 0;
	}

}
