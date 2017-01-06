package com.videoPlatform.service.impl;

import java.util.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.videoPlatform.dao.RelationDAO;
import com.videoPlatform.dao.VideoDAO;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblVideo;
import com.videoPlatform.service.RelationManager;
import com.videoPlatform.util.CustomVideoInfo;

@Service("rm")
public class RelationManagerImpl implements RelationManager {
	
	@Autowired(required=true)
	private VideoDAO videoDAO;
	
	@Autowired(required=true)
	private RelationDAO relationDAO;
	
	@Override
	public List<CustomVideoInfo> getCustomVideoInfoList(TblUser user, String operation_type, String videoName, String uploadDateStart,String uploadDateEnd) throws ParseException {
		// TODO Auto-generated method stub
		List<CustomVideoInfo> customVideoInfoList = new ArrayList<CustomVideoInfo>();
		CustomVideoInfo customVideoInfo = null;
		List<TblVideo> videoList = videoDAO.getVideoByVideoname(user.getUserId(), videoName);
		Integer numOfComment = 0;
		Integer numOfPlay = 0;
		for(TblVideo video:videoList){
			numOfComment = relationDAO.getNumOfComments(video.getVideoId(), uploadDateStart, uploadDateEnd);//获取该视频对应的评论数
			numOfPlay = relationDAO.getNumOfPlays(video.getVideoId(), uploadDateStart, uploadDateEnd);//获取该视频对应的播放数
			Date opeatation_dateTime = relationDAO.getOperationDatetime(user, operation_type, video);//获取这次操作的时间戳
			
			customVideoInfo = new CustomVideoInfo();
			customVideoInfo.setVideo(video);
			customVideoInfo.setOperation_type(operation_type);
			customVideoInfo.setOpeatation_dateTime(opeatation_dateTime);
			customVideoInfo.setNumOfComment(numOfComment);
			customVideoInfo.setNumOfPlay(numOfPlay);
			customVideoInfoList.add(customVideoInfo);//添加到list的尾部
		}
		return customVideoInfoList;
	}

}
