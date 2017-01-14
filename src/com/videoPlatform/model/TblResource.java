package com.videoPlatform.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "tbl_resource", catalog = "videoplatform")
public class TblResource {
	
	@Id
	@Column(name = "resource_ID", unique = true, nullable = false)
	private String resourceId;
	private String resourceName;
	private String resourceValue;
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tblResource")
	private Set<TblPermission> tblPermissions = new HashSet<TblPermission>(0);
	
	public TblResource(String resourceId, String resourceName, String resourceValue,
			Set<TblPermission> tblPermissions) {
		super();
		this.resourceId = resourceId;
		this.resourceName = resourceName;
		this.resourceValue = resourceValue;
		this.tblPermissions = tblPermissions;
	}
	
	public String getResourceId() {
		return resourceId;
	}
	public void setResourceId(String resourceId) {
		this.resourceId = resourceId;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getResourceValue() {
		return resourceValue;
	}
	public void setResourceValue(String resourceValue) {
		this.resourceValue = resourceValue;
	}
	public Set<TblPermission> getTblPermissions() {
		return tblPermissions;
	}
	public void setTblPermissions(Set<TblPermission> tblPermissions) {
		this.tblPermissions = tblPermissions;
	}
	

}
