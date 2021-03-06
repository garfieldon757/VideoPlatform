package com.videoPlatform.model;
// Generated 2017-1-15 13:56:31 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * TblVideotagrelation generated by hbm2java
 */
@Entity
@Table(name = "tbl_videotagrelation", catalog = "videoplatform")
public class TblVideotagrelation implements java.io.Serializable {

	private String videoTagRelationId;
	private TblVideo tblVideo;
	private TblUser tblUser;
	private TblTag tblTag;
	private Set<TblUserpicture> tblUserpictures = new HashSet<TblUserpicture>(0);

	public TblVideotagrelation() {
	}

	public TblVideotagrelation(String videoTagRelationId) {
		this.videoTagRelationId = videoTagRelationId;
	}

	public TblVideotagrelation(String videoTagRelationId, TblVideo tblVideo, TblUser tblUser, TblTag tblTag,
			Set<TblUserpicture> tblUserpictures) {
		this.videoTagRelationId = videoTagRelationId;
		this.tblVideo = tblVideo;
		this.tblUser = tblUser;
		this.tblTag = tblTag;
		this.tblUserpictures = tblUserpictures;
	}

	@Id

	@Column(name = "videoTagRelation_ID", unique = true, nullable = false)
	public String getVideoTagRelationId() {
		return this.videoTagRelationId;
	}

	public void setVideoTagRelationId(String videoTagRelationId) {
		this.videoTagRelationId = videoTagRelationId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "video_ID")
	public TblVideo getTblVideo() {
		return this.tblVideo;
	}

	public void setTblVideo(TblVideo tblVideo) {
		this.tblVideo = tblVideo;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_ID")
	public TblUser getTblUser() {
		return this.tblUser;
	}

	public void setTblUser(TblUser tblUser) {
		this.tblUser = tblUser;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "tag_ID")
	public TblTag getTblTag() {
		return this.tblTag;
	}

	public void setTblTag(TblTag tblTag) {
		this.tblTag = tblTag;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tblVideotagrelation")
	@JsonIgnore
	public Set<TblUserpicture> getTblUserpictures() {
		return this.tblUserpictures;
	}

	public void setTblUserpictures(Set<TblUserpicture> tblUserpictures) {
		this.tblUserpictures = tblUserpictures;
	}

}
