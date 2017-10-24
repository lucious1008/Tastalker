package com.in.tastalker.dao.admin;

import java.util.List;

import com.in.tastalker.vo.GourmetVO;
import com.in.tastalker.vo.ReplyVO;

public interface AdminGourmetDAO {
	public List<GourmetVO> gourmetCatalog(int 페이지넘버);
	public List<GourmetVO> searchGourmetCatalog(GourmetVO gvo,String 부분주소,int 페이지넘버);
	public GourmetVO specifingGourmetSpecification(int 맛집번호);
	public boolean modifyGourmetInfo(GourmetVO gourmetVO);
	public boolean deleteGourmet(int 맛집번호);
	public int gourmetSum();
	public int searchSum(GourmetVO gourmetVO, String address, int PageNum);
	public List<ReplyVO> replyList(String replyTable);
	public int replyDel(int k, int val);


}
