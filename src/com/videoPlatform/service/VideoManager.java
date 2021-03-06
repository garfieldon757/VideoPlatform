package com.videoPlatform.service;

import java.sql.Date;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

import com.videoPlatform.model.TblDatadictionary;
import com.videoPlatform.model.TblTag;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblVideo;
import com.videoPlatform.model.TblVideoCategory;
import com.videoPlatform.model.TblVideotagrelation;
import com.videoPlatform.util.CustomVideoInfo;

public interface VideoManager {
	
	public List<TblVideoCategory> getVideoCategoryList();
	public List<TblVideo> getVideoListByVideoCategroyIDAndPage(String videoCategroyID , int page);
	public int getVideoListSizeByVideoCategoryID(String videoCategoryID);
	public TblVideo getVideoByVideoID(String videoID);
	public List<CustomVideoInfo> getCustomVideoInfoList(String videoName, String uploadDateStart, String uploadDateEnd) throws ParseException;
	public List<TblVideotagrelation> getVideoTagList(String videoId);
	public List<TblTag> getAllVideoTagList();
	public void addVideotagrelations(TblUser user, String videoId, List<String> newTagList);
	public void addTags(List<String> newTagList);
	
	public HashMap<String, Integer> getPlayInfo(String videoId, Date videoPlayDatetimeStart, Date videoPlayDatetimeEnd);
	public TreeMap<String, Integer> getPlayCountList(String videoId, Date videoPlayDatetimeStart, Date videoPlayDatetimeEnd);

}
