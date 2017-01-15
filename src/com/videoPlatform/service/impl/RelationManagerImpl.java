package com.videoPlatform.service.impl;

import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.videoPlatform.dao.RelationDAO;
import com.videoPlatform.dao.VideoDAO;
import com.videoPlatform.model.TblComment;
import com.videoPlatform.model.TblUser;
import com.videoPlatform.model.TblUservideorelation;
import com.videoPlatform.model.TblVideo;
import com.videoPlatform.service.RelationManager;
import com.videoPlatform.util.CustomVideoInfo;
import com.videoPlatform.util.MonthCalculate;

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
		List<TblUservideorelation> userVideoRelationList = videoDAO.getUservideorelationByMultiParams(user.getUserId(), videoName, uploadDateStart, uploadDateEnd, operation_type);
		Integer numOfComment = 0;
		Integer numOfPlay = 0;
		for(TblUservideorelation userVideoRelation:userVideoRelationList){
			numOfComment = relationDAO.getNumOfComments(userVideoRelation.getTblVideo().getVideoId(), uploadDateStart, uploadDateEnd);//获取该视频对应的评论数
			numOfPlay = relationDAO.getNumOfPlays(userVideoRelation.getTblVideo().getVideoId(), uploadDateStart, uploadDateEnd);//获取该视频对应的播放数
			Date opeatation_dateTime = relationDAO.getOperationDatetime(user, operation_type, userVideoRelation.getTblVideo());//获取这次操作的时间戳
			
			customVideoInfo = new CustomVideoInfo();
			customVideoInfo.setVideo(userVideoRelation.getTblVideo());
			customVideoInfo.setOperation_type(operation_type);
			customVideoInfo.setOpeatation_dateTime(opeatation_dateTime);
			customVideoInfo.setNumOfComment(numOfComment);
			customVideoInfo.setNumOfPlay(numOfPlay);
			customVideoInfoList.add(customVideoInfo);//添加到list的尾部
		}
		return customVideoInfoList;
	}

	@Override
	public TreeMap<String, Integer> getOperationCountList(String userId, Date userOperationDatetimeStart,
			Date userOperationDatetimeEnd, String operationType) {
		// TODO Auto-generated method stub
		MonthCalculate monthCalculate = new MonthCalculate(userOperationDatetimeStart, userOperationDatetimeEnd);
		List<String> xAxisValueList = monthCalculate.calculateAndOutput();//x轴坐标获取
		List<Integer> yAxisValueList = new ArrayList<Integer>();
		for(int i=0;  ; i++){
			if( xAxisValueList.get(i+1).equals("") ){
				break;
			}
			Integer temp = 0;
			switch (operationType){
				case "play":
					temp = relationDAO.getUserPlayNum(userId, xAxisValueList.get(i), xAxisValueList.get(i+1) );
					break;
				case "collect":
					temp = relationDAO.getUserCollectNum(userId, xAxisValueList.get(i), xAxisValueList.get(i+1) );
					break;
				case "comment":
					temp = relationDAO.getUserCommentNum(userId, xAxisValueList.get(i), xAxisValueList.get(i+1) );
					break;
			}
			yAxisValueList.add(temp);
		}//根据x轴的坐标值获取对应的y轴数据值
		
		TreeMap<String, Integer> countList = new TreeMap<String, Integer>();
		for(int i=0; i < (xAxisValueList.size()-2); i++){
			countList.put( xAxisValueList.get(i) , yAxisValueList.get(i) );
		}
		
		return countList;
	}

}
