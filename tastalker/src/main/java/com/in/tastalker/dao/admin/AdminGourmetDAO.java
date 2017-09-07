package com.in.tastalker.dao.admin;

import java.util.List;

import com.in.tastalker.vo.GourmetVO;

public interface AdminGourmetDAO {
	public List<GourmetVO> gourmetCatalog(int 페이지넘버);
	public List<GourmetVO> searchGourmetCatalog(String 대분류,String 상호명,String 부분주소,int 페이지넘버);
	public GourmetVO specifingGourmetSpecification(int 맛집번호);
	public boolean modifyGourmetInfo(GourmetVO gourmetVO);
	public boolean deleteGourmet(int 맛집번호);

}
