package com.in.tastalker.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.in.tastalker.dao.admin.AdminGourmetDAO;
import com.in.tastalker.vo.GourmetVO;
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
	public List<GourmetVO> searchGourmetCatalog(String 대분류, String 상호명, String 부분주소, int 페이지넘버) {
		// TODO Auto-generated method stub
		return adminGourmetDAO.searchGourmetCatalog(대분류, 상호명, 부분주소, 페이지넘버);
	}

	@Override
	public GourmetVO specifingGourmetSpecification(int 맛집번호) {
		// TODO Auto-generated method stub
		return adminGourmetDAO.specifingGourmetSpecification(맛집번호);
	}

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

}
