package com.videoPlatform.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_rolePermissionRelation", catalog = "videoplatform")
public class TblRolePermissionRelation {
	
	@Id
	@Column(name = "permission_ID", unique = true, nullable = false)
	private String rolePermissionRelationId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "rolePermissionRelation_roleID")
	private TblRole tblRole;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "rolePermissionRelation_permissionID")
	private TblPermission tblPermission;
	
	public TblRolePermissionRelation(String rolePermissionRelationId, TblRole tblRole, TblPermission tblPermission) {
		super();
		this.rolePermissionRelationId = rolePermissionRelationId;
		this.tblRole = tblRole;
		this.tblPermission = tblPermission;
	}

	public String getRolePermissionRelationId() {
		return rolePermissionRelationId;
	}

	public void setRolePermissionRelationId(String rolePermissionRelationId) {
		this.rolePermissionRelationId = rolePermissionRelationId;
	}

	public TblRole getTblRole() {
		return tblRole;
	}

	public void setTblRole(TblRole tblRole) {
		this.tblRole = tblRole;
	}

	public TblPermission getTblPermission() {
		return tblPermission;
	}

	public void setTblPermission(TblPermission tblPermission) {
		this.tblPermission = tblPermission;
	}
	
	

}
