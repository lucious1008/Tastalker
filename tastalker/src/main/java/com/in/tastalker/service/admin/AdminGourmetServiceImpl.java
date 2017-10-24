package com.in.tastalker.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.in.tastalker.dao.admin.AdminGourmetDAO;
import com.in.tastalker.vo.GourmetVO;
import com.in.tastalker.vo.ReplyVO;

@Transactional
@Service("adminGourmetService")
public class AdminGourmetServiceImpl implements AdminGourmetService{

	@Autowired
	private AdminGourmetDAO adminGourmetDAO;
	
	@Override
	public List<GourmetVO> gourmetCatalog(int 페이지넘버) {
		// TODO Auto-generated method stub
		return adminGourmetDAO.gourmetCatalog(페이지넘버);
	}

	@Override
	public List<GourmetVO> searchGourmetCatalog(GourmetVO gvo, String 상호명, int 페이지넘버) {
		// TODO Auto-generated method stub
		return adminGourmetDAO.searchGourmetCatalog(gvo, 상호명, 페이지넘버);
	}

	@Override
	public GourmetVO specifingGourmetSpecification(int 맛집번호) {
		// TODO Auto-generated method stub
		return adminGourmetDAO.specifingGourmetSpecification(맛집번호);
	}
	@Transactional
	@Override
	public boolean modifyGourmetInfo(GourmetVO gourmetVO) {
		// TODO Auto-generated method stub
		return adminGourmetDAO.modifyGourmetInfo(gourmetVO);
	}

	@Override
	public boolean deleteGourmet(int 맛집번호) {
		// TODO Auto-generated method stub
		return adminGourmetDAO.deleteGourmet(맛집번호);
	}

	@Override
	public int gourmetSum() {
		// TODO Auto-generated method stub
		return adminGourmetDAO.gourmetSum();
	}

	@Override
	public int searchSum(GourmetVO gourmetVO, String address, int pageNum) {
		// TODO Auto-generated method stub
		return adminGourmetDAO.searchSum(gourmetVO, address,pageNum);
	}

	@Override
	public List<ReplyVO> replyList(String replyTable) {
		// TODO Auto-generated method stub
		return adminGourmetDAO.replyList(replyTable);
	}

	@Override
	public int replyDel(int k, int val) {
		// TODO Auto-generated method stub
		return adminGourmetDAO.replyDel(k,val);
	}

}
