package com.in.tastalker.dao.admin;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.in.tastalker.vo.GourmetVO;
@Repository("adminGourmetDAO")
public class AdminGourmetDAOImpl implements AdminGourmetDAO{
	
	
	@Override
	public List<GourmetVO> gourmetCatalog(int 페이지넘버) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GourmetVO> searchGourmetCatalog(String 대분류, String 상호명, String 부분주소, int 페이지넘버) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GourmetVO specifingGourmetSpecification(int 맛집번호) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modifyGourmetInfo(GourmetVO gourmetVO) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteGourmet(int 맛집번호) {
		// TODO Auto-generated method stub
		return false;
	}

}
