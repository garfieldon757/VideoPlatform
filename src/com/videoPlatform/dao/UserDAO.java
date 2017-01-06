package com.videoPlatform.dao;

import com.videoPlatform.model.TblRole;
import com.videoPlatform.model.TblUser;

public interface UserDAO {

	public TblRole getRole(String roleID);
	public void insertUser(TblUser user);
	public TblUser getUserByUserId(String userId);
	public TblUser getUserByEmail(String email);
	public TblUser getUserByUserNickName(String userNickName);
	public TblUser updateTblUser(TblUser user);
}
