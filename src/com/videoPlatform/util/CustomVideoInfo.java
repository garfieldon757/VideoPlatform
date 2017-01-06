package com.videoPlatform.util;

import java.util.Date;

import com.videoPlatform.model.TblVideo;

public class CustomVideoInfo {
	
	private TblVideo video;
	private String operation_type;
	private Date operatation_dateTime;
	private Integer numOfComment;
	private Integer numOfPlay;
	public TblVideo getVideo() {
		return video;
	}
	public void setVideo(TblVideo video) {
		this.video = video;
	}
	public String getOperation_type() {
		return operation_type;
	}
	public void setOperation_type(String operation_type) {
		this.operation_type = operation_type;
	}
	public Date getOpeatation_dateTime() {
		return operatation_dateTime;
	}
	public void setOpeatation_dateTime(Date operatation_dateTime) {
		this.operatation_dateTime = operatation_dateTime;
	}
	public Integer getNumOfComment() {
		return numOfComment;
	}
	public void setNumOfComment(Integer numOfComment) {
		this.numOfComment = numOfComment;
	}
	public Integer getNumOfPlay() {
		return numOfPlay;
	}
	public void setNumOfPlay(Integer numOfPlay) {
		this.numOfPlay = numOfPlay;
	}
	
}
