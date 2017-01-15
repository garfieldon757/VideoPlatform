package com.videoPlatform.model;
// Generated 2017-1-15 13:56:31 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * TblComment generated by hbm2java
 */
@Entity
@Table(name = "tbl_comment", catalog = "videoplatform")
public class TblComment implements java.io.Serializable {

	private String commentId;
	private TblVideo tblVideo;
	private TblUser tblUser;
	private TblComment tblComment;
	private String commentContent;
	private Date commentCommentTimestamps;
	private Set<TblComment> tblComments = new HashSet<TblComment>(0);

	public TblComment() {
	}

	public TblComment(String commentId) {
		this.commentId = commentId;
	}

	public TblComment(String commentId, TblVideo tblVideo, TblUser tblUser, TblComment tblComment,
			String commentContent, Date commentCommentTimestamps, Set<TblComment> tblComments) {
		this.commentId = commentId;
		this.tblVideo = tblVideo;
		this.tblUser = tblUser;
		this.tblComment = tblComment;
		this.commentContent = commentContent;
		this.commentCommentTimestamps = commentCommentTimestamps;
		this.tblComments = tblComments;
	}

	@Id

	@Column(name = "comment_ID", unique = true, nullable = false)
	public String getCommentId() {
		return this.commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
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
	@JoinColumn(name = "comment_parentID")
	public TblComment getTblComment() {
		return this.tblComment;
	}

	public void setTblComment(TblComment tblComment) {
		this.tblComment = tblComment;
	}

	@Column(name = "comment_content")
	public String getCommentContent() {
		return this.commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "comment_commentTimestamps", length = 19)
	public Date getCommentCommentTimestamps() {
		return this.commentCommentTimestamps;
	}

	public void setCommentCommentTimestamps(Date commentCommentTimestamps) {
		this.commentCommentTimestamps = commentCommentTimestamps;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tblComment")
	@JsonIgnore
	public Set<TblComment> getTblComments() {
		return this.tblComments;
	}

	public void setTblComments(Set<TblComment> tblComments) {
		this.tblComments = tblComments;
	}

}
