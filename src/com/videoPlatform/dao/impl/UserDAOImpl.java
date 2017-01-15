package com.videoPlatform.dao.impl;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.videoPlatform.dao.UserDAO;
import com.videoPlatform.model.TblRole;
import com.videoPlatform.model.TblRolePermissionRelation;
import com.videoPlatform.model.TblUser;

@Repository("ud")
@Transactional
public class UserDAOImpl implements UserDAO{

	
	@PersistenceContext(name="un")
	private EntityManager em ;
	
	@Override
	public TblRole getRole(String roleId) {
		// TODO Auto-generated method stub
		String jpql = "select r from TblRole r where r.roleId=:roleId";
		List<TblRole> resultList = em.createQuery(jpql).setParameter("roleId", roleId).getResultList();
		TblRole role = resultList.get(0);
		return role;
	}

	@Override
	public void insertUser(TblUser user) {
		// TODO Auto-generated method stub
		em.persist(user);
	}
	
	@Override
	public TblUser getUserByUserId(String userId) {
		// TODO Auto-generated method stub
		String jpql = "select u from TblUser u where u.userId=:userId";
		TblUser user = (TblUser) em.createQuery(jpql).setParameter("userId", userId).getResultList().get(0);
		return user;
	}
	
	@Override
	public TblUser getUserByEmail(String email) {
		// TODO Auto-generated method stub
		String jpql = "select u from TblUser u where u.userEmail=:email";
		TblUser user = (TblUser) em.createQuery(jpql).setParameter("email", email).getResultList().get(0);
		return user;
	}

	@Override
	public TblUser getUserByUserNickName(String userNickName) {
		// TODO Auto-generated method stub
		String jpql = "select u from TblUser u where u.userNickName=:userNickName";
		List<TblUser> userList = em.createQuery(jpql).setParameter("userNickName", userNickName).getResultList();
		if( userList.size() != 0 ){
			TblUser user = userList.get(0);
			return user;
		}else{
			return null;
		}
	}
	
	@Override
	public List<TblUser> getUserByUserNickName_likeSearch(String userNickName) {
		// TODO Auto-generated method stub
		String jpql = "select u from TblUser u where u.userNickName LIKE :userNickName";
		List<TblUser> userList = em.createQuery(jpql).setParameter("userNickName", "%" + userNickName + "%").getResultList();
		return userList;
	}

	@Override
	public TblUser updateTblUser(TblUser user) {
		// TODO Auto-generated method stub
		em.merge(user);
		return user;
	}

	@Override
	public List<TblRolePermissionRelation> getRolePermissionRelationListByRole(TblRole tblRole) {
		// TODO Auto-generated method stub
		String jpql = "select rpr from TblRolePermissionRelation rpr where rpr.tblRole =:tblRole";
		List<TblRolePermissionRelation> tblRolePermissionRelationList = em.createQuery(jpql).setParameter("tblRole", tblRole).getResultList();
		
		return tblRolePermissionRelationList;
	}

	
	
}
