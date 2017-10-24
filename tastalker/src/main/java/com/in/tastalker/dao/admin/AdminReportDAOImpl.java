package com.in.tastalker.dao.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.in.tastalker.vo.ReportVO;
@Repository("adminReportDAO")
public class AdminReportDAOImpl implements AdminReportDAO{
	@Autowired
	private SqlSession sqlSession;
	boolean result = true;

	@Override
	public List<ReportVO> reportCatalog(int 페이지넘버) {
		List<ReportVO> list = sqlSession.selectList("report", 페이지넘버);

		return list;
	}

	@Override
	public List<ReportVO> sortReportCatalog(int 제보상태, int 페이지넘버) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("pageNum", 페이지넘버);
		map.put("reportStatus", 제보상태);
		
		List<ReportVO> list = sqlSession.selectList("searchReport", map);
		
		return list;
	}

	@Override
	public ReportVO specifingReportSecification(int 제보번호) {
		// TODO Auto-generated method stub
		ReportVO rvo =  sqlSession.selectOne("reportDetail", 제보번호);
		return  rvo;
	}

	@Override
	public boolean approveReport(ReportVO reportVO) {

		// 제보상태 및 수정내용 업데이트
		sqlSession.update("statuUpdateApp", reportVO);

		// 제보에서 맛집 테이블로 이동
		result = sqlSession.insert("moveInfo", reportVO) == 1;
		
		
		System.out.println("dao reportVO  before: " + reportVO.getReportNum());
		//맛집 번호 가져오기
		int gourmetNum = sqlSession.selectOne("gourmet", reportVO);

		
		//댓글 및 평점테이블 만들기
		//댓글 이름 생성
		String replyName = "REPLY_"+Integer.toString(gourmetNum);
	
		//댓글테이블 생성
		HashMap<String, Object> map = new HashMap<>();
		map.put("tname", replyName);
		
		sqlSession.selectOne("replyNm", map);
		//댓글시퀀즈 생성
		sqlSession.selectOne("replyseq", map);
		
		
		//평점 이름 생성
		String gradeName = "GRADE_"+Integer.toString(gourmetNum);
		map.put("gname", gradeName);
		//평점테이블 생성
		sqlSession.selectOne("gradeNm", map);
		
		//평점시퀀즈 생성
		sqlSession.selectOne("gradeNmseq", map);
		
		//평점 altter
		sqlSession.selectOne("altter", map);
		
		
		//제보자 포인트 추가
		//제보자 포인트 호출
		System.out.println("포인트 증가");
		map.put("user", reportVO.getReportUser());
		int point = sqlSession.selectOne("userPoint", map);
		System.out.println("포인트 : " + point);
		point += 3;
		map.put("point", point);
		//제보자 포인트 insert
		sqlSession.update("plus", map);
		return result;
	}

	@Override
	public boolean rejectReport(int reportVO) {
		// TODO Auto-generated method stub
		boolean result = sqlSession.update("statuUpdate", reportVO)== 1;
		return result;
	}

	@Override
	public int sumPage() {
		// TODO Auto-generated method stub
		int list = sqlSession.selectOne("reportSumPage");
		return list;
	}

	@Override
	public int searchSum(int reportSearch) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchSum",reportSearch);
		int searchResult = sqlSession.selectOne("searchSum", map);
		return searchResult;
	}

}
