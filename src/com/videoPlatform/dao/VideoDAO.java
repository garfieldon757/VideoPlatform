package com.videoPlatform.dao;

import java.sql.Date;
import java.text.ParseException;
import java.util.List;

import com.videoPlatform.model.TblDatadictionary;
import com.videoPlatform.model.TblTag;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblVideo;
import com.videoPlatform.model.TblVideotagrelation;

public interface VideoDAO {

	public List<TblDatadictionary> getVideoCategoryList();
	public TblDatadictionary getVideoCategoryByVideoCategoryID(String videoCategroyID);
	public List<TblVideo> getVideoListByVideoCategroyAndPage(TblDatadictionary videoCategory , int page);
	public int getVideoListSizeByVideoCategory(TblDatadictionary videoCategory);
	public TblVideo getVideoByVideoID(String videoID);
	public List<TblVideo> getVideoByVideoname(String userId, String videoName);
	public List<TblVideo> getVideoByVideokeyword(String userId, String videoKeyword);
	public Integer getNumOfComments(String videoId, String uploadDateStart, String uploadDateEnd) throws ParseException;
	public Integer getNumOfPlays(String videoId, String uploadDateStart, String uploadDateEnd);
	public List<TblVideotagrelation> getVideoTagList(String videoId);
	
	public TblDatadictionary getTblDatadictionaryByVideoCategory(String videoCategory);
	public TblVideo updateVideo(String videoId, String videoName, String videoDescription, String videoCategory);
	public TblTag getTblTagByTagName(String newTag);
	public void addVideotagrelation(TblUser user, String videoId, String newTag);
	public void addTag(String newTag);
	
	public Integer getTotalCountOfPlay(String videoId, Date videoPlayDatetimeStart, Date videoPlayDatetimeEnd);
	public Integer getTotalCountOfPlayPeople(String videoId, Date videoPlayDatetimeStart, Date videoPlayDatetimeEnd);
	
	
	

}
