package com.videoPlatform.dao;

import java.sql.Date;
import java.text.ParseException;
import java.util.List;

import com.videoPlatform.model.TblDatadictionary;
import com.videoPlatform.model.TblTag;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblUservideorelation;
import com.videoPlatform.model.TblVideo;
import com.videoPlatform.model.TblVideoCategory;
import com.videoPlatform.model.TblVideotagrelation;

public interface VideoDAO {

	public List<TblVideoCategory> getVideoCategoryList();
	public TblVideoCategory getVideoCategoryByVideoCategoryID(String videoCategroyID);
	public List<TblVideo> getVideoListByVideoCategroyAndPage(TblVideoCategory videoCategory , int page);
	public int getVideoListSizeByVideoCategory(TblVideoCategory videoCategory);
	public TblVideo getVideoByVideoID(String videoID);
	public List<TblVideo> getVideoByVideoname(String userId, String videoName);
	public List<TblVideo> getVideoByVideokeyword(String userId, String videoKeyword);
	public List<TblUservideorelation> getUservideorelationByMultiParams(String userId, String videoKeyword, String operateDateStart, String operateDateEnd, String operation_type);
	public Integer getNumOfComments(String videoId, String uploadDateStart, String uploadDateEnd) throws ParseException;
	public Integer getNumOfPlays(String videoId, String uploadDateStart, String uploadDateEnd);
	public List<TblVideotagrelation> getVideoTagList(String videoId);
	
	public TblVideoCategory getTblVideoCategoryByVideoCategoryName(String videoCategoryName);
	public TblVideo updateVideo(String videoId, TblUser user, String videoName, String videoDescription, String videoCategory, String videoCoverLink, String videoSourceLink);
	public TblTag getTblTagByTagName(String newTag);
	public List<TblTag> getTblTagList();
	public void addVideotagrelation(TblUser user, String videoId, String newTag);
	public void addTag(String newTag);
	
	public Integer getTotalCountOfPlay(String videoId, Date videoPlayDatetimeStart, Date videoPlayDatetimeEnd);
	public Integer getTotalCountOfPlayPeople(String videoId, Date videoPlayDatetimeStart, Date videoPlayDatetimeEnd);
	
	
	
	
	
	

}
