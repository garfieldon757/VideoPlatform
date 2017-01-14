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
@Table(name = "tbl_videocategory", catalog = "videoplatform")
public class TblVideoCategory {

	@Id
	@Column(name = "videoCategory_ID", unique = true, nullable = false)
	private String videoCategoryId;
	private String videoCategroyName;
	private String videoCategoryUrl;
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tblVideoCategory")
	private Set<TblVideo> tblVideos = new HashSet<TblVideo>(0);
	
	public TblVideoCategory(String videoCategoryId, String videoCategroyName, String videoCategoryUrl,
			Set<TblVideo> tblVideos) {
		super();
		this.videoCategoryId = videoCategoryId;
		this.videoCategroyName = videoCategroyName;
		this.videoCategoryUrl = videoCategoryUrl;
		this.tblVideos = tblVideos;
	}

	public String getVideoCategoryId() {
		return videoCategoryId;
	}

	public void setVideoCategoryId(String videoCategoryId) {
		this.videoCategoryId = videoCategoryId;
	}

	public String getVideoCategroyName() {
		return videoCategroyName;
	}

	public void setVideoCategroyName(String videoCategroyName) {
		this.videoCategroyName = videoCategroyName;
	}

	public String getVideoCategoryUrl() {
		return videoCategoryUrl;
	}

	public void setVideoCategoryUrl(String videoCategoryUrl) {
		this.videoCategoryUrl = videoCategoryUrl;
	}

	public Set<TblVideo> getTblVideos() {
		return tblVideos;
	}

	public void setTblVideos(Set<TblVideo> tblVideos) {
		this.tblVideos = tblVideos;
	}
	
	
	
	
	
}
