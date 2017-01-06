package com.videoPlatform.service.impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.videoPlatform.dao.UserDAO;
import com.videoPlatform.model.TblRole;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.service.UserManager;

@Service("um")
public class UserManagerImpl implements UserManager {

	@Autowired(required=true)
	private UserDAO userDAO;
	
	@Autowired(required=true)
	private HttpServletRequest httpServletRequest;
	
	@Override
	public String signUp(HttpServletRequest request) {
		// TODO Auto-generated method stub
		TblUser user = new TblUser();
		String userId = UUID.randomUUID().toString();
		String sex = request.getParameter("sex");
		String userNickName = request.getParameter("userNickName");
		String userPassword = request.getParameter("password");
		String userEmail = request.getParameter("email");
		user.setUserId(userId);
		user.setUserSex(sex);
		user.setUserNickName(userNickName);
		user.setUserPassword(userPassword);
		user.setUserEmail(userEmail);
		
		TblRole tblRole = userDAO.getRole("1");//设置用户注册默认权限为“普通用户”,roleID为1	
		tblRole.getTblUsers().add(user);
		user.setTblRole(tblRole);
		userDAO.insertUser(user);//存储这条user数据到数据库
		
		return "test";
	}

	@Override
	public String login(HttpServletRequest request) {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		TblUser tblUser = userDAO.getUserByEmail(email);
		String db_pwd = tblUser.getUserPassword();
		if(db_pwd.equals(password)){
			HttpSession session = request.getSession();
			session.setAttribute("user", tblUser);
			return "main_page";
		}else{
			return "error_page";
		}
		
	}

	@Override
	public String userNickNameExist(String userNickName) {
		// TODO Auto-generated method stub
		TblUser user = userDAO.getUserByUserNickName(userNickName);
		if( user != null ){
			return "unavailable";
		}else{
			return "available";
		}
	}
	
	@Override
	public TblUser getSession(HttpServletRequest request, String sessionKey) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		TblUser user = (TblUser) session.getAttribute(sessionKey);
		return user;
	}

	@Override
	public void updateSession(HttpServletRequest request, String sessionKey, Object obj) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute(sessionKey, obj);
		return ;
	}


	
	@Override
	public void updateTblUser_baseProfile(TblUser user, String userNickName, String userSex, Date userBirthDate, String userBirthPlace) {
		// TODO Auto-generated method stub
		user.setUserNickName(userNickName);
		user.setUserSex(userSex);
		user.setUserBirthDate(userBirthDate);
		user.setUserBirthPlace(userBirthPlace);
		TblUser new_user = userDAO.updateTblUser(user);
		HttpSession session = httpServletRequest.getSession();
		session.setAttribute("user", new_user);//更新session里的user对象
		return;
	}

	@Override
	public void updateTblUser_security(TblUser user, String userEmail, String userPhoneNumber, String userPassword) {
		// TODO Auto-generated method stub
		user.setUserEmail(userEmail);
		user.setUserPhoneNumber(userPhoneNumber);
		user.setUserPassword(userPassword);
		TblUser new_user = userDAO.updateTblUser(user);
		HttpSession session = httpServletRequest.getSession();
		session.setAttribute("user", new_user);//更新session里的user对象
		return;
	}

	
	
}
