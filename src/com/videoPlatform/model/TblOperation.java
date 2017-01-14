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
@Table(name = "tbl_operation", catalog = "videoplatform")
public class TblOperation {
	
	@Id
	@Column(name = "operation_ID", unique = true, nullable = false)
	private String operationId;
	private String operationDescription;
	private String operationUrl;
	private String operationType;
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tblOperation")
	private Set<TblPermission> tblPermissions = new HashSet<TblPermission>(0);
	
	
	public TblOperation(String operationId, String operationDescription, String operationUrl, String operationType,
			Set<TblPermission> tblPermissions) {
		super();
		this.operationId = operationId;
		this.operationDescription = operationDescription;
		this.operationUrl = operationUrl;
		this.operationType = operationType;
		this.tblPermissions = tblPermissions;
	}


	public String getOperationId() {
		return operationId;
	}


	public void setOperationId(String operationId) {
		this.operationId = operationId;
	}


	public String getOperationDescription() {
		return operationDescription;
	}


	public void setOperationDescription(String operationDescription) {
		this.operationDescription = operationDescription;
	}


	public String getOperationUrl() {
		return operationUrl;
	}


	public void setOperationUrl(String operationUrl) {
		this.operationUrl = operationUrl;
	}


	public String getOperationType() {
		return operationType;
	}


	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}


	public Set<TblPermission> getTblPermissions() {
		return tblPermissions;
	}


	public void setTblPermissions(Set<TblPermission> tblPermissions) {
		this.tblPermissions = tblPermissions;
	}
	
	
	
	
	

}
