package com.videoPlatform.service.impl;

import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.videoPlatform.dao.RelationDAO;
import com.videoPlatform.dao.VideoDAO;
import com.videoPlatform.model.TblDatadictionary;
import com.videoPlatform.model.TblTag;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblVideo;
import com.videoPlatform.model.TblVideoCategory;
import com.videoPlatform.model.TblVideotagrelation;
import com.videoPlatform.service.VideoManager;
import com.videoPlatform.util.CustomVideoInfo;
import com.videoPlatform.util.MonthCalculate;

@Service("vm")
public class VideoManagerImpl implements VideoManager{

	@Autowired(required=true)
	private VideoDAO videoDAO;
	
	@Autowired(required=true)
	private RelationDAO relationDAO;
	
	@Autowired(required=true)
	private HttpServletRequest httpServletRequest;
	
	@Override
	public List<TblVideoCategory> getVideoCategoryList() {
		List<TblVideoCategory> videoCategoryList = videoDAO.getVideoCategoryList();
		return videoCategoryList;
	}

	@Override
	public List<TblVideo> getVideoListByVideoCategroyIDAndPage(String videoCategroyID , int page) {
		TblVideoCategory videoCategory = videoDAO.getVideoCategoryByVideoCategoryID(videoCategroyID);
		List<TblVideo> videoList = videoDAO.getVideoListByVideoCategroyAndPage(videoCategory , page);
		return videoList;
	}

	@Override
	public int getVideoListSizeByVideoCategoryID(String videoCategoryID) {
		TblVideoCategory videoCategory = videoDAO.getVideoCategoryByVideoCategoryID(videoCategoryID);
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

	@Override
	public HashMap<String, Integer> getPlayInfo(String videoId, Date videoPlayDatetimeStart,
			Date videoPlayDatetimeEnd) {
		// TODO Auto-generated method stub
		Integer totalCount_play = videoDAO.getTotalCountOfPlay(videoId, videoPlayDatetimeStart, videoPlayDatetimeEnd);
		Integer totalCount_playProple = videoDAO.getTotalCountOfPlayPeople(videoId, videoPlayDatetimeStart, videoPlayDatetimeEnd);
		Integer totalMinite_play = 0;//videoDAO.getTotalMiniteOfPlay();
		double totalPercent_play = 0;//videoDAO.getPercentOfPlay()
				
		HashMap<String, Integer> videoInfo = new HashMap<String, Integer>();
		videoInfo.put("totalCount_play", totalCount_play );
		videoInfo.put("totalCount_playProple", totalCount_playProple );
		videoInfo.put("totalCount_playProple", totalCount_playProple);
		videoInfo.put("totalPercent_play", 0);
			
		return videoInfo;
	}

	@Override
	public TreeMap<String, Integer> getPlayCountList(String videoId, Date videoPlayDatetimeStart,
			Date videoPlayDatetimeEnd) {
		// TODO Auto-generated method stub
		MonthCalculate monthCalculate = new MonthCalculate(videoPlayDatetimeStart, videoPlayDatetimeEnd);
		List<String> xAxisValueList = monthCalculate.calculateAndOutput();//x轴坐标获取
		List<Integer> yAxisValueList = new ArrayList<Integer>();
		for(int i=0;  ; i++){
			if( xAxisValueList.get(i+1).equals("") ){
				break;
			}
			Integer temp = relationDAO.getVideoPlayNum(videoId, xAxisValueList.get(i), xAxisValueList.get(i+1));//边界不受影响，因为xAxis专门在结尾添加了结尾的月份信息
			yAxisValueList.add(temp);
		}//根据x轴的坐标值获取对应的y轴数据值
		
		TreeMap<String, Integer> playCountList = new TreeMap<String, Integer>();
		for(int i=0; i < (xAxisValueList.size()-2); i++){
			playCountList.put( xAxisValueList.get(i) , yAxisValueList.get(i) );
		}
		
		return playCountList;
	}


	
}
