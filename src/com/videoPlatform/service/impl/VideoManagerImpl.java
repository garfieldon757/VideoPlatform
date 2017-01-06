package com.videoPlatform.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.videoPlatform.dao.VideoDAO;
import com.videoPlatform.model.TblDatadictionary;
import com.videoPlatform.model.TblTag;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblVideo;
import com.videoPlatform.model.TblVideotagrelation;
import com.videoPlatform.service.VideoManager;
import com.videoPlatform.util.CustomVideoInfo;

@Service("vm")
public class VideoManagerImpl implements VideoManager{

	@Autowired(required=true)
	private VideoDAO videoDAO;
	
	@Autowired(required=true)
	private HttpServletRequest httpServletRequest;
	
	@Override
	public List<TblDatadictionary> getVideoCategoryList() {
		List<TblDatadictionary> videoCategoryList = videoDAO.getVideoCategoryList();
		return videoCategoryList;
	}

	@Override
	public List<TblVideo> getVideoListByVideoCategroyIDAndPage(String videoCategroyID , int page) {
		TblDatadictionary videoCategory = videoDAO.getVideoCategoryByVideoCategoryID(videoCategroyID);
		List<TblVideo> videoList = videoDAO.getVideoListByVideoCategroyAndPage(videoCategory , page);
		return videoList;
	}

	@Override
	public int getVideoListSizeByVideoCategoryID(String videoCategoryID) {
		TblDatadictionary videoCategory = videoDAO.getVideoCategoryByVideoCategoryID(videoCategoryID);
		int videoListSize = videoDAO.getVideoListSizeByVideoCategory(videoCategory);
		return videoListSize;
	}

	@Override
	public TblVideo getVideoByVideoID(String videoID) {
		// TODO Auto-generated method stub
		return videoDAO.getVideoByVideoID(videoID);
	}
	
	@Override
	public List<CustomVideoInfo> getCustomVideoInfoList(String videoName, String uploadDateStart,String uploadDateEnd) throws ParseException {
		// TODO Auto-generated method stub
		List<CustomVideoInfo> customVideoInfoList = new ArrayList<CustomVideoInfo>();
		CustomVideoInfo customVideoInfo = null;
		HttpSession session = httpServletRequest.getSession();
		TblUser user = (TblUser) session.getAttribute("user");
		List<TblVideo> videoList = videoDAO.getVideoByVideoname(user.getUserId(), videoName);
		Integer numOfComment = 0;
		Integer numOfPlay = 0;
		for(TblVideo video:videoList){
			numOfComment = videoDAO.getNumOfComments(video.getVideoId(), uploadDateStart, uploadDateEnd);
			numOfPlay = videoDAO.getNumOfPlays(video.getVideoId(), uploadDateStart, uploadDateEnd);
			customVideoInfo = new CustomVideoInfo();
			customVideoInfo.setVideo(video);
			customVideoInfo.setNumOfComment(numOfComment);
			customVideoInfo.setNumOfPlay(numOfPlay);
			customVideoInfoList.add(customVideoInfo);//添加到list的尾部
		}
		return customVideoInfoList;
	}

	@Override
	public List<TblVideotagrelation> getVideoTagList(String videoId) {
		// TODO Auto-generated method stub
		List<TblVideotagrelation> tblVideotagrelationList = videoDAO.getVideoTagList(videoId);
		return tblVideotagrelationList;
	}

	@Override
	public void addVideotagrelations(TblUser user, String videoId, List<String> newTagList) {
		// TODO Auto-generated method stub
		for(String newTag:newTagList){
			videoDAO.addVideotagrelation(user, videoId, newTag);
		}
		return;
	}

	@Override
	public void addTags(List<String> newTagList) {
		// TODO Auto-generated method stub
		for(String newTag:newTagList){
			videoDAO.addTag(newTag);
		}
		return;
	}


	
}
