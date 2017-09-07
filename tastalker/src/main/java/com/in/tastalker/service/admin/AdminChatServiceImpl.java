package com.in.tastalker.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.in.tastalker.dao.admin.AdminChatDAO;

@Service("adminChatService")
public class AdminChatServiceImpl implements AdminChatService{
	
	@Autowired
	private AdminChatDAO adminChatDAO;
	
	@Override
	public void searchChatLog(String 날짜, String 채팅방명) {
		adminChatDAO.searchChatLog(날짜, 채팅방명);
		
	}

	@Override
	public void viewChatLog(String 날짜, String 채팅방명) {
		adminChatDAO.viewChatLog(날짜, 채팅방명);
		
	}

}
