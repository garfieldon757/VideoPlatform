package com.videoPlatform.dao;

import java.util.List;

import com.videoPlatform.model.TblRole;
import com.videoPlatform.model.TblRolePermissionRelation;
import com.videoPlatform.model.TblUser;

public interface UserDAO {

	public TblRole getRole(String roleID);
	public void insertUser(TblUser user);
	public TblUser getUserByUserId(String userId);
	public TblUser getUserByEmail(String email);
	public TblUser getUserByUserNickName(String userNickName);
	public List<TblUser> getUserByUserNickName_likeSearch(String userNickName);
	public TblUser updateTblUser(TblUser user);
	public List<TblRolePermissionRelation> getRolePermissionRelationListByRole(TblRole tblRole);
}
