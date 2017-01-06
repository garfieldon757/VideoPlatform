package com.videoPlatform.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.videoPlatform.model.TblUser;
import com.videoPlatform.util.CustomVideoInfo;



public interface UserManager {

	
	public String signUp(HttpServletRequest request);
	public String login(HttpServletRequest request);
	public String userNickNameExist(String userNickName);
	public TblUser getSession(HttpServletRequest request, String sessionKey);
	public void updateSession(HttpServletRequest request, String sessionKey, Object obj);
	
	public void updateTblUser_baseProfile(TblUser user, String userNickName, String userSex, Date userBirthDate, String userBirthPlace);
	public void updateTblUser_security(TblUser user, String userEmail, String userPhoneNumber, String userPassword);
	
}
